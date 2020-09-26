extends Area

export(Resource) var basic_tower

var current_building

func _ready():
	$Highlight.hide()
	
func try_build():
	if current_building != null:
		return
	if Game.bones < 50:
		return
	current_building = "tower"
	var P = basic_tower.instance()
	var towers = get_parent()
	towers.add_child(P)
	P.global_transform = global_transform
	Game.spend_bones(50)

func _on_BuildNode_mouse_entered():
	$Highlight.show()


func _on_BuildNode_mouse_exited():
	$Highlight.hide()

func _on_BuildNode_input_event(camera, event, click_position, click_normal, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT:
			try_build()
