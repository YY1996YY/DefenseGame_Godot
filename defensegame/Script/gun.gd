extends Node2D
@export var bulletScene : PackedScene

var is_shooting : bool
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("Shoot"):
		is_shooting = true
		if $ShootTimer.is_stopped():
			$ShootTimer.start()
	elif  Input.is_action_just_released("Shoot"):
		$ShootTimer.stop()
		is_shooting = false


func _on_shoot_timer_timeout() -> void:
	fire_bullet()

func fire_bullet()->void:
	var bullet_node = bulletScene.instantiate()
	bullet_node.position = $ShootPoint.global_position
	bullet_node.rotation = $GunAx.global_rotation
	get_tree().current_scene.add_child(bullet_node)
