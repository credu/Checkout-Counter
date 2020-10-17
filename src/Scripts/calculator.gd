extends Control

var num = 0
var numbers = ["","",""]
var numFunction = 0
var function = false

var a = 0
var b = 0
var c

var registro
var resultado

func _ready():
	registro = $registro
	resultado = $resultado

func _physics_process(delta):
	$Label.text = "a=" + str(a) +"\nb=" + str(b) + "\nc=" + str(c) + "\narray= " + str(numbers) + "\nfunction=" + str(function) + "\nnum=" + str(num)

func _on_ac_pressed():
	registro.text = ""
	resultado.text = "0"
	num = 0
	numFunction = 0
	a = 0
	b = 0
	c = null
	numbers = ["","",""]
	function = false
	
func _on_1_pressed():
	if resultado.text == "0":
		resultado.text = "="
	numbers[num] += "1"
	registro.text += "1"
	_functions()

func _on_2_pressed():
	if resultado.text == "0":
		resultado.text = "="
	numbers[num] += "2"
	registro.text += "3"
	_functions()

func _on_3_pressed():
	if resultado.text == "0":
		resultado.text = "="
	numbers[num] += "3"
	registro.text += "3"
	_functions()

func _on_4_pressed():
	if resultado.text == "0":
		resultado.text = "="
	numbers[num] += "4"
	registro.text += "4"
	_functions()

func _on_5_pressed():
	if resultado.text == "0":
		resultado.text = "="
	numbers[num] += "5"
	registro.text += "5"
	_functions()
	
func _on_6_pressed():
	if resultado.text == "0":
		resultado.text = "="
	numbers[num] += "6"
	registro.text += "6"
	_functions()

func _on_7_pressed():
	if resultado.text == "0":
		resultado.text = "="
	numbers[num] += "7"
	registro.text += "7"
	_functions()

func _on_8_pressed():
	if resultado.text == "0":
		resultado.text = "="
	numbers[num] += "8"
	registro.text += "8"
	_functions()

func _on_9_pressed():
	if resultado.text == "0":
		resultado.text = "="
	numbers[num] += "9"
	registro.text += "9"
	_functions()

func _on_0_pressed():
	if resultado.text == "0":
		resultado.text = "="
	numbers[num] += "0"
	registro.text += "0"
	_functions()

func _on_punto_pressed():
	if resultado.text == "0":
		resultado.text = "=0."
	numbers[num] += "."
	registro.text += "."
	_functions()

func _on_mas_pressed():
	function = true
	numFunction = 0
	registro.text += "+"
	_provis()
	
	
func _on_menos_pressed():
	function = true
	numFunction = 1
	registro.text += "-"
	_provis()
	
func _on_multiplicacion_pressed():
	function = true
	numFunction = 2
	registro.text += "x"
	_provis()
	
func _on_division_pressed():
	function = true
	numFunction = 3
	registro.text += "÷"
	_provis()
	
func _on_igual_pressed():
	pass

func _functions():
	match numFunction:
		0:
			c = float(numbers[0])+float(numbers[1])
		1:
			c = float(numbers[0])-float(numbers[1])
		2:
			c = float(numbers[0])*float(numbers[1])
		3:
			c = (float(numbers[0])/float(numbers[1]))
	resultado.text = "="+str(c)
	numbers[2] = str(c)
	
func _provis():
	num=1
	numbers[0] = numbers[2]
	numbers[1] = ""
