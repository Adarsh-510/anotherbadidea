extends Node

@onready var element_1: Label = $"../element1"
@onready var element_2: Label = $"../element2"
@onready var element_3: Label = $"../element3"

func _ready() -> void:
	var player

	match FightSystem.current_entity:
		FightSystem.ENTITIES.P1:
			player = DataBase.Player1
		FightSystem.ENTITIES.P2:
			player = DataBase.Player2
		FightSystem.ENTITIES.P3:
			player = DataBase.Player3

	element_1.text = player["item1"]
	element_2.text = player["item2"]
	element_3.text = player["item3"]
