extends Node2D

func _on_Player1Wall_body_exited(body):
	ScoreKeeper.p1_score += 1
	update_and_reload()

func _on_Player2Wall_body_exited(body):
	ScoreKeeper.p2_score += 1
	update_and_reload()

func _ready():
	update_score_board()

func update_score_board():
	$TextContainer/Score.set_text(str(ScoreKeeper.p1_score, ":", ScoreKeeper.p2_score))

func update_and_reload():
	update_score_board()
	get_tree().reload_current_scene()
