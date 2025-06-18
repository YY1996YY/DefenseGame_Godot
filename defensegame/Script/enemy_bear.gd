extends Area2D
@export var hp : int
@export var hp_max : int
@export var animator : AnimatedSprite2D
@export var animator_shadow : AnimatedSprite2D

enum Status{
	BlockByWall,
	moveForward,
	move2Player,
	attack
}

var status


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	status = Status.moveForward
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if status==Status.moveForward :
		position -= Vector2(100,0)*delta
		
	##move to player
	if status==Status.move2Player:
		var x = position.x-get_node("../Oyasiro").position.x
		var y = position.y-get_node("../Oyasiro").position.y
		position -= Vector2(x,y).normalized() * 100 * delta
	
	if status==Status.attack:
		animator.play("attack")
		animator_shadow.play("shadow_attack")
		if $atkTimer.is_stopped():
			$atkTimer.start()
		
	if position.x < 1000&&status !=Status.attack:
		status = Status.move2Player
		
		
	
	# destroy
	if hp == 0:
		queue_free()
	#update hp bar
	hpBar_update()

func take_demage(dmg:int)->void:
	if dmg < hp:
		hp = hp-dmg
	else :
		hp=0

func hpBar_update()->void:
	$TextureProgressBar.value = hp * 100 / hp_max


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("Oyasiro"):
		status=Status.attack
	pass # Replace with function body.


func _on_atk_timer_timeout() -> void:
	get_node("/root/Node2D").take_damage(5)
	pass # Replace with function body.
