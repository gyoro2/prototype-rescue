extends CharacterBody2D

var speed = 300
var damage = 20

func _process(_delta):
	velocity.x = speed  # Proyektil bergerak ke kanan
	move_and_slide()  # Menggunakan pergerakan CharacterBody2D
	if position.x > 1024:  # Jika proyektil keluar layar
		queue_free()

func _on_CollisionShape2D_body_entered(body):
	if body.is_instance_of(load("res://hunter_1.gd")):  # Memeriksa apakah 'body' adalah Manusia
		body.take_damage(damage)
		queue_free()
