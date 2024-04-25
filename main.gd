extends Node

@onready var _button = $HBoxContainer/Button
@onready var _label = $HBoxContainer/Label
@onready var _test_root = $Test

var _far = true


func _ready():
	_update_state()


func _on_button_pressed():
	_far = not _far
	_update_state()


func _update_state():
	if _far:
		_button.text = "Go close to origin"
		_test_root.position = Vector3(1000000, 1000000, 1000000)
		_label.text = str(_test_root.position)
	else:
		_button.text = "Go far from origin"
		_test_root.position = Vector3(0, 0, 0)
		_label.text = str(_test_root.position)
