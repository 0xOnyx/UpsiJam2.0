extends Position2D

var style = -1
var growth_rate  = .9
var number_of_balls = 30
var duration = 15
var i = 0
var foo

onready var timer = get_node("Timer")
onready var Ball = load("res://ball/ball.tscn")

func _ready():
	initlong(duration, growth_rate, number_of_balls)
	timer.start(duration)
	
func initn(level_of_insanity):
#	use n to call the other init function
	initlong(duration , 
	growth_rate, 
	number_of_balls * (1 + level_of_insanity)) # something tumes insanity to
#	timer.start(duration)

func initlong(d, g, n):
	growth_rate  = g
	number_of_balls = n
	duration = d
#	timer.start(duration)
	foo = []
	for x in range(0, number_of_balls + 1):
		foo.append(pow(x,growth_rate)/pow(number_of_balls, growth_rate))
#		print(pow(x,growth_rate)/pow(number_of_balls, growth_rate))

func _process(delta):
	if  i <= number_of_balls && foo[i] * duration < duration - timer.get_time_left():
		i = i + 1
#		print("spawn a ball with", timer.get_time_left())
		spawn_ball()


func spawn_ball():
	var ball = Ball.instance()
	if (style == -1):
		randomize()
		style = randi() % ball.numbersBalls
	ball.init(style)
	ball.position = position;
	if get_parent().get_parent() != null:
		get_parent().get_parent().get_node("BallBag").add_child(ball)
	else:
		.add_child(ball)

func _on_Timer_timeout():
	queue_free()
