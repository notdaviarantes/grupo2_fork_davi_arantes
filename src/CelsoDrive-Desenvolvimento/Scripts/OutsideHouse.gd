extends Node2D


func _ready():
	Global.level = 1
	# Define posição do personagem
	Global.playerPosition = Vector2(64, 208)
	
	# Instancia cena para mostrar o personagem
	var spawnPlayer = load("res://Scenes/SpawnPlayer.tscn").instance()
	add_child(spawnPlayer)
	
	if Global.visibleTruck:
		$Truck.visible = true
	else:
		$Truck.queue_free()


# Move o personagem para dentro de casa
func _on_CelsoHouse_body_entered(_body):
	Global.level = 2
	return get_tree().change_scene("res://Scenes/InsideHouse.tscn")


func _process(_delta):
	e_pressed()
	
# Mostra tecla E do teclado ao se aproximar do caminhao 
func _on_Caminhao_body_entered(_body):
	$Truck/Einteract.visible = true
	#return get_tree().change_scene("")
	#adicionar caminho para estrada/checklist

# Esconde tecla E ao se afastar
func _on_Caminhao_body_exited(_body):
	$Truck/Einteract.visible = false
	
# Captura input ao pressionar tecla, função é executada ocorrendo troca de cena
func e_pressed():
	if Input.is_action_just_pressed("interagir"):
		return get_tree().change_scene("res://Scenes/RunGame.tscn")
