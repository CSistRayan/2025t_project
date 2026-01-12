extends CharacterBody3D


const SPEED = 3.0
const JUMP_VELOCITY = 4.5
const turn_speed = 5


func _physics_process(delta: float) -> void:
	# gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	var movement_input = Input.get_axis("in_forward", "in_backward")
	var direction_input = Input.get_axis("in_right", "in_left")
	var controller_direction_input = Input.get_axis("in2_right", "in2_left")
	
	# rotation
	rotate_y(direction_input * turn_speed * delta)
	rotate_y(controller_direction_input * turn_speed * delta)
	
	var velocity_vector = -global_transform.basis.z * movement_input * SPEED
	
	velocity.x = velocity_vector.x
	velocity.z = velocity_vector.z
	move_and_slide()
