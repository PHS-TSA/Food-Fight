extends Button

#might need to write some good to reset all my global variables


func _on_pressed() -> void:
	#Change this if adding in random maps
	Global.reset_stats()
	self.get_tree().change_scene_to_file(Global.mode_selected)
