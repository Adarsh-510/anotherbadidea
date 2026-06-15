extends NavigationAgent2D

@export var look_around: bool = true
@export var randomize_path: bool = false

@onready var parent: CharacterBody2D = get_parent()
@onready var refresh_position: Timer = $refresh_position
@onready var follow_player_for: Timer = $"follow player for"

var target

var path_positions: Array[Vector2] = []
var position_index: int = 0
var has_target: bool = false
var is_looking: bool = false
var default_target_distance 

const look_around_angle: float = 40

func _ready() -> void:
	default_target_distance = target_desired_distance
	
	if parent is Character and parent._name != 0:
		avoidance_priority = 0
	
	setup()

func setup():
	target = parent.target
	
	if target is CharacterBody2D:
		has_target = true
		refresh_position.start()
		target_desired_distance = default_target_distance
	elif target:
		refresh_position.start()
		has_target = true
		target_desired_distance = 40
	else:
		refresh_position.stop()
		target_desired_distance = 10
		var path: Path2D = get_parent().find_child("Path2D")
		if path:
			get_positions(path)
			if not path_positions.is_empty(): has_target = true

func _physics_process(_delta: float) -> void:
	if not has_target: return
	elif target != parent.target: setup()
	
	if parent is Character: check_movement_type()
	var speed_modifier = (0.25 if parent.is_squatting else (1.75 if parent.is_sprinting else 1.0)) if parent is Character else (1.0 if follow_player_for.is_stopped() else 1.25)
	
	if parent is Enemy:
		if parent.can_see_player:
			follow_player_for.start()
			is_looking = false
			parent.target = parent.player_in_vision
			return
		if parent.can_hear_player:
			is_looking = false
			set_velocity(Vector2.ZERO)
			return
	
	if is_looking:
		set_velocity(Vector2.ZERO)
		return
	
	if is_navigation_finished():
		if target: return
		navigate_to_next()
	
	var intended_velocity = parent.global_position.direction_to(get_next_path_position()) * parent.Speed * speed_modifier
	set_velocity(intended_velocity) 

func _on_velocity_computed(safe_velocity: Vector2) -> void:
	parent.velocity = parent.velocity.move_toward(safe_velocity, 50)
	if parent is Enemy and parent.velocity: parent.direction = parent.velocity.normalized()

func _on_refresh_position_timeout() -> void:
	if target: target_position = target.global_position

func check_movement_type():
	var distance_to_player = get_path_length()
	if distance_to_player > 300:
		parent.is_sprinting = true
		parent.is_squatting = false
	elif distance_to_player < 150: 
		if target is Character and target.is_squatting:
			parent.is_sprinting = false
			parent.is_squatting = true
	else:
		parent.is_sprinting = false
		parent.is_squatting = false

func navigate_to_next():
	var next_target = target_position
	
	if randomize_path: while next_target == target_position:
		next_target = path_positions.pick_random()
	else:
		next_target = path_positions[position_index]
		position_index = (position_index + 1) % path_positions.size()
	
	if look_around: look_around_direction(next_target)
	
	target_position = next_target

func look_around_direction(next_target):
	is_looking = true
	
	var direction_to_next_target = parent.global_position.direction_to(next_target)
	var difference_in_angle = parent.direction.angle() - direction_to_next_target.angle()
	difference_in_angle = difference_in_angle if difference_in_angle >= 0 else difference_in_angle + TAU
	var offset_angle = (1 if difference_in_angle >= PI else -1) * deg_to_rad(look_around_angle)
	
	if is_looking and get_tree(): await get_tree().create_timer(1).timeout
	if is_looking: parent.direction = direction_to_next_target
	if is_looking and get_tree(): await get_tree().create_timer(0.2).timeout
	if is_looking: parent.direction = Vector2.from_angle(direction_to_next_target.angle() + offset_angle).normalized()
	if is_looking and get_tree(): await get_tree().create_timer(1).timeout
	if is_looking: parent.direction = Vector2.from_angle(direction_to_next_target.angle() - offset_angle).normalized()
	if is_looking and get_tree(): await get_tree().create_timer(1).timeout
	
	is_looking = false

func get_positions(path: Path2D):
	for i in range(path.curve.point_count - 1):
		path_positions.push_back(path.global_position + path.curve.get_point_position(i))

func _on_follow_player_for_timeout() -> void:
	parent.target = null
