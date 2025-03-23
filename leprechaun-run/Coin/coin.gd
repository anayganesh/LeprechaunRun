extends RigidBody2D

@export var collected = false
# Called when the node enters the scene tree for the first time.
func _ready():
	set_deferred("visible", true)
	await get_tree().create_timer(2).timeout
	queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$AnimatedSprite2D.play("default")




func _on_area_2d_body_entered(body):
	if body.name == "Player":
		$AudioStreamPlayer2D.play()
		collected = true
		ScoreManager.add_score(1)
		set_deferred("visible", false)
		await get_tree().create_timer(0.36).timeout
		queue_free() 
