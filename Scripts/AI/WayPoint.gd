extends Area

func _on_Area_body_entered(body):
	if body.is_in_group("Enemy"):
		body.move_to(get_parent().get_parent().get_node("FinalTarget").global_transform.origin)
