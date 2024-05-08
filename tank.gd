extends CharacterBody2D


const SPEED = 300.0
var rotationSpeed:float = 4
var aimSpeed:float = 5
var aimMethod:bool = true #true = key board. false = mouse

# Get the gravity from the project settings to be synced with RigidBody nodes.

var rotationDirection = 0

func get_input():
	rotationDirection = Input.get_axis("rotate_left", "rotate_right") 
	velocity = transform.x * Input.get_axis("backwards", "forwards") * SPEED
	if(aimMethod):
		if(Input.is_action_pressed("aim_left")):
			%TankTopGreen.global_rotation -= deg_to_rad(aimSpeed)
		if(Input.is_action_pressed("aim_right")):
			%TankTopGreen.global_rotation += deg_to_rad(aimSpeed)
	else:
		%TankTopGreen.global_rotation = %TankTopGreen.global_position.angle_to_point(get_global_mouse_position()) + (PI/2)
	
func _physics_process(delta):	
	get_input()
	rotation += rotationDirection * rotationSpeed * delta
	move_and_slide()
	

	

	

	move_and_slide()
