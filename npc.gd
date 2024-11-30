extends CharacterBody2D

const speed = 30
var current_state = IDLE

var dir = Vector2.RIGHT
var start_pos

var is_roaming = true
var is_chatting = false

var player
var player_in_chat = false

enum {
	IDLE,
	NEW_DIR,
	MOVE
}

func _ready():
	randomize()
	start_pos = position 

func _process(delta):
	if current_state == 0 or current_state == 1:
		$AnimatedSprite2D.play("idle")  
		$QuestMark.play("idle")
		
	if Input.is_action_just_pressed("chat"):
		print("chatting")
		is_roaming = false
		$QuestMark.visible = false
		is_chatting = true
		$AnimatedSprite2D.play("idle")
		
func _on_chat_detection_area_body_entered(body):
	if body.has_method("player"):
		player = body
		player_in_chat = true
		
func _on_chat_detection_area_body_exited(body):
	if body.has_method("player"):
		player_in_chat = false
		
