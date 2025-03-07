extends Node
## TEST SCRIPT FOR THE VORPAL MIDDLEWARE
## Please refer to page 85 of the thesis for explanation on the Engine class methods

var vorpal_module: VORPALModule
var status


func _ready() -> void:
	vorpal_module = VORPALModule.new()
	if vorpal_module != null:
		print_rich("[color=green]SUCCESS!!!!")
	else:
		print_rich("[color=red]naoooooo")
	status = vorpal_module.start("patches")
	print("THE STATUS IS: ", status)
	

func _exit_tree() -> void:
	vorpal_module.finish()

func is_ok():
	return status == true
	
func tick(delta):
	vorpal_module.tick(delta)
	

func event_instance(path):
	return vorpal_module.event_instance(path)


func free_event(id):
	vorpal_module.free_event(id)
	

func clear():
	vorpal_module.clear()

func push_command(id, cmd):
	vorpal_module.push_command(id, cmd)

func push_command_1f(id, cmd, arg):
	vorpal_module.push_command_1f(id, cmd, arg)

func set_event_position(id, pos):
	vorpal_module.set_event_position(id, pos.x, pos.y, pos.z)
