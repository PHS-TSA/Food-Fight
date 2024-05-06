extends CharacterBody2D


const SPEED = 300.0
var rotation_rate:float = 100

# Get the gravity from the project settings to be synced with RigidBody nodes.


func _physics_process(delta):
	
	#need to make tank rotate smoothly according to direction,
	var direction = Input.get_vector("left","right","up","down")
	velocity = direction * SPEED

	#Rotates the tank based on direction. Have w/s move it forward / backward. Have a/d rotate the tank left and right
	if(Input.is_action_pressed("up")):
		print("work")
		#velocity
	
	
	
	%TankTopGreen.global_rotation = %TankTopGreen.global_position.angle_to_point(get_global_mouse_position()) + (PI/2)
	

	move_and_slide()
