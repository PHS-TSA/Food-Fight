extends Node
class_name global

#Round System
var G_tanks_picking = [] #alligns with cards picked
var G_cards_picked = [] #make sure to reset these in rounds

#Store Tank stats between rounds:


#Tank Stats
var G_maxHealth= []
var G_tankSpeed = []
var G_regen = []


#Bullet Stats
var G_damage = []
var G_bulletSpeed = []
var G_bulletRange =[]
var G_bulletSize  =[]

#may eventually add the tank settings here once i have a settings menu

# Card Data
var common_cards = ["Reinforced_Armor","Pointer_Bullets","Speedy_Bullets"]
var uncommon_cards = ["Galvanized_Steel_Plating"]
var rare_cards = ["Mechanic_on_Board"]
var legendary_cards = ["Atom_Bullets"]



