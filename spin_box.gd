extends SpinBox


func _ready() -> void:
	var line_edit = get_line_edit()
	# Set the minumum character width of the line edit to 1
	line_edit.add_theme_constant_override("minimum_character_width", 50)
	# Resize the spin box to update the size
	size = Vector2.ZERO
