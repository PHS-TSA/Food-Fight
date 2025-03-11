extends CheckButton

func _ready() -> void:
	button_pressed = Global.autoaim



func _on_pressed() -> void:
	Global.autoaim = button_pressed
