class_name Bullet
extends Area2D

var velocity := Vector2.from_angle(self.global_rotation)
var traveled_distance := 0.0


#stats
var speed:float
var range:float 
var damage:float 
var size:float
var fireB:bool
var aiFired:bool

func _ready():
	self.set_scale(Vector2(size, size))



func _physics_process(delta: float) -> void:

	#gonna be honest i don't really know how this bullet code works. It just does
	#the velocity.rotated just gives the angle as a vector i think
	self.position += velocity.rotated(global_rotation-(PI/2)) * speed * delta
	self.traveled_distance += speed * delta
	print(self.speed)
	if self.traveled_distance > range:
		queue_free()


func _on_body_entered(body: Node2D) -> void:
	#Logic so big food doesn't kill player. Update in future to be more efficient 
	if(traveled_distance < 2):
		return
	queue_free()
	if(body.has_method("take_damage")):
		body.take_damage(damage,fireB,aiFired)
	
