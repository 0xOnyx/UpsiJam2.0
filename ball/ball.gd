extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# also the mass which dictaes 
export (int) var style


var out = 1;

# Called when the node enters the scene tree for the first time.
func _ready():
	.set_bounce(.5)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_VisibilityNotifier2D_screen_exited() -> void:
	print("despawning ball")
	queue_free()
