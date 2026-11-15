extends Area2D

var already_collected = false
@onready var game_manager: Node = %game_manager

func _on_body_entered(body):
	if already_collected == false:
		already_collected = true
		game_manager.checkpoint()
