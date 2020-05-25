# This scene is instantiated within the main game
# and is called immediately after the latest execution
# of `play_turn()` within the Globals.gd script. 

extends Control

onready var sunlight_grid = $"."

func _ready():
	print("making some sunlight happen yo")
	
	var sun_spot_1 = make_some_sun()
	sunlight_grid.add_child(sun_spot_1)
	
	var sun_spot_2 = make_some_sun()
	sunlight_grid.add_child(sun_spot_2)
	
	var sun_spot_3 = make_some_sun()
	sunlight_grid.add_child(sun_spot_3)
	
	var sun_spot_4 = make_some_sun()
	sunlight_grid.add_child(sun_spot_4)
	
	var sun_spot_5 = make_some_sun()
	sunlight_grid.add_child(sun_spot_5)

func set_sprite_pos_x():
	return rand_range(200, 1700)
	
func set_sprite_pos_y():
	return rand_range(300, 900)

func make_some_sun():
	# Creating a new sun spot with a base of a TextureRect because it needs
	# to load the sunlight beam texture into something.
	var sun_spot = TextureRect.new()
	sun_spot.texture = load("res://scenery_objects/sunlight_tile_1_Small.png")
	
	# Also need a collision box to check against the tree's collision box 
	# and determine if they are touching.
	var sun_spot_collision_shape = CollisionShape2D.new()
	sun_spot_collision_shape.set_shape(RectangleShape2D)
	sun_spot.add_child(sun_spot_collision_shape)
	
	sun_spot.margin_left = set_sprite_pos_x()
	sun_spot.margin_top = set_sprite_pos_y()
	
	return sun_spot
