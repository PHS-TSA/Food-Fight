extends Control

@onready var label: Label = %ScoreLabel

# Basic implementation for now. Update later once tile map and level design is finalized.


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# TODO: change implementation if doing more than two players
	var scoreString := "%s to %s" % [Global.G_wins[0], Global.G_wins[1]]
	label.text = scoreString
