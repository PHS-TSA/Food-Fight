extends Node2D

const MAPS = [preload("res://Stages/Maps/map_1.tscn"),preload("res://Stages/Maps/map_2.tscn")]

@export var player1Path:String
@export var player2Path:String


var players = [] #holds tank objects
var player_wins = []
var tanks_alive


var tanks_picking = []
var card:String

# Called when the node enters the scene tree for the first time.
func _ready():
	print("rounds ready is running")
	#Choose a map
	add_child(MAPS[randi_range(0,len(MAPS)-1)].instantiate())
	
	#Spawn Players at spawn points
	var PLAYER1 = load(player1Path)
	var PLAYER2 = load(player2Path)
	for child in self.get_children():
		#This code isn't great. I just want to go to be and have it work
		print(child)
		if(len(child.get_children()) > 2):
			if(child.get_child(0).name == "Player1Spawn"):
				var spawnedPlayer1 = PLAYER1.instantiate()
				spawnedPlayer1.position = child.get_node("Player1Spawn").global_position
				add_child(spawnedPlayer1)
			if(child.get_child(1).name == "Player2Spawn"):
				var spawnedPlayer2 = PLAYER2.instantiate()
				spawnedPlayer2.position = child.get_node("Player2Spawn").global_position
				add_child(spawnedPlayer2)
	#var spawnedPlayer1 = PLAYER1.instantiate()
	#spawnedPlayer1.position = get_child()
	
	MusicPlayer.play_music_level()
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
		apply_stats()
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
				#need to figure out why this causes players to get to choose two cards after first win
				if player_wins[i] == Global.total_rounds:
					print("Player has won ", i+1)
					Global.G_winningPlayer = str(i+1)
					self.get_tree().change_scene_to_file("res://win_screen.tscn")
					return
			players[i].health = players[i].maxHealth
		#pause_objects(true)
		print(player_wins)
		#Check to see if a player 
		
		tanks_alive = len(players)
		save_stats()
		self.get_tree().change_scene_to_file("res://Cards/card_view.tscn")
		

func pause_objects(pause_unpause:bool):
	get_tree().paused = pause_unpause 
	#for child in self.get_children():
		#if(child.has_method("fire")):
			#if(pause_unpause):
				#child.paused = true
			#else:
				#child.paused = false


func save_stats(): #Saves stats before scene change
	for player in players:
		#Wins
		Global.G_wins = player_wins
		
		#Tank Stats
		Global.G_maxHealth.append(player.maxHealth)
		Global.G_tankSpeed.append(player.tankSpeed)
		Global.G_regen.append(player.regen)
		Global.G_attackSpeed.append(player.attackSpeed)
		
		#Bullet Stats
		Global.G_damage.append(player.damage)
		Global.G_bulletSpeed.append(player.bulletSpeed)
		Global.G_bulletRange.append(player.bulletRange)
		Global.G_bulletSize.append(player.bulletSize)
		Global.G_fireBullets.append(player.fireBullets)


func apply_stats(): #applys and resets stats
	for i in range(len(players)):
		#Wins
		player_wins = Global.G_wins
		
		#Tank Stats
		players[i].maxHealth = Global.G_maxHealth[i]
		players[i].tankSpeed = Global.G_tankSpeed[i]
		players[i].regen = Global.G_regen[i]
		players[i].attackSpeed = Global.G_attackSpeed[i]
		
		#Bullet STats
		players[i].damage = Global.G_damage[i]
		players[i].bulletSpeed = Global.G_bulletSpeed[i]
		players[i].bulletRange = Global.G_bulletRange[i]
		players[i].bulletSize = Global.G_bulletSize[i]
		players[i].fireBullets = Global.G_fireBullets[i]
	Global.G_maxHealth= []
	Global.G_tankSpeed = []
	Global.G_regen = []
	Global.G_damage = []
	Global.G_bulletSpeed = []
	Global.G_bulletRange =[]
	Global.G_bulletSize  =[]

func apply_cards(): # Needs to apply card stats to the corresponding tank and reset global lists
	
	var tank
	for i in range(len(Global.G_tanks_picking)):
		card = Global.G_cards_picked[i]
		tank = players[Global.G_tanks_picking[i]] 
		match card:
			#Commons
			"Heavy-Food": 
				tank.damage *= 1.2
			"Jacket":
				tank.maxHealth *= 1.2
				tank.health = tank.maxHealth
			"Fast-Flying":
				tank.bulletSpeed *= 1.2
				
			#uncommon
			"Watermelon-Helmet":
				tank.maxHealth *= 1.4
				tank.health = tank.maxHealth
			"Cabbage":
				tank.bulletSize *= 1.5
			"Long-Range":
				tank.bulletRange *= 3
			"Super-Heavy-Food":
				tank.damage *= 1.4
			
			#rare
			"Vitamins":
				tank.regen += 0.01 #percent based system
			"Pepper":
				tank.fireBullets = true
			"Super-Shoes":
				tank.tankSpeed *= 2
			"Short-Range":
				tank.damage *= 2
				tank.bulletRange /= 2
			#legendary
			"Walnuts":
				tank.bulletSize *= 0.2
				tank.bulletSpeed *= 2
				tank.damage *= 1.5
				if(tank.bulletSize < 0.1): # After 0.1 they are invisble and not fun
					tank.bulletSize = 0.1
				
	Global.G_tanks_picking = []
	Global.G_cards_picked = []
