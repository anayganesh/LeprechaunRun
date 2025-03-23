extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	BackgroundMusic.play() # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
		
	if Input.is_action_pressed("escape"):
		queue_free()
		get_tree().quit()



func _on_restart_pressed():
	await get_tree().create_timer(2).timeout
	get_tree().change_scene_to_file("res://Main/Main.tscn") # Replace with function body.
