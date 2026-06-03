extends Node

@onready var turns: Label = $"../Visuals/turns_info_panel"
var iterator = 0
var typing_duration = 2.5
var sleep_duration = 1.5

@onready var Interface = get_tree().get_first_node_in_group("Interface")

func _ready() -> void:
	add_to_group("TurnsHandler")


func _process(delta: float) -> void:
	
	if DataBase.curr_enemy["hp"] <= 0:
		clear_arrays()
		DataBase.curr_enemy["hp"] = 100
		Interface.reset()
		FightSystem.active_state = FightSystem.STATE.SELECTION
		get_tree().change_scene_to_file("res://Misc/testing.tscn")
	if DataBase.Player1["hp"] <= 0 or DataBase.Player2["hp"] <= 0 or DataBase.Player3["hp"] <= 0:
		clear_arrays()
		Interface.reset()
		FightSystem.active_state = FightSystem.STATE.SELECTION
		get_tree().change_scene_to_file("res://Misc/testing.tscn")


func enemy_turn():
	iterator = 0
	if randf_range(0,1) > 0.5:
		FightSystem.actions_array.append(DataBase.curr_enemy["attack1"])
		FightSystem.damage_array.append(DataBase.curr_enemy["attack1_damage"])
		FightSystem.accuracy_array.append(DataBase.curr_enemy["attack1_miss_chance"])
	else:
		FightSystem.actions_array.append(DataBase.curr_enemy["attack2"])
		FightSystem.damage_array.append(DataBase.curr_enemy["attack2_damage"])
		FightSystem.accuracy_array.append(DataBase.curr_enemy["attack2_miss_chance"])
	
	show_turns()

func show_turns():
	
	await get_tree().create_timer(sleep_duration).timeout
	
	var p1_tween = create_tween()
	turns.text = str(DataBase.Player1["name"]) + " used " + str(FightSystem.actions_array[iterator])
	turns.visible_ratio = 0
	p1_tween.tween_property(turns, "visible_ratio",  1.0, typing_duration)
	await p1_tween.finished
	
	DataBase.curr_enemy["hp"] -= FightSystem.damage_array[iterator] 
	
	await get_tree().create_timer(sleep_duration).timeout
	
	var p1_damage_tween = create_tween()
	if randf_range(0, 1) > FightSystem.accuracy_array[iterator]/100:
		turns.text = str(DataBase.Player1["name"]) + " dealt " + str(FightSystem.damage_array[iterator]) + " damage "
	else:
		turns.text = str(DataBase.Player1["name"]) + "'s attack missed"
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
	
	DataBase.curr_enemy["hp"] -= FightSystem.damage_array[iterator] 
	
	await get_tree().create_timer(sleep_duration).timeout
	
	var p2_damage_tween = create_tween()
	if randf_range(0, 1) > FightSystem.accuracy_array[iterator]/100:
		turns.text = str(DataBase.Player2["name"]) + " dealt " + str(FightSystem.damage_array[iterator]) + " damage "
	else:
		turns.text = str(DataBase.Player2["name"]) + "'s attack missed"
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
	
	DataBase.curr_enemy["hp"] -= FightSystem.damage_array[iterator] 
	
	await get_tree().create_timer(sleep_duration).timeout
	
	var p3_damage_tween = create_tween()
	if randf_range(0, 1) > FightSystem.accuracy_array[iterator]/100:
		turns.text = str(DataBase.Player3["name"]) + " dealt " + str(FightSystem.damage_array[iterator]) + " damage "
	else:
		turns.text = str(DataBase.Player3["name"]) + "'s attack missed"
	turns.visible_ratio = 0
	p3_damage_tween.tween_property(turns, "visible_ratio",  1.0, typing_duration)
	await p3_damage_tween.finished
	
	iterator += 1
	
	await get_tree().create_timer(sleep_duration).timeout
	
	var target
	var roll = randf()
	if roll < 0.3333:
		target = 1
	elif roll < 0.6666:
		target = 2
	else:
		target = 3
		
	match target:
		1:
			var e_p_tween = create_tween()
			turns.text = "Bully used " + str(FightSystem.actions_array[iterator]) + " on " + str(DataBase.Player1["name"])
			turns.visible_ratio = 0
			e_p_tween.tween_property(turns, "visible_ratio",  1.0, typing_duration * 2.0)
			
			DataBase.Player1["hp"] -= FightSystem.damage_array[iterator]
			
			await e_p_tween.finished
			
			var e_p_damage_tween = create_tween()
			if randf_range(0, 1) > FightSystem.accuracy_array[iterator]/100:
				turns.text = "Bully dealt " + str(FightSystem.damage_array[iterator]) + " damage "
			else:
				turns.text = "Bully's attack missed"
			turns.visible_ratio = 0
			e_p_damage_tween.tween_property(turns, "visible_ratio",  1.0, typing_duration)
			await e_p_damage_tween.finished
			
			
		2:
			var e_p_tween = create_tween()
			turns.text = "Bully used " + str(FightSystem.actions_array[iterator]) + " on " + str(DataBase.Player2["name"])
			turns.visible_ratio = 0
			e_p_tween.tween_property(turns, "visible_ratio",  1.0, typing_duration * 2.0)
			
			DataBase.Player2["hp"] -= FightSystem.damage_array[iterator]
			
			await e_p_tween.finished
			
			var e_p_damage_tween = create_tween()
			if randf_range(0, 1) > FightSystem.accuracy_array[iterator]/100:
				turns.text = "Bully dealt " + str(FightSystem.damage_array[iterator]) + " damage "
			else:
				turns.text = "Bully's attack missed"
			turns.visible_ratio = 0
			e_p_damage_tween.tween_property(turns, "visible_ratio",  1.0, typing_duration)
			await e_p_damage_tween.finished
			
			
		3:
			var e_p_tween = create_tween()
			turns.text = "Bully used " + str(FightSystem.actions_array[iterator]) + " on " + str(DataBase.Player3["name"])
			turns.visible_ratio = 0
			e_p_tween.tween_property(turns, "visible_ratio",  1.0, typing_duration * 2.0)
			
			DataBase.Player3["hp"] -= FightSystem.damage_array[iterator]
			
			await e_p_tween.finished
			
			var e_p_damage_tween = create_tween()
			if randf_range(0, 1) > FightSystem.accuracy_array[iterator]/100:
				turns.text = "Bully dealt " + str(FightSystem.damage_array[iterator]) + " damage "
			else:
				turns.text = "Bully's attack missed"
			turns.visible_ratio = 0
			e_p_damage_tween.tween_property(turns, "visible_ratio",  1.0, typing_duration)
			await e_p_damage_tween.finished
	
	iterator += 1
	
	turns.text = " "
	FightSystem.active_state = FightSystem.STATE.SELECTION
	Interface.show_menu()
	clear_arrays()
	

func visual_feedback():
	pass
	#activated after every "player used that" frame
	#pass 2 arguements, entity attacked and attack names, also store the position of all player panels and enemy

func clear_arrays():
	FightSystem.actions_array.clear()
	FightSystem.damage_array.clear()
	FightSystem.accuracy_array.clear()
