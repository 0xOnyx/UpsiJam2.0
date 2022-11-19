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
	
	if body is KinematicBody2D:
		body.can_play = false;
		return;
	$Bouncy.play()
	hit += 1
	if hit == 15:
		get_parent().modulate.a = .8
	if hit == 16:
		get_parent().modulate.a = .7
	if hit == 18:
		get_parent().modulate.a = .6
	if hit == 20:
		get_parent().queue_free()
	pass # Replace with function body.


func _on_Area2D_body_exited(body):
	if body is KinematicBody2D:
		body.can_play = true;
	pass # Replace with function body.
