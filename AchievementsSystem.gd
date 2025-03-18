extends Node

# Словарь для хранения достижений
var achievements: Dictionary = {
    "mountain_conqueror": false,  # Покорить все горы
    "speedrunner": false,         # Пройти уровень за рекордное время
    "flag_collector": false,      # Собрать все флаги на уровне
    "craft_master": false         # Создать все предметы
}

# Словарь для хранения прогресса
var progress: Dictionary = {
    "mountains_conquered": 0,     # Количество покорённых гор
    "flags_collected": 0,         # Количество собранных флагов
    "items_crafted": 0            # Количество созданных предметов
}

# Функция для обновления прогресса
func update_progress(key: String, value: int) -> void:
    if progress.has(key):
        progress[key] += value
        check_achievements()

# Функция для проверки достижений
func check_achievements() -> void:
    if progress["mountains_conquered"] >= 3 and not achievements["mountain_conqueror"]:
        unlock_achievement("mountain_conqueror")
    if progress["flags_collected"] >= 10 and not achievements["flag_collector"]:
        unlock_achievement("flag_collector")
    if progress["items_crafted"] >= 5 and not achievements["craft_master"]:
        unlock_achievement("craft_master")

# Функция для разблокировки достижения
func unlock_achievement(achievement: String) -> void:
    if achievements.has(achievement):
        achievements[achievement] = true
        print("Достижение разблокировано: ", achievement)
        show_achievement_popup(achievement)

# Функция для показа уведомления о достижении
func show_achievement_popup(achievement: String) -> void:
    var popup = preload("res://AchievementPopup.tscn").instantiate()
    popup.get_node("Label").text = "Достижение: " + achievement
    get_parent().add_child(popup)
