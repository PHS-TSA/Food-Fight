extends Label


func _ready() -> void:
	if (Global.G_winningPlayer == 1):
		self.text = "Red Player Has Won!"
	elif(Global.G_winningPlayer == 2):
		self.text = "Blue Player Has Won!"
	#self.text = "Player %s has won!" % Global.G_winningPlayer
