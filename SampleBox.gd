extends StaticBody2D
const maxHealth:float = 100.0
var health:float = maxHealth
var healthBar:ProgressBar


# Called when the node enters the scene tree for the first time.
func _ready():
	healthBar = self.get_node("HealthBar")
	healthBar.max_value = maxHealth
	healthBar.value = health
	print(healthBar.max_value)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func take_damage(damage:float,fire:bool):
	health -= damage
	healthBar.value = health
	if(health <= 0):
		queue_free()
