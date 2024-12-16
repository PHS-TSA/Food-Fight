extends Control

#Basic implementation for now. update later once tile map and level design is finalized

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#TODO change implementation if doing more than two players
	var scoreString = ("%s to %s" % [Global.G_wins[0],Global.G_wins[1]])
	%ScoreLabel.text = scoreString
	#for player in Global.G_wins:
		#%ScoreLabel.text += Global.G_wins
	#var scoreString = Global.G_wins
	#%ScoreLabel.text = scoreString[]
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
