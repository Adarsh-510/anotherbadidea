extends CanvasLayer

@onready var DialogueBox = preload("res://Dialogue Box/Scenes/DialogueBox.tscn")

@onready var book_panel: Panel = $Book_Panel


func _ready() -> void:
	book_panel.modulate.a = 0

	var Dialogue1 = DialogueBox.instantiate()
	add_child(Dialogue1)
	Dialogue1.setup("Well....this is boring.", "Rudy", "Bored")

	await Dialogue1.finished
	Dialogue1.queue_free()

	var Dialogue2 = DialogueBox.instantiate()
	add_child(Dialogue2)
	Dialogue2.setup("You know when I hear the words 'summer vacation', this is definitely not what I picture.", "Owen", "Sad")

	await Dialogue2.finished
	Dialogue2.queue_free()

	var Dialogue3 = DialogueBox.instantiate()
	add_child(Dialogue3)
	Dialogue3.setup("You got any ideas then?", "Andy", "Default")

	await Dialogue3.finished
	Dialogue3.queue_free()

	var Dialogue4 = DialogueBox.instantiate()
	add_child(Dialogue4)
	Dialogue4.setup("I just wanna go back to school at this point... with Cindy.", "Owen", "InLove")

	await Dialogue4.finished
	Dialogue4.queue_free()

	var Dialogue5 = DialogueBox.instantiate()
	add_child(Dialogue5)
	Dialogue5.setup("Word's around town she's been hanging out with Brian all summer. He's got all kinds of expensive toys.", "Rudy", "Happy")

	await Dialogue5.finished
	Dialogue5.queue_free()

	var Dialogue6 = DialogueBox.instantiate()
	add_child(Dialogue6)
	Dialogue6.setup("What?! Nooooo... I hated that kid from the start. Always something fishy about him.", "Owen", "Sad")

	await Dialogue6.finished
	Dialogue6.queue_free()

	var Dialogue7 = DialogueBox.instantiate()
	add_child(Dialogue7)
	Dialogue7.setup("Dude, stop. We're here to discuss a serious matter. We can't just let time go by like this.", "Andy", "Default")

	await Dialogue7.finished
	Dialogue7.queue_free()

	var Dialogue8 = DialogueBox.instantiate()
	add_child(Dialogue8)
	Dialogue8.setup("Time is but a mere illusion, crafted to distract the mortal mind from its inevitable demise.", "Rudy", "Possessed")

	await Dialogue8.finished
	Dialogue8.queue_free()

	var Dialogue9 = DialogueBox.instantiate()
	add_child(Dialogue9)
	Dialogue9.setup("What now?", "Andy", "Default")

	await Dialogue9.finished
	Dialogue9.queue_free()

	var Dialogue10 = DialogueBox.instantiate()
	add_child(Dialogue10)
	Dialogue10.setup("Oh, it's from this book. Found it buried behind the garage.", "Rudy", "Happy")

	await Dialogue10.finished
	Dialogue10.queue_free()
	
	var Dialogue11_tween = create_tween()
	Dialogue11_tween.tween_property(book_panel, "modulate:a", 1, 2)

	await Dialogue11_tween.finished
	await get_tree().create_timer(1.0).timeout
	var Dialogue11_tween1 = create_tween()
	Dialogue11_tween1.tween_property(book_panel, "modulate:a", 0, 2)
	
	await Dialogue11_tween1.finished
	book_panel.queue_free()

	var Dialogue12 = DialogueBox.instantiate()
	add_child(Dialogue12)
	Dialogue12.setup("Hey, if he's so intelligent, why don't we just ask him how to be less bored?", "Owen", "Happy")

	await Dialogue12.finished
	Dialogue12.queue_free()

	var Dialogue13 = DialogueBox.instantiate()
	add_child(Dialogue13)
	Dialogue13.setup("Hey... that's actually not a bad idea.", "Andy", "Happy")

	await Dialogue13.finished
	Dialogue13.queue_free()

	var Dialogue14 = DialogueBox.instantiate()
	add_child(Dialogue14)
	Dialogue14.setup("Can't. All the stuff we need is in the Old Junkyard.", "Rudy", "Default")

	await Dialogue14.finished
	Dialogue14.queue_free()

	var Dialogue15 = DialogueBox.instantiate()
	add_child(Dialogue15)
	Dialogue15.setup("Gasp!", "Andy", "Scared")

	await Dialogue15.finished
	Dialogue15.queue_free()

	var Dialogue16 = DialogueBox.instantiate()
	add_child(Dialogue16)
	Dialogue16.setup("Wait, what's wrong with that?", "Owen", "Sad")

	await Dialogue16.finished
	Dialogue16.queue_free()
