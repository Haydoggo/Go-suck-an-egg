extends Node2D

onready var camera: Camera2D = $Camera2D

func _ready() -> void:
	if Global.score < 0.2:
		$Result/GoodCake.show()
	elif Global.score < 0.8:
		$Result/CakeIsh.show()
	else:
		$Result/BadCake.show()
	yield(get_tree().create_timer(1.0), "timeout")
	pan_to_target($Result/Position2D)

func pan_to_target(target : Position2D):
	var tween = create_tween().set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_CUBIC).set_parallel()
	tween.tween_property(camera, "global_position", target.global_position, 0.4)
	tween.tween_property(camera, "zoom", target.scale, 0.4)
	yield(tween, "finished")


func _on_LinkButton_pressed() -> void:
	get_tree().change_scene("res://Game.tscn")
