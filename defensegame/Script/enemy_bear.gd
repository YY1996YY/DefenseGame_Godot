extends Area2D
@export var hp : int
@export var hp_max : int

enum Status{
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
	

		
	if position.x < 1000:
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
