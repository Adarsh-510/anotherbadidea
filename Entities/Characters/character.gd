@tool
extends CharacterBody2D
class_name Character

var sprites = [
	preload("res://Entities/Assets/Animations/Movement Animations/Andy.tres"),
	preload("res://Entities/Assets/Animations/Movement Animations/Rudy.tres"),
	preload("res://Entities/Assets/Animations/Movement Animations/Owen.tres")
]

@export_enum("Andy", "Rudy", "Owen") var _name: int = 0:
	set(value):
		_name = value
		if Engine.is_editor_hint():
			$"movement animation".sprite_frames = sprites[_name]
		Name = NAMES[_name]

@export var Speed: float = 250

@export_category("Pathfinding")
@export var target: Node

var NAMES = ["Andy", "Rudy", "Owen"]
var Name: String

var is_sprinting: bool = false
var is_squatting: bool = false
var direction: Vector2

func _ready() -> void:
	if _name == 0: set_collision_layer_value(1, true)
	update_sprite()

func update_sprite():
	$"movement animation".sprite_frames = sprites[_name]

func _physics_process(_delta: float) -> void:
	if Engine.is_editor_hint(): return
	
	if velocity: direction = velocity.normalized()
	move_and_slide()
