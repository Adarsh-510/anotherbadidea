extends Area2D

@onready var parent = get_parent()

@export var radius_modifier_sprinting: float = 1.75
@export var radius_modifier_squatting: float = 0.25

func _physics_process(_delta: float) -> void:
	var radius_modifier
	
	if parent.velocity:
		radius_modifier = Vector2(1, 1)
		if parent.is_sprinting: radius_modifier *= radius_modifier_sprinting
		elif parent.is_squatting: radius_modifier *= radius_modifier_squatting
	else: radius_modifier = Vector2.ZERO
	
	scale = radius_modifier

func _on_body_entered(body: Node2D) -> void:
	if body is Enemy:
		body.heard_player(parent)

func _on_body_exited(body: Node2D) -> void:
	if body is Enemy:
		body.player_noise_lost()
