extends Area2D

enum Items {health, ammo}

var icon_textures = [preload("res://assets/PNG/Default size/Effects/wrench_white.png"),
					 preload("res://assets/PNG/Default size/Effects/ammo_machinegun.png")]

export (Items) var type = Items.health
export (Vector2) var amount = Vector2(10, 25)

func _ready():
	$Icon.texture = icon_textures[type]
	
func _on_Pickup_body_entered(body):
	match type:
		Items.health:
			if body.has_method('heal'):
				print("healing")
				body.heal(int(rand_range(amount.x, amount.y)))
		Items.ammo:
			body.ammo += int (rand_range(amount.x, amount.y))
			
	queue_free()
