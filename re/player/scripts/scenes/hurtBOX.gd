extends Area3D

@export var canDamage = false
@export var amountDamage = 0


func _on_area_entered(area: Area3D) -> void:
	print(1)
