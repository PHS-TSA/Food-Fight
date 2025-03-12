extends Node2D


func _on_player_round_button_pressed() -> void:
	Global.mode_selected = "res://Stages/2-Player-Rounds/round_scene.tscn"
	self.get_tree().change_scene_to_file("res://round_config_ui.tscn")


func _on_player_ai_button_pressed() -> void:
	Global.mode_selected = "res://Stages/2-Player-Rounds/round_scene_ai.tscn"
	self.get_tree().change_scene_to_file("res://round_config_ui.tscn")


func _on_tutorial_button_pressed() -> void:
	self.get_tree().change_scene_to_file("res://tutorial.tscn")
	pass # Replace with function body.


func _on_quitbutton_pressed() -> void:
	get_tree().quit()
	pass # Replace with function body.
