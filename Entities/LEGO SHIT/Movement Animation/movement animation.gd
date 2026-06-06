extends AnimatedSprite2D

@onready var parent: CharacterBody2D = get_parent()

const animations = [
	"res://Entities/Assets/Animations/Movement Animations/Andy.tres",
	"res://Entities/Assets/Animations/Movement Animations/Rudy.tres",
	"res://Entities/Assets/Animations/Movement Animations/Owen.tres",
	"res://Entities/Assets/Animations/Movement Animations/Andy.tres",
	"res://Entities/Assets/Animations/Movement Animations/Rudy.tres",
	"res://Entities/Assets/Animations/Movement Animations/Owen.tres"
]

func _ready() -> void:
	if parent is Character:
		match parent.Name:
			parent.NAME.Andy: sprite_frames = load(animations[0])
			parent.NAME.Rudy: sprite_frames = load(animations[1])
			parent.NAME.Owen: sprite_frames = load(animations[2])
	if parent is Enemy:
		match parent.Name:
			parent.NAME.Boxer: sprite_frames = load(animations[3])
			parent.NAME.Tall: sprite_frames = load(animations[4])
			parent.NAME.Fat: sprite_frames = load(animations[5])

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
	
	if current_animation != "" and current_animation != " ": play(current_animation)
