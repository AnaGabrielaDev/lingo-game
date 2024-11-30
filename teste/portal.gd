extends Area2D

var entered = false

func _on_body_entered(body: PhysicsBody2D):
	entered = true

func _on_body_exited(body: PhysicsBody2D):
	entered = false

func _process(delta):
	if entered:
		get_tree().change_scene_to_file("res://teste/level_3.tscn")
