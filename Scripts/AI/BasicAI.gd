extends KinematicBody

export var speed = 2.0
export var health = 15
export var value = 20
export var damage = 10

var path = []
var state = "default"
var current_target
var current_node = 0
var slowed = false
var dying = false

var rng = RandomNumberGenerator.new()

onready var nav = get_parent()

func _process(delta):
	if dying:
		return
	if current_node < path.size():
		var dir = (path[current_node] - global_transform.origin)
		if dir.length() < 1:
			current_node += 1
		else:
			if slowed:
				move_and_slide(dir.normalized() * speed/2, Vector3.UP )	
			else:
				move_and_slide(dir.normalized() * speed, Vector3.UP )	
	
func move_to(target):
	path = nav.get_simple_path(global_transform.origin, target)
	current_node = 0

func damage(damage_done):
	health -= damage_done
	if health <= 0:
		dying = true
		$DeathTimer.start()
		$AnimatedSprite3D.play("dead")
		Game.gain_bones(value)

func SetDifficulty():
	match Game.difficulty:
		"easy":
			health = 10
			damage = 5
		"hard":
			health = 25
			damage = 20
			
func Slow():
	$SlowTimer.start()
	slowed = true

func Attack():
	dying = true
	$DeathTimer.start()
	$AnimatedSprite3D.play("attack")
	
func _on_StartTimer_timeout():
	rng.randomize()
	var rand_target = rng.randi_range(0, 2)
	if rand_target == 0:
		move_to(get_parent().get_node("Waypoint").global_transform.origin)
	elif rand_target == 1:
		move_to(get_parent().get_node("Waypoint2").global_transform.origin)
	else:
		move_to(get_parent().get_node("Waypoint3").global_transform.origin)

func _on_SlowTimer_timeout():
	slowed = false


func _on_DeathTimer_timeout():
	queue_free()
