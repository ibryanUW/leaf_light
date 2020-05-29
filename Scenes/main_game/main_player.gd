extends KinematicBody2D

onready var this_player = PlayerCharacter.new()
onready var branch = Sprite.new()
onready var branch_sprite_texture = load("res://tree_sprites/branch_1_reduced.png")
onready var branch_hit_box = RectangleShape2D.new()
onready var branch_collision_shape = CollisionShape2D.new()

var turn_count = 0

func make_move(current_angle):
	if(current_angle >= 0):
		pass
	
func make_move_right():
	print("moving right")
	this_player.play_turn()
	set_turn_count()

func make_move_left():
	this_player.play_turn()
	set_turn_count()
	print("moving left")

func make_move_up():
	this_player.play_turn()
	set_turn_count()
	print("moving up")

func put_branch_on_tree(parent_obj_origin):
	branch.set_texture(branch_sprite_texture)
	
	var btm_left_x = branch.texture.get_width()
	var btm_left_y = branch.texture.get_height()
	print("btm_x ", btm_left_x, " btm_y ", btm_left_y)
	var top_right_x = parent_obj_origin.x + btm_left_x
	var top_right_y = parent_obj_origin.y - btm_left_y
	
	print("x ", top_right_x, " y ", top_right_y)
	
	branch.set_global_position(Vector2(top_right_x, top_right_y))
	branch_hit_box.extents = Vector2(btm_left_x/2, btm_left_y/2)
	
	branch_collision_shape.set_shape(branch_hit_box)
	branch.add_child(branch_collision_shape)
	
	print(branch_collision_shape.get_global_position())
	return branch
	
func get_turn_count():
	return self.turn_count
	
func set_turn_count():
	turn_count+=1
