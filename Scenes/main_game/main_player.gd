extends KinematicBody2D

onready var this_player = PlayerCharacter.new()
var turn_count = 0

func make_move():
	this_player.play_turn()
	set_turn_count()

func get_turn_count():
	return self.turn_count
	
func set_turn_count():
	turn_count+=1
