extends CharacterBody2D

const SPEED = 200
const JUMP = 400
const GRAVITY = 20
const UP = Vector2(0, -1)

@onready var Base = $Base

@warning_ignore("unused_parameter")
func _physics_process(delta):
	move()
	jump()
	gravity()
	animate()

	move_and_slide()

func gravity():
	if not is_on_floor():
		velocity.y += GRAVITY

func move():
	if Input.is_action_pressed("left") and not Input.is_action_pressed("right"):
		velocity.x = -SPEED
	elif Input.is_action_pressed("right") and not Input.is_action_pressed("left"):
		velocity.x = SPEED
	else:
		velocity.x = 0

func jump():
	if Input.is_action_pressed("jump") and is_on_floor():
		velocity.y -= JUMP

func animate():
		
	if velocity.y < 0:
		Base.play("jump")
	elif velocity.y > 0:
		Base.play("fall")
	elif velocity.x > 0:
		Base.play("walk")
		Base.flip_h = false
	elif velocity.x < 0:
		Base.play("walk")
		Base.flip_h = true
	else:
		Base.play("idle")
