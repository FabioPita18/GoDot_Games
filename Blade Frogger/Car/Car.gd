extends Area2D

const CAR_LIST = ['Grey1','Grey2','Yellow1','Yellow2']
var car_speed = 250
var direction = 1

func _ready():
	randomize()
	var current_car = CAR_LIST[randi() % CAR_LIST.size()]
	$"AnimatedSprite".animation = current_car
	car_speed = rand_range(220,280)

	if position.x < 0:
		direction = -1
		$"AnimatedSprite".flip_h = true
	else:
		direction = 1

func _process(delta):
	position.x -= car_speed * delta * direction


func _on_Car_body_entered(body):
	get_tree().change_scene("res://GameScreen/GameScreen.tscn")
