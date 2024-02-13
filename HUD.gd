extends Node

signal start_game

signal start_over

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$BackButton.hide()
	

func _on_PlayButton_pressed():
	$PlayButton.hide()
	$Title.hide()
	$BackButton.show()
	$QuitButton.hide()
	emit_signal("start_game")


func _on_BackButton_pressed():
	$PlayButton.show()
	$Title.show()
	$BackButton.hide()
	$QuitButton.show()
	emit_signal("start_over")


func _on_QuitButton_pressed():
	get_tree().quit()
