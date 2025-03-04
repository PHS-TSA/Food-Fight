extends Label


func _ready() -> void:
	self.text = "Player %s has won!" % Global.G_winningPlayer
