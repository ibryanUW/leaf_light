extends CanvasLayer

onready var load_progress = $ProgressBar

func _ready():
	adjust_progress_bar()

func adjust_progress_bar():
	var load_time = 0
	while (load_time <= 100):
		var _time_out = yield(get_tree().create_timer(0.025), "timeout")
		load_time+=1
		load_progress.value = load_time
	Globals.goto_scene("res://Scenes/main_game/NewGameScene.tscn")
