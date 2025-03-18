extends Control

@export var mountain_name: String = "Гора Эверест"
@export var mountain_height: float = 8848.0
@export var player_name: String = "Игрок"

func _ready() -> void:
    $MountainInfo.text = "Гора: " + mountain_name + "\nВысота: " + str(mountain_height) + " м"
    $PlayerName.text = "Игрок: " + player_name

func _on_screenshot_button_pressed() -> void:
    take_screenshot()

func _on_next_level_button_pressed() -> void:
    get_tree().change_scene_to_file("res://Level2.tscn")

func take_screenshot() -> void:
    var image = get_viewport().get_texture().get_image()
    image.save_png("user://screenshot.png")
    print("Скриншот сохранён!")
