extends Sprite


# Declare member variables
var nozzle_speed = 200
var discrete_suck_speed = 100
var continuous_suck_speed = 50
var consume_speed = 500


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	

func suckle_from_the_continuous_teat(food, speed, delta):
	var amount_smaller = (speed*delta)/100
	food.scale = food.scale.move_toward(Vector2(0, 0), amount_smaller)
	Global.suckitude[food.type] += amount_smaller
	food.size -= amount_smaller
	if food.size <= 0:
		print("trying to destroy continuous food")
		food.queue_free()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position = position.move_toward(get_global_mouse_position(), nozzle_speed*delta)
	
	for area in get_node("Suck").get_overlapping_areas():
		var food : Node2D = area.owner
		if food.is_in_group("discrete"):
			food.position = food.position.move_toward(position, discrete_suck_speed*delta)
		else:
			suckle_from_the_continuous_teat(food, continuous_suck_speed, delta)
	
	for area in get_node("Consume").get_overlapping_areas():
		var food : Node2D = area.owner
		if food.is_in_group("discrete"):
			food.position = food.position.move_toward(position, consume_speed*delta)
			if food.position == position:
				food.queue_free()
				Global.suckitude[food.type] += 1
		else:
			suckle_from_the_continuous_teat(food, continuous_suck_speed, delta)
			
		
