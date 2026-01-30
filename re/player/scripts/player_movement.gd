
extends CharacterBody3D
 
@export var movement_Speed = 2.0
@export var turning_Speed = 0.025
@export var can_move = true

var interactable_item_in_range = Array()

func _physics_process(delta: float) -> void:
	
	### MOVEMENT SCRIPT
	### original (https://godotforums.org/d/36094-3d-tank-controls-for-player-movement/5)
	### modified to fix rotation issues
	
	
	# gravity
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	
	var input_direction : Vector2 =  Input.get_vector("in_right","in_left","in_backward", "in_forward")
	var movement_direction = input_direction.y
	
	# prevent backward walking
	if (can_move):
		if input_direction.y < 0.0:
			# Fix later
			movement_direction = movement_direction * movement_Speed
		else:
			movement_direction = abs(movement_direction * movement_Speed)
	
	if (can_move):
		velocity = self.global_transform.basis.z * movement_direction
	
	if (can_move):
		if movement_direction == 0:
		# Apply rotation WHILE static
			if input_direction.y > 0.0:
				rotate_y(turning_Speed * -input_direction.x)
			else:
				rotate_y(turning_Speed * input_direction.x)
		else:
		# Apply rotation WHILE moving
			if input_direction.y > 0.0:
				rotate_y(turning_Speed * input_direction.x)
			else:
				rotate_y(turning_Speed * -input_direction.x)
		### End of Movement
	
	
	move_and_slide()





	# Interact
	if Input.is_action_just_pressed("in_interact"):
		# Interact if Item
		if interactable_item_in_range[0] == true:
			var nbtItemData = interactable_item_in_range[-1].get_parent().get_node('nbt')
			get_parent().get_node("HUD/viewUI").popUp('Would you like to pick up ' + nbtItemData.item_name + '?', 'Yes', 'Not Now')
		


## Item range manager
func set_areaInteract(area, enter_or_exit):
		if (area.get_parent().has_node("nbt")):
			if (area.get_parent().get_node('nbt').character_Type == 'item'):
				if (enter_or_exit == true):
					interactable_item_in_range.push_front(true)
					interactable_item_in_range.append(area)
				else:
					interactable_item_in_range.push_front(false)
					interactable_item_in_range.erase(area)

func _on_interaction_box_area_entered(area: Area3D) -> void:
	set_areaInteract(area, true)

func _on_interaction_box_area_exited(area: Area3D) -> void:
	set_areaInteract(area, false)
