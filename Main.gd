extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Character.hide()

func new_game():
	$Character.show()
	$Background.hide()

func _on_HUD_start_over():
	$Character.hide()
	$Background.show()
