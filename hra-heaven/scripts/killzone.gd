extends Area2D

@onready var hráč: CharacterBody2D = %hráč

func _on_body_entered(body: Node2D) -> void:

	hráč.move_local_x(100)
