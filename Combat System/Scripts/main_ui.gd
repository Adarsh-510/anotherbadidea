extends Control

@onready var attack_UI = preload("res://Combat System/Scenes/attacks.tscn")
@onready var item_UI = preload("res://Combat System/Scenes/items.tscn")
@onready var UI = preload("res://Combat System/Scenes/ui.tscn")

@onready var UI_position: Marker2D = $Marker2D
@onready var desc_label: Label = $description/desc_label
@onready var turns_info_panel: Label = $"../Visuals/turns_info_panel"


var init_position
var UI_menu
var attack_menu
var item_menu
var current_UI

var iterator = 1

func _ready() -> void:
	
	add_to_group("Interface")
	
	init_position = UI_position.global_position
	UI_menu = UI.instantiate()
	UI_menu.global_position = init_position
	add_child(UI_menu)
	current_UI = UI_menu
	
	turns_info_panel.position = init_position + Vector2(0,500)

func _process(delta: float) -> void:
	
	if (FightSystem.active_state == FightSystem.STATE.SELECTION):
		if Input.is_action_just_pressed("ui_up") and iterator > 1 and iterator <= 3:
			iterator -= 1
		if Input.is_action_just_pressed("ui_down") and iterator >= 1 and iterator < 3:
			iterator += 1
			
		var player
		match FightSystem.current_entity:
			FightSystem.ENTITIES.P1:
				player = DataBase.Player1
			FightSystem.ENTITIES.P2:
				player = DataBase.Player2
			FightSystem.ENTITIES.P3:
				player = DataBase.Player3
				
		
		if Input.is_action_just_pressed("ui_accept") and current_UI == UI_menu and iterator == 1:
			attack_menu = attack_UI.instantiate()
			attack_menu.global_position = init_position
			add_child(attack_menu)
			current_UI = attack_menu
			UI_menu.queue_free()

		
		elif Input.is_action_just_pressed("ui_accept") and current_UI == UI_menu and iterator == 2:
			item_menu = item_UI.instantiate()
			item_menu.global_position = init_position
			add_child(item_menu)
			current_UI = item_menu
			UI_menu.queue_free()

		
		elif Input.is_action_just_pressed("ui_accept") and current_UI == attack_menu:
			match attack_menu.iterator:
				1:
					FightSystem.next_turn(player["attack1_damage"], player["attack1"])
				2:
					FightSystem.next_turn(player["attack2_damage"], player["attack2"])
				3:
					FightSystem.next_turn(player["attack3_damage"], player["attack3"])

			remove_curr_menu()

		
		elif Input.is_action_just_pressed("ui_accept") and current_UI == item_menu:
			match item_menu.iterator:
				1:
					FightSystem.next_turn(player["item1_damage"], player["item1"])
					player["item1"] = "Nothing"
					player["item1_desc"] = "Wow, so empty"
					player["item1_damage"] = "0"
				2:
					FightSystem.next_turn(player["item2_damage"], player["item2"])
					player["item2"] = "Nothing"
					player["item2_desc"] = "Wow, so empty"
					player["item2_damage"] = "0"
				3:
					FightSystem.next_turn(player["item3_damage"], player["item3"])
					player["item3"] = "Nothing"
					player["item3_desc"] = "Wow, so empty"
					player["item3_damage"] = "0"

			remove_curr_menu()
		
		
		
		if Input.is_action_just_pressed("ui_cancel") and current_UI != UI_menu:
			remove_curr_menu()
			
			
			
			
		match current_UI:
			UI_menu:
				if Input.is_action_pressed("ui_accept") and iterator == 3:
					desc_label.text = "Cannot run away"
				else:
					desc_label.text = "What will you do?"
					
			attack_menu:
				match attack_menu.iterator:
					1:
						desc_label.text = player["attack1_desc"]
					2:
						desc_label.text = player["attack2_desc"]
					3:
						desc_label.text = player["attack3_desc"]
			item_menu:
				match item_menu.iterator:
					1:
						desc_label.text = player["item1_desc"]
					2:
						desc_label.text = player["item2_desc"]
					3:
						desc_label.text = player["item3_desc"]
					
					

func remove_curr_menu():
	current_UI.queue_free()
	UI_menu = UI.instantiate()
	UI_menu.global_position = init_position
	add_child(UI_menu)
	iterator = 1
	current_UI = UI_menu

func hide_menu():
	var tween = get_tree().create_tween()
	tween.parallel().tween_property(self, "global_position:y", global_position.y + 500, 2)
	tween.parallel().tween_property(turns_info_panel, "global_position:y", init_position.y, 2)

func show_menu():
	var tween = get_tree().create_tween()
	tween.tween_property(self, "global_position:y", global_position.y - 500, 1)
	turns_info_panel.position = init_position + Vector2(0, 500)

func reset():
	current_UI = UI_menu
	iterator = 1
