extends Control


func _ready():
	$AnimationPlayer.play("RESET")
	self.visible = false


func resume():
	get_tree().paused = false
	$AnimationPlayer.play_backwards("pause")
	self.visible = false


func pause():
	self.visible = true
	get_tree().paused = true
	$AnimationPlayer.play("pause")


func testEsc():
	if Input.is_action_just_pressed("esc") and get_tree().paused == false:
		print("holy smokes")
		pause()
	elif Input.is_action_just_pressed("esc") and get_tree().paused == true:
		print("holy dokes")
		resume()


func _on_resume_pressed():
	resume()


func _on_restart_pressed():
	Global.reset_stats()
	get_tree().paused = false
	self.get_tree().change_scene_to_file(Global.mode_selected)


func _on_quit_pressed():
	self.get_tree().change_scene_to_file("res://Stages/start_menu.tscn")
	get_tree().paused = false


func _process(delta):
	testEsc()
