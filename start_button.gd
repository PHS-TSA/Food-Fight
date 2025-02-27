extends Button


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_pressed() -> void:
	#If adding more modes. change this to route to a passed in scence
	Global.total_rounds = int(%RoundCounter.get_line_edit().text)
	
	#If 2 player use keyboard aiming
	if(Global.mode_selected == "res://Stages/2-Player-Rounds/round_scene.tscn"):
		Global.G_aimMethod = true
	#Use mouse aiming
	else:
		Global.G_aimMethod = false
	#Using mode selected to allow for single player vs ai
	self.get_tree().change_scene_to_file(Global.mode_selected)
	pass # Replace with function body.
