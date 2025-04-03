extends Control



func _on_rock_button_button_down() -> void:
	gameDecision(0) #0 for rock, 1 for scissors, 2 for paper
	
func _on_scissors_button_button_down() -> void:
	gameDecision(1)

func _on_paper_button_button_down() -> void:
	gameDecision(2)

func gameDecision(uChoice): #called on any 3 button presses, recieves user input, returns opponent's image, and result
	return rules(uChoice, opponentGenerate())
		
func rules(uInput, AiInput):	#this is the thing that decides who wins. takes opponent and user input, returns win or lose bool
	if (uInput == AiInput): #tie
		$result.texture = load("res://imagesv2_rpc/question.png") #tie
	else:
		if((uInput+1)%3 == AiInput):	#is the users input moving up one the same as the aiinput? if so win, if same tie, is not lose. modulus is for looping back around when paper is chosen for the user.
			$result.texture = load("res://imagesv2_rpc/right.png")
		else:
			$result.texture = load("res://imagesv2_rpc/wrong.png")
	
func opponentGenerate(): #when any 3 user buttons are pressed, call this and itll randomize the action and then change the image. returns AiInput
	var rand = (randi() % 3)
	var imgDictionary = {0: "res://imagesv2_rpc/rock.png", 1: "res://imagesv2_rpc/scissors.png", 2: "res://imagesv2_rpc/paper.png"}
	$opponent.texture = load(imgDictionary[rand])
	return rand
