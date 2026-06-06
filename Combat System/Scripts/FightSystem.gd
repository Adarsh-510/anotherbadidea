extends Node2D

enum ENTITIES {P1, P2, P3, E}
var entity_array = [ENTITIES.P1, ENTITIES.P2, ENTITIES.P3, ENTITIES.E]
var iterator = 0
var current_entity

enum STATE {SELECTION, ATTACK}
var active_state
var damage_array = []
var actions_array = []

func _ready() -> void:
	Engine.time_scale = 2.0
	active_state = STATE.SELECTION

func _process(_delta: float) -> void:
	current_entity = entity_array[iterator]

func next_turn(prev_turn_damage, prev_turn_name):
	damage_array.append(prev_turn_damage)
	actions_array.append(prev_turn_name)
	
	iterator += 1
	if iterator >= entity_array.size() -1:
		
		active_state = STATE.ATTACK
		iterator = 0 
		
		var Interface = get_tree().get_first_node_in_group("Interface")
		var TurnsHandler = get_tree().get_first_node_in_group("TurnsHandler")
		
		Interface.hide_menu()
		TurnsHandler.enemy_turn()    
