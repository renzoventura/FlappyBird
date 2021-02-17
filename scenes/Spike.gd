extends Area2D

func _on_Spike_body_entered(body):
	if (body.name == "Player"):
		print("DEAD")
		get_tree().call_group("Player", "died")
		get_tree().call_group("Level", "stop_spawning")
		get_tree().call_group("Spikes", "stop")
