extends Button


func _on_pressed():
	Global.mode_selected = "res://Stages/2-Player-Rounds/round_scene.tscn"
	self.get_tree().change_scene_to_file("res://round_config_ui.tscn")
