extends Tank

var randomNum = randi_range(0,360)

@onready var player = get_player()
@onready var nav: NavigationAgent2D = $NavigationAgent2D


func _ready():
	tankSpeed *= 0.5
	onFire = false
	health = maxHealth
	healthBar = $HealthBar
	healthBar.max_value = maxHealth
	healthBar.value = health
	
	aiFired = true
	ai = true
	fire()

func _physics_process(delta):
	var direction = Vector3()
	nav.target_position = player.global_position
	
	direction = nav.get_next_path_position() - global_position
	direction = direction.normalized()

	rotation = direction.angle()
	#Points cannon to player
	%TankTopGreen.global_rotation = %TankTopGreen.global_position.angle_to_point(player.global_position) + (PI/2) 
	var intended_velocity = direction * tankSpeed * delta * 0.2
	if nav.avoidance_enabled:
		nav.set_velocity(intended_velocity)
	else:
		_on_navigation_agent_2d_velocity_computed(intended_velocity)
		
	
	move_and_slide()


 ## Set a target near the player.
#func get_circle_position(random):
	#var kill_circle_centre = player.global_position
	#var radius = 100
	 ##Distance from center to circumference of circle
	#var angle = random * PI * 2;
	#var x = kill_circle_centre.x + cos(angle) * radius;
	#var y = kill_circle_centre.y + sin(angle) * radius;
#
	#return Vector2(x, y)
#

func get_player():
	for child in get_parent().get_children():
		if(child.name == "Tank"): #TODO add in support for other player names and multi player and when the ai tank is a child of something other than the tree
			return	child


func _on_navigation_agent_2d_velocity_computed(safe_velocity): #Makes it so this agent doesnt colide with others
	#TODO update avoidance values in navigation agent 2D so ai tanks dont collide 
	velocity = safe_velocity


func _on_fire_timer_timeout():
	self.onFire = false
	$Fire.visible = false


func _on_attack_speed_timeout():
	self.attackCooldown = false
	fire()
