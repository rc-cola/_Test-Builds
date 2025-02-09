extends Node2D
@onready var timeline = "res://dialogic/timelines/new_test_timeline.dtl"




func _on_area_2d_body_entered(body):
	if (body.has_method("is_player")):
		Dialogic.start(timeline).process_mode = Node.PROCESS_MODE_ALWAYS
		Dialogic.process_mode = Node.PROCESS_MODE_ALWAYS
		get_tree().paused = true
		Dialogic.timeline_ended.connect(ended)
		


func ended():
	Dialogic.timeline_ended.disconnect(ended)
	get_tree().set_deferred("paused", false)
	print_debug("SIGNAL ENDED ")
