class_name PlayerTank
extends Tank


#Input/Player Properties
#Have these variables be overidden in the child class
var rotate_left_button = "rotate_left"
var rotate_right_button = "rotate_right"
var aim_left_button = "aim_left"
var aim_right_button = "aim_right"
var forward_button = "forwards"
var backwards_button = "backwards"
var fire_button = "fire"

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

func _physics_process(delta): #Seperate physics process for AI and Player 
	rotationDirection = Input.get_axis(rotate_left_button, rotate_right_button) 
	velocity = transform.x * Input.get_axis(backwards_button, forward_button) * tankSpeed * delta
	
	
	if(aimMethod): #might wanna update with delta
		if(Input.is_action_pressed(aim_left_button)):
			%TankTopGreen.global_rotation -= deg_to_rad(aimSpeed)
		if(Input.is_action_pressed(aim_right_button)):
			%TankTopGreen.global_rotation += deg_to_rad(aimSpeed)
	else:
		%TankTopGreen.global_rotation = %TankTopGreen.global_position.angle_to_point(get_global_mouse_position()) + (PI/2)
	
	if(Input.is_action_pressed(fire_button)):
		fire() #could eventually add parameters to make the bullets more fun. Should do that in tank settings
	
	if(onFire):
		health -= fireDamage * delta
	
	health += maxHealth * regen * delta #regenerates tank health
	healthBar.value = health
	rotation += rotationDirection * rotationSpeed * delta
	move_and_slide()
