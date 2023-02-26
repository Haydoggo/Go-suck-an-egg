extends Sprite


# Declare member variables
var nozzle_speed = 200
var suck_speed = 100
var consume_speed = 500


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position = position.move_toward(get_global_mouse_position(), nozzle_speed*delta)
	for area in get_node("Suck").get_overlapping_areas():
		var food : Node2D = area.owner
		if food.is_in_group("discrete"):
			food.position = food.position.move_toward(position, suck_speed*delta)
		else:
			# make the size smaller at suck speed
			food.scale = food.scale.move_toward(Vector2(0, 0), (suck_speed*delta)/100)
	for area in get_node("Consume").get_overlapping_areas():
		var food = area.owner
		food.position = food.position.move_toward(position, consume_speed*delta)
		if food.position == position:
			food.queue_free()
