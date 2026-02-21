extends CharacterBody2D

var speed := 200
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    print("Hello world")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
    get_input()
    check_attack()
    move_and_slide()

func get_input():
    velocity = Vector2.ZERO
    if Input.is_action_pressed("right"):
        velocity.x += 1
    if Input.is_action_pressed("left"):
        velocity.x -= 1
    if Input.is_action_pressed("up"):
        velocity.y -= 1
    if Input.is_action_pressed("down"):
        velocity.y += 1
    velocity = velocity.normalized() * speed

func check_attack():
    if Input.is_action_just_pressed("attack"):
        get_node("AnimationPlayer").play("attack")

func _on_sword_body_entered(body: Node2D) -> void:
    if body.is_in_group("Enemy"):
        body.queue_free()
