extends Node

var num = 0
var data = ["Nombre","Descripcion","Costo"]

func _ready():
	($Nombre/AnimationPlayer as AnimationPlayer).play("experimental")

func focus_entered():
	if (get_node(data[num]).get_node("TextEdit"+str(num)).text == ""):
		(get_node(data[num]).get_node("AnimationPlayer") as AnimationPlayer).play("in")
		return
	
	if (get_node(data[num]).get_node("ColorRect").color == Color8(187,222,251,255)):
		(get_node(data[num]).get_node("AnimationPlayer") as AnimationPlayer).play("select")
	
func focus_exited():
	if (get_node(data[num]).get_node("TextEdit"+str(num)).text==""):
		(get_node(data[num]).get_node("AnimationPlayer") as AnimationPlayer).play("outIncorrect")
		return
		
	get_node(data[num]).get_node("ColorRect").color = Color8(187,222,251,255)


func _on_TextEdit0_focus_entered():
	num = 0
	focus_entered()

func _on_TextEdit0_focus_exited():
	focus_exited()

func _on_TextEdit1_focus_entered():
	num = 1
	focus_entered()

func _on_TextEdit1_focus_exited():
	focus_exited()

func _on_TextEdit2_focus_entered():
	num = 2
	focus_entered()

func _on_TextEdit2_focus_exited():
	focus_exited()


func _on_Button_pressed():
	if (get_node("Nombre/TextEdit0").text == "") or (get_node("Costo/TextEdit2").text == ""):
		print("Faltan datos")
		return
	print("Falta programar la base de datos")
