extends KinematicBody

export var speed = 2.0
export var health = 10
export var value = 20
export var damage = 10
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

func damage(damage_done):
	health -= damage_done
	if health <= 0:
		Game.gain_bones(value)
		queue_free()


func _on_StartTimer_timeout():
	move_to(get_parent().get_node("FinalTarget").global_transform.origin)
