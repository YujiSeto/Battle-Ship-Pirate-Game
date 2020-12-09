extends Node2D

func _ready():
	set_camera_limits()
	Input.set_custom_mouse_cursor(load("res://assets/UI/crossair_black.png"),
		Input.CURSOR_ARROW, Vector2(16, 16))

func set_camera_limits():
	var map_limits = $BackGround.get_used_rect()
	var map_cellsize = $BackGround.cell_size
	$Player/Camera2D.limit_left = map_limits.position.x * map_cellsize.x
	$Player/Camera2D.limit_right = map_limits.end.x * map_cellsize.x
	$Player/Camera2D.limit_top = map_limits.position.y * map_cellsize.y
	$Player/Camera2D.limit_bottom = map_limits.end.y * map_cellsize.y

func _on_Ship_shoot(bullet, _position, _direction):
	var b = bullet.instance()
	add_child(b)
	b.start(_position, _direction)

func _on_Player_dead():
	get_tree().reload_current_scene()


func _on_EnemyShip_dead():
	$Paths/Path2D/PathFollow2D/Reward.show()
	

func _on_EnemyShip_dead2():
	$Paths/Path2D2/PathFollow2D/Reward.show()


func _on_GunTurret_dead():
	pass # Replace with function body.


func _on_EnemyShip_dead3():
	$Paths/Path2D3/PathFollow2D/Reward.show()
