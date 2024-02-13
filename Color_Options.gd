extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var color_options_vis = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$ScrollContainer.hide()
	$ScrollBackground.hide()

func _on_Color_Options_pressed():
	if color_options_vis == false:
		$ScrollContainer.show()
		$ScrollBackground.show()
		
		color_options_vis = true
	elif color_options_vis == true:
		$ScrollContainer.hide()
		$ScrollBackground.hide()
		color_options_vis = false
		
