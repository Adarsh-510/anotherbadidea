extends Node2D

signal finished

@onready var sprites: Node2D = $Sprites

@onready var andy_bored: Sprite2D = $Sprites/Andy_bored
@onready var andy_default: Sprite2D = $Sprites/Andy_default
@onready var andy_happy: Sprite2D = $Sprites/Andy_happy
@onready var andy_scared: Sprite2D = $Sprites/Andy_scared

@onready var owen_happy: Sprite2D = $Sprites/Owen_happy
@onready var owen_sad: Sprite2D = $Sprites/Owen_sad
@onready var owen_inlove: Sprite2D = $Sprites/Owen_inlove

@onready var rudy_bored: Sprite2D = $Sprites/Rudy_bored
@onready var rudy_default: Sprite2D = $Sprites/Rudy_default
@onready var rudy_happy: Sprite2D = $Sprites/Rudy_happy
@onready var rudy_possessed: Sprite2D = $Sprites/Rudy_possessed

@onready var god_default: Sprite2D = $Sprites/God_default
@onready var god_angry: Sprite2D = $Sprites/God_angry
@onready var god_happy: Sprite2D = $Sprites/God_happy

@onready var bully1_default: Sprite2D = $Sprites/Bully1_default
@onready var bully2_default: Sprite2D = $Sprites/Bully2_default
@onready var bully3_default: Sprite2D = $Sprites/Bully3_default
@onready var leader_default: Sprite2D = $Sprites/Leader_default

@onready var label: Label = $Panel/Label

var _text
var _name
var _expression

var text_duration
var sleep_duration = 0.5
var text_speed = 0.05 # lower = faster text
var text_finished = false

var tween: Tween

func _ready() -> void:
	hide_all()

func _process(_delta: float) -> void:
	if text_finished:
		if Input.is_action_just_pressed("Select"):
			finished.emit()
	else:
		if Input.is_action_just_pressed("Select"):
			label.visible_ratio = 1

			if tween and tween.is_valid():
				tween.kill()

			text_finished = true
			await get_tree().create_timer(sleep_duration).timeout
			_on_text_finished()

func setup(text, kid, expression):
	_text = text
	_name = kid
	_expression = expression

	text_finished = false

	hide_all()
	show_character()
	play_text()

func show_character():
	match _name:
		"Andy":
			match _expression:
				"Bored":
					andy_bored.modulate.a = 1
				"Default":
					andy_default.modulate.a = 1
				"Happy":
					andy_happy.modulate.a = 1
				"Scared":
					andy_scared.modulate.a = 1

		"Rudy":
			match _expression:
				"Bored":
					rudy_bored.modulate.a = 1
				"Default":
					rudy_default.modulate.a = 1
				"Happy":
					rudy_happy.modulate.a = 1
				"Possessed":
					rudy_possessed.modulate.a = 1

		"Owen":
			match _expression:
				"Happy":
					owen_happy.modulate.a = 1
				"Sad":
					owen_sad.modulate.a = 1
				"InLove":
					owen_inlove.modulate.a = 1

		"God":
			match _expression:
				"Default":
					god_default.modulate.a = 1
				"Angry":
					god_angry.modulate.a = 1
				"Happy":
					god_happy.modulate.a = 1

		"Bully1":
			match _expression:
				"Default":
					bully1_default.modulate.a = 1

		"Bully2":
			match _expression:
				"Default":
					bully2_default.modulate.a = 1

		"Bully3":
			match _expression:
				"Default":
					bully3_default.modulate.a = 1

func play_text():
	label.text = str(_name) + ": " + _text
	text_duration = label.text.length() * text_speed
	label.visible_ratio = 0

	if tween and tween.is_valid():
		tween.kill()

	tween = get_tree().create_tween()
	tween.tween_property(label, "visible_ratio", 1.0, text_duration)
	tween.finished.connect(_on_text_finished)

func hide_all():
	for sprite in sprites.get_children():
		print("hiding " + sprite.name)
		sprite.modulate.a = 0

func _on_text_finished():
	text_finished = true
