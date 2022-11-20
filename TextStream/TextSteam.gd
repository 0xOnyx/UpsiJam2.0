extends Control

var time = .9
onready var timer = $Timer
onready var lable = $Label
var i = 1

func _ready():
	init("./this is a long test")
	pass # Replace with function body.

func init(text_stream):
	lable.set_text(text_stream)
	time = time * lable.get_total_character_count()
#	timer.set_wait_time(time)
#	timer.start()
	letter()

func letter():
	lable.set_visible_characters(i + 1)
	timer.set_wait_time(time)
	timer.start()
	if lable.get_total_character_count() == i:
		queue_free()

func _on_Timer_timeout():
	timer.stop()
	letter()
