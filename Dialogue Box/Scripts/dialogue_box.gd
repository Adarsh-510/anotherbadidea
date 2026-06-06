extends Node2D

signal finished

@onready var andy_bored: Sprite2D = $Andy_bored
@onready var andy_default: Sprite2D = $Andy_default
@onready var andy_happy: Sprite2D = $Andy_happy
@onready var andy_scared: Sprite2D = $Andy_scared

@onready var owen_happy: Sprite2D = $Owen_happy
@onready var owen_sad: Sprite2D = $Owen_sad
@onready var owen_inlove: Sprite2D = $Owen_inlove

@onready var rudy_bored: Sprite2D = $Rudy_bored
@onready var rudy_default: Sprite2D = $Rudy_default
@onready var rudy_happy: Sprite2D = $Rudy_happy
@onready var rudy_possessed: Sprite2D = $Rudy_possesed

@onready var god_default: Sprite2D = $God_default
@onready var god_angry: Sprite2D = $God_angry
@onready var god_happy: Sprite2D = $God_happy

@onready var label: Label = $Panel/Label

var _text
var _name
var _expression

var text_duration
var sleep_duration = 0.5
var text_speed = 0.07 # lower = faster text
var text_finished = false

var tween: Tween

func _ready() -> void:
	hide_all()

func _process(delta: float) -> void:
	if text_finished:
		if Input.is_action_just_pressed("ui_accept"):
			finished.emit()
	else:
		if Input.is_action_just_pressed("ui_accept"):
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
	# Andy
	andy_bored.modulate.a = 0
	andy_default.modulate.a = 0
	andy_happy.modulate.a = 0
	andy_scared.modulate.a = 0

	# Owen
	owen_happy.modulate.a = 0
	owen_sad.modulate.a = 0
	owen_inlove.modulate.a = 0

	# Rudy
	rudy_bored.modulate.a = 0
	rudy_default.modulate.a = 0
	rudy_happy.modulate.a = 0
	rudy_possessed.modulate.a = 0

	# God
	god_default.modulate.a = 0
	god_angry.modulate.a = 0
	god_happy.modulate.a = 0

func _on_text_finished():
	text_finished = true
