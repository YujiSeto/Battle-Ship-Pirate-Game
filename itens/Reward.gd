extends Area2D

export (float) var lifetime

func start():
	$Lifetime.start()
	$Lifetime.wait_time = lifetime

func _on_Reward_body_entered(body):
	queue_free()
