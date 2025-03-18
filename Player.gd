extends CharacterBody3D

@export var speed: float = 5.0
@export var jump_force: float = 10.0
@export var gravity: float = 20.0

var velocity: Vector3 = Vector3.ZERO
var is_on_ground: bool = false

func _physics_process(delta: float) -> void:
    handle_movement(delta)
    handle_jump()
    move_and_slide()

func handle_movement(delta: float) -> void:
    velocity.x = 0
    velocity.z = 0

    var input_dir = Vector3.ZERO
    if Input.is_action_pressed("ui_left"):
        input_dir.x -= 1
    if Input.is_action_pressed("ui_right"):
        input_dir.x += 1

    input_dir = input_dir.normalized()
    velocity.x = input_dir.x * speed

    # Применяем гравитацию
    velocity.y -= gravity * delta

func handle_jump() -> void:
    if is_on_ground and Input.is_action_just_pressed("ui_jump"):
        velocity.y = jump_force
