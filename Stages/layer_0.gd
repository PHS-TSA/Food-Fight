extends TileMapLayer

@onready var obstacles:TileMapLayer = $"../Obstacles"


func _use_tile_data_runtime_update(coords):
	if coords in obstacles.get_used_cells_by_id(7): #ID 2 because the id for this tileset is 2
		return true
	if coords in obstacles.get_used_cells_by_id(0):
		return true
	return false

func _tile_data_runtime_update(coords:Vector2i, tile_data:TileData):
	#if(coords in obstacles.get_used_cells_by_id(2)): #Checks if there obstacles on the coords for this layer
	tile_data.set_navigation_polygon(0,null)
		
