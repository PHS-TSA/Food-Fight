extends Button


func _on_pressed() -> void:
	Global.mode_selected = "res://Stages/2-Player-Rounds/round_scene_ai.tscn"
	self.get_tree().change_scene_to_file("res://round_config_ui.tscn")
