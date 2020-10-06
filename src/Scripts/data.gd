extends Control

func _on_Button_pressed():
	var dir = Directory.new()
	if dir.open("user://database") == OK: #Extraido de la documentacion de godot:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if dir.current_is_dir(): #Si encuentras un directorio no hagas nada
				pass
			else: #Si encuentras un archivo que concuerde con el nombre-descripcion-costo de la data actual eliminalo  
				if (file_name == $nombre.text + " - " + $descripcion.text + " - " + str($costo.text) +".csv"):
					dir.remove("user://database/"+$nombre.text + " - " + $descripcion.text + " - " + str($costo.text) +".csv")
					finish() #elimina el nodo de data que estaba creado
					return #No sigas buscando directorios si ya lo encontraste
			file_name = dir.get_next() #Cambia file_name al nombre del siguiente directorio
	else:
		print("Ha ocurrido un error intentando acceder al directorio.")

func finish():
	$".".queue_free() #elimina el nodo de data que estaba creado
