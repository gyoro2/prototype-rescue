extends Button

var plant_scene = preload("res://serangan.tscn")

func _on_pressed():
	if !has_node("tanaman"):
		var plant = plant_scene.instantiate()
		add_child(plant)
		plant.position = self.position
