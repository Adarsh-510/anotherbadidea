extends Node2D

@export var fade_duration: float = 1.0
@export var hold_duration: float = 1.5

@onready var a_game_by: Label = $A_Game_by
@onready var art_direction: Label = $"Art Direction"
@onready var animation: Label = $Animation
@onready var programming: Label = $Programming
@onready var music: Label = $Music


func _ready() -> void:
	var SceneController = get_tree().current_scene
	
	var labels = [
		a_game_by,
		art_direction,
		animation,
		programming,
		music
	]

	for label in labels: label.modulate.a = 0.0

	await get_tree().create_timer(1.5).timeout

	for label in labels:
		var tween = create_tween()

		tween.tween_property(label, "modulate:a", 1.0, fade_duration)
		tween.tween_interval(hold_duration)
		tween.tween_property(label, "modulate:a", 0.0, fade_duration)

		await tween.finished
	
	SceneController.swap_scene("res://Scenes/Menu/Main Menu.tscn", true, false)
