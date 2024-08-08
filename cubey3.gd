@tool
extends PanelContainer

@export var rot_speed := 1.0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Control/PanelContainer2.rotation -= delta * rot_speed / 3
	$Control/PanelContainer.rotation += delta * rot_speed
