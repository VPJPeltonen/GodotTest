extends Area

export(Resource) var spikes
export(Resource) var bear_trap
export(Resource) var bomb
export(Resource) var ghost

var current_building

func _ready():
	$Highlight.hide()
	
func try_build(building):
	if current_building != null:
		return
	if building == "none":
		return
	var price = Prices.get_price(building)
	if Game.bones < price:
		return
	current_building = building
	var P = get_building_scene(building)
	var towers = get_parent()
	towers.add_child(P)
	P.global_transform = global_transform
	print(building)
	Game.spend_bones(price)

func get_building_scene(name):
	var P
	match name:
		"Spikes":
			P = spikes.instance()
		"Bear Trap":
			P = bear_trap.instance()
		"Bomb":
			P = bomb.instance()
		"Ghost":
			P = ghost.instance()
	return P
	
func _on_BuildNode_mouse_entered():
	$Highlight.show()

func _on_BuildNode_mouse_exited():
	$Highlight.hide()

func _on_BuildNode_input_event(camera, event, click_position, click_normal, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT:
			try_build(Game.trap_mode)
