extends KinematicBody2D

onready var this_player = PlayerCharacter.new()
onready var branch = Sprite.new()
onready var branch_sprite_texture = load("res://tree_sprites/branch_1_reduced.png")
onready var branch_hit_box = RectangleShape2D.new()
onready var branch_collision_shape = CollisionShape2D.new()

var turn_count = 0
var how_far_to_grow = 0


#func make_move_right(point_to_grow_to):
#	print("moving right")
#	this_player.play_turn()
#
##	put_branch_on_tree()
#
#func make_move_left(point_to_grow_to):
#	print("moving left")
#	this_player.play_turn()

#	put_branch_on_tree()

func set_growth_distance(grow_dist):
	how_far_to_grow = sqrt(grow_dist)
	print("how far to grow ", how_far_to_grow)
	return how_far_to_grow

func put_branch_on_tree(angle, target_pos, origin_point, parent_obj):
	branch.set_texture(branch_sprite_texture)
	var btm_left_x = branch.texture.get_width()
	var btm_left_y = branch.texture.get_height()
	var texture_area = btm_left_x * btm_left_y
	var sprite_spread = round(how_far_to_grow / btm_left_y)
	print(sprite_spread)
	
	for _i in sprite_spread:
		var new_x = origin_point.x + btm_left_x
		var new_y = origin_point.y - btm_left_y
		branch.set_global_position(Vector2(new_x, new_y))
		branch_hit_box.extents = Vector2(btm_left_x/2, btm_left_y/2)
		
		branch_collision_shape.set_shape(branch_hit_box)
		branch.add_child(branch_collision_shape)
		
		print(branch_collision_shape.get_global_position())
#		branch.look_at(target_pos)
		parent_obj.add_child(branch)
	
func get_turn_count():
	return self.turn_count
	
func set_turn_count(turn_counter):
	turn_count+=1
