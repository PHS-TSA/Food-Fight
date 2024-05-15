class_name Bullet
extends Area2D

var velocity := Vector2.from_angle(self.global_rotation)
var traveled_distance := 0.0

#stats
var SPEED := 400
var RANGE := 1200
var damage:float = 10



func _physics_process(delta: float) -> void:

	#gonna be honest i don't really know how this bullet code works. It just does
	#the velocity.rotated just gives the angle as a vector i think
	self.position += velocity.rotated(global_rotation-(PI/2)) * SPEED * delta
	self.traveled_distance += SPEED * delta
	if self.traveled_distance > RANGE:
		queue_free()


func _on_body_entered(body: Node2D) -> void:
	queue_free()
	if(body.has_method("take_damage")):
		body.take_damage(damage)
	
