extends Area2D
@export var bullet_speed : float = 100

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var x = cos(transform.get_rotation())
	
	var y = sin(transform.get_rotation())
	print("x:",x,"y:",y)
	
	position += Vector2(x,y).normalized() * bullet_speed * delta;
	
	
	
	#delete bullet
	


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("Enemy"):
		print("hit!!")
		area.take_demage(5)
		queue_free()
