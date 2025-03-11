extends StaticBody2D
const maxHealth: float = 100.0
var health: float = maxHealth
var healthBar: ProgressBar


func _ready():
	healthBar = self.get_node("HealthBar")
	healthBar.max_value = maxHealth
	healthBar.value = health
	print(healthBar.max_value)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func take_damage(damage: float, fire: bool):
	health -= damage
	healthBar.value = health
	if health <= 0:
		queue_free()
