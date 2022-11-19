extends KinematicBody2D

var lifes: int = 10;

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

export var size = (Vector2(0.125, 0.125))
onready var flagPacked = preload("res://blocker/blocker.tscn")
onready var sprite;
onready var place = $block;
var random : int;
var mirror = false
var can_play = true;
var speed : int;


func _ready():
	pick()
	position = Vector2(0,0)

	place.modulate.a = .2
	place.scale = size
	$Sprite.scale = size
	$CollisionShape2D.scale = size
	place.rotation_degrees = 0
	speed  = $CollisionShape2D.shape.extents.x * size.x;
	pass 

func pick():
	randomize();
	random = randi() % 2;
	if (random == 0):
		sprite = load("res://blocker/bouncy_asset.png")
	else:
		sprite = load("res://blocker/sticky_asset.png")
	place.texture = sprite

func _physics_process(delta):
	modulate.a = 0.5

	

	vel.x = 0;
	vel.y = 0;
	if Input.is_action_just_pressed(inputs["mirror"]):
		mirror = !mirror
		if (mirror):
			place.rotation_degrees = 90
		else:
			place.rotation_degrees = .0
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
		block.init(random)
		block.position = position;
		block.rotation_degrees = place.rotation_degrees;
		block.scale = place.scale;
		block.get_node("Sprite").texture = sprite;
		get_parent().get_node("BlockerBag").add_child(block);
		pick();
		

	#vel = move_and_slide(vel, Vector2.UP);
