extends KinematicBody2D

onready var this_player = PlayerCharacter.new()
onready var branch = Sprite.new()
onready var branch_sprite_texture = load("res://tree_sprites/branch_1_reduced.png")
onready var branch_hit_box = RectangleShape2D.new()
onready var branch_collision_shape = CollisionShape2D.new()

var turn_count = 0

func make_move():
	this_player.play_turn()
	set_turn_count()

func put_branch_on_tree(parent_obj_origin, sprite_scale):
	branch.set_texture(branch_sprite_texture)
	var top_right_x = parent_obj_origin.x - sprite_scale.x
	var top_right_y = parent_obj_origin.y + sprite_scale.y
	print("x ", top_right_x, " y ", top_right_y)
	branch.set_global_position(Vector2(top_right_x, top_right_y))
	branch_hit_box.extents = Vector2(branch.texture.get_height()-5, branch.texture.get_width()-5)
	branch_collision_shape.set_shape(branch_hit_box)
	branch.add_child(branch_collision_shape)
	return branch
	
func get_turn_count():
	return self.turn_count
	
func set_turn_count():
	turn_count+=1
