extends Node2D

onready var new_game_screen = $"."
onready var sun_gen = SunlightTileGenerator.new()
onready var main_player = $"PlayerCharacter"
onready var npc_left = $"NonPlayerCharacterLeft"
onready var npc_right = $"NonPlayerCharacterRight"

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
			player_collision_info()
			main_player.make_move()
			print(main_player.get_turn_count())
			npc_left.make_move()
			print(npc_left.get_turn_count())
			npc_right.make_move()
			print(npc_right.get_turn_count())
		else:
			print("was null")

func player_collision_info():
	print($"PlayerCharacter/Player".get_rect())
	print($"PlayerCharacter/Player".get_rect().position * $"PlayerCharacter/Player".get_scale())
	print($"PlayerCharacter/Player".get_texture().get_size())
	print($"PlayerCharacter/PlayerCollisionBox".get_shape().get_extents().round())
	print($"PlayerCharacter".get_position())
	get_sun_gen_coords()

func get_sun_gen_coords():
	var sun_collision_box = sun_gen.get_child(1).get_global_position()
	print(sun_gen.get_child(1).get_shape().get_extents())
	print($"PlayerCharacter".get_position().distance_to(sun_collision_box))
	print(rad2deg($"PlayerCharacter".get_position().angle_to(sun_collision_box)))
