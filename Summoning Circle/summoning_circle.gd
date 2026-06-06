extends StaticBody2D

@onready var items: Node2D = $items
@onready var circle: Area2D = $circle
@onready var player_position: Area2D = $"player position"
@onready var rudy_hide: Marker2D = $"positions/Rudy Hide"
@onready var owen_hide: Marker2D = $"positions/Owen Hide"
@onready var rudy_circle: Marker2D = $"positions/Rudy Circle"
@onready var owen_circle: Marker2D = $"positions/Owen Circle"
@onready var progress: TextureProgressBar = $"CanvasLayer/summoning progress/TextureProgressBar"

@export var Rudy: Character
@export var Owen: Character

var is_filled: bool = false
var in_circle: bool = false
var in_position: bool = false

func _ready() -> void:
	items.visible = false

func toggle_fill():
	is_filled = is_filled
	items.visible = not items.visible
	
	if Rudy.target == rudy_circle: Rudy.target = rudy_hide
	elif Rudy.target == rudy_hide: Rudy.target = rudy_circle
	else: Rudy.target = rudy_circle
	
	if Owen.target == owen_circle: Owen.target = owen_hide
	elif Owen.target == owen_hide: Owen.target = owen_circle
	else: Owen.target = owen_circle

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Interact") and in_circle:
		toggle_fill()
	if event.is_action_pressed("Select") and in_position:
		progress.value += 1

func _on_circle_body_entered(body: Node2D) -> void:
	if body is Character and body._name == 0:
		in_circle = true

func _on_circle_body_exited(body: Node2D) -> void:
	if body is Character and body._name == 0:
		in_circle = false

func _on_player_position_body_entered(body: Node2D) -> void:
	if body is Character and body._name == 0:
		in_position = true

func _on_player_position_body_exited(body: Node2D) -> void:
	if body is Character and body._name == 0:
		in_position = false
