extends Node2D

@onready var SceneController = get_tree().current_scene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _on_button_pressed() -> void:
	SceneController.swap_scene("res://Scenes/Summoning Scene/summoning.tscn", true, false)
