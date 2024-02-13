extends Node2D

onready var clothes = $Sprites/Clothes
onready var body = $Sprites/Body
onready var head = $Sprites/Head
onready var face = $Sprites/Face
onready var hair = $Sprites/Hair

onready var hair_color = $Sprites/Color_Values

const sprites = preload("res://assets/Sprites.gd")
const color_values = preload("res://assets/Color_Values.gd")
const color_options = preload("res://Color_Options.gd")

var curr_clothes: int = 0
var curr_body: int = 0
var curr_head: int = 0
var curr_face: int = 0
var curr_hair: int = 0

var curr_hair_color: int = 0

var random = RandomNumberGenerator.new()


# Called when the node enters the scene tree for the first time.
func _ready():
	
	hair.modulate = color_values.hair_colors[curr_hair_color]
	clothes.texture = sprites.male_clothes_sprite[curr_clothes]
	face.texture = sprites.male_face_sprite[curr_face]
	body.texture = sprites.male_body_sprite[curr_body]
	hair.texture = sprites.hair_sprite[curr_hair]
	
	var white_color_button = Button.new()
	white_color_button.icon = preload("res://assets/Color_Options/Color_Options1.png")
	white_color_button.flat = true
	get_node("ChangeHair/Color_Options/ScrollContainer/Control").add_child(white_color_button, false)
	white_color_button.connect("pressed", self, "_on_white_color_button_pressed")
	
	var brown_color_button = Button.new()
	brown_color_button.icon = preload("res://assets/Color_Options/Color_Options2.png")
	brown_color_button.flat = true
	get_node("ChangeHair/Color_Options/ScrollContainer/Control").add_child(brown_color_button, false)
	brown_color_button.connect("pressed", self, "_on_brown_color_button_pressed")

	var red_color_button = Button.new()
	red_color_button.icon = preload("res://assets/Color_Options/Color_Options3.png")
	red_color_button.flat = true
	get_node("ChangeHair/Color_Options/ScrollContainer/Control").add_child(red_color_button, false)
	red_color_button.connect("pressed", self, "_on_red_color_button_pressed")
	
func _on_white_color_button_pressed():
	hair.modulate = color_values.hair_colors[0]
func _on_brown_color_button_pressed():
	hair.modulate = color_values.hair_colors[1]
func _on_red_color_button_pressed():
	hair.modulate = color_values.hair_colors[2]


func _on_ChangeClothes_pressed():
	if (face.texture == sprites.male_face_sprite[curr_face]):
		curr_clothes = (curr_clothes + 1) % sprites.male_clothes_sprite.size()
		clothes.texture = sprites.male_clothes_sprite[curr_clothes]
	elif(face.texture == sprites.female_face_sprite[curr_face]):
		curr_clothes = (curr_clothes + 1) % sprites.female_clothes_sprite.size()
		clothes.texture = sprites.female_clothes_sprite[curr_clothes]

func _on_MaleButton_pressed():
	if (sprites.female_face_sprite.size() > sprites.male_face_sprite.size()):
		curr_face = (curr_face) % sprites.male_face_sprite.size()
	if (sprites.female_clothes_sprite.size() > sprites.male_clothes_sprite.size()):
		curr_clothes = (curr_clothes) % sprites.male_clothes_sprite.size()
	clothes.texture = sprites.male_clothes_sprite[curr_clothes]
	face.texture = sprites.male_face_sprite[curr_face]
	body.texture = sprites.male_body_sprite[curr_body]

func _on_FemaleButton_pressed():
	if (sprites.male_face_sprite.size() > sprites.female_face_sprite.size()):
		curr_face = (curr_face) % sprites.female_face_sprite.size()
	if (sprites.male_clothes_sprite.size() > sprites.female_clothes_sprite.size()):
		curr_clothes = (curr_clothes) % sprites.female_clothes_sprite.size()
	clothes.texture = sprites.female_clothes_sprite[curr_clothes]
	face.texture = sprites.female_face_sprite[curr_face]
	body.texture = sprites.female_body_sprite[curr_body]

func _on_ChangeHair_pressed():
	curr_hair = (curr_hair + 1) % sprites.hair_sprite.size()
	hair.texture = sprites.hair_sprite[curr_hair]

func _on_ChangeFace_pressed():
	if (body.texture == sprites.male_body_sprite[curr_body]):
		curr_face = (curr_face + 1) % sprites.male_face_sprite.size()
		face.texture = sprites.male_face_sprite[curr_face]
	elif(body.texture == sprites.female_body_sprite[curr_body]):
		curr_face = (curr_face + 1) % sprites.female_face_sprite.size()
		face.texture = sprites.female_face_sprite[curr_face]

func save():
	var save_dict = {
		"clothes" : curr_clothes,
		"body" : curr_body,
		"head" : curr_head,
		"face" : curr_face,
		"hair" : curr_hair
	}
	return save_dict

func _on_Save_pressed():
	pass

func _on_Randomize_pressed():
	curr_hair_color = random.randi_range(0, color_values.hair_colors.size() - 1)
	hair.modulate = color_values.hair_colors[curr_hair_color]
	if (body.texture == sprites.male_body_sprite[curr_body]):
		curr_clothes = random.randi_range(0, sprites.male_clothes_sprite.size() - 1)
		curr_face = random.randi_range(0, sprites.male_face_sprite.size() - 1)
		
		clothes.texture = sprites.male_clothes_sprite[curr_clothes]
		face.texture = sprites.male_face_sprite[curr_face]
		
	elif(body.texture == sprites.female_body_sprite[curr_body]):
		curr_clothes = random.randi_range(0, sprites.female_clothes_sprite.size() - 1)
		curr_face = random.randi_range(0, sprites.female_face_sprite.size() - 1)
		
		clothes.texture = sprites.female_clothes_sprite[curr_clothes]
		face.texture = sprites.female_face_sprite[curr_face]
	
	curr_hair = random.randi_range(0, sprites.hair_sprite.size() - 1)
	hair.texture = sprites.hair_sprite[curr_hair]
