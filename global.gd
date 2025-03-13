extends Node
class_name global

#Round System
var G_tanks_picking := []  # aligns with cards picked
var G_cards_picked := []  # make sure to reset these in rounds
var mode_selected: String
var total_rounds: int
var autoaim:bool = false

#Store Tank stats between rounds:

#Wins
#TODO change implementation if doing more than two players
var G_wins := [0, 0]
var G_winningPlayer:int

#Tank Stats
var G_maxHealth := []
var G_tankSpeed := []
var G_regen := []
var G_attackSpeed := []
var G_aimMethod

#Bullet Stats
var G_damage := []
var G_bulletSpeed := []
var G_bulletRange := []
var G_bulletSize := []
var G_fireBullets := []

#may eventually add the tank settings here once i have a settings menu

# Card Data
var common_cards := ["Jacket", "Heavy-Food", "Fast-Flying","Quick-Feet"]
var uncommon_cards := ["Watermelon-Helmet", "Cabbage", "Long-Range", "Super-Heavy-Food","Super-Fast-Food"]
var rare_cards := ["Vitamins", "Pepper", "Super-Shoes", "Short-Range","Quick-Throw"]
var legendary_cards := ["Walnuts","Gatling-Pea","Juggernaut"]


func reset_stats() -> void:
	#Round System
	G_tanks_picking = []  # aligns with cards picked
	G_cards_picked = []  # make sure to reset these in rounds

	#Wins
	#TODO: change implementation if doing more than two players
	G_wins = [0, 0]
	G_winningPlayer = 1

	#Tank Stats
	G_maxHealth = []
	G_tankSpeed = []
	G_regen = []
	G_attackSpeed = []

	#Bullet Stats
	G_damage = []
	G_bulletSpeed = []
	G_bulletRange = []
	G_bulletSize = []
	G_fireBullets = []
