extends Node2D


var players = [] #holds tank objects
var player_wins = []
var tanks_alive

var tanks_picking = []
var card:String
# Called when the node enters the scene tree for the first time.

func _ready():
	print("this fire again")
		
	
	
	var tank_index = 0
	var connections = [] #stores signal connections
	for child in self.get_children(): #loops through the tree to find tanks
		if child.has_method("fire"):
			players.append(child) #adds tanks to players list
			player_wins.append(0)
			child.tank_index = tank_index
			connections.append(child.tank_dead.connect(self._on_tank_dead))
			tank_index += 1
	if(len(Global.G_cards_picked)>0): #runs after cards are picked
		print("this works")
		apply_cards()
	tanks_alive = len(players) 

func _process(delta):
	pass
	

func _on_tank_dead(index:int): #Use index to determine which player gets a card
	tanks_alive -= 1
	Global.G_tanks_picking.append(index) #when it comes back gonna need to subtract one
	if(tanks_alive == 1):
		for i in range(len(players)): #adds a win to every player who's not dead. This loop is not needed now but will be for future updates with more players
			if(players[i].health>0):
				player_wins[i] += 1
			players[i].health = players[i].maxHealth
		#pause_objects(true)
		print(player_wins)
		tanks_alive = len(players)
		self.get_tree().change_scene_to_file("res://card_view.tscn")
		

func pause_objects(pause_unpause:bool):
	get_tree().paused = pause_unpause 
	#for child in self.get_children():
		#if(child.has_method("fire")):
			#if(pause_unpause):
				#child.paused = true
			#else:
				#child.paused = false


func apply_cards(): # Needs to apply card stats to the corresponding tank and reset global lists
	print("apply time")
	
	for i in range(len(Global.G_tanks_picking)):
		card = Global.G_cards_picked[i]
		print(card)
		match card:
			"Pointer_Bullets": # Need to make a work around so tank variables don't get reset every time
				print(players[i].damage)
				players[i].damage *= 1.2
				print(players[i].damage)
