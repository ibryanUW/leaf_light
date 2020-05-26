# This scene is instantiated within the main game
# and is called immediately after the latest execution
# of `play_turn()` within the Globals.gd script. 

extends Control

class_name SunlightTileGenerator

# Custom function for getting a random value between 200 (far left) and
# 1700 (far right )
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

func generate_sunlight():
	var light_control = $"."
	print("making some sunlight happen yo")
	for _i in range(5):
		var temp_sun = make_some_sun()
		light_control.add_child(temp_sun)
	return light_control
