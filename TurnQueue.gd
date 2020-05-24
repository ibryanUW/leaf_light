extends Node

class_name TurnQueue

var active_character

func initialize():
	# Getting the first child from the tree and storing it
	# in a variable called `active_character` to represent the
	# current player.
	active_character = get_child(0)
	
func play_turn():
	yield(active_character.play_turn(), "completed")
	
	# Get the current player's index in the tree and add 1 to adjust for
	# array positioning and tell program that end of queue has been reached.
	var new_index : int = (active_character.get_index() + 1) % get_child_count()
	
	# Set `active_character` to the node retreived in previous line.
	active_character = get_child(new_index)
