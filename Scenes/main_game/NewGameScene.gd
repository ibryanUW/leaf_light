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

var turn_counter

func _ready():
	print("Entering new game")
	turn_counter = 0
	new_game_screen.add_child(sun_gen)
	
func _input(event):
	if(event.is_action_pressed("click")):
		playing_turn()
	
# 
func playing_turn():
	if(sun_gen != null):
		# Release current sunbeam object from memory and
		# create a new one which gets new property data.
#		sun_gen.free()
#		sun_gen = SunlightTileGenerator.new()
#		new_game_screen.add_child(sun_gen)
		turn_counter+=1
		var current_angle_to_sun = get_angle_data(sun_gen) - 90
		var current_sun_textrect_global_pos = sun_gen.get_global_position()
		main_player.put_branch_on_tree(current_angle_to_sun, current_sun_textrect_global_pos, main_player.get_global_position(), main_player)
		var grow_distance = main_player.get_global_position().distance_to(current_sun_textrect_global_pos)
		main_player.set_growth_distance(grow_distance)
		main_player.set_turn_count(turn_counter)
		

#
func player_collision_info():
	print("rectangle coords of player sprite ", $"PlayerCharacter/Player".get_rect())
	print($"PlayerCharacter/Player".get_rect().position * $"PlayerCharacter/Player".get_scale())
	print($"PlayerCharacter/Player".get_texture().get_size())
	print($"PlayerCharacter/PlayerCollisionBox".get_shape().get_extents().round())
	print($"PlayerCharacter".get_position())


func get_angle_data(current_sun_textrect):
	# Get distance and angle information
	var current_sun_textrect_pos = current_sun_textrect.get_child(0).get_global_position()
	var angle_to_sun_spot = abs(rad2deg(main_player.get_position().angle_to_point(current_sun_textrect_pos)))
	return angle_to_sun_spot
#	print(angle_to_sun_spot-90)
#	print(current_sun_textrect)

# Checks signal emmited from close button on label and calls function
# to remove the label from the screen.
func _on_CloseInfoLabel_pressed():
	remove_info_text()

# Checks if the label is on the screen and removes it from
# memory.
func remove_info_text():
	if($"Game_Start_Info_Label" != null):
		$"Game_Start_Info_Label".queue_free()
