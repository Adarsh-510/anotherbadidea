extends Area2D

@onready var parent = get_parent()

@export var radius_modifier_sprinting: float = 1.3
@export var radius_modifier_squatting: float = 0.4
@export var radius_modifier_standing: float = 0.2
@export var scaling_speed: float = 0.05

var defaut_radius

func _ready() -> void:
	defaut_radius = scale

func _physics_process(_delta: float) -> void:
	get_radius()

func get_radius():
	var new_radius = defaut_radius
	
	if parent.velocity:
		if parent.is_sprinting: new_radius *= radius_modifier_sprinting
		elif parent.is_squatting: new_radius *= radius_modifier_squatting
	else: new_radius *= radius_modifier_standing
	
	scale = scale.move_toward(new_radius, scaling_speed)

func _on_body_entered(body: Node2D) -> void:
	if body is Enemy:
		body.heard_player(parent)

func _on_body_exited(body: Node2D) -> void:
	if body is Enemy:
		body.player_noise_lost()
