extends KinematicBody

export var slows = false
var speed = 5
var damage = 5
var target 

func _process(delta):
	if target == null:
		queue_free()
	else:
		var dir = (target.global_transform.origin - global_transform.origin)
		move_and_slide(dir.normalized() * speed, Vector3.UP )	

func _on_LifeTimer_timeout():
	queue_free()

func _on_Area_body_entered(body):
	if body.is_in_group("Enemy"):
		body.damage(damage)
		if slows:
			body.Slow()
		queue_free()
