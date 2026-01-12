extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5


func _physics_process(delta: float) -> void:
	# gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	var input_dir := Input.get_vector("in_left", "in_right", "in_forward", "in_backward")
	
	# Apply rotation
	if input_dir.x == 1:
		rotate_y(0.02)
	elif input_dir.x == -1:
		rotate_y(-0.02)
	
	# Apply movement
	if input_dir.y == 0:
		velocity = self.global_transform.basis.z * 0
	elif input_dir.y < 0:
		velocity = self.global_transform.basis.z * SPEED
	elif input_dir.y > 0:
		velocity = self.global_transform.basis.z * -SPEED
	
	print(input_dir.y)


	move_and_slide()
