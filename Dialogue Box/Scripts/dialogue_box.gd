extends Node2D

signal finished

@onready var andy_bored: Sprite2D = $Andy_bored
@onready var andy_default: Sprite2D = $Andy_default
@onready var andy_happy: Sprite2D = $Andy_happy
@onready var andy_scared: Sprite2D = $Andy_scared
@onready var owen_happy: Sprite2D = $Owen_happy
@onready var owen_sad: Sprite2D = $Owen_sad
@onready var rudy_bored: Sprite2D = $Rudy_bored
@onready var rudy_default: Sprite2D = $Rudy_default
@onready var rudy_happy: Sprite2D = $Rudy_happy

@onready var label: Label = $Panel/Label

var _text
var _name
var _expression

var text_duration
var sleep_duration = 0.5
var text_speed = 0.07 #the lesser this is, the faster text is
var text_finished = false

var tween

func _ready() -> void:
	tween = get_tree().create_tween()

func _process(delta: float) -> void:
	
	if text_finished:
		if Input.is_action_just_pressed("ui_accept"):
			finished.emit()
	if not text_finished:
		if Input.is_action_just_pressed("ui_accept"):
			label.visible_ratio = 1
			tween.kill()
			text_finished = true
			await get_tree().create_timer(sleep_duration).timeout
			_on_text_finished()

func setup(text, kid, expression):
	_text = text
	_name = kid
	_expression = expression
	play_text()
	
	hide_all()
	
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

		"Owen":
			match _expression:
				"Happy":
					owen_happy.modulate.a = 1
				"Sad":
					owen_sad.modulate.a = 1

func play_text():
	label.text = str(_name) + ": " + _text
	text_duration = label.text.length() * text_speed
	label.visible_ratio = 0
	tween.tween_property(label, "visible_ratio", 1, text_duration)

	tween.finished.connect(_on_text_finished)

func hide_all():
	andy_bored.modulate.a = 0
	andy_default.modulate.a = 0
	andy_happy.modulate.a = 0
	andy_scared.modulate.a = 0

	owen_happy.modulate.a = 0
	owen_sad.modulate.a = 0

	rudy_bored.modulate.a = 0
	rudy_default.modulate.a = 0
	rudy_happy.modulate.a = 0

func _on_text_finished():
	text_finished = true
