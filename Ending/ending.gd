extends CanvasLayer

@onready var DialogueBox = preload("res://Dialogue Box/Scenes/DialogueBox.tscn")

@onready var cutscene_0: Panel = $"cutscene 0"
@onready var cutscene_1: Sprite2D = $"cutscene 1"
@onready var cutscene_2: Sprite2D = $"cutscene 2"
@onready var cutscene_3: Panel = $"cutscene 3"

func _ready() -> void:
	cutscene_1.modulate.a = 0
	cutscene_2.modulate.a = 0
	cutscene_3.modulate.a = 0
	
	await get_tree().create_timer(3.5).timeout
	
	cutscene_0.modulate.a = 0
	cutscene_1.modulate.a = 1
	var Dialogue1 = DialogueBox.instantiate()
	add_child(Dialogue1)
	Dialogue1.z_index = 2
	Dialogue1.setup("Uhhhhh", "Andy", "Default")

	await Dialogue1.finished
	Dialogue1.queue_free()
	cutscene_1.modulate.a = 0
	cutscene_2.modulate.a = 1

	var Dialogue2 = DialogueBox.instantiate()
	add_child(Dialogue2)
	Dialogue2.z_index = 2
	Dialogue2.setup("WHO DARES AWAKEN ME FROM MY ETERNAL SLUMBER?!", "God", "Default")

	await Dialogue2.finished
	Dialogue2.queue_free()
	cutscene_2.modulate.a = 0

	var Dialogue3 = DialogueBox.instantiate()
	add_child(Dialogue3)
	Dialogue3.setup("Uhh- we did", "Rudy", "Default")

	await Dialogue3.finished
	Dialogue3.queue_free()

	var Dialogue4 = DialogueBox.instantiate()
	add_child(Dialogue4)
	Dialogue4.setup("YOU KIDS?!! HOW DARE YOU", "God", "Angry")

	await Dialogue4.finished
	Dialogue4.queue_free()

	var Dialogue5 = DialogueBox.instantiate()
	add_child(Dialogue5)
	Dialogue5.setup("Are you really the god of infinite wisdom?", "Andy", "Default")

	await Dialogue5.finished
	Dialogue5.queue_free()

	var Dialogue6 = DialogueBox.instantiate()
	add_child(Dialogue6)
	Dialogue6.setup("I am.... no doubt about it.", "God", "Default")

	await Dialogue6.finished
	Dialogue6.queue_free()

	var Dialogue7 = DialogueBox.instantiate()
	add_child(Dialogue7)
	Dialogue7.setup("What's the best candy bar?", "Rudy", "Default")

	await Dialogue7.finished
	Dialogue7.queue_free()

	var Dialogue8 = DialogueBox.instantiate()
	add_child(Dialogue8)
	Dialogue8.setup("M&M's.", "God", "Default")

	await Dialogue8.finished
	Dialogue8.queue_free()

	var Dialogue9 = DialogueBox.instantiate()
	add_child(Dialogue9)
	Dialogue9.setup("Guys, he knows everything.", "Rudy", "Happy")

	await Dialogue9.finished
	Dialogue9.queue_free()

	var Dialogue10 = DialogueBox.instantiate()
	add_child(Dialogue10)
	Dialogue10.setup("Regardless. As a reward for restoring me to this realm, I shall grant you a single wish.", "God", "Default")

	await Dialogue10.finished
	Dialogue10.queue_free()

	var Dialogue11 = DialogueBox.instantiate()
	add_child(Dialogue11)
	Dialogue11.setup("What is it you seek? Infinite wealth? Eternal happiness? Perhaps it is power that you desire?", "God", "Default")

	await Dialogue11.finished
	Dialogue11.queue_free()

	var Dialogue12 = DialogueBox.instantiate()
	add_child(Dialogue12)
	Dialogue12.setup("We need to know how not to be bored during summer vacations.", "Owen", "Happy")

	await Dialogue12.finished
	Dialogue12.queue_free()

	var Dialogue13 = DialogueBox.instantiate()
	add_child(Dialogue13)
	Dialogue13.setup("Tha- that's it? You sure you don't want me to, like.... destroy the world or something?", "God", "Default")

	await Dialogue13.finished
	Dialogue13.queue_free()

	var Dialogue14 = DialogueBox.instantiate()
	add_child(Dialogue14)
	Dialogue14.setup("Nah, Mom would be pretty pissed off if that happens.", "Andy", "Happy")

	await Dialogue14.finished
	Dialogue14.queue_free()

	var Dialogue15 = DialogueBox.instantiate()
	add_child(Dialogue15)
	Dialogue15.setup("Alright then..... the secret to a perfect summer vacation is.....", "God", "Default")

	await Dialogue15.finished
	Dialogue15.queue_free()

	var Dialogue16 = DialogueBox.instantiate()
	add_child(Dialogue16)
	Dialogue16.setup("WATER BALLOONS", "God", "Happy")

	await Dialogue16.finished
	Dialogue16.queue_free()

	cutscene_3.modulate.a = 1
