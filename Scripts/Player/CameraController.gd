extends Camera


export var camera_speed = 20
var negative_limits = Vector2(-230,-260)
var positive_limits = Vector2(2470,2820)

func _process(delta):
	var direction = Vector3()
	if Input.is_action_pressed("camera_up") and transform.origin.y > negative_limits.y:
		direction.z += camera_speed
	elif Input.is_action_pressed("camera_down") and transform.origin.y < positive_limits.y:
		direction.z -= camera_speed
	
	if Input.is_action_pressed("camera_left") and transform.origin.x > negative_limits.x:
		direction.x += camera_speed
	elif Input.is_action_pressed("camera_right") and transform.origin.x < positive_limits.x:
		direction.x -= camera_speed
	transform.origin += direction * delta
