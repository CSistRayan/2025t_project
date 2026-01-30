extends Node

# Character
@export var character_Type = 'player'

# Health:
@export var health = 100
@export var maxHealth = 100

@export var inventory = []
@export var equipped_slot = 0

func take_damage(amount):
	health += amount
	print(health)

func _ready() -> void:
	pass
