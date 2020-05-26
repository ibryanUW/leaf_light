extends Node2D

onready var new_game_screen = $"."
onready var sun_gen

func _ready():
	print("something")
	

func _input(event):
	if(event.is_action_pressed('click')):
		if(sun_gen == null):
			print("click")
			sun_gen = SunlightTileGenerator.new()
			new_game_screen.add_child(sun_gen.generate_sunlight())
		else:
			print("was not null, click")
			sun_gen.free()
			sun_gen = SunlightTileGenerator.new()
			new_game_screen.add_child(sun_gen.generate_sunlight())
