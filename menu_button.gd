extends Button


func _on_pressed() -> void:
	Global.reset_stats()
	self.get_tree().change_scene_to_file("res://Stages/start_menu.tscn")
