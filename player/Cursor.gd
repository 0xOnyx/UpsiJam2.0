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

var preview= [randi() % 2,randi() % 2,randi() % 2,randi() % 2,randi() % 2,randi() % 2,randi() % 2,randi() % 2,randi() % 2,randi() % 2,randi() % 2,randi() % 2];


var mirror = false
var can_play = true;
var speed : int;


func _ready():
	pick()
	position = Vector2(get_viewport().size.x / 2,get_viewport().size.y / 2)

	place.scale = size
	$Sprite.scale = size
	$CollisionShape2D.scale = size
	place.rotation_degrees = 90 + (0 if preview[0] != 2 else 90) if (player == "1") else 0
	mirror = true if (player == "1") else false

	speed  = $CollisionShape2D.shape.extents.x * size.x;

	pass 

func pick():
	var random = preview[0]


	randomize();


	if (random == 0):
		sprite = load("res://blocker/bouncy_asset.png")
	elif random == 1:
		sprite = load("res://blocker/sticky_asset.png")
	elif random == 2:
		sprite = load("res://blocker/git_merge/git_merge_right.png")	
	place.texture = sprite
	preview.append(randi() % 3);
	var i = 0;
	while i < 4:
		var texture = load("res://blocker/bouncy_asset.png")
		if (preview[i] == 1):
			texture = load("res://blocker/sticky_asset.png")
		if (preview[i] == 2):
			texture = load("res://blocker/git_merge/git_merge_right.png")
		if (player == "1"):
			get_parent().get_node("RightPadding").get_node("VBoxContainer").get_node("TextureRect" + str(i)).texture = texture;
		else:
			get_parent().get_node("LeftPadding").get_node("VBoxContainer").get_node("TextureRect" + str(i)).texture = texture;
				
		i+=1



func _physics_process(delta):
	modulate.a = 0.8

	

	vel.x = 0;
	vel.y = 0;
	if Input.is_action_just_pressed(inputs["mirror"]):
		mirror = !mirror
		if (mirror):
			place.rotation_degrees = 90 + (0 if preview[0] != 2 else 90) 		
		else:
			place.rotation_degrees = .0
	if Input.is_action_pressed(inputs["right"]):
		vel.x += 300;
	if Input.is_action_pressed(inputs["left"]):
		vel.x -= 300 ;
	if Input.is_action_pressed(inputs["down"]):
		vel.y += 300 ;
	if Input.is_action_pressed(inputs["up"]):
		vel.y -= 300 ;
		
	
	if player == "2" && position.x < get_viewport().size.x / 2 + speed:
		position.x = get_viewport().size.x / 2 + speed;
	if player == "1" && position.x > get_viewport().size.x / 2 - speed:
		position.x = get_viewport().size.x / 2 - speed;
	if position.x < speed:
		position.x = speed;
		
	vel = move_and_slide(vel, Vector2.UP)
	if position.x > get_viewport().size.x - speed:
		position.x = get_viewport().size.x - speed;
	if position.y < speed:
		position.y = speed;
	if position.y > get_viewport().size.y - speed:
		position.y = get_viewport().size.y - speed;
		
	if Input.is_action_just_pressed(inputs["place"]) && can_play:
		can_play = false;
		var block = flagPacked.instance();
		block.init(preview.pop_front(),player)
		block.position = position;
		block.rotation_degrees = place.rotation_degrees;
		block.scale = place.scale;
		block.get_node("Sprite").texture = sprite;
		get_parent().get_node("BlockerBag").add_child(block);
		pick();
		

	#vel = move_and_slide(vel, Vector2.UP);
