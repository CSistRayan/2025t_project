extends Node2D
@onready var player = $"../../PlayerPawn/nbt"
@onready var PopUp = $"Popup"



func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func popUp(message, btnAccept, btnDeny):
	get_tree().paused = true
	$Popup/text.text = message
	$Popup/accept.text = btnAccept
	$Popup/reject.text = btnDeny
	$Popup.visible = true
	
	
