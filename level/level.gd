extends Node2D

# make game length
var max_time = 10
var min_time = 3

var current_time = max_time

onready var score = [get_node("score1"), get_node("score2")]


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var matchtime = get_node("SpawnerMatchTimer")
onready var time = get_node("SpawnerTimer")
onready var Spawner = load("res://spawner/Spawner.tscn")

func calc_time():
	var current_time_pow = pow(current_time, 2)
	var max_time_pow = pow(max_time, 2) / 2
	return (current_time_pow / max_time_pow)

# Called when the node enters the scene tree for the first time.
func _ready():
	var set_time_value = calc_time()
	matchtime.start(set_time_value)
	time.start(1)
	score[0].get_child(0).text = str(1)


func _on_SpawnerTimer_timeout():
	if (!matchtime.is_stopped()) : 
		print("lskjdf")
		randomize()
		var p1 = int(rand_range(0, get_viewport().size.x/2))
		var p2 = int(rand_range(get_viewport().size.x/2, get_viewport().size.x))
		var set_time_value = calc_time()
		time.set_wait_time(calc_time());
		var spawner1 = Spawner.instance()
		var spawner2 = Spawner.instance()
		spawner1.position = Vector2(p1, 20)
		spawner2.position = Vector2(p2, 20)
#        Spawner.init()
		get_node("SpawnerBag").add_child(spawner1)
		get_node("SpawnerBag").add_child(spawner2)

func _on_SpawnerMatchTimer_timeout():
	if (current_time <= min_time): 
		matchtime.stop()
	current_time -= 1

# level manager
# generte the spawning 

