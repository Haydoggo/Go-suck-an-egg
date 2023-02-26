extends Sprite


# Declare member variables
var nozzle_speed = 200
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position = position.move_toward(get_global_mouse_position(), nozzle_speed*delta)
	pass
