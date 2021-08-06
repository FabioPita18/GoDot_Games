extends KinematicBody

const SPEED = 12
const GRAVITY = 1 
var gun_ready = true

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _input(event):
	if event is InputEventMouseMotion:
		$Head.rotate_y(deg2rad(event.relative.x * -0.3))
		$Head/Eyes.rotate_x(deg2rad(event.relative.y * -0.3))

func _process(delta):
	var velocity = Vector3.ZERO
	var direction = $Head.get_global_transform().basis
	var target = null
	
	if Input.is_action_pressed("forward"): velocity -= direction.z
	if Input.is_action_pressed("backward"): velocity += direction.z
	if Input.is_action_pressed("rightward"): velocity += direction.x
	if Input.is_action_pressed("leftward"): velocity -= direction.x
	if Input.is_action_just_pressed("shoot") and gun_ready:
		get_tree().call_group('Shotgun','shoot_animation')
		$AudioStreamPlayer3D.play()
		target = $Head/Eyes/RayCast.get_collider()
		if target:
			if target.has_method('hit'):
				target.hit()
		gun_ready = false
		$Cooldown.start()
	
	velocity.y -= GRAVITY
	
	move_and_slide(velocity.normalized() * SPEED)


func _on_Cooldown_timeout():
	gun_ready = true
