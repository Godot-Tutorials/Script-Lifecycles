extends Node


# Declare member variables here. Examples:
var counter1: int = 0
var counter2: int = 0
var counter3: int = 0

# 2. Called after enter tree
func _ready():
	print("_ready() is called")

# 1. the first virtual method to be called
func _enter_tree():
	print("_enter_tree() is called")

# 5. The last thing to be called besides exit tree
func _process(delta):
	if counter1 < 1:
		print("_process() is called")
		counter1 += 1
		# We are deleting this scene when our script is not "running/in use"
		call_deferred("removeScene")

# 4. Called before the _process virtual method
func _physics_process(delta):
	if counter2 < 1:
		print("_physics_process() is called")
		counter2 += 1

# 6. When its called, it will be the last method call
# When a scene/node exits the root viewport, lifecycle calls no longer work
func _exit_tree():
	print("_exit_tree() is called")

# 3. If input is recieved it will call this method
func _input(event):
	if counter3 < 1:
		print("_input() is called")
		counter3 += 1

# we are removing this scene from the root viewport
func removeScene():
	self.get_tree().get_root().remove_child(self)
