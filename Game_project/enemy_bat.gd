extends CharacterBody2D

class_name Enemybat

var Health : float = 100.0
var Speed : float = 20.0
var Target : PlayerCharacter = null 

func _physics_process(_delta : float) -> void :
	if Target == null:
		# Find the player character and set it as the target.
		var players = get_tree().get_nodes_in_group("Player")
		if players.size() > 0:
			Target = players[0]

	if Target != null:
		# Calculate the direction vector from enemy to target.
		var direction = (Target.global_position - global_position).normalized()
		velocity = direction * Speed
		move_and_slide()

func apply_damage(Damage : float) -> void:
	Health = clamp(Health - Damage, 0.00, 100.0)
	if Health == 0.0 :
		queue_free()
	
	
