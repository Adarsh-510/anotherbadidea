extends Node

#in description add the damage it deals

enum ENEMIES {
	NONE,
	BULLY_1,
	BULLY_2,
	BULLY_3,
	BULLY_4,
	BULLY_LEADER
}

enum CHECKPOINTS {
	INTRO,
	SISTER_STEALTH,
	JUNKYARD_ENTRANCE,
	JUNKYARD_INSIDE,
	GOD_SUMMONING,
	ENDING
}

var curr_checkpoint = CHECKPOINTS.INTRO
var curr_enemy = ENEMIES.BULLY_1

var Player1 = {
	"name": "Player 1",
	"max_hp": 100,
	"hp": 100,

	"attack": 15,
	"defense": 8,

	"attack1": "Player 1's Attack 1",
	"attack1_desc": "This is Player 1's Attack 1",
	"attack1_damage": 10,

	"attack2": "Player 1's Attack 2",
	"attack2_desc": "This is Player 1's Attack 2",
	"attack2_damage": 15,

	"attack3": "Player 1's Attack 3",
	"attack3_desc": "This is Player 1's Attack 3",
	"attack3_damage": 20,

	"item1": "Player 1's Item 1",
	"item1_desc": "This is Player 1's Item 1",
	"item1_damage": 10,

	"item2": "Player 1's Item 2",
	"item2_desc": "This is Player 1's Item 2",
	"item2_damage": 20,

	"item3": "Player 1's Item 3",
	"item3_desc": "This is Player 1's Item 3",
	"item3_damage": 30
}

var Player2 = {
	"name": "Player 2",
	"max_hp": 100,
	"hp": 100,

	"attack": 12,
	"defense": 10,

	"attack1": "Player 2's Attack 1",
	"attack1_desc": "This is Player 2's Attack 1",
	"attack1_damage": 12,

	"attack2": "Player 2's Attack 2",
	"attack2_desc": "This is Player 2's Attack 2",
	"attack2_damage": 18,

	"attack3": "Player 2's Attack 3",
	"attack3_desc": "This is Player 2's Attack 3",
	"attack3_damage": 25,

	"item1": "Player 2's Item 1",
	"item1_desc": "This is Player 2's Item 1",
	"item1_damage": 10,

	"item2": "Player 2's Item 2",
	"item2_desc": "This is Player 2's Item 2",
	"item2_damage": 20,

	"item3": "Player 2's Item 3",
	"item3_desc": "This is Player 2's Item 3",
	"item3_damage": 30
}

var Player3 = {
	"name": "Player 3",
	"max_hp": 100,
	"hp": 100,

	"attack": 18,
	"defense": 5,

	"attack1": "Player 3's Attack 1",
	"attack1_desc": "This is Player 3's Attack 1",
	"attack1_damage": 15,

	"attack2": "Player 3's Attack 2",
	"attack2_desc": "This is Player 3's Attack 2",
	"attack2_damage": 20,

	"attack3": "Player 3's Attack 3",
	"attack3_desc": "This is Player 3's Attack 3",
	"attack3_damage": 30,

	"item1": "Player 3's Item 1",
	"item1_desc": "This is Player 3's Item 1",
	"item1_damage": 10,

	"item2": "Player 3's Item 2",
	"item2_desc": "This is Player 3's Item 2",
	"item2_damage": 20,

	"item3": "Player 3's Item 3",
	"item3_desc": "This is Player 3's Item 3",
	"item3_damage": 30
}

var Bully1 = {
	"name": "Bully 1",

	"max_hp": 100,
	"hp": 100,

	"attack": 10,
	"defense": 5,

	"attack1": "Punch",
	"attack1_desc": "Deals 10 damage.",
	"attack1_damage": 10,

	"attack2": "Kick",
	"attack2_desc": "Deals 15 damage.",
	"attack2_damage": 15
}

var Bully2 = {
	"name": "Bully 2",

	"max_hp": 100,
	"hp": 100,

	"attack": 12,
	"defense": 6,

	"attack1": "Punch",
	"attack1_desc": "Deals 12 damage.",
	"attack1_damage": 12,

	"attack2": "Headbutt",
	"attack2_desc": "Deals 18 damage.",
	"attack2_damage": 18
}

var Bully3 = {
	"name": "Bully 3",

	"max_hp": 100,
	"hp": 100,

	"attack": 15,
	"defense": 8,

	"attack1": "Heavy Punch",
	"attack1_desc": "Deals 15 damage.",
	"attack1_damage": 15,

	"attack2": "Flying Kick",
	"attack2_desc": "Deals 20 damage.",
	"attack2_damage": 20
}

var Bully4 = {
	"name": "Bully 4",

	"max_hp": 100,
	"hp": 100,

	"attack": 18,
	"defense": 10,

	"attack1": "Combo Punch",
	"attack1_desc": "Deals 18 damage.",
	"attack1_damage": 18,

	"attack2": "Trash Can Slam",
	"attack2_desc": "Deals 24 damage.",
	"attack2_damage": 24
}

var BullyLeader = {
	"name": "Junkyard King",

	"max_hp": 100,
	"hp": 100,

	"attack": 25,
	"defense": 15,

	"attack1": "Royal Beatdown",
	"attack1_desc": "Deals 25 damage.",
	"attack1_damage": 25,

	"attack2": "Ice Cream Theft",
	"attack2_desc": "Deals 35 damage.",
	"attack2_damage": 35
}
