extends Tank

func _init():
	super._init("rotate_left_alt","rotate_right_alt","aim_left_alt","aim_right_alt","forwards_alt","backwards_alt","fire_alt")




func _on_fire_timer_timeout():
	self.onFire = false
	$Fire.visible = false
