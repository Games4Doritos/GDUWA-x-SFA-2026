extends Enemy




func _physics_process(delta: float) -> void:
	target_distance = 0.0
	super(delta)
	if not $AnimationPlayer.is_playing():
		for b in $Area2D.get_overlapping_bodies():
			if b.is_in_group("Player"):
				b.damage()
				$AnimationPlayer.play("Attack")
