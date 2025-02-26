extends Control

var current_level = get_tree()
var tanks_picking = []

#card variables
var ran:int
var random_card:String
var texture = CompressedTexture2D.new()
var picks_left
var card_list = []

# Called when the node enters the scene tree for the first time.
func _ready():
	tanks_picking = Global.G_tanks_picking
	picks_left = len(tanks_picking)
	card_list = [%Card1,%Card2,%Card3]
	%Card1.card_picked.connect(self._on_card_picked)
	%Card2.card_picked.connect(self._on_card_picked)
	%Card3.card_picked.connect(self._on_card_picked)
	generate_cards()
	


func generate_cards():
	%Picking_Label.text = ("Player "+str(tanks_picking[0]+1)+" is picking!") #this is broken
	
	for card in card_list:
		ran = randi_range(1,100)
		if(ran>=95):
			random_card = Global.legendary_cards[randi_range(0,len(Global.legendary_cards)-1)]
			texture = load("res://Cards/Food-Card-Assets/Legendary/"+str(random_card)+".png")
			card.texture_normal = texture
			card.card_name = random_card
		elif(ran>=80): #need to add str() to these
			random_card = Global.rare_cards[randi_range(0,len(Global.rare_cards)-1)]
			texture = load(("res://Cards/Food-Card-Assets/Rare/"+random_card+".png"))
			card.texture_normal = texture
			card.card_name = random_card
		elif(ran>=50):
			random_card = Global.uncommon_cards[randi_range(0,len(Global.uncommon_cards)-1)]
			texture = load("res://Cards/Food-Card-Assets/Uncommon/"+random_card+".png")
			card.texture_normal = texture
			card.card_name = random_card
		else:
			random_card = Global.common_cards[randi_range(0,len(Global.common_cards)-1)]
			texture = load("res://Cards/Food-Card-Assets/Common/"+random_card+".png")
			card.texture_normal = texture
			card.card_name = random_card



func _on_card_picked():
	picks_left -= 1
	
	if(picks_left>0):
		generate_cards()
	else:
		self.get_tree().change_scene_to_file("res://Stages/2-Player-Rounds/round_scene.tscn") # THIS NEEDS TO BE EDITIED IN THE FUTURE FOR OTHER LEVELS. USE A GLOBAL FOR CURRENT LEVEL
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
