extends Position2D

var max_value: int = 1024

onready var Ball = load("res://ball/ball.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _process(delta):
	pass;

func _on_Timer_timeout():
	randomize()
	var ball = Ball.instance()
	var x = randi() % 512;
	ball.position = Vector2(x, 0)
#	ball.style = randi() %  ball.style_nums
	add_child(ball)
