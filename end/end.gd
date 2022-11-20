extends Node2D

var playerScore1 = Globals.get("score1")
var playerScore2 = Globals.get("score2")

onready var root = get_tree().root
onready var score1Node = get_node("score1")
onready var score2Node = get_node("score2")
onready var you1 = get_node("you1")
onready var you2 = get_node("you2")
var audioLeft = load("res://audio/player_left.mp3")
var audioRight = load("res://audio/player_right.mp3")
onready var player = get_node("player")

func _ready():
	score1Node.text = str(playerScore1)
	score2Node.text = str(playerScore2)
	if (playerScore1 > playerScore2) : 
		you2.text = "You WIN !"
		you1.text = "You LOSE !"
		player.stream = audioRight
	else: 
		you1.text = "You WIN !"
		you2.text = "You LOSE !"
		player.stream = audioLeft
	player.play()

func _process(delta):
	if (Input.is_action_just_pressed("1_select")):
		get_tree().change_scene("res://effect/effect.tscn")

func _on_player_finished():
	player.stop()

onready var pressEnter = get_node("PressEnter")

func _on_Timer_timeout():
	if (pressEnter.is_visible()):
		pressEnter.hide()
	else:
		pressEnter.show()
