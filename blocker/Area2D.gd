extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var hit = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_body_entered(body):
	if get_parent().blocker_type == 3 && body is RigidBody2D:
		body.was_blackholed = true;
		body.queue_free();
	if (body is RigidBody2D && $Bouncy.get_playback_position() == 0):
		$Bouncy.play()
	hit += 1
	if (get_parent().blocker_type == 3 && hit % 2 == 0):
		get_parent().get_node("Sprite").frame+= 1
	if hit == 15:
		get_parent().modulate.a = .8
	if hit == 16:
		get_parent().modulate.a = .7
	if hit == 18:
		get_parent().modulate.a = .6
	if hit == 20:
		get_parent().queue_free()

