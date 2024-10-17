extends Node2D

var spawn_timer = 0
var spawn_interval = 2  # Interval spawn manusia
var manusia_scene = preload("res://hunter1.tscn")  # Memuat scene manusia
var selected_hewan_scene = null  # Untuk menyimpan scene hewan yang dipilih
var hewan_container  # Node untuk menambahkan hewan yang dipilih

var spawn_positions = [
	Vector2(1024, 100), 
	Vector2(1024, 200), 
	Vector2(1024, 300), 
	Vector2(1024, 400)
]

var money = 100  # Jumlah uang awal pemain
var money_label  # Label untuk menampilkan uang

func _ready():
	# Memilih hewan secara default saat game dimulai
	select_hewan("Hewan1")
	
	# Menyimpan referensi ke node yang dibutuhkan
	money_label = $UI/MoneyLabel  # Pastikan jalur ini benar
	hewan_container = $HewanContainer  # Node untuk menambahkan hewan
	update_money_display()

	# Debugging untuk memastikan hewan_container dan money_label ada
	if not hewan_container:
		print("Error: Node HewanContainer tidak ditemukan")
	if not money_label:
		print("Error: Node MoneyLabel tidak ditemukan")

# Fungsi untuk memperbarui tampilan uang di UI
func update_money_display():
	if money_label:  # Pastikan money_label tidak null
		money_label.text = "Money: " + str(money)
	else:
		print("Error: Label untuk uang tidak ditemukan")

# Fungsi untuk memunculkan manusia secara otomatis
func _process(delta):
	spawn_timer += delta
	if spawn_timer > spawn_interval:
		spawn_manusia()
		spawn_timer = 0

# Fungsi untuk memunculkan manusia di posisi acak
func spawn_manusia():
	if manusia_scene:
		var manusia = manusia_scene.instantiate()  # Membuat instance dari manusia
		if manusia:
			add_child(manusia)  # Menambahkan manusia ke scene
			var spawn_index = randi() % spawn_positions.size()  # Memilih posisi spawn acak
			manusia.position = spawn_positions[spawn_index]
			manusia.health = 100  # Kesehatan manusia
			manusia.speed = 100  # Kecepatan manusia
			manusia.set("target_y", manusia.position.y)  # Tetapkan target Y agar mereka tetap di satu baris
		else:
			print("Instansiasi manusia gagal")
	else:
		print("Scene manusia tidak berhasil dimuat")

# Fungsi untuk memilih hewan yang akan ditempatkan
func select_hewan(hewan_type: String):
	match hewan_type:
		"Hewan1":
			selected_hewan_scene = preload("res://serangan.tscn")  # Mengatur scene hewan sesuai pilihan
		_:
			print("Hewan tipe tidak dikenal")
	if selected_hewan_scene:
		print("Hewan yang dipilih: ", hewan_type)
	else:
		print("Error: Scene hewan tidak berhasil dimuat")

# Fungsi untuk menempatkan hewan di lokasi klik
func spawn_hewan(position):
	if selected_hewan_scene and money >= 50:  # Cek uang dan hewan yang dipilih
		var hewan = selected_hewan_scene.instantiate()
		if hewan:
			# Pastikan hewan_container sudah terinisialisasi
			if hewan_container:
				hewan_container.add_child(hewan)  # Menambahkan hewan ke container
				hewan.position = position  # Set posisi hewan
				money -= 50  # Kurangi uang
				update_money_display()

				# Debug untuk memastikan hewan telah ditempatkan
				print("Hewan berhasil ditempatkan di posisi: ", position)
			else:
				print("Error: hewan_container belum terinisialisasi atau tidak ditemukan")
		else:
			print("Instansiasi hewan gagal")
	else:
		if money < 50:
			print("Uang tidak cukup untuk menempatkan hewan")
		if not selected_hewan_scene:
			print("Tidak ada hewan yang dipilih")


# Fungsi untuk menangani klik mouse untuk menempatkan hewan
func _input(event):
	if event is InputEventMouseButton and event.is_pressed():
		print("Mouse diklik, posisi: ", event.position)
		if selected_hewan_scene:
			var position = get_global_mouse_position()  # Mendapatkan posisi klik mouse
			print("Mencoba menempatkan hewan di: ", position)
			spawn_hewan(position)  # Memanggil fungsi untuk menempatkan hewan
		else:
			print("Tidak ada hewan yang dipilih")

func _on_pilih_hewan_1_pressed() -> void:
	select_hewan("Hewan1")  # Memilih Hewan1
	print("Hewan1 dipilih")  # Debugging
