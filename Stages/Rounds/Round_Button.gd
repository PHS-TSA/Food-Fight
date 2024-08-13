extends Button


func _on_pressed():
	self.get_tree().change_scene_to_file("res://Stages/Rounds/round_scene.tscn")
