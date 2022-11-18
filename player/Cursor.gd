extends KinematicBody2D

var lifes: int = 10;
var speed : int = 200;
var vel = Vector2()
export var player = "1";
onready var inputs = {
	"right": player + "_move_right",
	"left": player + "_move_left",
	"up": player + "_move_up",
	"down": player + "_move_down",
	"place": player + "_place"
};

onready var flagPacked = preload("res://blocker/blocker.tscn")

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
	if Input.is_action_just_pressed(inputs["place"]):
		var block = flagPacked.instance(PackedScene.GEN_EDIT_STATE_MAIN);
		block.position = position
		get_parent().add_child(block)
		modulate = Color(0, 1.5, 0)

	vel = move_and_slide(vel, Vector2.UP);
