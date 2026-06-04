extends CharacterBody2D

class_name Enemy

enum NAME { Boxer, Tall, Fat }

@onready var emotion_animation: AnimatedSprite2D = $"emotion animation"

@export var Name: NAME
@export var Speed: float = 150
@export var time_before_battle: float = 2
@export var confusion_time = 0.75

var can_hear_player: bool = false
var can_see_player: bool = false

var direction: Vector2 = Vector2.RIGHT

func _ready() -> void:
	emotion_animation.visible = false

func _physics_process(_delta: float) -> void:
	move_and_slide()

func heard_player(player: Character):
	can_hear_player = true
	confusion(player)

func player_noise_lost():
	can_hear_player = false

func start_battle():
	var dead_sprite = Sprite2D.new()
	dead_sprite.texture = load("res://Entities/Assets/Sprite Sheets/death.png")
	dead_sprite.global_position = global_position
	dead_sprite.scale *= 0.07
	dead_sprite.z_index = -10
	get_parent().add_child(dead_sprite)
	
	# call battle scene HERE IDK HOW TO DO TATSVABDCASODNSCAOSC
	
	queue_free()

func confusion(player):
	while can_hear_player and not can_see_player:
		emotion_animation.visible = true
		emotion_animation.play("Confusion")
		await get_tree().create_timer(confusion_time).timeout
		direction = (player.global_position - global_position).normalized()
		emotion_animation.visible = false

func anger():
	emotion_animation.visible = true
	emotion_animation.play("Anger")
	await get_tree().create_timer(0.5).timeout
	emotion_animation.play("Loading")
	await get_tree().create_timer(time_before_battle).timeout
	emotion_animation.visible = false
	if can_see_player: start_battle()
