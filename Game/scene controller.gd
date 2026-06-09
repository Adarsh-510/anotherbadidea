extends Node

var frozen_scenes: Dictionary = {}

@onready var current_active_scene = $Node2D

func swap_scene(target_scene_path: String, delete_current: bool, keep_current_running: bool) -> void:
	var old_scene = current_active_scene
	if delete_current:
		old_scene.queue_free()
	else:
		var old_scene_key = old_scene.scene_file_path
		frozen_scenes[old_scene_key] = old_scene
		
		remove_child(old_scene)
		
		if not keep_current_running:
			old_scene.process_mode = PROCESS_MODE_DISABLED
	
	var new_scene: Node = null
	
	if frozen_scenes.has(target_scene_path):
		new_scene = frozen_scenes[target_scene_path]
		frozen_scenes.erase(target_scene_path)
		new_scene.process_mode = PROCESS_MODE_INHERIT
	else:
		var scene_class = load(target_scene_path)
		new_scene = scene_class.instantiate()
	
	add_child(new_scene)
	current_active_scene = new_scene
