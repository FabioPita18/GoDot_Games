extends RigidBody

func _ready():
	$Object.get_child(randi() % $Object.get_child_count()).visible = true

func hit():
	$Particles.emitting = true
	$VegetableDeathTimer.start()

func _process(delta):
	if translation.y < -5: queue_free()
	
func _on_VegetableDeathTimer_timeout():
	queue_free()
