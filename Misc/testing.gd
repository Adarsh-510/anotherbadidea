extends Node2D

func _on_bl_pressed() -> void:
	DataBase.curr_enemy = DataBase.BullyLeader
	get_tree().change_scene_to_file("res://Combat System/Scenes/Main_Battle.tscn")

func _on_b_1_pressed() -> void:
	DataBase.curr_enemy = DataBase.Bully1
	get_tree().change_scene_to_file("res://Combat System/Scenes/Main_Battle.tscn")

func _on_b_2_pressed() -> void:
	DataBase.curr_enemy = DataBase.Bully2
	get_tree().change_scene_to_file("res://Combat System/Scenes/Main_Battle.tscn")

func _on_b_3_pressed() -> void:
	DataBase.curr_enemy = DataBase.Bully3
	get_tree().change_scene_to_file("res://Combat System/Scenes/Main_Battle.tscn")
