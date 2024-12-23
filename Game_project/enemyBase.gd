extends Node

var health : int = 100

func apply_dmg(damage : int) :
	health = clamp(health - damage, 0.00, 100.0)
	if health == 0.0 :
		queue_free()
	
