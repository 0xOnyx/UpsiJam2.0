extends Position2D

var max_time = 10
var min_time = 3
var current_time = max_time
var style = -1

onready var realtime = get_node("RealTime")
onready var time = get_node("Timer")
onready var Ball = load("res://ball/ball.tscn")
	
func calc_time():
	var current_time_pow = pow(current_time, 2)
	var max_time_pow = pow(max_time, 2) / 2
	return (current_time_pow / max_time_pow)

func _ready():
	var set_time_value = calc_time()
	realtime.start(set_time_value)
	time.start(1)
	

func _process(delta):
	pass


func _on_Timer_timeout():
	if (!realtime.is_stopped()) : 
		var set_time_value = calc_time()
		time.set_wait_time(calc_time());
		var ball = Ball.instance()
		if (style == -1):
			randomize()
			style = randi() % ball.numbersBalls
		ball.init(style)
		ball.position = position;
		get_parent().get_parent().get_node("BallBag").add_child(ball)

func _on_RealTime_timeout():
	if (current_time <= min_time): 
		realtime.stop()
		queue_free()
	current_time -= 1
