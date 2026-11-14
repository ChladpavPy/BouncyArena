extends CharacterBody2D

const SPEED = 200.0
const JUMP_VELOCITY = -200.0
var double_jump: bool = true
var sprint: int = 1

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		if double_jump and Input.is_action_just_pressed("skok"):
			velocity.y = JUMP_VELOCITY
			double_jump = false



		

	# Handle jump.
	if Input.is_action_just_pressed("skok") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("levá", "pravá")
	
	if direction > 0:
		animated_sprite.flip_h = false
	if direction < 0:
		animated_sprite.flip_h = true

	if is_on_floor():
		double_jump = true
		if direction == 0:
			animated_sprite.play("idle")
		elif Input.is_action_pressed("sprint"):
			animated_sprite.play("run")
			sprint = 2
		else:
			animated_sprite.play("walk")
			sprint = 1

	if direction:
		velocity.x = direction * SPEED * sprint
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
