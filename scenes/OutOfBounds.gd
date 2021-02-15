extends Area2D

func _ready():
	pass

func _on_OutOfBounds_area_entered(area):
	area.queue_free() 
	
