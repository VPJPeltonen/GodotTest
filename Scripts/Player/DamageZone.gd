extends Area


func _on_DamageZone_body_entered(body):
	if body.is_in_group("Enemy"):
		Game.take_damage(body.damage)
		body.queue_free()
