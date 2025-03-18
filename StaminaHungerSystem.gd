extends Node

@export var max_stamina: float = 100.0
@export var max_hunger: float = 100.0

var stamina: float = max_stamina
var hunger: float = max_hunger

func _process(delta: float) -> void:
    if stamina <= 0 or hunger <= 0:
        game_over()

    if Input.is_action_pressed("ui_up") or Input.is_action_pressed("ui_down"):
        stamina -= delta * 2
    else:
        stamina += delta

    hunger -= delta

func game_over() -> void:
    get_tree().change_scene_to_file("res://GameOverMenu.tscn")
