extends Node2D

enum ENTITIES {P1, P2, P3, E}
var entity_array = [ENTITIES.P1, ENTITIES.P2, ENTITIES.P3, ENTITIES.E]
var iterator = 0
var current_entity

enum STATE {SELECTION, ATTACK}
var active_state
var damage_array = []
var actions_array = []

@onready var Interface = get_tree().get_first_node_in_group("Interface")
@onready var TurnsHandler = get_tree().get_first_node_in_group("TurnsHandler")

func _ready() -> void:
	active_state = STATE.SELECTION

func _process(delta: float) -> void:
	current_entity = entity_array[iterator]

func next_turn(prev_turn_damage, prev_turn_name):
	damage_array.append(prev_turn_damage)
	actions_array.append(prev_turn_name)
	
	iterator += 1
	if iterator >= entity_array.size() -1:
		iterator = 0 
		active_state = STATE.ATTACK
		Interface.hide_menu()
		TurnsHandler.enemy_turn()
