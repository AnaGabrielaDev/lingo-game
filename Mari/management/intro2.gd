extends Node2D
class_name Intro2

const _DIALOG_SCREEN: PackedScene = preload("res://Mari/management/dialog_screen.tscn")
const NEXT_SCENE_PATH: String = "res://teste/level_2.tscn"  # Caminho para a próxima cena

var _dialog_data: Dictionary = {
	0: {
		"faceset" : "res://Mari/dialog/assets/scientist_faceset.png",
		"dialog": "O que é isso…? Um anel… flutuando… em chamas? Onde eu estou?",
		"title": "Cientista"
	},
	
	1: {
		"faceset" : "res://Mari/dialog/assets/scientist_faceset.png",
		"dialog": "Parece tão… familiar e, ao mesmo tempo… irreal. Por que isso está aqui, no meio desse… vazio?",
		"title": "Cientista"
	},
	
	2: {
		"faceset" : "res://Mari/dialog/assets/quem_faceset.png",
		"dialog": "Você… finalmente chegou…",
		"title": "Voz Misteriosa"
	},
	
	3: {
		"faceset" : "res://Mari/dialog/assets/scientist_faceset.png",
		"dialog": "Quem está aí?! Por que me trouxe aqui?!",
		"title": "Cientista"
	},
	
	4: {
		"faceset" : "res://Mari/dialog/assets/quem_faceset.png",
		"dialog": "Quem você pensa que é? Vamos, toque no anel logo, não tenho o dia todo.",
		"title": "Voz Misteriosa"
	},
	
	5: {
		"faceset" : "res://Mari/dialog/assets/scientist_faceset.png",
		"dialog": "Olha, pra quem tá me pedindo um favor, você tá se achando demais, não acha?",
		"title": "Cientista"
	},
	
	6: {
		"faceset" : "res://Mari/dialog/assets/quem_faceset.png",
		"dialog": "Sem mais enrolação! Apenas toque no anel.",
		"title": "Voz Misteriosa"
	},
	
	7: {
		"faceset" : "res://Mari/dialog/assets/scientist_faceset.png",
		"dialog": "Tá bom, tá bom... já vou!",
		"title": "Cientista"
	},
	
	8: {
		"faceset" : "res://Mari/dialog/assets/scientist_faceset.png",
		"dialog": "Mas o que...",
		"title": "Cientista"
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
