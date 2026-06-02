extends Panel

@onready var player_1: Panel = $"../../Visuals/player1"
@onready var player_2: Panel = $"../../Visuals/player2"
@onready var player_3: Panel = $"../../Visuals/player3"
var p1_highlight
var p2_highlight
var p3_highlight

@onready var turn_label: Label = $turn_label

func _ready() -> void:
	p1_highlight = player_1.get_theme_stylebox("panel") as StyleBoxFlat
	p2_highlight = player_2.get_theme_stylebox("panel") as StyleBoxFlat
	p3_highlight = player_3.get_theme_stylebox("panel") as StyleBoxFlat

func _process(delta: float) -> void:
	if (FightSystem.active_state == FightSystem.STATE.SELECTION):
		match FightSystem.current_entity:
			FightSystem.ENTITIES.P1:
				turn_label.text = "Player 1's turn"
				
				p1_highlight.border_width_left = 5
				p1_highlight.border_width_right = 5
				p1_highlight.border_width_top = 5
				p1_highlight.border_width_bottom = 5
				
				p2_highlight.border_width_left = 0
				p2_highlight.border_width_right = 0
				p2_highlight.border_width_top = 0
				p2_highlight.border_width_bottom = 0
				
				p3_highlight.border_width_left = 0
				p3_highlight.border_width_right = 0
				p3_highlight.border_width_top = 0
				p3_highlight.border_width_bottom = 0
			
			FightSystem.ENTITIES.P2:
				turn_label.text = "Player 2's turn"
				
				p1_highlight.border_width_left = 0
				p1_highlight.border_width_right = 0
				p1_highlight.border_width_top = 0
				p1_highlight.border_width_bottom = 0
				
				p2_highlight.border_width_left = 5
				p2_highlight.border_width_right = 5
				p2_highlight.border_width_top = 5
				p2_highlight.border_width_bottom = 5
				
				p3_highlight.border_width_left = 0
				p3_highlight.border_width_right = 0
				p3_highlight.border_width_top = 0
				p3_highlight.border_width_bottom = 0
				
			FightSystem.ENTITIES.P3:
				turn_label.text = "Player 3's turn"
				
				p1_highlight.border_width_left = 0
				p1_highlight.border_width_right = 0
				p1_highlight.border_width_top = 0
				p1_highlight.border_width_bottom = 0
				
				p2_highlight.border_width_left = 0
				p2_highlight.border_width_right = 0
				p2_highlight.border_width_top = 0
				p2_highlight.border_width_bottom = 0
				
				p3_highlight.border_width_left = 5
				p3_highlight.border_width_right = 5
				p3_highlight.border_width_top = 5
				p3_highlight.border_width_bottom = 5
				
	else:
		p1_highlight.border_width_left = 0
		p1_highlight.border_width_right = 0
		p1_highlight.border_width_top = 0
		p1_highlight.border_width_bottom = 0
				
		p2_highlight.border_width_left = 0
		p2_highlight.border_width_right = 0
		p2_highlight.border_width_top = 0
		p2_highlight.border_width_bottom = 0
				
		p3_highlight.border_width_left = 0
		p3_highlight.border_width_right = 0
		p3_highlight.border_width_top = 0
		p3_highlight.border_width_bottom = 0
