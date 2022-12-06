extends Control


func _on_QuitButton_pressed():
	get_tree().quit()


func _on_RecommencerButton_pressed():
	queue_free()
	get_tree().change_scene("res://scenes/Main.tscn")

func _on_MenuPrincipalButton_pressed():
	queue_free()
	get_tree().change_scene("res://scenes/Menu.tscn")
