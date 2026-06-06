extends Area2D

@onready var parent = get_parent()
@onready var sight: RayCast2D = $RayCast2D
@onready var cone_visual: Polygon2D = $Polygon2D

var is_in_cone: bool = false
var player_in_cone: Character

func _physics_process(_delta: float) -> void:
	if is_in_cone: is_it_visible()
	#current_cone_visual()

func is_it_visible():
	sight.target_position = sight.to_local(player_in_cone.global_position)
	sight.force_raycast_update()
	
	# edit it to accept the circle
	if sight.is_colliding() and sight.get_collider() is Character and sight.get_collider()._name == 0:
		parent.end_game()

func _on_body_entered(body: Node2D) -> void:
	if body is Character and body._name == 0:
		is_in_cone = true
		player_in_cone = body

func _on_body_exited(body: Node2D) -> void:
	if body is Character and body._name == 0:
		is_in_cone = false

#func current_cone_visual():
	#if parent.can_see_player and cone_visual.modulate == Color("ffffff50"): cone_visual.modulate = "ff000050"
	#if not parent.can_see_player and cone_visual.modulate == Color("ff000050"): cone_visual.modulate = "ffffff50"
