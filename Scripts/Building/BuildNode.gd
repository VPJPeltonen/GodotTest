extends Area

export(Resource) var basic_tower
export(Resource) var basic_tower_2
export(Resource) var basic_tower_3

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

func get_building_scene(name):
	var P
	match name:
		"tower 1":
			P = basic_tower.instance()
		"tower 2":
			P = basic_tower_2.instance()
		"tower 3":
			P = basic_tower_3.instance()
	return P
	
func _on_BuildNode_mouse_entered():
	$Highlight.show()


func _on_BuildNode_mouse_exited():
	$Highlight.hide()

func _on_BuildNode_input_event(camera, event, click_position, click_normal, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT:
			try_build(Game.build_mode)
