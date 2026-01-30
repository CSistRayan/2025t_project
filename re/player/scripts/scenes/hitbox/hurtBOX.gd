extends Area3D

@export var canDamage = false
@export var amountDamage = -30

@export var can_Damage_char = ['player']

func _on_area_entered(area: Area3D) -> void:
	if can_Damage_char.has(area.get_parent().get_node('nbt').character_Type):
		area.get_parent().get_node('nbt').take_damage(amountDamage)
