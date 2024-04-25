extends Node3D


@onready var _animation_player = $animated_cube/AnimationPlayer


func _ready():
	var anim = _animation_player.get_animation("ArmatureAction")
	anim.loop_mode = Animation.LOOP_LINEAR
	_animation_player.play("ArmatureAction")
