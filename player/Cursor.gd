extends KinematicBody2D

var lifes: int = 10;
var speed : int = 200;
var vel = Vector2()
export var inputs = {
	"right": "1_move_right",
	"left": "1_move_left",
	"up": "1_move_up",
	"down": "1_move_down"	
};
onready var sprite = $Sprite


func _ready():
	pass 

func _physics_process(delta):
	modulate.a = 0.5

	vel.x = 0;
	vel.y = 0;
	if Input.is_action_pressed(inputs["right"]):
		 vel.x += speed;
	if Input.is_action_pressed(inputs["left"]):
		vel.x -= speed;
	if Input.is_action_pressed(inputs["down"]):
		vel.y += speed;
	if Input.is_action_pressed(inputs["up"]):
		vel.y -= speed;
	vel = move_and_slide(vel, Vector2.UP);
