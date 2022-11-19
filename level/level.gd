extends Node2D

# make game length
var max_time = 10
var min_time = 3

var current_time = max_time
onready var side_padding = get_viewport().size.x * .15
onready var middle_padding = get_viewport().size.x * .05
onready var rightpadd_shape = get_node("RightPadding/CollisionShape2D")
#onready var rightpadd_shape = get_node("RightPadding").get_child(0)
onready var rightpadd_line = get_node("RightPadding").get_child(1)
onready var leftpadd_shape = get_node("LeftPadding").get_child(0)
onready var leftpadd_line = get_node("LeftPadding").get_child(1)

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
#	rightpadd_shape.set_shape(RectangleShape2D).extents.x = side_padding*2
#	rightpadd_shape.get_child(0).set_shape(RectangleShape2D).extents.y = side_padding*2
#	rightpadd_line.PoolVector2Array = [[0, 0,], [side_padding, get_viewport().y]]

func _on_SpawnerTimer_timeout():
	if (!matchtime.is_stopped()) : 
		randomize()
		var p1 = int(rand_range(side_padding, get_viewport().size.x/2) - middle_padding)
		randomize()
		var p2 = int(rand_range(get_viewport().size.x/2 + middle_padding, get_viewport().size.x) - side_padding)
		var set_time_value = calc_time()
		time.set_wait_time(calc_time());
		var spawner1 = Spawner.instance()
		var spawner2 = Spawner.instance()
		spawner1.position = Vector2(p1, 20)
		spawner2.position = Vector2(p2, 20)
#        Spawner.init()
		get_node("SpawnerBag").add_child(spawner1)
		get_node("SpawnerBag").add_child(spawner2)

func _on_SpawnerMatchTime_timeout():
	if (current_time <= min_time): 
		matchtime.stop()
	current_time -= 1

# level manager
# generte the spawning 


func _on_SpawnerMatchTimer_timeout():
	pass # Replace with function body.
