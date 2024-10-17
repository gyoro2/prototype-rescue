extends Node2D

var sun_points = 0
var zombie_scene = preload("res://hunter1.tscn")

func _ready():
	var zombie_timer = Timer.new()
	zombie_timer.wait_time = 5.0
	zombie_timer.timeout.connect(self._spawn_zombie)
	add_child(zombie_timer)
	zombie_timer.start()

func increase_sun(amount):
	sun_points += amount
	print("Sun points: ", sun_points)

func _spawn_zombie():
	var zombie = zombie_scene.instantiate()
	add_child(zombie)
	zombie.position = Vector2(1024, randf() * 600)
