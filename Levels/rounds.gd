extends Node2D



# Called when the node enters the scene tree for the first time.
func _ready():
	pause_objects(true)
	pass # Replace with function body.
#change scene calls 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	

func pause_objects(pause_unpause:bool):
	for child in self.get_children():
		if(child.has_method("fire")):
			if(pause_unpause):
				child.paused = true
			else:
				child.pause = false
			
