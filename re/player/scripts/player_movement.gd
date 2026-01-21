
extends CharacterBody3D
 
@export var movement_Speed = 2.0
@export var turning_Speed = 0.025



func _physics_process(delta: float) -> void:
	#
	### MOVEMENT SCRIPT
	### original (https://godotforums.org/d/36094-3d-tank-controls-for-player-movement/5)
	### modified to fix rotation issues
	#
	
	# gravity
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	
	var input_direction : Vector2 =  Input.get_vector("in_right","in_left","in_backward", "in_forward")
	var movement_direction = input_direction.y
	
	# prevent backward walking
	if input_direction.y < 0.0:
		# Fix later
		movement_direction = abs(movement_direction * movement_Speed)
	else:
		movement_direction = abs(movement_direction * movement_Speed)
	
	
	velocity = self.global_transform.basis.z * movement_direction
	
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
