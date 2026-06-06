extends Area2D

@onready var parent = get_parent()
@onready var sight: RayCast2D = $RayCast2D
@onready var cone_visual: Polygon2D = $Polygon2D

var is_in_cone: bool = false
var player_in_cone: Character

func _physics_process(delta: float) -> void:
	if is_in_cone: is_player_visible()
	
	current_cone_visual()
	
	look_towards(delta)

func _on_body_entered(body: Node2D) -> void:
	if body is Character and body._name == 0:
		is_in_cone = true
		player_in_cone = body

func _on_body_exited(body: Node2D) -> void:
	if body is Character and body._name == 0:
		is_in_cone = false
		parent.can_see_player = false

func current_cone_visual():
	if parent.can_see_player and cone_visual.modulate == Color("ffffff50"): cone_visual.modulate = "ff000050"
	if not parent.can_see_player and cone_visual.modulate == Color("ff000050"): cone_visual.modulate = "ffffff50"

func is_player_visible():
	sight.target_position = sight.to_local(player_in_cone.global_position)
	sight.force_raycast_update()
	if sight.is_colliding() and sight.get_collider() is Character and sight.get_collider()._name == 0:
		if not parent.can_see_player:
			parent.can_see_player = true
			parent.player_in_vision = sight.get_collider()
			parent.anger()
		parent.direction = global_position.direction_to(player_in_cone.global_position)
	elif parent.can_see_player: parent.can_see_player = false

func look_towards(delta):
	if not parent.direction: return
	
	var rotation_speed = 7.5
	
	if abs(angle_difference(global_rotation, parent.direction.angle())) > 0.01:
		global_rotation = lerp_angle(global_rotation, parent.direction.angle(), rotation_speed * delta)
