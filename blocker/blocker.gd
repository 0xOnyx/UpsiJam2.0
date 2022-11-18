extends StaticBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var bounce_factor

# Called when the node enters the scene tree for the first time.
func _ready():
	if bounce_factor == null:
			bounce_factor = .5
	.set_bounce(bounce_factor)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
