extends Node2D

var growth_rate  = .5
var number_of_leaks = 70
var match_duration = 200
var i = 0
var foo

onready var timer = get_node("Timer2")
onready var Spawner = load("res://spawner/Spawner.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	timer.start(match_duration)
	foo = []
	for x in range(0, number_of_leaks + 1):
		foo.append(pow(x,growth_rate)/pow(number_of_leaks, growth_rate))
		print(foo.pop_front())

func spawn_spawner():
	var spawner = Spawner.instance()
	spawner.position = position;
	spawner.initn(foo[i])
	spawner.position = Vector2(80 + i * 5 , 80)

func _process(delta):
	if foo[i] * match_duration < match_duration - timer.get_time_left():
		i = i + 1
#		print("spawn a ball with", timer.get_time_left())
		spawn_spawner()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
