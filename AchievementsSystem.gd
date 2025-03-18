extends Node

var achievements: Dictionary = {
    "mountain_conqueror": false,  # Покорить все горы
    "speedrunner": false,         # Пройти уровень за рекордное время
    "flag_collector": false       # Собрать все флаги на уровне
}

func unlock_achievement(achievement: String) -> void:
    if achievements.has(achievement):
        achievements[achievement] = true
        print("Достижение разблокировано: ", achievement)
        show_achievement_popup(achievement)

func show_achievement_popup(achievement: String) -> void:
    var popup = preload("res://AchievementPopup.tscn").instantiate()
    popup.get_node("Label").text = "Достижение: " + achievement
    get_parent().add_child(popup)
