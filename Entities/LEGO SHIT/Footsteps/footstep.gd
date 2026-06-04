extends AudioStreamPlayer2D

@onready var parent = get_parent()
@onready var time_between_steps: Timer = $"time between steps"

@onready var base_step_time: float

func _ready() -> void:
	base_step_time = time_between_steps.wait_time

func _process(_delta: float) -> void:
	var step_wait_time = base_step_time
	if parent is Character:
		if parent.is_sprinting: step_wait_time /= 1.75
		elif parent.is_squatting: step_wait_time /= 0.50
	
	time_between_steps.wait_time = step_wait_time

func make_noise():
	if parent.velocity: playing = true

func _on_time_between_steps_timeout() -> void:
	make_noise()
