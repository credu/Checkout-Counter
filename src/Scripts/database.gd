extends Node

var data = {
	weekday = "",
	day = 0,
	month = 0,
	year = 0,
	
	nombre = "",
	descripcion = "",
	costo = 0
	}

var num = 0

func _ready():
	var path = Directory.new()
	if(!path.dir_exists("user://database")): # Si no existe el directorio para la base de datos entonces crea uno nuevo
		path.open("user://")
		path.make_dir("user://database")
	

func save_data():
	var save = File.new()
	#Crea un archivo con los datos recibidos ya sea por parte de otro nodo
	save.open("user://database/"+str(data.nombre)+" - "+data.descripcion+" - "+str(data.costo)+".csv", File.WRITE)
	save.close() #Cierra el archivo que se estaba usando
	#Lee y escribe sobre el archivo con el siguiente nombre que depende de la variable data
	save.open("user://database/"+str(data.nombre)+" - "+data.descripcion+" - "+str(data.costo)+".csv", File.READ_WRITE)
	
	#obten el datetime y dependiendo del dia tendra un string u otro
	var time = OS.get_datetime()
	var weekday = time["weekday"]
	if weekday == 0:
		data.weekday = "Domingo"
	elif weekday == 1:
		data.weekday = "Lunes"
	elif weekday == 2:
		data.weekday = "Martes"
	elif weekday == 3:
		data.weekday = "Miercoles"
	elif weekday == 4:
		data.weekday = "Jueves"
	elif weekday == 5:
		data.weekday = "Viernes"
	elif weekday == 6:
		data.weekday = "Sabado"
	
	data.day = time["day"]
	data.month = time["month"]
	data.year = time["year"]
	
	#print(data) #Data recibida por el script
	
	while(!save.eof_reached()): #Mientras save no llegue a la ultima linea del archivo abierto
		num=num+1
		#print("linea"+str(num))
		save.get_line() #Lee la linea y ve a la siguiente
	save.store_line(to_json(data)) #Si llego a la ultima linea escribiras lo que esta dentro de data
	num=0 #Reinicia a num (Esta variable dependera de la instancia que se cree para cada nodo duplicado de data)
	
	save.close() #Cierra el archivo que se estaba usando
