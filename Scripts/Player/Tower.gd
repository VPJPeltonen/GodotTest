extends Spatial

export(Resource) var projectile

# TODO - change to allow mutliple targets
var enemy_in_range
var reloaded = true

func _process(delta):
	if enemy_in_range != null and reloaded:
		shoot()

func shoot():
	var P = projectile.instance()
	var scene_root = get_parent()
	scene_root.add_child(P)
	print("shoot")
	P.global_transform = global_transform
	P.target = enemy_in_range
	reloaded = false
	$ReloadTimer.start()

func _on_Area_body_entered(body):
	if body.is_in_group("Enemy"):
		if enemy_in_range == null:
			enemy_in_range = body
			
func _on_Area_body_exited(body):
	if body.is_in_group("Enemy"):
		if body == enemy_in_range:
			enemy_in_range = null
	
func _on_ReloadTimer_timeout():
	reloaded = true



