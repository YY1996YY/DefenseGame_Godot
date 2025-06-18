extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_window().title = "2025年度＿制作実習＿防衛シューティングゲーム＿「楊屹凡」"
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("GameStart"):
		get_tree().change_scene_to_file("res://Scene/Game.tscn")
	
	
	pass
