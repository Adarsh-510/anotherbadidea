extends StaticBody2D

@onready var hint_overlay: TextureRect = $"hint overlay"
@onready var pickup_area: Area2D = $"pickup area"
@onready var point_light_2d: PointLight2D = $PointLight2D

@export_enum("Spindal", "Lemonade", "Pickle", "Flute", "Mask") var item: int = 0

var interactable: bool = false

func _ready() -> void:
	hint_overlay.scale = Vector2.ZERO
	hint_overlay.visible = false

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Interact") and interactable:
		DataBase.CollectedItems[DataBase.CollectedItems.keys()[item]] = true
		var tween = create_tween()
		tween.set_ease(Tween.EASE_IN)
		tween.set_trans(Tween.TRANS_EXPO)
		tween.tween_property(self, "scale", Vector2.ZERO, 0.2)
		
		await tween.finished
		
		queue_free()

func _on_pickup_area_body_entered(body: Node2D) -> void:
	if body is Character:
		interactable = true
		
		if DataBase.CollectedItems.values().has(true): return
		
		hint_overlay.visible = true
		
		var tween = create_tween()
		tween.set_ease(Tween.EASE_OUT)
		tween.set_trans(Tween.TRANS_CUBIC)
		tween.tween_property(hint_overlay, "scale", Vector2.ONE, 0.3)

func _on_pickup_area_body_exited(body: Node2D) -> void:
	if body is Character:
		interactable = false
		
		if hint_overlay.visible:
			var tween = create_tween()
			tween.set_ease(Tween.EASE_IN)
			tween.set_trans(Tween.TRANS_CUBIC)
			tween.tween_property(hint_overlay, "scale", Vector2.ZERO, 0.3)
			
			tween.tween_callback(func(): hint_overlay.visible = false)
