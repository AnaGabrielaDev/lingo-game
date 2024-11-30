extends Node2D
class_name Intro1

const _DIALOG_SCREEN: PackedScene = preload("res://Mari/management/dialog_screen.tscn")
const NEXT_SCENE_PATH: String = "res://Mari/management/intro2.tscn"  # Caminho para a próxima cena


var _dialog_data: Dictionary = {
	0: {
		"faceset" : "res://Mari/dialog/assets/scientist_faceset.png",
		"dialog": "Imagine só! Se as pessoas pudessem aprender novas línguas em dias, ou até horas, com o método certo!",
		"title": "Cientista"
	},
	
	1: {
		"faceset" : "res://Mari/dialog/assets/assistent_faceset.png",
		"dialog": "(suspira) Isso parece… bem otimista, professora. Que método seria esse?",
		"title": "Asssistente"
	},
	
	2: {
		"faceset" : "res://Mari/dialog/assets/scientist_faceset.png",
		"dialog": "Uma combinação de estímulos visuais e associações! A chave para absorver línguas como nunca antes!",
		"title": "Cientista"
	},
	
	3: {
		"faceset" : "res://Mari/dialog/assets/assistent_faceset.png",
		"dialog": "Então… algo como uma esponja linguística? Professora, isso é mesmo viável?",
		"title": "Assistente"
	},
	
	4: {
		"faceset" : "res://Mari/dialog/assets/scientist_faceset.png",
		"dialog": "Talvez! Mas é uma ideia capaz de mudar o mundo!",
		"title": "Cientista"
	},
	
	5: {
		"faceset" : "res://Mari/dialog/assets/assistent_faceset.png",
		"dialog": "(olha para o relógio) Se você diz… Mas já está tarde, professora.",
		"title": "Assistente"
	},
	
	6: {
		"faceset" : "res://Mari/dialog/assets/scientist_faceset.png",
		"dialog": "É verdade. Bom, quem sabe um pouco de descanso ajude a clarear as ideias. Boa noite!",
		"title": "Cientista"
	},
	
	7: {
		"faceset" : "res://Mari/dialog/assets/assistent_faceset.png",
		"dialog": "Boa noite, professora. Que os sonhos tragam ideias... práticas.",
		"title": "Assistente"
	},
}

@export_category("Objects")
@export var _hud: CanvasLayer = null

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_select"):
		var _new_dialog: DialogScreen = _DIALOG_SCREEN.instantiate()
		_new_dialog.data = _dialog_data
		_hud.add_child(_new_dialog)
		
		# Conectar o sinal ao método local
		_new_dialog.connect("dialog_finished", Callable(self, "_on_dialog_finished"))

func _on_dialog_finished():
	# Troca para a próxima cena
	get_tree().change_scene_to_file(NEXT_SCENE_PATH)
