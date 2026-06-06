extends Node

var enemy_died = false
var player_died = false

@onready var turns: Label = $"../Visuals/turns_info_panel"
var iterator = 0
var typing_duration = 2.5
var sleep_duration = 1.55
var death_duration = 2

@onready var Interface = get_tree().get_first_node_in_group("Interface")

var enemy_damage_offset = Vector2(60,100)

@onready var bully_leader_marker: Marker2D = $"../Visuals/enemy/BullyLeader_Marker"
@onready var bully_1_marker: Marker2D = $"../Visuals/enemy/Bully1_Marker"
@onready var bully_2_marker: Marker2D = $"../Visuals/enemy/Bully2_Marker"
@onready var bully_3_marker: Marker2D = $"../Visuals/enemy/Bully3_Marker"

@onready var bully_leader_sprite: Sprite2D = $"../Visuals/enemy/BullyLeader"
@onready var bully_1_sprite: Sprite2D = $"../Visuals/enemy/Bully1"
@onready var bully_2_sprite: Sprite2D = $"../Visuals/enemy/Bully2"
@onready var bully_3_sprite: Sprite2D = $"../Visuals/enemy/Bully3"

@onready var p1_damage_animation: AnimatedSprite2D = $"../Visuals/player1/damage_animation"
@onready var p2_damage_animation: AnimatedSprite2D = $"../Visuals/player2/damage_animation"
@onready var p3_damage_animation: AnimatedSprite2D = $"../Visuals/player3/damage_animation"
@onready var e_damage_animation: AnimatedSprite2D = $"../Visuals/enemy/damage_animation"
@onready var trans_in_animation: AnimationPlayer = $"../InterFace/Trans_in_animation"


func _ready() -> void:
	add_to_group("TurnsHandler")
	set_enemy_damage_pos()

func _process(delta: float) -> void:
	
	if DataBase.curr_enemy["hp"] <= 0:
		enemy_died = true
		clear()
		DataBase.curr_enemy["hp"] = 100
		Interface.reset()
		death_animation()
		await get_tree().create_timer(death_duration).timeout
		get_tree().change_scene_to_file("res://Misc/testing.tscn") #change to junkyard
		
		
	if DataBase.Player1["hp"] <= 0 or DataBase.Player2["hp"] <= 0 or DataBase.Player3["hp"] <= 0:
		player_died = true
		clear()
		Interface.reset()
		await get_tree().create_timer(death_duration).timeout
		get_tree().change_scene_to_file("res://Misc/testing.tscn") #change to game over 
		


func enemy_turn():
	iterator = 0
	if randf() > 0.3:
		FightSystem.actions_array.append(DataBase.curr_enemy["attack1"])
		FightSystem.damage_array.append(DataBase.curr_enemy["attack1_damage"])
	else:
		FightSystem.actions_array.append(DataBase.curr_enemy["attack2"])
		FightSystem.damage_array.append(DataBase.curr_enemy["attack2_damage"])
	
	show_turns()

func show_turns():
	
	await get_tree().create_timer(sleep_duration).timeout
	if enemy_died or player_died:
		return
	
	var p1_tween = create_tween()
	turns.text = str(DataBase.Player1["name"]) + " used " + str(FightSystem.actions_array[iterator])
	turns.visible_ratio = 0
	p1_tween.tween_property(turns, "visible_ratio",  1.0, typing_duration)
	await p1_tween.finished
	
	DataBase.curr_enemy["hp"] -= FightSystem.damage_array[iterator]
	visual_feedback(0)
	
	await get_tree().create_timer(sleep_duration).timeout
	if enemy_died or player_died:
		return
	
	var p1_damage_tween = create_tween()
	turns.text = str(DataBase.Player1["name"]) + " dealt " + str(FightSystem.damage_array[iterator]) + " damage "
	turns.visible_ratio = 0
	p1_damage_tween.tween_property(turns, "visible_ratio",  1.0, typing_duration)
	await p1_damage_tween.finished
	
	iterator += 1
	
	await get_tree().create_timer(sleep_duration).timeout
	if enemy_died or player_died:
		return
	
	var p2_tween = create_tween()
	turns.text = str(DataBase.Player2["name"]) + " used " + str(FightSystem.actions_array[iterator])
	turns.visible_ratio = 0
	p2_tween.tween_property(turns, "visible_ratio",  1.0, typing_duration)
	await p2_tween.finished
	
	DataBase.curr_enemy["hp"] -= FightSystem.damage_array[iterator] 
	visual_feedback(0)
	
	await get_tree().create_timer(sleep_duration).timeout
	if enemy_died or player_died:
		return
	
	var p2_damage_tween = create_tween()
	turns.text = str(DataBase.Player2["name"]) + " dealt " + str(FightSystem.damage_array[iterator]) + " damage "
	turns.visible_ratio = 0
	p2_damage_tween.tween_property(turns, "visible_ratio",  1.0, typing_duration)
	await p2_damage_tween.finished
	
	iterator += 1
	
	await get_tree().create_timer(sleep_duration).timeout
	if enemy_died or player_died:
		return
	
	var p3_tween = create_tween()
	turns.text = str(DataBase.Player3["name"]) + " used " + str(FightSystem.actions_array[iterator])
	turns.visible_ratio = 0
	p3_tween.tween_property(turns, "visible_ratio",  1.0, typing_duration)
	await p3_tween.finished
	
	DataBase.curr_enemy["hp"] -= FightSystem.damage_array[iterator] 
	visual_feedback(0)
	
	await get_tree().create_timer(sleep_duration).timeout
	if enemy_died or player_died:
		return
	
	var p3_damage_tween = create_tween()
	turns.text = str(DataBase.Player3["name"]) + " dealt " + str(FightSystem.damage_array[iterator]) + " damage "
	turns.visible_ratio = 0
	p3_damage_tween.tween_property(turns, "visible_ratio",  1.0, typing_duration)
	await p3_damage_tween.finished
	
	iterator += 1
	
	await get_tree().create_timer(sleep_duration).timeout
	if enemy_died or player_died:
		return
	
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
			visual_feedback(1)
			
			await e_p_tween.finished
			
			var e_p_damage_tween = create_tween()
			turns.text = "Bully dealt " + str(FightSystem.damage_array[iterator]) + " damage "
			turns.visible_ratio = 0
			e_p_damage_tween.tween_property(turns, "visible_ratio",  1.0, typing_duration)
			await e_p_damage_tween.finished
			
			
		2:
			var e_p_tween = create_tween()
			turns.text = "Bully used " + str(FightSystem.actions_array[iterator]) + " on " + str(DataBase.Player2["name"])
			turns.visible_ratio = 0
			e_p_tween.tween_property(turns, "visible_ratio",  1.0, typing_duration * 2.0)
			
			DataBase.Player2["hp"] -= FightSystem.damage_array[iterator]
			visual_feedback(2)
			
			await e_p_tween.finished
			
			var e_p_damage_tween = create_tween()
			turns.text = "Bully dealt " + str(FightSystem.damage_array[iterator]) + " damage "
			turns.visible_ratio = 0
			e_p_damage_tween.tween_property(turns, "visible_ratio",  1.0, typing_duration)
			await e_p_damage_tween.finished
			
			
		3:
			var e_p_tween = create_tween()
			turns.text = "Bully used " + str(FightSystem.actions_array[iterator]) + " on " + str(DataBase.Player3["name"])
			turns.visible_ratio = 0
			e_p_tween.tween_property(turns, "visible_ratio",  1.0, typing_duration * 2.0)
			
			DataBase.Player3["hp"] -= FightSystem.damage_array[iterator]
			visual_feedback(3)
			
			await e_p_tween.finished
			
			var e_p_damage_tween = create_tween()
			turns.text = "Bully dealt " + str(FightSystem.damage_array[iterator]) + " damage "
			turns.visible_ratio = 0
			e_p_damage_tween.tween_property(turns, "visible_ratio",  1.0, typing_duration)
			await e_p_damage_tween.finished
	
	iterator += 1
	
	clear()
	

func visual_feedback(target):
	match target:
		0:
			e_damage_animation.play("explosion")
		1:
			p1_damage_animation.play("explosion")
		2:
			p2_damage_animation.play("explosion")
		3:
			p3_damage_animation.play("explosion")

func clear():
	turns.text = " "
	FightSystem.active_state = FightSystem.STATE.SELECTION
	Interface.show_menu()
	
	FightSystem.actions_array.clear()
	FightSystem.damage_array.clear()
	

func set_enemy_damage_pos():
	match DataBase.curr_enemy:
		DataBase.BullyLeader:
			e_damage_animation.position = bully_leader_marker.position + enemy_damage_offset
		DataBase.Bully1:
			e_damage_animation.position = bully_1_marker.position + enemy_damage_offset
		DataBase.Bully2:
			e_damage_animation.position = bully_2_marker.position + enemy_damage_offset
		DataBase.Bully3:
			e_damage_animation.position = bully_3_marker.position + enemy_damage_offset

func death_animation():
	match DataBase.curr_enemy:
		DataBase.BullyLeader:
			bully_leader_sprite.modulate = Color(0.3,0.3,0.3,1)
		DataBase.Bully1:
			bully_1_sprite.modulate = Color(0.3,0.3,0.3,1)
		DataBase.Bully2:
			bully_2_sprite.modulate = Color(0.3,0.3,0.3,1)
		DataBase.Bully3:
			bully_3_sprite.modulate = Color(0.3,0.3,0.3,1)
			
	trans_in_animation.play("Trans_in", 0.0, -1.0, true)
