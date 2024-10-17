extends Control

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _ready():
	$Label.text = "Selamat datang di game ini!"
	$Sprite.visible = true
	$Label.visible = true

func _on_button_pressed():
	queue_free() 
