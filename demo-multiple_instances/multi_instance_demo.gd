extends Node
## Multi-Instance VORPAL Demo
## Demonstrates creating and managing multiple isolated Pure Data instances

var vorpal_module: VORPALModule
var music_instance_id: int = -1
var sfx_instance_id: int = -1
var music_event_id: int = -1
var sfx_event_id: int = -1


func _ready() -> void:
	print("=== VORPAL Multi-Instance Demo ===")
	
	# Initialize VORPAL module
	vorpal_module = VORPALModule.new()
	if vorpal_module == null:
		print("[ERROR] Failed to create VORPALModule")
		return
	
	# Start the engine with patch directory
	var status = vorpal_module.start("patches")
	if not status:
		print("[ERROR] Failed to start VORPAL engine")
		return
	
	print("[OK] VORPAL engine started")
	
	# Test 1: Create multiple instances
	print("\n--- Test 1: Creating instances ---")
	music_instance_id = vorpal_module.create_instance()
	sfx_instance_id = vorpal_module.create_instance()
	
	print("[OK] Music instance ID: ", music_instance_id)
	print("[OK] SFX instance ID: ", sfx_instance_id)
	
	# Test 2: Create events bound to specific instances
	print("\n--- Test 2: Creating events ---")
	
	# Event on music instance (using instance_id parameter)
	music_event_id = vorpal_module.event_instance("undertale-main", music_instance_id)
	if music_event_id >= 0:
		print("[OK] Music event created: ID ", music_event_id, " on instance ", music_instance_id)
	else:
		print("[ERROR] Failed to create music event")
	
	# Event on SFX instance (using instance_id parameter)
	sfx_event_id = vorpal_module.event_instance("step-sfx", sfx_instance_id)
	if sfx_event_id >= 0:
		print("[OK] SFX event created: ID ", sfx_event_id, " on instance ", sfx_instance_id)
	else:
		print("[ERROR] Failed to create SFX event")
	
	# Test 3: Backward compatibility - event without instance_id (uses default 0)
	print("\n--- Test 3: Backward compatibility ---")
	var default_event_id = vorpal_module.event_instance("main")
	if default_event_id >= 0:
		print("[OK] Default event created: ID ", default_event_id, " on default instance 0")
	else:
		print("[INFO] Default event creation failed (expected if 'main.pd' does not exist)")
	
	# Start events
	print("\n--- Test 4: Starting events ---")
	if music_event_id >= 0:
		vorpal_module.push_command(music_event_id, "start")
		print("[OK] Music event started")
	
	if sfx_event_id >= 0:
		vorpal_module.push_command(sfx_event_id, "start")
		print("[OK] SFX event started")
	
	print("\n=== Demo initialized successfully ===")
	print("Audio should be playing from multiple instances")


func _process(delta: float) -> void:
	# MUST call tick every frame to process audio
	if vorpal_module != null:
		vorpal_module.tick(delta)


func _exit_tree() -> void:
	print("\n=== Cleaning up ===")
	
	# Destroy instances
	if music_instance_id >= 0:
		vorpal_module.destroy_instance(music_instance_id)
		print("[OK] Music instance destroyed")
	
	if sfx_instance_id >= 0:
		vorpal_module.destroy_instance(sfx_instance_id)
		print("[OK] SFX instance destroyed")
	
	# Finish engine
	if vorpal_module != null:
		vorpal_module.finish()
		print("[OK] VORPAL engine finished")
