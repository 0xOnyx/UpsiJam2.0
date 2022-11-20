extends Node

onready var game_musique = load("res://audio/power.wav")
onready var musique = get_node("musique")

# Called when the node enters the scene tree for the first time.
func _ready():
	musique.stream = game_musique
	musique.play()

func _process(delta):
	pass
