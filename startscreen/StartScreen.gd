extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var current_select = 0


func _ready():
	pass # Replace with function body.



onready var select_start = get_node("select_start")
onready var select_exit = get_node("select_exit")

func _process(delta):
	if Input.is_action_just_pressed("1_move_down") or Input.is_action_just_pressed("1_move_up"):
		current_select += 1
		current_select %= 2
		if (current_select == 0):
			select_start.show()
			select_exit.hide()
		else :
			select_start.hide()
			select_exit.show()
	if (Input.is_action_just_pressed("1_select") and current_select == 0):
		get_tree().change_scene("res://effect/effect.tscn")
	elif (Input.is_action_just_pressed("1_select") and current_select == 1):
		get_tree().quit()

func _on_Timer_timeout():
	if (current_select == 0):
		if (select_start.is_visible()):
			select_start.hide()
		else:
			select_start.show()
		select_exit.hide()
	else:
		if (select_exit.is_visible()):
			select_exit.hide()
		else:
			select_exit.show()
		select_start.hide()

