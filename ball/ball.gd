extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export (float) var bounce_factor
# also the mass which dictaes 
export (int) var style

# Called when the node enters the scene tree for the first time.
func _ready():
	#if bounce_factor == null:
	#		bounce_factor = .5
	#.set_bounce(bounce_factor)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_VisibilityNotifier2D_screen_exited() -> void:
	print("despawning ball")
	queue_free()
