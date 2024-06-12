extends Panel

var textures = {
	0: load("res://assets/key_peg_empty.png"),
	1: load("res://assets/key_peg_white.png"),
	2: load("res://assets/key_peg_black.png")
}

func show_evaluation(evaluations):
	var texture = [0, 0, 0, 0]
	for n in range(len(evaluations)):
		texture[n] = evaluations[n]
		
	$Verif0.texture = textures[texture[0]]
	$Verif1.texture = textures[texture[1]]
	$Verif2.texture = textures[texture[2]]
	$Verif3.texture = textures[texture[3]]
