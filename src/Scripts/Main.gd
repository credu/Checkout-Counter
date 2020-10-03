extends Node

func _ready():
	$Options/Background.color = Color8(1,1,1,0)
	$Options/Background.rect_position.x = -1080
	$Options/NavbarL.rect_position.x = -800
	

func _on_TextureButton_pressed():
	print("asd1")
	($AnimationPlayer as AnimationPlayer).play("navbarShow")

func _on_ExitOptions_pressed():
	print("asd2")
	($AnimationPlayer as AnimationPlayer).play("navbarHide")
