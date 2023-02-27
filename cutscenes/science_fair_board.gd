extends Node2D

onready var targets = $CameraTargets.get_children()
onready var camera = $Camera2D
var target_index = 0

var animating = false

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("tap") and not animating:
		if target_index == targets.size():
			get_tree().change_scene_to(preload("res://Game.tscn"))
		else:
			if not $Notes.visible:
				$Notes.show()
				create_tween().tween_property($Notes, "modulate", Color.white, 0.4)
			pan_to_target(targets[target_index % targets.size()])
			target_index += 1

func pan_to_target(target : Position2D):
	animating = true
	var tween = create_tween().set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_CUBIC).set_parallel()
	tween.tween_property(camera, "position", target.position, 0.4)
	tween.tween_property(camera, "zoom", target.scale, 0.4)
	yield(tween, "finished")
	animating = false

