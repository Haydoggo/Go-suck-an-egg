extends Node2D


func _ready() -> void:
	Global.score = 0
	for food in Global.suckitude:
		Global.suckitude[food] = 0
