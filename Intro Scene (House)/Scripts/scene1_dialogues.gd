extends CanvasLayer

@onready var DialogueBox = preload("res://Dialogue Box/Scenes/DialogueBox.tscn")

@onready var book_panel: Panel = $Book_Panel

@onready var cutscene_1: Panel = $"Cutscene 1"
@onready var cs_1_text: Label = $"Cutscene 1/cs1_text"

@onready var cutscene_2: Sprite2D = $"Cutscene 2"
@onready var cs_2_text: Label = $"Cutscene 2/cs2_text"

@onready var cutscene_3: Sprite2D = $"Cutscene 3"
@onready var cs_3_text: Label = $"Cutscene 3/cs3_text"

@onready var frank: Sprite2D = $Frank

func _ready() -> void:
	book_panel.modulate.a = 0
	cutscene_1.modulate.a = 0
	cutscene_2.modulate.a = 0
	cutscene_3.modulate.a = 0
	frank.modulate.a = 0

	await get_tree().create_timer(2).timeout

	var Dialogue1 = DialogueBox.instantiate()
	add_child(Dialogue1)
	Dialogue1.setup("We've officially run out of things to do.", "Rudy", "Bored")

	await Dialogue1.finished
	Dialogue1.queue_free()

	var Dialogue2 = DialogueBox.instantiate()
	add_child(Dialogue2)
	Dialogue2.setup("This is the worst summer in recorded history.", "Owen", "Sad")

	await Dialogue2.finished
	Dialogue2.queue_free()

	var Dialogue3 = DialogueBox.instantiate()
	add_child(Dialogue3)
	Dialogue3.setup("Pretty sure history has had worse summers.", "Andy", "Default")

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
	Dialogue10.setup("Oh, it's from this book....", "Rudy", "Happy")

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
	Dialogue12.setup("Why do you have that?", "Andy", "Default")

	await Dialogue12.finished
	Dialogue12.queue_free()

	var Dialogue13 = DialogueBox.instantiate()
	add_child(Dialogue13)
	Dialogue13.setup("Library sale, found it pretty cheap.", "Rudy", "Happy")

	await Dialogue13.finished
	Dialogue13.queue_free()

	var Dialogue14 = DialogueBox.instantiate()
	add_child(Dialogue14)
	Dialogue14.setup("Hey, if he's so wise, why don't we just ask him how to be less bored?", "Owen", "Happy")

	await Dialogue14.finished
	Dialogue14.queue_free()

	var Dialogue15 = DialogueBox.instantiate()
	add_child(Dialogue15)
	Dialogue15.setup("Hey...... that's actually not a bad idea.", "Andy", "Happy")

	await Dialogue15.finished
	Dialogue15.queue_free()

	var Dialogue16 = DialogueBox.instantiate()
	add_child(Dialogue16)
	Dialogue16.setup("Can't. All the stuff we need is in the Old Junkyard.", "Rudy", "Default")

	await Dialogue16.finished
	Dialogue16.queue_free()

	var Dialogue17 = DialogueBox.instantiate()
	add_child(Dialogue17)
	Dialogue17.setup("*Gasp*", "Andy", "Scared")

	await Dialogue17.finished
	Dialogue17.queue_free()

	var Dialogue18 = DialogueBox.instantiate()
	add_child(Dialogue18)
	Dialogue18.setup("Wait, what's wrong with that?", "Owen", "Sad")

	await Dialogue18.finished
	Dialogue18.queue_free()

	cutscene_1.modulate.a = 1
	var cs1_tween = create_tween()
	cs1_tween.tween_property(cs_1_text, "modulate:a", 0, 2)

	await cs1_tween.finished

	cutscene_2.modulate.a = 1
	cs_2_text.text = " For decades, the Old Junkyard Gang has ruled these lands...."
	cs_2_text.visible_ratio = 0
	var cs2_tween = create_tween()
	cs2_tween.tween_property(cs_2_text, "visible_ratio", 1, 6)
	await cs2_tween.finished
	await get_tree().create_timer(2).timeout
	
	cutscene_3.modulate.a = 1
	cs_3_text.text = " We lived in fear, fear of their cruelty and greed..."
	cs_3_text.visible_ratio = 0
	var cs3_tween = create_tween()
	cs3_tween.tween_property(cs_3_text, "visible_ratio", 1, 6)
	await cs3_tween.finished
	await get_tree().create_timer(2).timeout

	cutscene_1.modulate.a = 0
	cutscene_2.modulate.a = 0
	cutscene_3.modulate.a = 0

	
	var Dialogue19 = DialogueBox.instantiate()
	add_child(Dialogue19)
	Dialogue19.setup("yea, we're not going", "Andy", "Default")

	await Dialogue19.finished
	Dialogue19.queue_free()

	var Dialogue20 = DialogueBox.instantiate()
	add_child(Dialogue20)
	Dialogue20.setup("you remember what happened to Frank?", "Owen", "Sad")
	frank.modulate.a = 1

	await Dialogue20.finished
	Dialogue20.queue_free()
	
	var Dialogue21 = DialogueBox.instantiate()
	add_child(Dialogue21)
	Dialogue21.setup("he got wayyy too bored last summer", "Owen", "Sad")

	await Dialogue21.finished
	Dialogue21.queue_free()
	frank.modulate.a = 0

	var Dialogue22 = DialogueBox.instantiate()
	add_child(Dialogue22)
	Dialogue22.setup("*gulp*", "Andy", "Bored")

	await Dialogue22.finished
	await get_tree().create_timer(2).timeout
	Dialogue22.queue_free()
	
	get_tree().change_scene_to_file("res://Junkyard/junkyard.tscn")
