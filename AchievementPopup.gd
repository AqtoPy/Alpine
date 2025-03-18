extends Control

func _ready() -> void:
    $Timer.start(3)  # Закрыть окно через 3 секунды

func _on_timer_timeout() -> void:
    queue_free()  # Закрыть окно
