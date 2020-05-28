extends Node2D

onready var new_game_screen = $"."
onready var sun_gen = SunlightTileGenerator.new()

func _ready():
	print("Entering new game")

func _input(event):
	if(event.is_action_pressed('click')):
		if(sun_gen != null):
			if($"Game_Start_Info_Label" != null):
				$"Game_Start_Info_Label".queue_free()
			sun_gen.free()
			sun_gen = SunlightTileGenerator.new()
			new_game_screen.add_child(sun_gen)
			print(get_sun_gen_coords(), sun_gen.get_child(1).get_global_position())
			player_collision_info()
		else:
			print("was null")

func player_collision_info():
	print($"PlayerCharacter/Player".get_rect())
	print($"PlayerCharacter/Player".get_rect().position * 0.25)
	print($"PlayerCharacter/Player".get_texture().get_size())
	print($"PlayerCharacter/PlayerCollisionBox".get_shape().get_extents().round())
	print($"PlayerCharacter".get_position())
#	print($"PlayerCharacter".get_position().distance_to())

func get_sun_gen_coords():
	return sun_gen.get_parent()
