extends Control

func _ready():
	$GameMode.hide()
	$WinScreen.hide()
	$LoseScreen.hide()
	$StartingMenu.show()

func _process(delta):
	$GameMode/Resource/Amount.text = str(Game.bones)
	$GameMode/Health/HealthBar.value = Game.health

func GameOver():
	$GameMode.hide()
	$LoseScreen.show()

func Victory():
	$GameMode.hide()
	$WinScreen.show()

func NextRound():
	$GameMode/RoundLabel.show()
	$GameMode/RoundLabel.text = "Round " + str(Game.current_round)
	$GameMode/RoundDisplay.start()

func _on_StartGameButton_pressed():
	$StartingMenu.hide()
	$GameMode.show()
	get_tree().call_group("Spawner", "StartGame")

func _on_EasyBox_pressed():
	Game.difficulty = "easy"

func _on_NormalBox_pressed():
	Game.difficulty = "normal"

func _on_HardBox_pressed():
	Game.difficulty = "hard"

func _on_BuildmodeButton_pressed(num):
	match num:
		0:
			Game.build_mode = "Slime Tower"
		1:
			Game.build_mode = "Archer Tower"
		2:
			Game.build_mode = "Fire Tower"
		3:
			Game.build_mode = "Grave"

func _on_TrapModeButton_pressed(num):
	match num:
		0:
			Game.build_mode = "Spikes"
		1:
			Game.build_mode = "Bear Trap"
		2:
			Game.build_mode = "Bomb"
		3:
			Game.build_mode = "Ghost"


func _on_RoundDisplay_timeout():
	$GameMode/RoundLabel.hide()
