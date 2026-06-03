extends Panel


@onready var player_1: Panel = $"../../Visuals/player1"
@onready var player_2: Panel = $"../../Visuals/player2"
@onready var player_3: Panel = $"../../Visuals/player3"
var p1_highlight
var p2_highlight
var p3_highlight

@onready var turn_label: Label = $turn_label

var blink_duration := 2.5

func _ready() -> void:
	p1_highlight = player_1.get_theme_stylebox("panel") as StyleBoxFlat
	p2_highlight = player_2.get_theme_stylebox("panel") as StyleBoxFlat
	p3_highlight = player_3.get_theme_stylebox("panel") as StyleBoxFlat


func _process(delta: float) -> void:
	if (FightSystem.active_state == FightSystem.STATE.SELECTION):
		match FightSystem.current_entity:
			FightSystem.ENTITIES.P1:
				turn_label.text = str(DataBase.Player1["name"]) + "'s turn"

				blink_border(p1_highlight)

				p2_highlight.border_width_left = 0
				p2_highlight.border_width_right = 0
				p2_highlight.border_width_top = 0
				p2_highlight.border_width_bottom = 0
				p2_highlight.border_color.a = 0.0

				p3_highlight.border_width_left = 0
				p3_highlight.border_width_right = 0
				p3_highlight.border_width_top = 0
				p3_highlight.border_width_bottom = 0
				p3_highlight.border_color.a = 0.0

			FightSystem.ENTITIES.P2:
				turn_label.text = str(DataBase.Player2["name"]) + "'s turn"

				p1_highlight.border_width_left = 0
				p1_highlight.border_width_right = 0
				p1_highlight.border_width_top = 0
				p1_highlight.border_width_bottom = 0
				p1_highlight.border_color.a = 0.0

				blink_border(p2_highlight)

				p3_highlight.border_width_left = 0
				p3_highlight.border_width_right = 0
				p3_highlight.border_width_top = 0
				p3_highlight.border_width_bottom = 0
				p3_highlight.border_color.a = 0.0

			FightSystem.ENTITIES.P3:
				turn_label.text = str(DataBase.Player3["name"]) + "'s turn"

				p1_highlight.border_width_left = 0
				p1_highlight.border_width_right = 0
				p1_highlight.border_width_top = 0
				p1_highlight.border_width_bottom = 0
				p1_highlight.border_color.a = 0.0

				p2_highlight.border_width_left = 0
				p2_highlight.border_width_right = 0
				p2_highlight.border_width_top = 0
				p2_highlight.border_width_bottom = 0
				p2_highlight.border_color.a = 0.0

				blink_border(p3_highlight)

	else:
		p1_highlight.border_width_left = 0
		p1_highlight.border_width_right = 0
		p1_highlight.border_width_top = 0
		p1_highlight.border_width_bottom = 0
		p1_highlight.border_color.a = 0.0

		p2_highlight.border_width_left = 0
		p2_highlight.border_width_right = 0
		p2_highlight.border_width_top = 0
		p2_highlight.border_width_bottom = 0
		p2_highlight.border_color.a = 0.0

		p3_highlight.border_width_left = 0
		p3_highlight.border_width_right = 0
		p3_highlight.border_width_top = 0
		p3_highlight.border_width_bottom = 0
		p3_highlight.border_color.a = 0.0


func blink_border(stylebox):
	var t = Time.get_ticks_msec() / 1000.0
	var alpha = (sin(t * TAU / blink_duration) + 1.0) / 2.0

	var color = stylebox.border_color
	color.a = alpha
	stylebox.border_color = color

	stylebox.border_width_left = 10
	stylebox.border_width_right = 10
	stylebox.border_width_top = 10
	stylebox.border_width_bottom = 10
