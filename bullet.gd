extends Area2D

var speed := 400
var dir := Vector2.LEFT

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
    position += speed*dir*delta
    rotation += 0.1
