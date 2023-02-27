extends HBoxContainer


# Declare member variables here. Examples:
onready var ratio_bar_dict = {
	"egg": get_node("Egg"), 
	"flour": get_node("Flour"), 
	"cocoa": get_node("Cocoa"), 
	"sugar": get_node("Sugar"),
	"vanilla": get_node("Vanilla")
	}


func set_ratio_bar():
	# get the sum of all the ingredients
	var total_sucked = 0
	for amount_of_food in Global.suckitude.values():
		total_sucked += amount_of_food
	

	# make that number the stretch value or whatever it is of the bar
	if total_sucked == 0:
		pass
	else:
		# get the ratio of each ingredient
		var ratio_dict = {
			"egg": Global.suckitude["egg"] / total_sucked,
			"flour": Global.suckitude["flour"] / total_sucked,
			"cocoa": Global.suckitude["cocoa"] / total_sucked,
			"sugar": Global.suckitude["sugar"] / total_sucked,
			"vanilla": Global.suckitude["vanilla"] / total_sucked
			}
		for food in ratio_bar_dict.keys():
			ratio_bar_dict[food].size_flags_stretch_ratio = ratio_dict[food]
	
	
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	set_ratio_bar()
