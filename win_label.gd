extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.text = ("Player " + Global.G_winningPlayer + " has won!")
