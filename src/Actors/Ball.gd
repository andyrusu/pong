extends KinematicBody2D

export var speed: = Vector2(1500, 1500)
export var direction: = Vector2.ZERO
export var velocity: = Vector2.ZERO

var rng: = RandomNumberGenerator.new()

func _ready():
	rng.randomize()
	direction.x = rng.randf_range(-1, 1)
	velocity = speed * direction
	
func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision:
		if collision.collider.get_class() == "StaticBody2D":
			velocity = velocity.bounce(collision.normal)
		else:
			velocity = velocity.bounce(collision.normal).rotated(collision.collider.velocity.angle() * -1)
