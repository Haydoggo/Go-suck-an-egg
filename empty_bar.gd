extends ColorRect


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var total_sucked = 0
	for amount_of_food in Global.suckitude.values():
		total_sucked += amount_of_food
	if total_sucked > 0:
		hide()

		
