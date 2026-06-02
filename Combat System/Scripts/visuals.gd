extends Control

@onready var bully_leader: Sprite2D = $enemy/BullyLeader
@onready var bully_1: Sprite2D = $enemy/Bully1
@onready var bully_2: Sprite2D = $enemy/Bully2
@onready var bully_3: Sprite2D = $enemy/Bully3

@onready var bully_leader_marker: Marker2D = $enemy/BullyLeader_Marker
@onready var bully_1_marker: Marker2D = $enemy/Bully1_Marker
@onready var bully_2_marker: Marker2D = $enemy/Bully2_Marker
@onready var bully_3_marker: Marker2D = $enemy/Bully3_Marker

@onready var enemy_progress_bar: ProgressBar = $enemy/ProgressBar
@onready var p1_progress_bar: ProgressBar = $player1/ProgressBar
@onready var p2_progress_bar: ProgressBar = $player2/ProgressBar
@onready var p3_progress_bar: ProgressBar = $player3/ProgressBar

func _ready() -> void:
	enemy_progress_bar.value = 100
	DataBase.curr_enemy = DataBase.Bully1

func _process(delta: float) -> void:
	
	p1_progress_bar.value = DataBase.Player1["hp"]
	p2_progress_bar.value = DataBase.Player2["hp"]
	p3_progress_bar.value = DataBase.Player3["hp"]
	
	match DataBase.curr_enemy:
		DataBase.BullyLeader:
			bully_leader.modulate.a = 1
			bully_1.modulate.a = 0
			bully_2.modulate.a = 0
			bully_3.modulate.a = 0
			
			enemy_progress_bar.position = bully_leader_marker.position
			
		DataBase.Bully1:
			bully_leader.modulate.a = 0
			bully_1.modulate.a = 1
			bully_2.modulate.a = 0
			bully_3.modulate.a = 0
			
			enemy_progress_bar.position = bully_1_marker.position
			
		DataBase.Bully2:
			bully_leader.modulate.a = 0
			bully_1.modulate.a = 0
			bully_2.modulate.a = 1
			bully_3.modulate.a = 0
			
			enemy_progress_bar.position = bully_2_marker.position
			
		DataBase.Bully3:
			bully_leader.modulate.a = 0
			bully_1.modulate.a = 0
			bully_2.modulate.a = 0
			bully_3.modulate.a = 1
			
			enemy_progress_bar.position = bully_3_marker.position
