extends Control

@onready var element1: Button = $element1
@onready var element2: Button = $element2
@onready var element3: Button = $element3

var element1_highlight
var element2_highlight
var element3_highlight

var iterator = 1

func _ready() -> void:
	element1_highlight = element1.get_theme_stylebox("normal") as StyleBoxFlat
	element2_highlight = element2.get_theme_stylebox("normal") as StyleBoxFlat
	element3_highlight = element3.get_theme_stylebox("normal") as StyleBoxFlat

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_up") and iterator > 1 and iterator <= 3:
		iterator -= 1
	if Input.is_action_just_pressed("ui_down") and iterator >= 1 and iterator < 3:
		iterator += 1
	
	match iterator:
		1:
			element1_highlight.border_width_left = 5
			element1_highlight.border_width_right = 5
			element1_highlight.border_width_top = 3
			element1_highlight.border_width_bottom = 3
			
			element2_highlight.border_width_left = 0
			element2_highlight.border_width_right = 0
			element2_highlight.border_width_top = 0
			element2_highlight.border_width_bottom = 0
			
			element3_highlight.border_width_left = 0
			element3_highlight.border_width_right = 0
			element3_highlight.border_width_top = 0
			element3_highlight.border_width_bottom = 0

		2:
			element1_highlight.border_width_left = 0
			element1_highlight.border_width_right = 0
			element1_highlight.border_width_top = 0
			element1_highlight.border_width_bottom = 0
			
			element2_highlight.border_width_left = 5
			element2_highlight.border_width_right = 5
			element2_highlight.border_width_top = 3
			element2_highlight.border_width_bottom = 3
			
			element3_highlight.border_width_left = 0
			element3_highlight.border_width_right = 0
			element3_highlight.border_width_top = 0
			element3_highlight.border_width_bottom = 0
			
		3:
			element1_highlight.border_width_left = 0
			element1_highlight.border_width_right = 0
			element1_highlight.border_width_top = 0
			element1_highlight.border_width_bottom = 0
			
			element2_highlight.border_width_left = 0
			element2_highlight.border_width_right = 0
			element2_highlight.border_width_top = 0
			element2_highlight.border_width_bottom = 0
			
			element3_highlight.border_width_left = 5
			element3_highlight.border_width_right = 5
			element3_highlight.border_width_top = 3
			element3_highlight.border_width_bottom = 3
