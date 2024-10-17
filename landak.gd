extends Area2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Waktu untuk setiap serangan (dalam detik)
var shoot_interval = 2.0
var time_passed = 0.0

# Preload proyektil
var projectile_scene = preload("res://proyektil.tscn")

func _process(delta):
	# Hitung waktu hingga tanaman menembak
	time_passed += delta
	if time_passed >= shoot_interval:
		shoot()
		time_passed = 0.0

func shoot():
	# Membuat proyektil
	var projectile = projectile_scene.instance()
	get_parent().add_child(projectile)
	projectile.position = self.position
