extends Control


@onready var healthLabel = $health
@onready var InLabel = $Inventory

func UpdateHealth():
	healthLabel = $"../../../PlayerPawn/nbt".health
	$health.text = str(healthLabel)

func UpdateInventory():
	InLabel = $"../../../PlayerPawn/nbt".inventory
	$Inventory.text = str(InLabel)


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	UpdateHealth()
	UpdateInventory()
	pass
