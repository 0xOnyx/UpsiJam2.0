extends KinematicBody2D

var lifes: int = 10;
onready var speed : int = $CollisionShape2D.shape.extents.x;
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
var can_play = true;

func _ready():
	position = Vector2(0,0)
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
	if Input.is_action_just_pressed(inputs["right"]):
		 position.x += speed;
	if Input.is_action_just_pressed(inputs["left"]):
		position.x -= speed;
	if Input.is_action_just_pressed(inputs["down"]):
		position.y += speed;
	if Input.is_action_just_pressed(inputs["up"]):
		position.y -= speed;
		
	
	if player == "2" && position.x < get_viewport().size.x / 2 + speed:
		position.x = get_viewport().size.x / 2 + speed;
	if player == "1" && position.x > get_viewport().size.x / 2 - speed:
		position.x = get_viewport().size.x / 2 - speed;
	if position.x < speed:
		position.x = speed;
	if position.x > get_viewport().size.x - speed:
		position.x = get_viewport().size.x - speed;
	if position.y < speed:
		position.y = speed;
	if position.y > get_viewport().size.y - speed:
		position.y = get_viewport().size.y - speed;
		
	if Input.is_action_just_pressed(inputs["place"]) && can_play:
		can_play = false;
		var block = flagPacked.instance();
		block.position = position
		block.rotation = mirror * .45
		block.get_node("Sprite").texture = sprite
		block.bounce_factor = 1
		get_parent().add_child(block)

	#vel = move_and_slide(vel, Vector2.UP);
