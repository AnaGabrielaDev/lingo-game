extends CharacterBody2D
class_name Character
var _state_machine

@export_category("Variables")
@export var _move_speed: float = 100.0

@export var _friction: float = 0.2
@export var _acceleration: float = 0.2

@export_category("Objects")
@export var _animation_tree: AnimationTree = null

func _ready() -> void:
	_state_machine = _animation_tree["parameters/playback"]
	
	
func _physics_process(_delta: float) -> void:
	_move()
	_animate()
	move_and_slide()
	
	
func _move() -> void:
	var _direction: Vector2 = Vector2(
		Input.get_axis("ui_left", "ui_right"),
		Input.get_axis("ui_up","ui_down")
	)
	
	if _direction != Vector2.ZERO:
		_animation_tree["parameters/idle/blend_position"] = _direction
		_animation_tree["parameters/walk/blend_position"] = _direction
		
		velocity.x = lerp(velocity.x, _direction.normalized().x * _move_speed, _acceleration)
		velocity.y = lerp(velocity.y, _direction.normalized().y * _move_speed, _acceleration)
		return
		
	velocity.x = lerp(velocity.x, _direction.normalized().x * _move_speed, _friction)
	velocity.y = lerp(velocity.y, _direction.normalized().y * _move_speed, _friction)

func player() -> void:
	pass

func _animate() -> void:
	if velocity.length() > 10:
		# Deixa o estado "idle" invisível e viaja para o estado "walk"
		$idle.visible = false
		$walk.visible = true
		_state_machine.travel("walk")
		return

	# Deixa o estado "idle" visível e viaja para o estado "idle"
	$idle.visible = true
	$walk.visible = false
	_state_machine.travel("idle")
