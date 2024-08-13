extends TextureButton

var card_name:String
signal card_picked()


func _on_pressed(): #update this later to support multiple players
	Global.G_cards_picked.append(card_name)
	card_picked.emit()
