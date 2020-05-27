extends KinematicBody2D

func _ready():
	print("Entering the main player script now...")
	
func play_turn():
	print("Player", get_position_in_parent(), "'s move")
	
