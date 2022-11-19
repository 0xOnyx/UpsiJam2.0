extends StaticBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var bouncy_sprite = preload("res://blocker/bouncy_asset.png")
onready var sticky_sprite = preload("res://blocker/sticky_asset.png")


func init(var type:int):
	if (type == 0):
		get_node("Sprite").texture = bouncy_sprite
		.set_bounce(.5)
	if (type == 1):
		$Sprite.texture = sticky_sprite
		.set_bounce(0)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
