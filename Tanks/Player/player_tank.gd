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

func _ready():
	print("runs")
	onFire = false
	health = maxHealth
	healthBar = $HealthBar
	healthBar.max_value = maxHealth
	healthBar.value = health
	
	aiFired = false
	ai = false
	
	print(healthBar)


func _physics_process(delta): #Seperate physics process for AI and Player 
	
	#TODO find a good way to do firing with this movement
	var direction = Input.get_vector(rotate_left_button, rotate_right_button, forward_button, backwards_button)
	velocity = direction * tankSpeed	 * delta
	#maybe make settings and allow players to choose based on single or multiplayer
	
	#rotationDirection = Input.get_axis(rotate_left_button, rotate_right_button) 
	#velocity = transform.x * Input.get_axis(backwards_button, forward_button) * tankSpeed * delta
	#
	
	if(Global.G_aimMethod): #might wanna update with delta
		if(Input.is_action_pressed(aim_left_button)):
			%PivotPoint.global_rotation -= deg_to_rad(aimSpeed)
		if(Input.is_action_pressed(aim_right_button)):
			%PivotPoint.global_rotation += deg_to_rad(aimSpeed)
	else:
		#%PivotPoint.global_rotation = %PivotPoint.angle_to_point(get_global_mouse_position()) + (PI/2)
		%PivotPoint.global_rotation = get_angle_to(get_global_mouse_position())
	
	if(Input.is_action_pressed(fire_button)):
		fire() #could eventually add parameters to make the bullets more fun. Should do that in tank settings
	
	if(onFire):
		health -= fireDamage * delta
	
	health += maxHealth * regen * delta #regenerates tank health
	healthBar.value = health
	rotation += rotationDirection * rotationSpeed * delta
	move_and_slide()
