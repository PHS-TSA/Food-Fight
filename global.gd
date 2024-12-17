extends Node
class_name global

#Round System
var G_tanks_picking = [] #alligns with cards picked
var G_cards_picked = [] #make sure to reset these in rounds
var total_rounds

#Store Tank stats between rounds:

#Wins
#TODO change implementation if doing more than two players
var G_wins = [0,0]
var G_winningPlayer = ""

#Tank Stats
var G_maxHealth= []
var G_tankSpeed = []
var G_regen = []
var G_attackSpeed = []


#Bullet Stats
var G_damage = []
var G_bulletSpeed = []
var G_bulletRange =[]
var G_bulletSize  =[]
var G_fireBullets = []

#may eventually add the tank settings here once i have a settings menu

# Card Data
var common_cards = ["Reinforced_Armor","Pointer_Bullets","Speedy_Bullets"]
var uncommon_cards = ["Galvanized_Steel_Plating","Bulking_Season",'Long_Range',"Super_Pointy_Bullets"]
var rare_cards = ["Mechanic_on_Board","Fire_Bullets","Super_Speed","Short_Fuse"]
var legendary_cards = ["Atom_Bullets"]

func reset_stats():
	#Round System
	G_tanks_picking = [] #alligns with cards picked
	G_cards_picked = [] #make sure to reset these in rounds

	#Wins
	#TODO change implementation if doing more than two players
	G_wins = [0,0]
	G_winningPlayer = ""

	#Tank Stats
	G_maxHealth= []
	G_tankSpeed = []
	G_regen = []
	G_attackSpeed = []


	#Bullet Stats
	G_damage = []
	G_bulletSpeed = []
	G_bulletRange =[]
	G_bulletSize  =[]
	G_fireBullets = []
