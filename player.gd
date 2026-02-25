extends CharacterBody2D

var speed := 200
var maxHealth := 2
var health

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	health = maxHealth
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	get_input()
	check_attack()
	move_and_slide()

var dir = 1

func get_input():
	velocity = Vector2.ZERO

	if Input.is_action_pressed("right"):
		velocity.x += 1
		
		if dir == -1:
			if get_node("AnimationPlayer").is_playing():
				get_node("AnimationPlayer").stop()
			get_node("Sword").position.x *= -1
			get_node("Sword").rotation *= -1
			dir = 1
			
	if Input.is_action_pressed("left"):
		velocity.x -= 1
		
		if dir == 1:
			if get_node("AnimationPlayer").is_playing():
				get_node("AnimationPlayer").stop()
			get_node("Sword").position.x *= -1
			get_node("Sword").rotation *= -1
			dir = -1
		
	if Input.is_action_pressed("up"):
		velocity.y -= 1
	if Input.is_action_pressed("down"):
		velocity.y += 1
	velocity = velocity.normalized() * speed

func check_attack():
	if Input.is_action_just_pressed("attack"):
		if dir == 1:
			get_node("AnimationPlayer").play("attack")
		else:
			get_node("AnimationPlayer").play("left_attack")
func _on_sword_body_entered(body: Node2D) -> void:
	if body.is_in_group("Enemy"):
		body.queue_free()

func damage() -> void:
	health -= 1
	get_node("ProgressBar").value -= get_node("ProgressBar").value/maxHealth
	
	if health == 0:
		queue_free()
