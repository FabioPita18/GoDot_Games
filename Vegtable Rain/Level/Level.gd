extends Spatial

const VEGETABLE = preload("res://Level/Vegetable.tscn")

func spawn_vegetable(pos,x,y,z):
	var vegetable = VEGETABLE.instance()
	var start_pos_name = "Positions/Start" + str(pos)
	vegetable.add_force(Vector3(x,y,z),Vector3(0.1,0.2,0))
	get_node(start_pos_name).add_child(vegetable)

func _on_Timer1_timeout(): spawn_vegetable(1,0,1000,800)


func _on_Timer2_timeout(): spawn_vegetable(2,900,1400,50)


func _on_Timer3_timeout(): spawn_vegetable(3,150,1200,-1000)


func _on_Timer4_timeout(): spawn_vegetable(4,-950,1100,50)


func _on_Timer5_timeout(): spawn_vegetable(5,950,1100,850)
