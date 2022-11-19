extends Node2D

var growth_rate  = .5
var number_of_leaks = 90
var match_duration = 200
var i = 0
var foo

var side_padding = 150
var middle_padding = 80

onready var timer = get_node("Timer2")
onready var Spawner = load("res://spawner/Spawner.tscn")

func _ready():
	timer.start(match_duration)
	foo = []
	for x in range(0, number_of_leaks + 1):
		foo.append(pow(x,growth_rate)/pow(number_of_leaks, growth_rate))
		print(pow(x,growth_rate)/pow(number_of_leaks, growth_rate))
	
func _process(delta):
	if foo[i] * match_duration < match_duration - timer.get_time_left():
		i = i + 1
#		print("spawn a ball with", timer.get_time_left())
		spawn_spawner()

func spawn_spawner():
	var spawner = Spawner.instance()
	spawner.position = position;
	spawner.initn(foo[i])
	var p
	randomize()
	if i % 2 == 0:
		p = int(rand_range(side_padding, get_viewport().size.x/2) - middle_padding)
	else:
		p = int(rand_range(get_viewport().size.x/2 + middle_padding, get_viewport().size.x) - side_padding)
	spawner.position = Vector2(p, 80)
	get_node("SpawnerBag").add_child(spawner)
	print("tried to make a spawner here", spawner, spawner.position)
	
func _on_Timer_timeout():
	queue_free()
	
