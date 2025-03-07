extends Node2D


func _ready() -> void:
	test.call_deferred()
	

func test():
	if Vorpal.is_ok():
		print("1")
		var speech = Vorpal.event_instance("speech")
		print("2")
		Vorpal.push_command(speech, "tutorial")
		print("3")
	else:
		print("not ok, status = ", Vorpal.status)
