extends Area2D

var playerNear = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if playerNear and Input.is_action_just_pressed("e"):
		Dialogic.start("generic-npc")


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		playerNear = true
		get_node("Label").visible = true


func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player"):
		playerNear = false
		get_node("Label").visible = false
