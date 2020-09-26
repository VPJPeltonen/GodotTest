extends Spatial

var bones = 100
var health = 100

func spend_bones(amount):
	bones -= amount

func gain_bones(amount):
	bones += amount

func take_damage(amount):
	health -= amount
