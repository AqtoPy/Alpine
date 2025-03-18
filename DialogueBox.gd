extends Control

func _on_close_button_pressed() -> void:
    queue_free()  # Закрываем диалоговое окно
