extends CharacterBody2D

var speed = 200  # Kecepatan manusia
var health = 100  # Kesehatan manusia

func _ready():
	set_process(true)  # Mengaktifkan pemrosesan di _process()

func _process(delta):
	position.x -= speed * delta  # Bergerak ke kiri

	# Hapus jika posisi manusia keluar layar
	if position.x < -50:  # Menghapus jika di luar layar
		queue_free()
