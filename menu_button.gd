extends Button


func _on_pressed() -> void:
	self.get_tree().change_scene_to_file("res://Stages/start_menu.tscn")
