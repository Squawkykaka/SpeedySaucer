# this means that the root node this script is based of is RigidBody2D
# control + click RigidBody2D to learn more
extends RigidBody2D

# the move speed
var speed : int = 200
var movement_allowed = true

# runs every physics frame
func _physics_process(_delta):
	# if movement is allowed then allow movement
	if movement_allowed: movement()

func movement():
	# checks if move_up,down,left,right is pressed and applies force in that direction.
	if Input.is_action_pressed("move_up"):
		apply_force(Vector2(0,-speed))
	if Input.is_action_pressed("move_down"):
		apply_force(Vector2(0, speed))
	if Input.is_action_pressed("move_left"):
		apply_force(Vector2(-speed,0))
	if Input.is_action_pressed("move_right"):
		apply_force(Vector2(speed,0))

# Allow or disallow movement.
func set_movement(move_allowed : bool):
	movement_allowed = move_allowed

# reset the velocity to ZERO.
func reset_velocity():
	linear_velocity = Vector2.ZERO
	
