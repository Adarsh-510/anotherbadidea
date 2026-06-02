extends Node

@onready var turns: Label = $"../Visuals/turns_info_panel"
var iterator = 0
var typing_duration = 2.5
var sleep_duration = 1.5

@onready var Interface = get_tree().get_first_node_in_group("Interface")

func _ready() -> void:
	add_to_group("TurnsHandler")

func enemy_turn():
	
	if randf_range(0,1) > 0.5:
		FightSystem.actions_array.append(DataBase.curr_enemy["attack1"])
		FightSystem.damage_array.append(DataBase.curr_enemy["attack1_damage"])
	else:
		FightSystem.actions_array.append(DataBase.curr_enemy["attack2"])
		FightSystem.damage_array.append(DataBase.curr_enemy["attack2_damage"])
	
	show_turns()

func show_turns():
	
	await get_tree().create_timer(sleep_duration).timeout
	
	var p1_tween = create_tween()
	turns.text = str(DataBase.Player1["name"]) + " used " + str(FightSystem.actions_array[iterator])
	turns.visible_ratio = 0
	p1_tween.tween_property(turns, "visible_ratio",  1.0, typing_duration)
	await p1_tween.finished
	
	await get_tree().create_timer(sleep_duration).timeout
	
	var p1_damage_tween = create_tween()
	turns.text = str(DataBase.Player1["name"]) + " dealt " + str(FightSystem.damage_array[iterator]) + " damage "
	turns.visible_ratio = 0
	p1_damage_tween.tween_property(turns, "visible_ratio",  1.0, typing_duration)
	await p1_damage_tween.finished
	
	iterator += 1
	
	await get_tree().create_timer(sleep_duration).timeout
	
	var p2_tween = create_tween()
	turns.text = str(DataBase.Player2["name"]) + " used " + str(FightSystem.actions_array[iterator])
	turns.visible_ratio = 0
	p2_tween.tween_property(turns, "visible_ratio",  1.0, typing_duration)
	await p2_tween.finished
	
	await get_tree().create_timer(sleep_duration).timeout
	
	var p2_damage_tween = create_tween()
	turns.text = str(DataBase.Player2["name"]) + " dealt " + str(FightSystem.damage_array[iterator]) + " damage "
	turns.visible_ratio = 0
	p2_damage_tween.tween_property(turns, "visible_ratio",  1.0, typing_duration)
	await p2_damage_tween.finished
	
	iterator += 1
	
	await get_tree().create_timer(sleep_duration).timeout
	
	var p3_tween = create_tween()
	turns.text = str(DataBase.Player3["name"]) + " used " + str(FightSystem.actions_array[iterator])
	turns.visible_ratio = 0
	p3_tween.tween_property(turns, "visible_ratio",  1.0, typing_duration)
	await p3_tween.finished
	
	await get_tree().create_timer(sleep_duration).timeout
	
	var p3_damage_tween = create_tween()
	turns.text = str(DataBase.Player3["name"]) + " dealt " + str(FightSystem.damage_array[iterator]) + " damage "
	turns.visible_ratio = 0
	p3_damage_tween.tween_property(turns, "visible_ratio",  1.0, typing_duration)
	await p3_damage_tween.finished
	
	iterator += 1
	
	await get_tree().create_timer(sleep_duration).timeout
	
	FightSystem.active_state = FightSystem.STATE.SELECTION
	Interface.show_menu()
	

func visual_feedback():
	pass
	#activated after every "player used that" frame
	#pass 2 arguements, entity attacked and attack names, also store the position of all player panels and enemy
