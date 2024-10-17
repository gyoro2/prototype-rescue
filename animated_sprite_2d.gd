extends CharacterBody2D

func _ready():
	# Membuat node Sprite baru
	var sprite = Sprite2D.new()
	
	# Memuat gambar untuk sprite
	sprite.texture = load("res://Porcupine Sprite Sheet.png")
	
	# Menambahkan sprite sebagai child dari KinematicBody2D
	add_child(sprite)
	
	# Mengatur posisi sprite
	sprite.position = Vector2(5, 5)
