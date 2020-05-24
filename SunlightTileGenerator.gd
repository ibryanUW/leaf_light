extends Node2D

func _ready():
	print("making some sunlight happen yo")
	var sun_spot_1 = TextureRect.new()
	sun_spot_1.texture = load("res://scenery_objects/sunlight_tile_1.png")
	sun_spot_1.anchor_left = 0
	sun_spot_1.anchor_right = 0
	sun_spot_1.anchor_bottom = 0
	sun_spot_1.anchor_top = 0
	
	var sunlight_dimensions = sun_spot_1.texture.get_size()
	print(sunlight_dimensions)
	sun_spot_1.texture.rect_size(100,100)
	add_child(sun_spot_1)
