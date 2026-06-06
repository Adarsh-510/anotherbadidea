extends Node2D

func _ready() -> void:
	DataBase.Player1["item1"] = "Sock"
	DataBase.Player1["item1_desc"] = "His Dad's smelly sock?\nDamage:40"
	DataBase.Player1["item1_damage"] = 40
	
	DataBase.Player2["item1"] = "Firecrackers"
	DataBase.Player2["item1_damage"] = "New year's eve came early\nDamage:30"
	DataBase.Player2["item1_damage"] = 30
	
	DataBase.Player2["item2"] = "Bio-enhancement Serum"
	DataBase.Player2["item2_damage"] = "Tastes Terrible\nDamage:25"
	DataBase.Player2["item2_damage"] = 25
	
	DataBase.Player3["item1"] = "Frozen Hot Dog"
	DataBase.Player3["item1_damage"] = "Harder than expected\nDamage:30"
	DataBase.Player3["item1_damage"] = 30
	



func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Junkyard/junkyard.tscn")
