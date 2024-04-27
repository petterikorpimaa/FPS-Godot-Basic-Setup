extends PanelContainer

@onready var property_container = %VBoxContainer

var frames_per_second : String

# Called when the node enters the scene tree for the first time.
func _ready():
	# Set global reference to self in Global Singleton
	Global.debug = self

	# Hide Debug Panel on load
	visible = false
	
	add_property("FPS", frames_per_second, 1)

func _process(delta):
	if visible:
		# Use delta time to get approx frames per second and round to two decimal places!
		# Disable VSync if fps is stuck at 60!
		frames_per_second = "%.2f" % (1.0 / delta) # Gets frames per second every frame
		add_property("FPS", frames_per_second, 1)

func _input(event):
	# Toggle debug panel
	if event.is_action_pressed("debug"):
		visible = !visible

func add_property(title: String, value, order):
	var target
	target = property_container.find_child(title, true, false) # Try to find Label node with the same name
	if !target: # If there is no current Label node for property (ie. initial load)
		target = Label.new() # Create a new label node
		property_container.add_child(target) # Add new node as child to VBox container
		target.name = title # Set name to the title
		target.text = target.name + ": " + str(value) # Set text value
	elif visible:
		target.text = title + ": " + str(value) # Update text value
		property_container.move_child(target, order) # Reorder property base on given order value
