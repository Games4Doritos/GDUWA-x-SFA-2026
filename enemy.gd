class_name Enemy extends CharacterBody2D

const bullet = preload("res://bullet.tscn")
@export var target_distance = 350
@export var SPEED = 50

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	var player = get_tree().get_first_node_in_group("Player")
	if player:
		var player_pos : Vector2= player.position
		var close = get_tree().get_first_node_in_group("Player").position.distance_to(position) < target_distance
		var dir = position.direction_to(player_pos)
		rotation = dir.angle()
		velocity = dir * SPEED
		if close:
			velocity*=-1
		move_and_slide()


func _on_timer_timeout() -> void:
	if get_tree().get_first_node_in_group("Player") != null:
		if get_tree().get_first_node_in_group("Player").position.distance_to(position) < 500:
			var new_bullet := bullet.instantiate()
			get_parent().add_child(new_bullet)
			new_bullet.position = position
			new_bullet.dir = position.direction_to(get_tree().get_first_node_in_group("Player").position).rotated(randf_range(-0.2, 0.2))
	


func _on_mouse_entered() -> void:
	print("hi")
