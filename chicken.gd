extends CharacterBody2D

# Referência ao AnimatedSprite2D
@onready var animated_sprite = $AnimatedSprite2D

func _ready():
	# Inicia a animação "eating" assim que o nó é carregado
	animated_sprite.play("eating")

func start_eating_animation():
	# Inicia a animação "eating" quando chamado
	animated_sprite.play("eating")
