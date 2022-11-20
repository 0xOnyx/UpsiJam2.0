extends Node2D

var growth_rate  = .9
var number_of_leaks = 50
onready var match_duration = get_parent().max_time
var i = 0
var foo

onready var top_offset = 170 # need to copy thi wth Cursor.gd if you change this
onready var side_padding = 300
onready var middle_padding = 60
onready var left_player = Vector2(120, 200)
onready var right_player = Vector2(300, 500)

onready var timer = get_node("Timer2")
onready var Spawner = load("res://spawner/Spawner.tscn")
onready var TextStream = load("res://TextStream/TextSteam.tscn")

func _ready():
	timer.start(match_duration)
	foo = []
	_resized()
	for x in range(0, number_of_leaks + 1):
		foo.append(pow(x,growth_rate)/pow(number_of_leaks, growth_rate))
		#print(pow(x,growth_rate)/pow(number_of_leaks, growth_rate))
	
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
		p = int(rand_range(left_player.x, left_player.y))
		var ts = TextStream.instance()
		ts.position = $PlayerLeft.get_position()
		.add_child(ts)
		ts.init("/a test string")
	else:
		p = int(rand_range(right_player.x, right_player.y))
	spawner.position = Vector2(p, top_offset)
	get_node("SpawnerBag").add_child(spawner)
	# print("tried to make a spawner here", spawner, spawner.position)
	
func _on_Timer_timeout():
	queue_free()
	
func _resized():
	left_player.x = side_padding
	left_player.y = .get_viewport().size.x/2 - middle_padding
	right_player.x = .get_viewport().size.x/2 + middle_padding
	right_player.y = .get_viewport().size.x - side_padding
