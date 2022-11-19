extends KinematicBody2D

var lifes: int = 10;
var speed : int = 600;
var vel = Vector2()

export var player = "1";

onready var inputs = {
	"right": player + "_move_right",
	"left": player + "_move_left",
	"up": player + "_move_up",
	"down": player + "_move_down",
	"place": player + "_place",
	"mirror": player + "_mirror"
};

onready var flagPacked = preload("res://blocker/blocker.tscn")
onready var sprite = preload("res://blocker/blocker.png")
onready var place = $block;
var mirror = 1

func _ready():
	place.texture = sprite
	place.modulate.a = .2
	place.rotation = .45
	pass 

func _physics_process(delta):
	modulate.a = 0.5

	vel.x = 0;
	vel.y = 0;
	if Input.is_action_just_pressed(inputs["mirror"]):
		mirror *= -1
		place.rotation *= -1
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
		block.rotation = mirror * .45
		block.get_node("Sprite").texture = sprite
		block.bounce_factor = 1
		get_parent().add_child(block)
		modulate = Color(0, 1.5, 0)

	vel = move_and_slide(vel, Vector2.UP);
