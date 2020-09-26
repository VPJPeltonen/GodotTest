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
	#P.look_at(transform.origin + velocity.normalized(), Vector3.UP)
	
	reloaded = false
	$ReloadTimer.start()
	
	#P.scale = Vector3(0.1, 0.1, 0.1)
	#P.BULLET_DAMAGE = 1
	#P.connect("hit", self, "plant_hit")
	#$GunCooldown.start()
	#reloaded = false

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



