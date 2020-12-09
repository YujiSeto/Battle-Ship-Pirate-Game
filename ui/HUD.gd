extends CanvasLayer

var bar_red = preload("res://assets/UI/barHorizontal_red_mid 200.png")
var bar_green = preload("res://assets/UI/barHorizontal_green_mid 200.png")
var bar_yellow = preload("res://assets/UI/barHorizontal_yellow_mid 200.png")
var bar_texture
var count = 1

func update_ammo(value):
	$Margin/Container/AmmoGauge.value = value

func update_healthbar(value):
	bar_texture = bar_green
	if value < 60:
		bar_texture = bar_yellow
	if value < 25:
		bar_texture = bar_red
	$Margin/Container/HealthBar.texture_progress = bar_texture
	$Margin/Container/HealthBar/Tween.interpolate_property($Margin/Container/HealthBar,'value', $Margin/Container/HealthBar.value, value, 0.2, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$Margin/Container/HealthBar/Tween.start()
	$AnimationPlayer.play("healthbar_flash")

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == 'healthbar_flash':
		$Margin/Container/HealthBar.texture_progress = bar_texture

func _on_Reward_body_entered(body):
	if count == 10:
		$Margin/Container/Points.show()
		count = count + 1
		
	if count == 9:
		$Margin/Container/Points2.show()
		count = count + 1
		
	if count == 8:
		$Margin/Container/Points3.show()
		count = count + 1
		
	if count == 7:
		$Margin/Container/Points4.show()
		count = count + 1
		
	if count == 6:
		$Margin/Container/Points5.show()
		count = count + 1
		
	if count == 5:
		$Margin/Container/Points6.show()
		count = count + 1
		
	if count == 4:
		$Margin/Container/Points7.show()
		count = count + 1
		
	if count == 3:
		$Margin/Container/Points8.show()
		count = count + 1
		get_tree().reload_current_scene()
		
	if count == 2:
		$Margin/Container/Points9.show()
		count = count + 1
		
	if count == 1:
		$Margin/Container/Points10.show()
		count = count + 1
