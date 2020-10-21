extends Node

var aplication = ["asd0","asd","asd2","asd3","asd4","asd5","databaseRead","calculadora"]

var option = 0
var state = 0

var content
var notification

var count = 1

func _ready():
	$Options/Background.color = Color8(1,1,1,0)
	$Options/Background.rect_position.x = -1080
	$Options/NavbarL.rect_position.x = -800
	$Main/Bar/Plus.modulate = Color8(0,0,0,0)

########## Mas opciones ##########
func _on_MoreButton_pressed():
	($AnimationPlayer as AnimationPlayer).play("navbarShow")

func _on_ExitOptions_pressed():
	($AnimationPlayer as AnimationPlayer).play("navbarHide")
	
func _on_Home_pressed():
	option=1

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
	($Main/Bar/AnimationPlayer as AnimationPlayer).play("plusShow")
	_location()

func _on_Calculadora_pressed():
	option=7
	_location()

func _on_Opciones_pressed():
	option=8
	print(option)
	#asd

func _location():
	print(option)
	var s = ResourceLoader.load("res://src/scenes/"+aplication[option]+".tscn") # Load the new scene.
	content = s.instance() # Instanciar una escena
	$Main/content.add_child(content) # Add it to the active scene, as child of root.
	($AnimationPlayer as AnimationPlayer).play("navbarHide")

	
func _on_Salir_pressed():
	get_tree().quit()
	
##### Botones de control ####
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
	print("back")
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

func _plus_visible():
	$Main/Bar/Plus.disabled=false
	$Main/Bar/Plus.visible=true

func _plus_invisible():
	$Main/Bar/Plus.disabled=true
	$Main/Bar/Plus.visible=false

#### Notificaciones dinamicas ######
func _font_notification(var num, var message):
	var s = ResourceLoader.load("res://src/scenes/Notification.tscn") # Carga el formato para las notificaciones
	notification = s.instance() # Instancialo como una variable

	# Formatos del arbol
	var title = notification.get_node("title")
	var body = notification.get_node("body")
	
	var border = notification.get_node("border")
	var background = notification.get_node("background")

	if num == 0:
		title.text = "Todo correcto!"
		border.get("custom_styles/hover").bg_color = Color("#c3e6cb")
		border.get("custom_styles/pressed").bg_color = Color("#c3e6cb")
		border.get("custom_styles/normal").bg_color = Color("#c3e6cb")
		
		background.get("custom_styles/hover").bg_color = Color("#d4edda")
		background.get("custom_styles/pressed").bg_color = Color("#d4edda")
		background.get("custom_styles/normal").bg_color = Color("#d4edda")
		
		title.set("custom_colors/font_color", Color("#155724"))
		body.set("custom_colors/font_color", Color("#155724"))
	elif num == 1:
		title.text = "Error:"
		border.get("custom_styles/hover").bg_color = Color("#f5c6cb")
		border.get("custom_styles/pressed").bg_color = Color("#f5c6cb")
		border.get("custom_styles/normal").bg_color = Color("#f5c6cb")
		
		background.get("custom_styles/hover").bg_color = Color("#f8d7da")
		background.get("custom_styles/pressed").bg_color = Color("#f8d7da")
		background.get("custom_styles/normal").bg_color = Color("#f8d7da")
		
		title.set("custom_colors/font_color", Color("#721c24"))
		body.set("custom_colors/font_color", Color("#721c24"))
	if message == "" and num == 0:
		body.text = "La tarea ha sido cumplida satisfactoriamente."
	elif message == "" and num == 1:
		body.text = "Hay una excepcion no controlada, comunicar al creador del proyecto."
	else:
		body.text = message
	notification.name = "notification "+str(count)
	$Main/FontContent.add_child(notification) # Add it to the active scene, as child of root.
	count = count + 1
