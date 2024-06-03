extends Area2D

signal hit


func _ready():
	var collision = [
		$CollisionA,
	] 
	var sprites = [
		$SpriteA
		]

	var random_int = randi() % collision.size()
	var selected_collisions = collision[random_int]
	var selected_sprite = sprites[random_int]
	
	selected_collisions.disabled = false
	selected_collisions.visible = true
	selected_sprite.visible = true


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()


func _on_body_entered(body):
	if body.is_in_group("dinosaurio"):
		hit.emit()
