extends RayCast2D

@export var Bullet : PackedScene
var gun_sprite : Sprite2D

func _ready():
	gun_sprite = $Sprite2D
	
func _physics_process(_delta):
	
	var MousePosition = get_global_mouse_position()
	look_at(MousePosition)
	if Input.is_action_just_pressed("shoot") : shoot()
	
	if MousePosition.x < global_position.x:
		gun_sprite.set_flip_v(true)
	else:
		gun_sprite.set_flip_v(false)
	
func shoot() -> void:
	var inst : Projectile = Bullet.instantiate()
	owner.add_child(inst)
	inst.transform = $Position2D.global_transform
