extends CharacterBody2D


const SPEED = 300.0
var rotation_rate:float = 100

# Get the gravity from the project settings to be synced with RigidBody nodes.


func _physics_process(delta):
	
	#need to make tank rotate smoothly according to direction,
	var direction = Input.get_vector("left","right","up","down")
	
	velocity = direction * SPEED
	
	print(%TankBottomGreen.global_rotation)
	match(Input):
		"left":
			%TankBottomGreen.global_rotation.move_toward(PI,rotation_rate)
			%TankCollision.global_rotation.move_toward(PI,rotation_rate)
			print(%TankBottomGreen.global_rotation)
		"right":
			%TankBottomGreen.global_rotation.move_toward(0,rotation_rate)
			%TankCollision.global_rotation.move_toward(0,rotation_rate)
			print(%TankBottomGreen.global_rotation)
		"up":
			%TankBottomGreen.global_rotation.move_toward(PI/2,rotation_rate)
			%TankCollision.global_rotation.move_toward(PI,rotation_rate)
		"down":
			%TankBottomGreen.global_rotation.move_toward(3*PI/2,rotation_rate)
			%TankCollision.global_rotation.move_toward(3*PI/2,rotation_rate)
		
	
	#var rotate_value:float = 
	
	%TankTopGreen.global_rotation = %TankTopGreen.global_position.angle_to_point(get_global_mouse_position()) + (PI/2)
	#if direction:
		#velocity.x = direction * SPEED
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
