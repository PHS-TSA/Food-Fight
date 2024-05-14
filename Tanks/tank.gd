class_name Tank
extends CharacterBody2D

const BULLET = preload("res://bullet.tscn") 

#Tank Stats
const SPEED = 400.0
var rotationSpeed:float = 4
var aimSpeed:float = 5
var aimMethod:bool = true #true = key board. false = mouse
var rotationDirection = 0

#Bullet Stats
var damage:float = 10

#Input/Player Properties
#Have these variables be overidden in the child class
var rotate_left_button = "rotate_left"
var rotate_right_button = "rotate_right"
var aim_left_button = "aim_left"
var aim_right_button = "aim_right"
var forward_button = "forwards"
var backwards_button = "backwards"

func _init(
	p_rotate_left_button: String,
	p_rotate_right_button: String,
	p_aim_left_button: String,
	p_aim_right_button: String,
	p_forward_button: String,
	p_backwards_button: String
	):
	item_name = p_item_name

func _physics_process(delta):
	rotationDirection = Input.get_axis("rotate_left", "rotate_right") 
	velocity = transform.x * Input.get_axis("backwards", "forwards") * SPEED 
	
	if(aimMethod): #might wanna update with delta
		if(Input.is_action_pressed("aim_left")):
			%TankTopGreen.global_rotation -= deg_to_rad(aimSpeed)
		if(Input.is_action_pressed("aim_right")):
			%TankTopGreen.global_rotation += deg_to_rad(aimSpeed)
	else:
		%TankTopGreen.global_rotation = %TankTopGreen.global_position.angle_to_point(get_global_mouse_position()) + (PI/2)
	
	if(Input.is_action_just_pressed("fire")):
		fire() #could eventually add parameters to make the bullets more fun. Should do that in tank settings
	
	
	rotation += rotationDirection * rotationSpeed * delta
	move_and_slide()




func fire():
	var spawned:Bullet = BULLET.instantiate()
	spawned.global_rotation = %TankTopGreen.global_rotation #this rotation is broken rn
	spawned.position = %FirePoint.global_position
	spawned.damage = damage
	#need offset 
	get_parent().add_child(spawned)
