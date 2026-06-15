extends Node

#game over screen
#save files
#delete enemy instance

enum CHECKPOINTS {
	INTRO,
	SISTER_STEALTH,
	JUNKYARD_ENTRANCE,
	JUNKYARD_INSIDE,
	GOD_SUMMONING,
	ENDING
}

var curr_checkpoint = CHECKPOINTS.INTRO
var curr_enemy = Bully1


var Player1 = {
	"name": "Andy",
	"max_hp": 100,
	"hp": 100,

	"attack": 15,
	"defense": 8,

	"attack1": "Slingshot",
	"attack1_desc": "Shoots slingshot right into enemy's eye\nDamage:22\n25% chance to miss",
	"attack1_damage": 22,
	"attack1_miss_chance": 25,

	"attack2": "Knuckle Sandwich",
	"attack2_desc": "Served Fresh, straight to the face\nDamage:16\n15% chance to miss",
	"attack2_damage": 16,
	"attack2_miss_chance": 15,

	"attack3": "Nothing",
	"attack3_desc": "Does.....nothing?",
	"attack3_damage": 0,
	"attack3_miss_chance": 0,

	"item_miss_chance": 0,

	"item1": "Sock",
	"item1_desc": "His Dad's smelly sock?\nDamage:40",
	"item1_damage": 40,

	"item2": "Nothing",
	"item2_desc": "Wow, so empty",
	"item2_damage": 0,

	"item3": "Nothing",
	"item3_desc": "Wow, so empty",
	"item3_damage": 0
}

var Player2 = {
	"name": "Rudy",
	"max_hp": 100,
	"hp": 100,

	"attack": 10,
	"defense": 12,

	"attack1": "The Legendary Elbow",
	"attack1_desc": "Sharp elbow right to the ribs\nDamage:18\n20% chance to miss",
	"attack1_damage": 18,
	"attack1_miss_chance": 20,

	"attack2": "Nothing",
	"attack2_desc": "Does.....nothing?",
	"attack2_damage": 0,
	"attack2_miss_chance": 0,

	"attack3": "Nothing",
	"attack3_desc": "Does.....nothing?",
	"attack3_damage": 0,
	"attack3_miss_chance": 0,

	"item_miss_chance": 0,

	"item1": "Firecrackers",
	"item1_desc": "New year's eve came early\nDamage:30",
	"item1_damage": 30,

	"item2": "Bio-enhancement Serum",
	"item2_desc": "Tastes Terrible\nDamage:25",
	"item2_damage": 25,

	"item3": "Nothing",
	"item3_desc": "Wow, so empty",
	"item3_damage": 0
}

var Player3 = {
	"name": "Owen",
	"max_hp": 100,
	"hp": 100,

	"attack": 8,
	"defense": 8,

	"attack1": "Flying Tackle",
	"attack1_desc": "Sacrifices safety for extra momentum\nDamage:20\n15% chance to miss",
	"attack1_damage": 20,
	"attack1_miss_chance": 15,

	"attack2": "Dragon Warrior Kick",
	"attack2_desc": "Pretty cool kick, no dragons involved\nDamage:28\n35% chance to miss",
	"attack2_damage": 28,
	"attack2_miss_chance": 35,

	"attack3": "Nothing",
	"attack3_desc": "Does.....nothing?",
	"attack3_damage": 0,
	"attack3_miss_chance": 0,

	"item_miss_chance": 0,

	"item1": "Frozen Hot Dog",
	"item1_desc": "Harder than expected\nDamage:30",
	"item1_damage": 30,

	"item2": "Nothing",
	"item2_desc": "Wow, so empty",
	"item2_damage": 0,

	"item3": "Nothing",
	"item3_desc": "Wow, so empty",
	"item3_damage": 0
}

var Bully1 = {
	# change the name to an array, then instead of accessing the name like Database.Bully1["name"]
	# access it like Database.Bully1["name].pick_random()
	"name": "Bully 1",
	
	"max_hp": 100,
	"hp": 100,

	"attack": 10,
	"defense": 5,

	"attack1": "Mean Stare",
	"attack1_damage": 15,
	"attack1_miss_chance": 10,

	"attack2": "Scratch",
	"attack2_damage": 35,
	"attack2_miss_chance": 20
	
	# add another kay called "lines", before the battle starts access a random line and display it
}

var Bully2 = {
	"name": "Bully 2",

	"max_hp": 100,
	"hp": 100,

	"attack": 12,
	"defense": 6,

	"attack1": "Harsh Insults",
	"attack1_damage": 20,
	"attack1_miss_chance": 20,
	
	"attack2": "Cigarette Burns",
	"attack2_damage": 45,
	"attack2_miss_chance": 50
}

var Bully3 = {
	"name": "Bully 3",

	"max_hp": 100,
	"hp": 100,

	"attack": 15,
	"defense": 8,

	"attack1": "Flying Kick",
	"attack1_damage": 25,
	"attack1_miss_chance": 35,
	
	"attack2": "Heavy Punch",
	"attack2_damage": 45,
	"attack2_miss_chance": 20
}

var BullyLeader = {
	"name": "Junkyard King",

	"max_hp": 100,
	"hp": 100,

	"attack": 20,
	"defense": 12,

	"attack1": "Pipe Swing",
	"attack1_damage": 35,
	"attack1_miss_chance": 10,

	"attack2": "Royal Beatdown",
	"attack2_damage": 50,
	"attack2_miss_chance": 25
}

var CollectedItems = {
	"Spindal": false,
	"Lemonade": false, 
	"Pickle": false,
	"Flute": false,
	"Mask": false
}
