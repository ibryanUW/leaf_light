extends Node


var current_scene = null

# Get current scene.
# Script is Autoloaded so is first to load, current scene is last to load (last child in tree)
func _ready():
	var tree_root = get_tree().get_root()
	current_scene = tree_root.get_child(tree_root.get_child_count() -1)
	
	
# Custom function to handle moving to a different scene
func goto_scene(path):
	# Check if current scene is still executing,
		# if true, defer loading.
	call_deferred("_deferred_goto_scene", path)
	
func _deferred_goto_scene(path):
		# Okay to release current scene
		current_scene.free()
		
		# Load new scene and create instance for use of methods.
		var new_scene = ResourceLoader.load(path)
		current_scene = new_scene.instance()
		
		# Add new_scene as child of current_scene to sort list
		# of scenes so they load in order.
		get_tree().get_root().add_child(current_scene)
		
		# Adding compatibility for SceneTree.change_scene() API
		get_tree().set_current_scene(current_scene)
