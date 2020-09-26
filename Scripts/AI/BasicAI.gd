extends KinematicBody

export var speed = 2.0
var path = []
var state = "default"
var current_target
var current_node = 0

onready var nav = get_parent()

func _process(delta):
	if current_node < path.size():
		var dir = (path[current_node] - global_transform.origin)
		if dir.length() < 1:
			current_node += 1
		else:
			move_and_slide(dir.normalized() * speed, Vector3.UP )	
	
func move_to(target):
	path = nav.get_simple_path(global_transform.origin, target)
	current_node = 0

func _on_StartTimer_timeout():
	move_to(get_parent().get_node("FinalTarget").global_transform.origin)
	print("trying")
