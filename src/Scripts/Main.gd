extends Node

var option = 0
var state = 0
var content
var notification
var count = 1

func _ready():
	$Options/Background.color = Color8(1,1,1,0)
	$Options/Background.rect_position.x = -1080
	$Options/NavbarL.rect_position.x = -800

func _on_TextureButton_pressed():
	($AnimationPlayer as AnimationPlayer).play("navbarShow")

func _on_ExitOptions_pressed():
	($AnimationPlayer as AnimationPlayer).play("navbarHide")

func _plusActive():
	pass

func _on_Home_pressed():
	option=1
	print(option)
	#asd

func _on_Ingresos_pressed():
	option=2
	print(option)
	#asd

func _on_Gastos_pressed():
	option=3
	print(option)
	#asd

func _on_Inversiones_pressed():
	option=4
	print(option)
	#asd

func _on_semana_pressed():
	option=5
	print(option)
	#asd

func _on_Base_pressed():
	option=6
	print(option)
	var s = ResourceLoader.load("res://src/scenes/databaseRead.tscn") # Load the new scene.
	content = s.instance() # Instanciar una escena
	$Main/content.add_child(content) # Add it to the active scene, as child of root.
	($AnimationPlayer as AnimationPlayer).play("navbarHide")

func _on_Opciones_pressed():
	option=7
	print(option)
	#asd
	
func _on_Salir_pressed():
	get_tree().quit()
	
func _on_Plus_pressed():
	if option==1:
		pass
	elif option==6:
		var s = ResourceLoader.load("res://src/scenes/form.tscn") # Load the new scene.
		content = s.instance() # Instanciar una escena
		$Main/content.add_child(content) # Add it to the active scene, as child of root.
		$Main/Bar/Plus.disabled=true
	
	_plus()

func _on_back_pressed():
	if option==1:
		pass
	elif option==6 and state==0:
		pass
	elif option==6 and state==1:
		$Main/content/Form/AnimationPlayer.play("finish")
		yield(get_tree().create_timer(0.3),"timeout")
		$Main/content/Form.queue_free()
	state=0
	_plus()
	
func _plus():
	$Main/Bar/Plus.disabled=false
	if ($Main/Bar/Plus.disabled==true):
		$Main/Bar/Plus.disabled=true
		$Main/Bar/Plus.visible=false
	elif ($Main/Bar/Plus.disabled==false):
		$Main/Bar/Plus.disabled=false
		$Main/Bar/Plus.visible=true

func _font_notification(var num):
	if num == 0:
		var s = ResourceLoader.load("res://src/scenes/NotificationCorrect.tscn") # Carga el formato para data
		notification = s.instance() # Instancialo como una variable
		notification.get_node("title").text
		notification.get_node("body").text 
		notification.name = "notification "+str(count)
		$Main/FontContent.add_child(notification) # Add it to the active scene, as child of root.
		count=count+1
	elif num == 1:
		pass
