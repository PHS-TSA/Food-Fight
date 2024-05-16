class_name Tank
extends CharacterBody2D

const BULLET = preload("res://Tanks/bullet.tscn") 

#Tank Stats
const maxHealth:float = 100.0
var health:float = maxHealth
var tankSpeed = 400.0
var regen:float = 0 #perecent based


var healthBar:ProgressBar
var rotationSpeed:float = 4
var aimSpeed:float = 3
var aimMethod:bool = true #true = key board. false = mouse
var rotationDirection = 0

#Bullet Stats
var damage:float = 10
var bulletSpeed = 400
var bulletRange = 1200
var bulletSize = 1

#Input/Player Properties
#Have these variables be overidden in the child class
var rotate_left_button = "rotate_left"
var rotate_right_button = "rotate_right"
var aim_left_button = "aim_left"
var aim_right_button = "aim_right"
var forward_button = "forwards"
var backwards_button = "backwards"
var fire_button = "fire"

#Signals
var tank_index:int #the index of the tank on the players list
signal tank_dead(index:int) #signals to the round/level that the tank is dead

 
#Constructer 
func _init(
	p_rotate_left_button: String,
	p_rotate_right_button: String,
	p_aim_left_button: String,
	p_aim_right_button: String,
	p_forward_button: String,
	p_backwards_button: String,
	p_fire_button:String
	):
	
	rotate_left_button  = p_rotate_left_button 
	rotate_right_button =	p_rotate_right_button
	aim_left_button =	p_aim_left_button
	aim_right_button =	p_aim_right_button
	forward_button =	p_forward_button
	backwards_button =	p_backwards_button
	fire_button = p_fire_button

func _ready():
	healthBar = self.get_node("HealthBar")
	healthBar.max_value = maxHealth
	healthBar.value = health

func _physics_process(delta):
	rotationDirection = Input.get_axis(rotate_left_button, rotate_right_button) 
	velocity = transform.x * Input.get_axis(backwards_button, forward_button) * tankSpeed 
	
	if(aimMethod): #might wanna update with delta
		if(Input.is_action_pressed(aim_left_button)):
			%TankTopGreen.global_rotation -= deg_to_rad(aimSpeed)
		if(Input.is_action_pressed(aim_right_button)):
			%TankTopGreen.global_rotation += deg_to_rad(aimSpeed)
	else:
		%TankTopGreen.global_rotation = %TankTopGreen.global_position.angle_to_point(get_global_mouse_position()) + (PI/2)
	
	if(Input.is_action_just_pressed(fire_button)):
		fire() #could eventually add parameters to make the bullets more fun. Should do that in tank settings
	
	health += maxHealth * regen * delta #regenerates tank health
	
	rotation += rotationDirection * rotationSpeed * delta
	move_and_slide()


func take_damage(damage:float):
	healthBar.max_value = maxHealth #could be less redudant be need it here so the bar doesn't bug when max health increases
	health -= damage
	healthBar.value = health
	if(health <= 0):
		tank_dead.emit(tank_index)
		#queue_free()


func fire():
	var spawned:Bullet = BULLET.instantiate()
	spawned.global_rotation = %TankTopGreen.global_rotation #this rotation is broken rn
	spawned.position = %FirePoint.global_position
	spawned.damage = damage
	spawned.speed = bulletSpeed
	spawned.range = bulletRange
	spawned.size = bulletSize
	#need offset 
	get_parent().add_child(spawned)
