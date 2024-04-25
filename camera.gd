extends Camera3D

var _yaw = 0
var _pitch = 0
var _distance = 0


func _ready():
	_yaw = rotation.y
	_pitch = rotation.x
	_distance = position.length()


func _input(event):
	if event is InputEventMouseMotion:
		if (event.button_mask & MOUSE_BUTTON_MASK_MIDDLE) != 0:
			if Input.is_key_pressed(KEY_SHIFT):
				var right = global_transform.basis.x
				var up = global_transform.basis.y
				var units_per_pixel = 0.01
				position += -right * units_per_pixel * event.relative.x \
					+ up * units_per_pixel * event.relative.y
			else:
				var pivot = position - global_transform.basis.z * _distance
				var radians_per_pixel = 0.01
				_yaw += -event.relative.x * radians_per_pixel
				_pitch += -event.relative.y * radians_per_pixel
				rotation = Vector3(_pitch, _yaw, 0)
				position = pivot + global_transform.basis.z * _distance


func _process(delta):
	var motor = Vector3()
	var forward = -global_transform.basis.z
	var right = global_transform.basis.x
	var up = Vector3(0,1,0)
	if Input.is_key_pressed(KEY_W):
		motor += forward
	if Input.is_key_pressed(KEY_S):
		motor -= forward
	if Input.is_key_pressed(KEY_A):
		motor -= right
	if Input.is_key_pressed(KEY_D):
		motor += right
	var speed = 2.0 * delta
	position += motor * speed

