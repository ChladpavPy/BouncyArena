extends Node

@onready var hráč: CharacterBody2D = %hráč

var checkpoint_var: Vector2

func checkpoint():
	checkpoint_var = hráč.position

func _process(delta: float) -> void:
	print(checkpoint_var)
