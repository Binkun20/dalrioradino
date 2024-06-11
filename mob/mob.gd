extends Area2D

signal hit


func _ready():
	GHUD.mob_counter = GHUD.mob_counter + 1
	var collision = [
		$CollisionA, $CollisionB, $CollisionC, $CollisionD, $CollisionE
	] 
	var sprites = [
		$SpriteA, $SpriteB, $SpriteC, $SpriteD, $SpriteE
		]

	var random_int = randi() % collision.size()
	var selected_collisions = collision[random_int]
	var selected_sprite = sprites[random_int]
	
	selected_collisions.disabled = false
	selected_collisions.visible = true
	selected_sprite.visible = true


func _on_visible_on_screen_notifier_2d_screen_exited():
	if GHUD.mob_counter > 0:
		GHUD.mob_counter = GHUD.mob_counter -2
	queue_free()


func _on_body_entered(body):
	if body.is_in_group("dinosaurio"):
		hit.emit()
