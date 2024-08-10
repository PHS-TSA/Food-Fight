extends Tank





@onready var player = get_player()
var randomNum = randi_range(0,360)

@onready var nav: NavigationAgent2D = $NavigationAgent2D

func _ready():
	print(player)
	print(get_player())
	tankSpeed *= 0.5
	

func _physics_process(delta):
	#move(get_circle_position(randomNum),delta)
	var direction = Vector3()
	nav.target_position = player.global_position
	
	direction = nav.get_next_path_position() - global_position
	direction = direction.normalized()
	
	#velocity = direction * tankSpeed * delta
	#move_and_slide()
	var intended_velocity = direction * tankSpeed * delta
	nav.set_velocity(intended_velocity)
		

func move(target,delta):

	rotation = get_angle_to(target)
	velocity = transform.x * tankSpeed
	move_and_slide()
	
	
	
func get_circle_position(random): #Sets a target near the player
	var kill_circle_centre = player.global_position
	var radius = 100
	 #Distance from center to circumference of circle
	var angle = random * PI * 2;
	var x = kill_circle_centre.x + cos(angle) * radius;
	var y = kill_circle_centre.y + sin(angle) * radius;

	return Vector2(x, y)


func get_player():
	for child in get_parent().get_children():
		#print(get_tree().get_child(i))
		if(child.name == "Tank"): #TODO add in support for other player names and multi player and when the ai tank is a child of something other than the tree
			return	child


func _on_navigation_agent_2d_velocity_computed(safe_velocity):
	velocity = safe_velocity
	move_and_slide()
	pass # Replace with function body.
