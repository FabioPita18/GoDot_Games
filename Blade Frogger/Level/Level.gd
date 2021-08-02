extends Node

const CAR = preload("res://Car/Car.tscn")

func _ready ():
	$YSort/Player.position = $PlayerStartPos.position

func car_spawn(start_pos):
	var car = CAR.instance()
	var car_start_node_name = "Startpositions/CarStart" + str(start_pos)
	car.position = get_node(car_start_node_name).position
	$"YSort".add_child(car)

	var timer_node_name = "CarTimers/Timer" + str(start_pos)
	get_node(timer_node_name).wait_time = rand_range(1.6,2.2)

func _process(delta):
	if $"YSort/Player".position.y <= -250:
		Global.score += 1
		$"YSort/Player".position = $"PlayerStartPos".position
		$"WinSound".play()
	$"CanvasLayer/Label".text = 'Score: ' + str(Global.score)

func _on_Timer_timeout(): car_spawn(1)
func _on_Timer2_timeout(): car_spawn(2)
func _on_Timer3_timeout(): car_spawn(3)
func _on_Timer4_timeout(): car_spawn(4)
func _on_Timer5_timeout(): car_spawn(5)
