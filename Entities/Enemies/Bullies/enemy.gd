@tool
extends CharacterBody2D
class_name Enemy

@onready var anger_sprite: Sprite2D = $Anger
@onready var confusion_sprite: Sprite2D = $Confusion

var sprites = [
	preload("res://Entities/Assets/Animations/Movement Animations/Andy.tres"),
	preload("res://Entities/Assets/Animations/Movement Animations/Rudy.tres"),
	preload("res://Entities/Assets/Animations/Movement Animations/Owen.tres")
]

@export_enum("Boxer", "Tall", "Fat") var _name: int = 0:
	set(value):
		_name = value
		if Engine.is_editor_hint():
			$"movement animation".sprite_frames = sprites[_name]
		Name = NAMES[_name]

@export var Speed: float = 150
@export var time_before_battle: float = 1.5
@export var confusion_time = 0.75

@export_category("Pathfinding")
@export var target: CharacterBody2D

var NAMES = ["Boxer", "Tall", "Fat"]
var Name: String

var can_hear_player: bool = false
var can_see_player: bool = false

var direction: Vector2 = Vector2.RIGHT

func _ready() -> void:
	anger_sprite.visible = false
	confusion_sprite.visible = false
	if _name == 0: set_collision_layer_value(1, true)
	update_sprite()

func update_sprite():
	$"movement animation".sprite_frames = sprites[_name]

func _physics_process(_delta: float) -> void:
	if Engine.is_editor_hint(): return
	
	if can_see_player != anger_sprite.visible: anger_sprite.visible = not anger_sprite.visible
	elif can_hear_player != confusion_sprite.visible: confusion_sprite.visible = not confusion_sprite.visible
	
	move_and_slide()

var sound_lost
func heard_player(player: Character):
	can_hear_player = true
	sound_lost = false
	confusion(player)

func player_noise_lost():
	sound_lost = true

func start_battle():
	var dead_sprite = Sprite2D.new()
	dead_sprite.texture = load("res://Entities/Assets/Sprite Sheets/death.png")
	dead_sprite.global_position = global_position
	dead_sprite.scale *= 0.07
	dead_sprite.z_index = -10
	get_parent().add_child(dead_sprite)
	
	# ADD DIALOGUE HERE
	# WHEN ENTER PRESSED ON DIALOGUE -> CHANGE SCENE
	
	match _name:
		0: DataBase.curr_enemy = DataBase.Bully1
		1: DataBase.curr_enemy = DataBase.Bully2
		2: DataBase.curr_enemy = DataBase.Bully3
	get_tree().change_scene_to_file("res://Combat System/Scenes/Main_Battle.tscn")

	queue_free()

func confusion(player):
	while can_hear_player and not can_see_player:
		await get_tree().create_timer(confusion_time).timeout
		direction = (player.global_position - global_position).normalized()
		await get_tree().create_timer(1).timeout
		if sound_lost: can_hear_player = false

func anger():
	await get_tree().create_timer(time_before_battle).timeout
	if can_see_player: start_battle()
