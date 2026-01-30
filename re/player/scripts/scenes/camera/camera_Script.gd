extends Node3D
@onready var attachedCamera = $"Camera3D"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


# Player Entered Scene
func _on_area_3d_area_entered(area: Area3D) -> void:
	if (area.get_parent().has_node("nbt")):
		if (area.get_parent().get_node('nbt').character_Type == 'player'):
			attachedCamera.make_current()
