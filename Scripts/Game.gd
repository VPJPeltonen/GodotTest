extends Spatial

var bones = 100
var health = 100
var difficulty = "normal"
var spawns_left = true
var build_mode = "none"

func _process(delta):
	if !spawns_left:
		var enemies = get_tree().get_nodes_in_group("Enemy")
		if enemies.size() == 0:
			Victory()

func spend_bones(amount):
	bones -= amount

func gain_bones(amount):
	bones += amount

func take_damage(amount):
	health -= amount
	if health <= 0:
		get_tree().call_group("UI", "GameOver")
		get_tree().call_group("Spawner", "GameOver")

func Victory():
	get_tree().call_group("UI", "Victory")
