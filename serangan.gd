extends CharacterBody2D

var health = 100
var damage = 20
var fire_rate = 1.5  # Menembak setiap 1.5 detik
var fire_timer = 0
var proyektil_scene = preload("res://proyektil.tscn")

func _process(delta):
	fire_timer += delta
	if fire_timer >= fire_rate:
		fire_proyektil()
		fire_timer = 0

func fire_proyektil():
	var proyektil = proyektil_scene.instance()
	proyektil.position = position
	get_parent().add_child(proyektil)

func take_damage(amount):
	health -= amount
	if health <= 0:
		queue_free()
