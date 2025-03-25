extends Control



func _on_rock_button_down() -> void:
	gameDecision(0) #0 for rock, 1 for paper, 2 for scissors
	
func _on_scissors_button_down() -> void:
	gameDecision(1)

func _on_paper_button_down() -> void:
	gameDecision(2)

func gameDecision(uChoice): #called on any 3 button presses, recieves user input, returns opponent's image, and result
	return rules(uChoice, opponentGenerate())
		
func rules(uInput, AiInput):	#this is the thing that decides who wins. takes opponent and user input, returns win or lose bool
	if (uInput == AiInput): #tie
		$result.texture = load("res://images/question.png") #tie
	else:
		if((uInput+1)%3 == AiInput):
			$result.texture = load("res://images/right.png")
		else:
			$result.texture = load("res://images/wrong.png")
	
func opponentGenerate(): #when any 3 user buttons are pressed, call this and itll randomize the action and then change the image. returns AiInput
	var rand = (randi() % 3)
	var imgDictionary = {0: "res://images/rock.png", 1: "res://images/scissors.png", 2: "res://images/paper.png"}
	$opponent.texture = load(imgDictionary[rand])
	return rand
