# This scene is instantiated within the main game
# and is called immediately after the latest execution
# of `play_turn()` within the Globals.gd script. 

extends Node2D

class_name SunlightTileGenerator

# Class variables.
onready var light_control = $"."
onready var sun_spot = TextureRect.new()
onready var sun_spot_hit_box = RectangleShape2D.new()

func _ready():
	generate_sunlight()

# Custom function for getting a random value between 200 (far left) and
# 1700 (far right ).
func create_pos_x():
	return rand_range(200, 1700)

# @see create_pos_x
func create_pos_y():
	return rand_range(200, 900)

# 
func make_some_sun():
	# Setting texture
	sun_spot.texture = load("res://scenery_objects/sunlight_tile_1_Small.png")
	sun_spot.margin_left = create_pos_x()
	sun_spot.margin_top = create_pos_y()
	sun_spot_hit_box.extents = Vector2(35,40)

func generate_sunlight():
	print("making some sunlight happen yo")
	make_some_sun()
	# Add children
	light_control.add_child(sun_spot)
	var temp_collision_shape = CollisionShape2D.new()
	temp_collision_shape.set_shape(sun_spot_hit_box)
	light_control.add_child(temp_collision_shape)
	temp_collision_shape.set_position(Vector2(sun_spot.margin_left + 35, sun_spot.margin_top + 40))
