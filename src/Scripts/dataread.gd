extends Control

var num = 1

var dataRead
var data = {
	weekday = "",
	day = 0,
	month = 0,
	year = 0,
	
	nombre = "",
	descripcion = "",
	costo = 0
	}

func _ready():
	var location = $ScrollContainer/Formulario

	var dir = Directory.new() #Indicador que se abrira un directorio
	if dir.open("user://database") == OK: #Si consigue abrir el directorio
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if dir.current_is_dir():
				pass
			else:
				var s = ResourceLoader.load("res://src/scenes/data.tscn") # Carga el formato para data
				dataRead = s.instance() # Instancialo como una variable
				
				var save = File.new() #Indicador de que se abrira un archivo
				save.open("user://database/" + file_name, File.READ)
				
				var load_data = data
				
				if(!save.eof_reached()): #Si no alcanzo el final del documento
					var provisional_data = parse_json(save.get_line()) #Lee las lineas del archivo
					
					if(provisional_data != null):    #Si no hay datos null entonces
						load_data = provisional_data #load_data obtiene los datos del jugador
				save.close()
				
				#Dales el valor que corresponde a su contenido
				dataRead.get_node("nombre").text = load_data.nombre
				dataRead.get_node("descripcion").text = load_data.descripcion
				dataRead.get_node("costo").text = str(load_data.costo)
				dataRead.name = "data"+str(num)
				location.add_child(dataRead) # Add it to the active scene, as child of root.
				num = num + 1 #Sumale uno al num para mantener formato y que se vean ordenado los nodos
			file_name = dir.get_next() #Obten el siguiente elemento en el diretorio
	else:
		print("Ha ocurrido un error intentando acceder al directorio.")
