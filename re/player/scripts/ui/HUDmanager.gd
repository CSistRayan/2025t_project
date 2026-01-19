extends Node2D
@onready var player = $"../../PlayerPawn/nbt"


func character_UISet(character):
	match char:
		'char_rayan':
			add_child(load("res://player/assets/char_rayan/UI/player_view.tscn").instance)
	pass


func _ready() -> void:
	
	character_UISet(player.character)
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
