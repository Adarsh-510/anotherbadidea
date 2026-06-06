extends CharacterBody2D

class_name Character

enum NAME { Andy, Rudy, Owen }

@export var Name: NAME
@export var Speed: float = 250

@export_category("Pathfinding")
@export var target: CharacterBody2D

var is_sprinting: bool = false
var is_squatting: bool = false
var direction: Vector2

func _ready() -> void:
	if Name == NAME.Andy: set_collision_layer_value(1, true)

func _physics_process(_delta: float) -> void:
	if velocity: direction = velocity.normalized()
	move_and_slide()
