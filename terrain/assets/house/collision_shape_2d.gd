extends Area2D
var _player_ref: Character = null
@export_category("variables")
@export var _teleport_position: Vector2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body is Character:
		_player_ref = body as Character  # Set _player_ref to the Character instance
		_player_ref.global_position = _teleport_position
