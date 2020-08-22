tool
extends KinematicBody2D

export var speed: = Vector2(0, 1000)
export(String) var up_input: = ""
export(String) var down_input: = ""

var velocity: = Vector2.ZERO
var direction: = Vector2.ZERO

func _physics_process(delta):
	direction = calculate_direction()
	velocity = calculate_velocity(speed, direction)
	move_and_slide(velocity)

func calculate_direction() -> Vector2:
	return Vector2(
		0.0, 
		get_down_input() - get_up_input()
	)
	
func calculate_velocity(speed: Vector2, direction: Vector2) -> Vector2:
	return speed * direction

func get_up_input() -> float:
	return Input.get_action_strength(up_input)
	
func get_down_input() -> float:
	return Input.get_action_strength(down_input)

func _get_configuration_warning():
	if up_input == "" and down_input == "":
		return "up_input and down_input need to be set to the approriate input type."
	elif up_input == "":
		return "up_input must be set to the appropriate input type."
	elif down_input == "":
		return "down_input must be set to the appropriate input type."
		
	return ""
