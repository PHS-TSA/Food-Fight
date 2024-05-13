extends CharacterBody2D

const BULLET = preload("res://bullet.tscn") 

#Tank Stats
const SPEED = 300.0
var rotationSpeed:float = 4
var aimSpeed:float = 5
var aimMethod:bool = true #true = key board. false = mouse

#Bullet Stats
var damage:float = 10



var rotationDirection = 0


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
