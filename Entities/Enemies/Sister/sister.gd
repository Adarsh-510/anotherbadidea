extends CharacterBody2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var vision: Area2D = $vision
@onready var sprite: AnimatedSprite2D = $sprite
@onready var phone_progress: Control = $"CanvasLayer/phone progress"
@onready var progress_bar: TextureProgressBar = $"CanvasLayer/phone progress/TextureProgressBar"

const look_angle = 20
const look_time = 3
const stay_time = 1
var phone_time
var looking_at_phone
var vision_scale

func _ready() -> void:
	vision_scale = vision.scale
	vision.scale = Vector2.ZERO
	vision.global_rotation = deg_to_rad(90)
	look_around()

func _process(_delta: float) -> void:
	if not looking_at_phone: animate()

func end_game():
	# play animation to call mom
	# end game
	pass

func animate():
	var angle = vision.global_rotation
	var current_animation = ""
	
	if angle > deg_to_rad(50) and angle < deg_to_rad(130): current_animation += "Down"
	else:
		sprite.flip_h = Vector2.from_angle(angle).x < 0
		current_animation += "Side"
	
	sprite.play("Idle " + current_animation)

func look_around():
	while true:
		phone_time = randi_range(6, 9)
		phone_up()
		await get_tree().create_timer(phone_time + 1.5).timeout
		
		phone_down()
		
		var tween = create_tween()
		tween.set_ease(Tween.EASE_IN_OUT)
		tween.set_trans(Tween.TRANS_SINE)
		
		tween.tween_property(vision, "global_rotation", deg_to_rad(180 - look_angle), look_time)
		tween.tween_interval(stay_time)
		
		tween.tween_property(vision, "global_rotation", deg_to_rad(0 + look_angle), look_time)
		tween.tween_interval(stay_time)
		
		tween.tween_property(vision, "global_rotation", deg_to_rad(90), look_time)
		tween.tween_interval(stay_time)
		
		await tween.finished
		await get_tree().create_timer(0.5).timeout

func phone_up():
	# look at phone sprite
	
	looking_at_phone = true
	
	var tween1 = create_tween()
	tween1.set_ease(Tween.EASE_IN)
	tween1.set_trans(Tween.TRANS_QUAD)
	tween1.tween_property(vision, "scale", Vector2.ZERO, 1.5)
	await tween1.finished
	
	phone_progress.visible = true
	var tween2 = create_tween()
	tween2.set_trans(Tween.TRANS_LINEAR)
	tween2.tween_property(progress_bar, "value", 100, phone_time)

func phone_down():
	looking_at_phone = false
	phone_progress.visible = false
	
	var tween = create_tween()
	tween.set_ease(Tween.EASE_OUT)
	tween.set_trans(Tween.TRANS_QUAD)
	tween.tween_property(vision, "scale", vision_scale, 1.5)
