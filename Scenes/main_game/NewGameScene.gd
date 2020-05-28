extends Node2D

onready var new_game_screen = $"."
onready var sun_gen = SunlightTileGenerator.new()

func _ready():
	print("Entering new game")

func _input(event):
	if(event.is_action_pressed('click')):
		if(sun_gen == null):
			print("click")
			new_game_screen.add_child(sun_gen)
		else:
			print("was not null, click")
			if($"Game_Start_Info_Label" != null):
				$"Game_Start_Info_Label".queue_free()
			sun_gen.free()
			print(player_collision_info())
			sun_gen = SunlightTileGenerator.new()
			new_game_screen.add_child(sun_gen)

func player_collision_info():
	print($"PlayerCharacter/Player".get_rect())
	print($"PlayerCharacter/Player".get_rect().position * 0.25)
	print($"PlayerCharacter/Player".get_texture().get_size())
	print($"PlayerCharacter/PlayerCollisionBox".get_shape().get_extents().round())
	print($"PlayerCharacter".get_position())
