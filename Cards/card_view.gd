extends Control

var current_level = get_tree()
var tanks_picking = []

#card variables
var ran: int
var random_card: String
var texture = CompressedTexture2D.new()
var picks_left
var card_list = []


func _ready():
	tanks_picking = Global.G_tanks_picking
	picks_left = len(tanks_picking)
	card_list = [%Card1, %Card2, %Card3]
	%Card1.card_picked.connect(self._on_card_picked)
	%Card2.card_picked.connect(self._on_card_picked)
	%Card3.card_picked.connect(self._on_card_picked)
	generate_cards()

	# THIS NEEDS TO CHANGE FOR MULTI AI SUPPORT
	if (
		Global.mode_selected == "res://Stages/2-Player-Rounds/round_scene_ai.tscn"
		and tanks_picking[0] != 0
	):  #Have ai pick
		#Goes through generated picked cards and picks rarest one
		var card_picked = false
		await get_tree().create_timer(2.0).timeout
		# Check for legendary cards first
		for card in card_list:
			if Global.legendary_cards.has(card.card_name) and not card_picked:
				Global.G_cards_picked.append(card.card_name)
				_on_card_picked()
				card_picked = true
				break
				
		# If no legendary card found, check for rare cards
		if not card_picked:
			for card in card_list:
				if Global.rare_cards.has(card.card_name):
					Global.G_cards_picked.append(card.card_name)
					_on_card_picked()
					card_picked = true
					break
					
		# If still no card found, check for uncommon cards
		if not card_picked:
			for card in card_list:
				if Global.uncommon_cards.has(card.card_name):
					Global.G_cards_picked.append(card.card_name)
					_on_card_picked()
					card_picked = true
					break
					
		# If still no card found, pick a common card
		if not card_picked:
			for card in card_list:
				if Global.common_cards.has(card.card_name):
					Global.G_cards_picked.append(card.card_name)
					_on_card_picked()
					break


func generate_cards():
	if(tanks_picking[0] == 0):
		%Picking_Label.text = ("Red Player is Picking!")
	elif(tanks_picking[0] == 1):
		%Picking_Label.text = ("Blue Player is Picking!")  
	#%Picking_Label.text = ("Player " + str(tanks_picking[0] + 1) + " is picking!")  #this is broken

	for card in card_list:
		ran = randi_range(1, 100)
		if ran >= 93:
			random_card = Global.legendary_cards[randi_range(0, len(Global.legendary_cards) - 1)]
			texture = load("res://Cards/Food-Card-Assets/Legendary/" + str(random_card) + ".png")
			card.texture_normal = texture
			card.card_name = random_card
		elif ran >= 80:  #need to add str() to these
			random_card = Global.rare_cards[randi_range(0, len(Global.rare_cards) - 1)]
			texture = load("res://Cards/Food-Card-Assets/Rare/" + random_card + ".png")
			card.texture_normal = texture
			card.card_name = random_card
		elif ran >= 50:
			random_card = Global.uncommon_cards[randi_range(0, len(Global.uncommon_cards) - 1)]
			texture = load("res://Cards/Food-Card-Assets/Uncommon/" + random_card + ".png")
			card.texture_normal = texture
			card.card_name = random_card
		else:
			random_card = Global.common_cards[randi_range(0, len(Global.common_cards) - 1)]
			texture = load("res://Cards/Food-Card-Assets/Common/" + random_card + ".png")
			card.texture_normal = texture
			card.card_name = random_card


func _on_card_picked():
	picks_left -= 1
	if picks_left > 0:  #for 2+ player support
		generate_cards()
	else:
		self.get_tree().change_scene_to_file(Global.mode_selected)  # THIS NEEDS TO BE EDITIED IN THE FUTURE FOR OTHER LEVELS. USE A GLOBAL FOR CURRENT LEVEL
