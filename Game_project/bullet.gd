extends Area2D

class_name Projectile

var speed : float = 5.0
var damage : float = 25.0
var Time_to_live : float = 1

func handle_time_to_live () -> void :
	var timer: Timer = Timer.new()
	add_child(timer)
	timer.wait_time = Time_to_live
	timer.one_shot = true
	timer.timeout.connect(func(): queue_free())
	timer.start()
	
func _ready() -> void:
	body_entered.connect(on_body_hit)
	handle_time_to_live()
	
func _physics_process(_delta) -> void :
	position += transform.x * speed

func on_body_hit(body : Node2D) -> void:
	if body.has_method("apply_damage"):
		body.apply_damage(damage)
		queue_free()
