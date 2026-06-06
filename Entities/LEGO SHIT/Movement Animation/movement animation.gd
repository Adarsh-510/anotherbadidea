extends AnimatedSprite2D

@onready var parent: CharacterBody2D = get_parent()

func _process(_delta: float) -> void:
	animate()

func animate():
	var current_animation = ""
	
	if parent is Character and parent.is_sprinting: current_animation += "Sprint"
	elif parent is Character and parent.is_squatting: current_animation += "Squat"
	elif parent.velocity: current_animation += "Walk"
	else: current_animation += "Idle"
	
	var direction = parent.direction
	
	var angle = rad_to_deg(direction.angle())
	
	current_animation += " "
	
	if angle > 50 and angle < 130: current_animation += "Down"
	elif angle < -50 and angle > -130: current_animation += "Up"
	else:
		flip_h = direction.x < 0
		current_animation += "Side"
	
	play(current_animation)
