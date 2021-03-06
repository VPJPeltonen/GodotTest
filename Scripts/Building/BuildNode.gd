extends Area

export(Resource) var slime_tower
export(Resource) var archer_tower
export(Resource) var fire_tower
export(Resource) var grave

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
	Game.spend_bones(price)
	print(building)

func get_building_scene(name):
	var P
	match name:
		"Slime Tower":
			P = slime_tower.instance()
		"Archer Tower":
			P = archer_tower.instance()
		"Fire Tower":
			P = fire_tower.instance()
		"Grave":
			P = grave.instance()
	return P
	
func _on_BuildNode_mouse_entered():
	$Highlight.show()


func _on_BuildNode_mouse_exited():
	$Highlight.hide()

func _on_BuildNode_input_event(camera, event, click_position, click_normal, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT:
			try_build(Game.build_mode)
