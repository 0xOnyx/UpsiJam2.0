extends StaticBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var bouncy_sprite = preload("res://blocker/bouncy_asset.png")
onready var sticky_sprite = preload("res://blocker/sticky_asset.png")
onready var git_merge_right = preload("res://blocker/git_merge/git_merge_right.png")
onready var garbage = preload("res://blocker/gargabe.png")
#onready var sticky_sound = preload("res://audio/sticky.mp3")
var blocker_type;

func enable_commit():
	$commit.disabled = false
	$TriangleArea/commit.disabled = true
	$rect.disabled = true
	$TriangleArea/rect.disabled = true
	$poly.disabled = true
	$TriangleArea/poly.disabled = true

func enable_void():
	$commit.disabled = false
	$TriangleArea/commit.disabled = false
	$rect.disabled = false
	$TriangleArea/rect.disabled = false
	$poly.disabled = true
	$TriangleArea/poly.disabled = true
	$Sprite.scale = Vector2(5,3)
	$Sprite.hframes = 16

func enable_rect():
	
	$commit.disabled = true
	$TriangleArea/commit.disabled = true
	$rect.disabled = false
	$TriangleArea/rect.disabled = false
	$poly.disabled = true
	$TriangleArea/poly.disabled = true

func enable_poly():
	
	$commit.disabled = true
	$TriangleArea/commit.disabled = true
	$poly.disabled = false
	$TriangleArea/poly.disabled = false
	$rect.disabled = true
	$TriangleArea/rect.disabled = true


func init(var type:int,var player):
	.set_bounce(.5)
	if (type == 0):
		get_node("Sprite").texture = bouncy_sprite
		blocker_type = 0;
		
		enable_commit()

	if (type == 1):
		$Sprite.texture = sticky_sprite
		$AnimationPlayer.play("Left" if (player == "1") else "Right")
		#Sound.get_node("sticky_sound").play()
		enable_rect()

		blocker_type = 1;
	if (type == 2):
		blocker_type = 2
		enable_poly()
		$Sprite.texture = git_merge_right
	if (type == 3):
		blocker_type = 3
		enable_void()
		$Sprite.texture = garbage
	return type


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
