extends Node2D

@export var connectedRoom = 1
var playerTouching = false
@onready var doorSprite = $AnimatedSprite2D
@onready var enterTimer = $enterTimer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body == get_tree().get_first_node_in_group("Player"):
		playerTouching = true


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body == get_tree().get_first_node_in_group("Player"):
		playerTouching = false

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("e") and playerTouching:
		doorSprite.play("brickOpen")
		enterTimer.start()

func _on_enter_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://levels/level" + str(connectedRoom) + ".tscn")
