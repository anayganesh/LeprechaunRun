extends Node2D

@export var coin_scene: PackedScene
@export var camera: Camera2D
@export var spawn_interval := 1.5
@export var x_spawn_range := Vector2(-256, 256)  # relative to camera
@export var y_spawn_offset := -64  # how high above the screen

@onready var timer: Timer = $Timer

func _ready():
	timer.wait_time = spawn_interval
	timer.timeout.connect(spawn_coin)
	timer.start()


func spawn_coin():
	if not camera:
		return

	var coin = coin_scene.instantiate()
	var screen_center = camera.global_position
	var x_pos = randi_range(screen_center.x + x_spawn_range.x, screen_center.x + x_spawn_range.y)
	var y_pos = screen_center.y + y_spawn_offset

	coin.global_position = Vector2(x_pos, y_pos)
	add_child(coin)
