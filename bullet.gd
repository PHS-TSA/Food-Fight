class_name Bullet
extends Area2D

var velocity := Vector2.RIGHT
var traveled_distance := 0.0
var num: int

@onready var ball: Sprite2D = %BallSprite


func _physics_process(delta: float) -> void:
	const SPEED := 300
	const RANGE := 1200
	self.position += self.velocity * SPEED * delta
	self.traveled_distance += SPEED * delta
	if self.traveled_distance > RANGE:
		queue_free()


func _on_body_entered(body: Node2D) -> void:
	queue_free()
	
