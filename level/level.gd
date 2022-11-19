extends Node2D

var score1 = 0
var score2 = 0
# make game length
var max_time = 10
var min_time = 3

var current_time = max_time
#onready var side_padding = get_viewport().size.x * .15
onready var side_padding = 200
onready var middle_padding = get_viewport().size.x * .05
onready var rightpadd_shape = get_node("RightPadding/CollisionShape2D")
#onready var rightpadd_shape = get_node("RightPadding").get_child(0)
onready var rightpadd_line = get_node("RightPadding").get_child(1)
onready var leftpadd_shape = get_node("LeftPadding").get_child(0)
onready var leftpadd_line = get_node("LeftPadding").get_child(1)

onready var score = [get_node("score1"), get_node("score2")]


# Called when the node enters the scene tree for the first time.
func _ready():
	score[0].get_child(0).text = str(score1)
	score[1].get_child(0).text = str(score2)
#	rightpadd_shape.set_shape(RectangleShape2D).extents.x = side_padding*2
#	rightpadd_shape.get_child(0).set_shape(RectangleShape2D).extents.y = side_padding*2
#	rightpadd_line.PoolVector2Array = [[0, 0,], [side_padding, get_viewport().y]]

func _process(delta):
	score[0].get_child(0).text = str(score1)
	score[1].get_child(0).text = str(score2)
