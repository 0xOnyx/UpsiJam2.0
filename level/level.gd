extends Node2D


onready var score = [get_node("score1"), get_node("score2")]

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	score[0].get_child(0).text = str(1)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

