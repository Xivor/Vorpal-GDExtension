extends Node2D

var undertale_main

func _ready() -> void:
	play_undertale_main.call_deferred()
	
	
func _process(delta: float) -> void:
	Vorpal.tick(delta)


# TODO: add buttons to block and unblock playback, just to test them
func play_undertale_main() -> void:
	undertale_main = Vorpal.event_instance("undertale-main")
	Vorpal.push_command(undertale_main, "start")
	print("all right")


func test():
	if Vorpal.is_ok():
		print("1")
		var speech = Vorpal.event_instance("speech")
		print("2")
		Vorpal.push_command(speech, "intro")
		print("3")
	else:
		print("not ok, status = ", Vorpal.status)


func _on_block_pressed() -> void:
	Vorpal.push_command(undertale_main, "block")

func _on_unblock_pressed() -> void:
	Vorpal.push_command(undertale_main, "unblock")
	
