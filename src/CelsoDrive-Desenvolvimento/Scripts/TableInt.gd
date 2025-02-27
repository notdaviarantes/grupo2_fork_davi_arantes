extends CanvasLayer


# Caso o usuário escolha a comida saudável -> healthyFood = true e esconde a cena
func _on_HealthyButton_pressed():
	Global.healthyFood = true
	visible = false
	Global.interactedTable = true


# Caso o usuário escolha a comida não saudável -> healthyFood = false e esconde a cena
func _on_NotHealthyButton_pressed():
	Global.healthyFood = false
	visible = false
	Global.interactedTable = true


# Botão para fechar a interação
func _on_CloseButton_pressed():
	visible = false
