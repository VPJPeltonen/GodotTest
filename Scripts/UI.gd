extends Control

func _process(delta):
	$Resource/Amount.text = str(Game.bones)
	$Health/HealthBar.value = Game.health
