extends StaticBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var bouncy_sprite = preload("res://blocker/bouncy_asset.png")
onready var sticky_sprite = preload("res://blocker/sticky_asset.png")
onready var git_merge_right = preload("res://blocker/git_merge/git_merge_right.png")
var blocker_type;


func enable_rect():
	$rect.disabled = false
	$TriangleArea/rect.disabled = false

func enable_poly():
	$poly.disabled = false
	$TriangleArea/poly.disabled = false


func init(var type:int):

	if (type == 0):
		get_node("Sprite").texture = bouncy_sprite
		blocker_type = 0;
		enable_rect()
		.set_bounce(0)
	if (type == 1):
		$Sprite.texture = sticky_sprite
		enable_rect()
		.set_bounce(1)
		blocker_type = 1;
	if (type == 2):
		blocker_type = 2
		enable_poly()
		$Sprite.texture = git_merge_right
		.set_bounce(0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
