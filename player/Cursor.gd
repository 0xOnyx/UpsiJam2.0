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

var preview= [randi() % 4,randi() % 4,randi() % 4,randi() % 4,randi() % 4,randi() % 4,randi() % 4,randi() % 4,randi() % 4,randi() % 4,randi() % 4,randi() % 4];


var mirror = false
var can_play = true;
var speed : int;

onready var top_offset = 120 # need to copy the setting from the spawn_tester.gd if you change this
onready var side_padding = 220
onready var middle_padding = 60
onready var left_player = Vector2(120, 200)
onready var right_player = Vector2(300, 500)

func _ready():
	_resized()
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
	elif random == 3:
		sprite = load("res://blocker/gargabe.png")	
	place.texture = sprite
	if (random == 3):
		place.hframes = 16
		place.frame = 0;
	else:
		place.hframes = 1
	preview.append(randi() % 4);
	var i = 0;
	while i < 4:
		var texture = load("res://blocker/bouncy_asset.png")
		if (preview[i] == 1):
			texture = load("res://blocker/sticky_asset.png")
		if (preview[i] == 2):
			texture = load("res://blocker/git_merge/git_merge_right.png")
		if preview[i] == 3:
			texture = load("res://blocker/gargabe.png")	
		if (player == "1"):
			get_parent().get_node("RightPadding").get_node("VBoxContainer").get_node("TextureRect" + str(i)).texture = texture;	
		else:
			get_parent().get_node("LeftPadding").get_node("VBoxContainer").get_node("TextureRect" + str(i)).texture = texture;
		i+=1



func _physics_process(delta):
	modulate.a = 0.8
	if (preview[0] == 3):
		place.hframes = 16
		place.frame = 0
		place.scale = Vector2(1,1)
		mirror = false
		place.rotation_degrees = 0
	else:
		place.scale = size
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
		
	var limit = left_player if (player == "1") else right_player;

		
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
		var type = block.init(preview.pop_front(), player)
		block.position = position;
		block.rotation_degrees = place.rotation_degrees;
		block.scale = size	
		if (type == 3):
			block.scale = size
		else:
			block.scale = place.scale
		block.get_node("Sprite").texture = sprite;
		get_parent().get_node("BlockerBag").add_child(block);
		place.scale = size
		pick();
	if (position.x > limit.y):
		position.x = limit.y
		
	if (position.x < limit.x):
		position.x = limit.x
		

func _resized():
	left_player.x = side_padding
	left_player.y = .get_viewport().size.x/2 - middle_padding
	right_player.x = .get_viewport().size.x/2 + middle_padding
	right_player.y = .get_viewport().size.x - side_padding
