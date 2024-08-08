extends Tank


#passed in input variables to tank constructer
func _init():
	super._init("rotate_left","rotate_right","aim_left","aim_right","forwards","backwards","fire")


func _on_fire_timer_timeout():
	self.onFire = false
	$Fire.visible = false
	pass # Replace with function body.


func _on_attack_speed_timeout():
	self.attackCooldown = false
	pass # Replace with function body.
