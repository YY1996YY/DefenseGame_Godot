extends Node2D
var mousePos : Vector2
var gunRotateAng : float
@export var BearScene : PackedScene

enum status{
	shooting
	
	
}
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	mousePos = get_viewport().get_mouse_position()
	gunRotateAng = GetGunRotateAng()
	print(gunRotateAng)
	$Gun.rotation=gunRotateAng
	
	



func GetGunRotateAng()->float:
	var ang
	var x=mousePos.x-$Gun/GunAx.global_position.x
	var y=mousePos.y-$Gun/GunAx.global_position.y
	#var x=mousePos.x-$Gun.position.x 
	#var y=mousePos.y-$Gun.position.y 
	ang = asin(y/sqrt(pow(x,2)+pow(y,2)))

	print(ang)
	return ang

#bear appear
func BearGenerate()->void:
	var bear_node = BearScene.instantiate();
	bear_node.position = Vector2(2500,randf_range(400,1000))
	get_tree().current_scene.add_child(bear_node)
	

func _on_bear_timer_timeout() -> void:
	BearGenerate()
