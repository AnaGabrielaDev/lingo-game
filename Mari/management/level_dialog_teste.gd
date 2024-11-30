extends Node2D
class_name DialogNpc

const _DIALOG_SCREEN: PackedScene = preload("res://Mari/management/dialog_screen_level.tscn")


var _dialog_data: Dictionary = {
	0: {
		"faceset" : "res://Mari/dialog/assets/scientist_faceset.png",
		"dialog": "Onde... onde estou? Tudo aqui é tão… bagunçado, letras estão por todo lugar. Como eu vim parar nesse lugar?",
		"title": "Cientista"
	},
	
	1: {
		"faceset" : "res://Mari/dialog/assets/scientist_faceset.png",
		"dialog": "O quê...? Um gato? Aí que fofinho, será que ele deixa eu tocar?",
		"title": "Cientista"
	},
	
	2: {
		"faceset" : "res://Mari/dialog/assets/gato1_faceset.jpg",
		"dialog": "Are you our savior?",
		"title": "???"
	},
	
	3: {
		"faceset" : "res://Mari/dialog/assets/scientist_faceset.png",
		"dialog": "Ah… você fala? Mas... que língua é essa? Não entendi nada do que você disse.",
		"title": "Cientista"
	},
	
	4: {
		"faceset" : "res://Mari/dialog/assets/gato1_faceset.jpg",
		"dialog": "(O animal revira os olhos, desdenhoso, e aponta para um objeto próximo a ele.)",
		"title": "???"
	},
	
	5: {
		"faceset" : "res://Mari/dialog/assets/scientist_faceset.png",
		"dialog": "Está me mostrando… esse objeto? Quer que eu toque? Bom… se é pra acordar desse sonho bizarro, acho que vale a pena tentar.",
		"title": "Cientista"
	},
	
	6: {
		"faceset" : "res://Mari/dialog/assets/scientist_faceset.png",
		"dialog": "Espera aí… um puzzle? limpa a garganta Certo, vou resolver isso. Se é um sonho, que seja interessante!",
		"title": "Cientista"
	},
	
	7: {
		"faceset" : "res://Mari/dialog/assets/gato1_faceset.jpg",
		"dialog": "Escute bem, humana. Você está presa aqui. Talvez você pra você isso seja apenas um ‘sonho maluco’, como preferir chamar. E você só vai acordar se resolver todos os puzzles deste mundo e trouxer as cores de volta.",
		"title": "Gato Rabugento"
	},
	
	8: {
		"faceset" : "res://Mari/dialog/assets/scientist_faceset.png",
		"dialog": "Espera… está dizendo que eu preciso resolver… puzzles?",
		"title": "Cientista"
	},
	
	9: {
		"faceset" : "res://Mari/dialog/assets/gato1_faceset.jpg",
		"dialog": "Finalmente entendeu. Agora, resolva os puzzles que faltam e faça o que tem que ser feito. Ou ficará aqui para sempre.",
		"title": "Gato Rabugento"
	},
	
	10: {
		"faceset" : "res://Mari/dialog/assets/scientist_faceset.png",
		"dialog": "Certo, certo, se é a única saída...",
		"title": "Cientista"
	},
}

@export_category("Objects")
@export var _hud: CanvasLayer = null

func _process(_delta: float) -> void:
	if $"../Npc".is_chatting and Input.is_action_just_pressed("chat"):
		var _new_dialog: DialogScreen = _DIALOG_SCREEN.instantiate()
		_new_dialog.data = _dialog_data
		_hud.add_child(_new_dialog)
