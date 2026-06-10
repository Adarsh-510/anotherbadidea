extends CanvasLayer

@onready var closed_book: HBoxContainer = $"closed book"
@onready var opened_book: Control = $"opened book"
@onready var strikeout_lines: Control = $"opened book/strikeout lines"

var book_opened: bool = false

func _ready() -> void:
	visible = false
	closed_book.visible = true
	opened_book.visible = false
	book_opened = false

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Escape"):
		if book_opened: toggle_book()
		else: toggle_pause() 

func toggle_pause():
	get_tree().paused = not get_tree().paused
	visible = not visible
	closed_book.visible = true
	opened_book.visible = false
	book_opened = false

func toggle_book():
	closed_book.visible = not closed_book.visible
	opened_book.visible = not opened_book.visible
	book_opened = not book_opened
	if book_opened: check_collected_items()

func check_collected_items():
	for i in range(5):
		strikeout_lines.get_child(i).visible = DataBase.CollectedItems.values()[i]

func _on_resume_pressed() -> void:
	toggle_pause()

func _on_options_pressed() -> void:
	pass # Replace with function body.

func _on_quit_pressed() -> void:
	get_tree().quit()

func _on_book_pressed() -> void:
	toggle_book()

func _on_close_book_button_pressed() -> void:
	toggle_book()
