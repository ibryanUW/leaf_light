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
			sun_gen = SunlightTileGenerator.new()
			new_game_screen.add_child(sun_gen)

