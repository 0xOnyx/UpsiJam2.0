extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


var bounce_factor
var numbersBalls = 4

var out = 1;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func init(var style):
	if style == 0:
		style1()
	elif style == 1:
		style1()
	elif style == 2:
		style2()
	elif style == 3:
		style3()
		
	if bounce_factor == null:
		.set_bounce(.5)
	.set_bounce(bounce_factor)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func style0():
#	print("heavy ball")
	$Sprite.frame = 1 
	weight = 100 

func style1():
#	print("low bounce ball")
	$Sprite.frame = 2
	bounce_factor = .1

func style2():
#	print("medium bounce ball")
	$Sprite.frame = 3
	bounce_factor = .5

func style3():
#	print("high bounce ball")
	$Sprite.frame = 4
	bounce_factor = .9

func _on_VisibilityNotifier2D_screen_exited() -> void:
#	print("despawning ball")
	queue_free()
