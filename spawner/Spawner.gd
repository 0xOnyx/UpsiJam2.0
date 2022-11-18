extends Position2D

var max_value: int = 1024

onready var Ball = load("res://ball/ball.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _process(delta):
	var ball = Ball.instance();
	var x = int(rand_range(0, 512))
	print(x);
	ball.position = Vector2(x, 0);
	#add_child(ball);
	

	
	
