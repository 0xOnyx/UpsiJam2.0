extends Node2D

var timeAlive = 2
var time = .1
onready var timer = $Timer
onready var lable = $Label
var i = 1
onready var wait = $wait

func _ready():
#	init("./this is a long test")
	pass
	
func init(text_stream):
	lable.set_text(text_stream)
	timer.set_wait_time(time)
	timer.start()

func letter():
	i += 1
	lable.set_visible_characters(i)
	if lable.get_total_character_count() <= i:
		timer.stop()
		wait.set_wait_time(timeAlive)
		wait.start()


func _on_Timer_timeout():
	letter()


func _on_wait_timeout():
	queue_free()
