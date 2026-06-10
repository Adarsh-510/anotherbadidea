extends Node2D

@onready var play: TextureButton = $play
@onready var sound: TextureButton = $sound
@onready var exit: TextureButton = $exit

@onready var play_shadow: Sprite2D = $play_shadow
@onready var sound_shadow: Sprite2D = $sound_shadow
@onready var exit_shadow: Sprite2D = $exit_shadow
@onready var sound_disabled: Sprite2D = $sound_disabled

var sound_enabled = true

const HOVER_OFFSET := 20
const TWEEN_TIME := 0.12

var play_start_pos: Vector2
var sound_start_pos: Vector2
var exit_start_pos: Vector2

var play_shadow_start_pos: Vector2
var sound_shadow_start_pos: Vector2
var exit_shadow_start_pos: Vector2

var sound_disabled_start_pos: Vector2


func _ready() -> void:
	
	sound_disabled.modulate.a = 0
	
	# Store original positions
	play_start_pos = play.position
	sound_start_pos = sound.position
	exit_start_pos = exit.position

	play_shadow_start_pos = play_shadow.position
	sound_shadow_start_pos = sound_shadow.position
	exit_shadow_start_pos = exit_shadow.position

	sound_disabled_start_pos = sound_disabled.position

	# Connect hover signals
	play.mouse_entered.connect(func():
		_hover(play, play_shadow, play_start_pos, play_shadow_start_pos)
	)
	play.mouse_exited.connect(func():
		_unhover(play, play_shadow, play_start_pos, play_shadow_start_pos)
	)

	sound.mouse_entered.connect(func():
		_hover(sound, sound_shadow, sound_start_pos, sound_shadow_start_pos)
		_hover_disabled(sound_disabled, sound_disabled_start_pos)
	)
	sound.mouse_exited.connect(func():
		_unhover(sound, sound_shadow, sound_start_pos, sound_shadow_start_pos)
		_unhover_disabled(sound_disabled, sound_disabled_start_pos)
	)

	exit.mouse_entered.connect(func():
		_hover(exit, exit_shadow, exit_start_pos, exit_shadow_start_pos)
	)
	exit.mouse_exited.connect(func():
		_unhover(exit, exit_shadow, exit_start_pos, exit_shadow_start_pos)
	)


func _hover(
	button: Control,
	shadow: Sprite2D,
	button_start: Vector2,
	shadow_start: Vector2
) -> void:
	var tween := create_tween()
	tween.set_parallel(true)
	tween.set_trans(Tween.TRANS_BACK)
	tween.set_ease(Tween.EASE_OUT)

	tween.tween_property(
		button,
		"position",
		button_start + Vector2(HOVER_OFFSET, 0),
		TWEEN_TIME
	)

	tween.tween_property(
		shadow,
		"position",
		shadow_start + Vector2(HOVER_OFFSET, 0),
		TWEEN_TIME
	)


func _unhover(
	button: Control,
	shadow: Sprite2D,
	button_start: Vector2,
	shadow_start: Vector2
) -> void:
	var tween := create_tween()
	tween.set_parallel(true)
	tween.set_trans(Tween.TRANS_BACK)
	tween.set_ease(Tween.EASE_OUT)

	tween.tween_property(
		button,
		"position",
		button_start,
		TWEEN_TIME
	)

	tween.tween_property(
		shadow,
		"position",
		shadow_start,
		TWEEN_TIME
	)


func _hover_disabled(sprite: Sprite2D, start_pos: Vector2) -> void:
	var tween := create_tween()
	tween.set_trans(Tween.TRANS_BACK)
	tween.set_ease(Tween.EASE_OUT)

	tween.tween_property(
		sprite,
		"position",
		start_pos + Vector2(HOVER_OFFSET, 0),
		TWEEN_TIME
	)


func _unhover_disabled(sprite: Sprite2D, start_pos: Vector2) -> void:
	var tween := create_tween()
	tween.set_trans(Tween.TRANS_BACK)
	tween.set_ease(Tween.EASE_OUT)

	tween.tween_property(
		sprite,
		"position",
		start_pos,
		TWEEN_TIME
	)


func _on_sound_pressed() -> void:
	var master_bus := AudioServer.get_bus_index("Master")

	if sound_enabled == true:
		sound_enabled = false
		AudioServer.set_bus_mute(master_bus, true)
		sound_disabled.modulate.a = 1
	elif sound_enabled == false:
		sound_enabled = true
		AudioServer.set_bus_mute(master_bus, false)
		sound_disabled.modulate.a = 0
		

func _on_play_pressed() -> void:
	var SceneController = get_tree().current_scene
	
	SceneController.swap_scene("res://Scenes/Intro/Intro.tscn", true, false)

func _on_exit_pressed() -> void:
	get_tree().quit()
