extends Spatial

export(Resource) var knight

var rng = RandomNumberGenerator.new()

func spawn():
	var P = knight.instance()
	var scene_root = get_parent()
	scene_root.add_child(P)
	print("shoot")
	P.global_transform = global_transform
	rng.randomize()
	var rand_scale = rng.randf_range(0.20, 0.30)
	P.scale = Vector3(rand_scale,rand_scale,rand_scale)

func _on_SpawnTimer_timeout():
	spawn()
