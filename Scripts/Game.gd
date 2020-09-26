extends Spatial

var bones = 100
var health = 100
var difficulty = "normal"
var spawns_left = true
var current_round = 1
var max_rounds = 20

var build_mode = "none"
var trap_mode = "none"

func _process(delta):
	if !spawns_left:
		var enemies = get_tree().get_nodes_in_group("Enemy")
		if enemies.size() == 0:
			Next_Round()
			spawns_left = true

func spend_bones(amount):
	get_tree().call_group("Build Button", "reset_button")
	build_mode = "none"
	trap_mode = "none"
	bones -= amount

func gain_bones(amount):
	bones += amount

func take_damage(amount):
	health -= amount
	if health <= 0:
		get_tree().call_group("UI", "GameOver")
		get_tree().call_group("Spawner", "GameOver")

func Next_Round():
	if current_round == max_rounds:
		Victory()
	else:
		current_round += 1
		get_tree().call_group("Spawner", "StartGame")
		get_tree().call_group("UI", "NextRound")
	
func Victory():
	get_tree().call_group("UI", "Victory")
