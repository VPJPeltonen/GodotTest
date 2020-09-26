extends Spatial

export(Resource) var knight

var rng = RandomNumberGenerator.new()
var spawn_amount = 20

func spawn():
	if spawn_amount <= 0:
		Game.spawns_left = false
		return
	spawn_amount -= 1
	var P = knight.instance()
	var scene_root = get_parent()
	scene_root.add_child(P)
	print("shoot")
	P.global_transform = global_transform
	rng.randomize()
	var rand_scale = rng.randf_range(0.20, 0.30)
	P.scale = Vector3(rand_scale,rand_scale,rand_scale)
	if Game.difficulty != "normal":
		P.SetDifficulty()

func StartGame():
	$SpawnTimer.start()

func GameOver():
	$SpawnTimer.stop()

func _on_SpawnTimer_timeout():
	spawn()
