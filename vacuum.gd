extends Node2D


# Declare member variables here. Examples:
var scale_speed = 200

var max_fill = 11.6
var fullness = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var total_food = 0.0
	for amount_of_food in Global.suckitude.values():
		total_food += amount_of_food
	fullness = total_food / max_fill
	get_node("Batter").rect_scale = (Vector2(1, fullness))
	get_node("Label").text = "%.2f%%" % (fullness*100)
	if fullness >= 1.0:
		get_tree().change_scene_to(preload("res://cutscenes/End Screen.tscn"))
