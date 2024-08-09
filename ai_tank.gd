extends Tank


enum{
	SURROUND,
	ATTACK,
	HIT,
}

var state = SURROUND
@onready var player = get_player()
var randomNum = randi_range(0,360)

func _ready():
	print(player)
	print(get_player())
	tankSpeed *= 0.5
	

func _physics_process(delta):
	match state:
		SURROUND:
			move(get_circle_position(randomNum),delta)
		

func move(target,delta):
	var direction = (target - global_position).normalized() 
	var desired_velocity =  direction * tankSpeed
	var steering = (desired_velocity - velocity) * delta * 2.5
	velocity += steering
	move_and_slide()
	
	
	
func get_circle_position(random):
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
