extends Node2D

class_name Control_Movement

@onready var parent = get_parent()

var direction: Vector2

func _physics_process(_delta: float) -> void:
	direction = Input.get_vector("Left", "Right", "Up", "Down")
	
	var speed_modifier = 1
	speed_modifier = 0.25 if parent.is_squatting else (1.75 if parent.is_sprinting else 1.0)
	
	parent.velocity = direction * parent.Speed * speed_modifier
	
	parent.is_squatting = Input.is_action_pressed("Control") and direction
	parent.is_sprinting = Input.is_action_pressed("Shift") and direction and not parent.is_squatting 
