extends Node2D


onready var realtime = get_node("RealTime")
onready var time = get_node("Timer")

var max_time = 6
var min_time = 1
var current_time = min_time

onready var audio = get_node("AudioStreamPlayer2D")

func _ready():
	audio.play(9)
	realtime.start(0.1)

onready var elementText = get_node("RichTextLabel")


func _on_Timer_timeout():
	if (!realtime.is_stopped()) : 
		elementText.set_percent_visible(float(current_time) / float(max_time))
		print(float(current_time) / float(max_time))
	else:
		get_tree().change_scene("res://effect/effect.tscn")

func _on_RealTime_timeout():
	if (current_time >= max_time): 
		realtime.stop()
	current_time += 0.1
