extends Node

var numData
var num = 0
var data = ["Nombre","Descripcion","Costo"]

var dataRead

func _ready():
	($Nombre/AnimationPlayer as AnimationPlayer).play("experimental")
	if get_tree().get_nodes_in_group("main"):
		get_parent().get_parent().get_parent().get_parent().state=1

func focus_entered(): #Focus dinamico a base de la señal del focus entered en el textedit de los nodos
	if (get_node(data[num]).get_node("TextEdit"+str(num)).text == ""):
		(get_node(data[num]).get_node("AnimationPlayer") as AnimationPlayer).play("in")
		return
	
	if (get_node(data[num]).get_node("ColorRect").color == Color8(187,222,251,255)):
		(get_node(data[num]).get_node("AnimationPlayer") as AnimationPlayer).play("select")
	
func focus_exited(): #Focus dinamico a base de la señal del focus exited en el textedit de los nodos
	if (get_node(data[num]).get_node("TextEdit"+str(num)).text==""):
		(get_node(data[num]).get_node("AnimationPlayer") as AnimationPlayer).play("outIncorrect")
		return
		
	get_node(data[num]).get_node("ColorRect").color = Color8(187,222,251,255)

#### Focus ##########################
func _on_TextEdit0_focus_entered():##
	num = 0                        ##
	focus_entered()                ##
								   ##
func _on_TextEdit0_focus_exited(): ##
	focus_exited()                 ##
								   ##
func _on_TextEdit1_focus_entered():##
	num = 1                        ##
	focus_entered()                ##
								   ##
func _on_TextEdit1_focus_exited(): ##
	focus_exited()                 ##
								   ##
func _on_TextEdit2_focus_entered():##
	num = 2                        ##
	focus_entered()                ##
								   ##
func _on_TextEdit2_focus_exited(): ##
	focus_exited()                 ##
#####################################

func _on_Button_pressed(): #Boton para subir los datos a la base de datos
	#Si nombre o costo estan vacios no hagas nada y corta la ejecucion
	if (get_node("Nombre/TextEdit0").text == "") or (get_node("Costo/TextEdit2").text == ""):
		print("Faltan datos")
		return
		
	#Actualiza los datos de la base de datos
	$"/root/Database".data.nombre = $Nombre/TextEdit0.text 
	$"/root/Database".data.descripcion = $Descripcion/TextEdit1.text 
	$"/root/Database".data.costo = $Costo/TextEdit2.text
	
	var s = ResourceLoader.load("res://src/scenes/data.tscn") # Load the new scene.
	if get_tree().get_nodes_in_group("main"):
		numData = get_parent().get_parent().get_node("databaseRead").num
	dataRead = s.instance() # Instanciar una escena
	dataRead.get_node("nombre").text = $Nombre/TextEdit0.text 
	dataRead.get_node("descripcion").text = $Descripcion/TextEdit1.text 
	dataRead.get_node("costo").text = $Costo/TextEdit2.text
	dataRead.name = "data"+str(numData)
	if get_tree().get_nodes_in_group("main"):
		get_parent().get_parent().get_node("databaseRead/ScrollContainer/Formulario").add_child(dataRead)
	
	Database.save_data()
