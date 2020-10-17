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
	$Control/information.text = "a=" + str(a) +"\nb=" + str(b) + "\nc=" + str(c) + "\narray= " + str(numbers) + "\nfunction=" + str(function) + "\nnum=" + str(num)

func _on_ac_pressed():
	registro.text = ""
	resultado.text = "0"
	
	a = 0
	b = 0
	c = null
	numbers = ["","",""]
	function = false
	num = 0
	
func _on_1_pressed():
	registro.text += "1"
	numbers.insert(0, 1)
	_function()

func _on_2_pressed():
	registro.text += "2"
	numbers.insert(0, 2)
	_function()

func _on_3_pressed():
	registro.text += "3"
	#numbers[0] = int(registro.text)
	numbers.insert(0, 3)
	_function()

func _on_4_pressed():
	registro.text += "4"
	if function:
		numbers[1] += "4"
		_function()
		return
	if resultado.text == "0":
		resultado.text = "="
	numbers[0] += "4"
	resultado.text += "4"

func _on_5_pressed():
	if resultado.text == "0":
		resultado.text = "="
	numbers[num] += "5"
	registro.text += "5"
	match numFunction:
		0:
			c = int(numbers[0])+int(numbers[1])
		1:
			c = int(numbers[0])-int(numbers[1])
		2:
			c = int(numbers[0])*int(numbers[1])
		3:
			c = (float(numbers[0])/int(numbers[1]))
	resultado.text = "="+str(c)
	numbers[2] = str(c)
	
func _on_6_pressed():
	registro.text += "6"
	numbers.insert(0, 6)
	_function()

func _on_7_pressed():
	registro.text += "7"
	numbers.insert(0, 7)
	_function()

func _on_8_pressed():
	registro.text += "8"
	numbers.insert(0, 8)
	_function()

func _on_9_pressed():
	registro.text += "9"
	numbers.insert(0, 9)
	_function()

func _on_0_pressed():
	registro.text += "0"
	numbers.insert(0, 0)
	_function()
	
func _on_mas_pressed():
	numFunction = 0
	function = true
	registro.text += "+"
	num=1
	numbers[0] = numbers[2]
	numbers[1] = ""
	
func _on_menos_pressed():
	function = true
	numFunction = 1
	registro.text += "-"
	
func _on_multiplicacion_pressed():
	function = true
	numFunction = 2
	registro.text += "x"
	
func _on_division_pressed():
	function = true
	numFunction = 3
	registro.text += "÷"
	
func _on_igual_pressed():
	pass

func _function():
	if function:
		for i in range(0, numbers.size()):
			if i==0 or i==1 and c == null:
				if i==0:
					a = int(numbers[i])
				elif i==1:
					b = int(numbers[i])
					match numFunction:
						0:
							c = a + b
						1:
							c = a - b
						2:
							c = a * b
						3:
							c = (float(a) / b)
					resultado.text = "="+str(c)
					function=false
			elif i== 0 or i==1 and c!=null:
				if i==1:
					b = int(numbers[i])
					match numFunction:
						0:
							c = c + a
						1:
							c = c - a
						2:
							c = c * a
						3:
							c = (float(c)/a)
					resultado.text = "="+str(c)
					function=false
