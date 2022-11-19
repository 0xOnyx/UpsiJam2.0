extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var time = 0;
onready var max_time = get_parent().max_duration
onready var timer = get_node("Timer1")

func _ready():
	time.set_wait_time(max_time)

func _on_Timer_timeout():
	time++
	print(time)
