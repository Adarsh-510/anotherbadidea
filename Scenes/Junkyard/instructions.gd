extends CanvasLayer

@onready var DialogueBox = preload("res://GUI/Dialogue Box/Scenes/DialogueBox.tscn")

func _ready() -> void:
	var Dialogue1 = DialogueBox.instantiate()
	add_child(Dialogue1)
	Dialogue1.setup("Ok so according to this book we have to collect 5 items....", "Rudy", "Default")
	
	await Dialogue1.finished
	Dialogue1.queue_free()
