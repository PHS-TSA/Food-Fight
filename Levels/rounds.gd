extends Node2D

var players = [] #holds tank objects
var player_wins = []
var tanks_alive

# Called when the node enters the scene tree for the first time.

func _ready():
	var tank_index = 0
	var connections = [] #stores signal connections
	for child in self.get_children(): #loops through the tree to find tanks
		if child.has_method("fire"):
			players.append(child) #adds tanks to players list
			player_wins.append(0)
			child.tank_index = tank_index
			connections.append(child.tank_dead.connect(self._on_tank_dead))
			tank_index += 1
	tanks_alive = len(players)

func _process(delta):
	pass
	

func _on_tank_dead(index:int): #Use index to determine which player gets a card
	tanks_alive -= 1
	if(tanks_alive == 1):
		for i in range(len(players)): #adds a win to every player who's not dead. This loop is not needed now but will be for future updates with more players
			print("Health pre: ", players[i].health)
			if(players[i].health>0):
				player_wins[i] += 1
			players[i].health = players[i].maxHealth
			print("Health after: ", players[i].health)
		print(player_wins)
		tanks_alive = len(players)
		
	#gonna need to update this entire method so every player has to be dead


func pause_objects(pause_unpause:bool):
	get_tree().paused = pause_unpause 
	#for child in self.get_children():
		#if(child.has_method("fire")):
			#if(pause_unpause):
				#child.paused = true
			#else:
				#child.paused = false
			
