extends CharacterBody3D

@export var dialogue_text: String = "Привет, я гид! Хочешь узнать о горе?"

func _on_body_entered(body: Node) -> void:
    if body.name == "Player":
        show_dialogue(dialogue_text)

func show_dialogue(text: String) -> void:
    var dialogue_box = preload("res://DialogueBox.tscn").instantiate()
    dialogue_box.get_node("Label").text = text
    get_parent().add_child(dialogue_box)
