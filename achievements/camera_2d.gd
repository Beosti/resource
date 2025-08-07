extends Camera2D  

var _target_zoom: float = 1.0;
const MIN_ZOOM: float = 0.1;
const MAX_ZOOM: float = 1.0;
const ZOOM_INCREMENT: float = 0.1;
const ZOOM_RATE: float = 8.0;

var isPressed := false;

## TODO ADD ZOOM

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion and isPressed:
		global_position += ((event.relative * 0.1) / 1) * -1;
	
	if event is InputEventMouseButton:
		isPressed = event.pressed;
