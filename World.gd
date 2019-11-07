extends Node

var new_ball = preload("res://Scenes/Ball.tscn")

export var score = 0
export var lives = 3

func increase_score(s):
	score += int(s)
	find_node("Score").update_score()
 
func decrease_lives():
	lives -= 1
	find_node("Lives").update_lives()
	if lives <= 0:
 		get_tree().change_scene("res://Scenes/End.tscn")

func make_ball():
	var ball = new_ball.instance()
	ball.position = find_node("Paddle").position - Vector2(0, 32)
	ball.name = "Ball"
	ball.linear_velocity = Vector2(200, -200)
	add_child(ball)
	