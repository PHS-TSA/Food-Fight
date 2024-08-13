extends Button


# Called when the node enters the scene tree for the first time.


func _on_pressed():
	self.get_tree().change_scene_to_file("res://Stages/Demo/demo_test_scene.tscn")
