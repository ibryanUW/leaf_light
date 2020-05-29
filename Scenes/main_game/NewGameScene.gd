extends Node2D

# Establishing some variables to store the player objects
# at run time. This helps cut down on needing a bunch of
# declarations in the _ready() function.
onready var new_game_screen = $"."
onready var sun_gen = SunlightTileGenerator.new()
onready var main_player = $"PlayerCharacter"
onready var main_player_sprite = $"PlayerCharacter/Player"
onready var npc_left = $"NonPlayerCharacterLeft"
onready var npc_right = $"NonPlayerCharacterRight"

func _ready():
	print("Entering new game")
	
# Takes in an *event* parameter that is a global variable in GDScript
# and is defined by the parameter provided to the `is_action_pressed()` function.
# This function will act as the control over the 3 players and initiate
# calls to the NPC's for their moves to be made. 
func _input(event):
	if(event.is_action_pressed('click')):
		# Get distance and angle information
		var sun_collision_box = sun_gen.get_child(1).get_global_position()
		var angle_to_sun_spot = main_player.get_position().angle_to(sun_collision_box)
		print(angle_to_sun_spot)
		if(sun_gen != null):
			# Release current sunbeam object from memory and
			# create a new one which gets new property data.
			sun_gen.free()
			sun_gen = SunlightTileGenerator.new()
			new_game_screen.add_child(sun_gen)



func player_collision_info():
	print("rectangle coords of player sprite ", $"PlayerCharacter/Player".get_rect())
	print($"PlayerCharacter/Player".get_rect().position * $"PlayerCharacter/Player".get_scale())
	print($"PlayerCharacter/Player".get_texture().get_size())
	print($"PlayerCharacter/PlayerCollisionBox".get_shape().get_extents().round())
	print($"PlayerCharacter".get_position())
	get_sun_gen_coords()

func get_sun_gen_coords():
#	var sun_collision_box = sun_gen.get_child(1).get_global_position()
#	print(sun_collision_box)
#	print(sun_gen.get_child(1).get_shape().get_extents())
#	print($"PlayerCharacter".get_position().distance_to(sun_collision_box))
#	print(rad2deg($"PlayerCharacter".get_position().angle_to(sun_collision_box)))

# Checks signal emmited from close button on label and calls function
# to remove the label from the screen.
func _on_CloseInfoLabel_pressed():
	remove_info_text()
	
# Checks if the label is on the screen and removes it from
# memory.
func remove_info_text():
	if($"Game_Start_Info_Label" != null):
		$"Game_Start_Info_Label".queue_free()
