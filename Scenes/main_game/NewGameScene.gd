extends Node2D

# This scene is loaded immediately after the initial loading screen.
# The scene sets up the player and two non-player characters.
# All stats and conditions are reset to a fresh start.
	# Basically everything is reset to a null or zero value.



func _ready():
	var clouds_rolling_scene = load("res://Scenes/main_game/CloudsRolling.tscn")
