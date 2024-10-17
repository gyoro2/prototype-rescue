extends Area2D

func _ready():
	position.y = -100
	move_y()

func move_y():
	position.y += 5

func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		get_parent().increase_sun(25)
		queue_free()
