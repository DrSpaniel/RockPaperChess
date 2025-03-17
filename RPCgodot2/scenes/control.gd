extends Control



func _on_rock_button_down() -> void:
	var rand = (randi() % 3)
	print("hello")
	
	$result.texture = load("res://images/wrong.png")
	
	if (rand == 0):
		print("rock!")
		$opponent.texture = load("res://images/rock.png")
	elif (rand == 1):
		print("paper!")
		$opponent.texture = load("res://images/paper.png")
	elif (rand == 2):
		print("scissors!")
		$opponent.texture = load("res://images/scissors.png")
		
		
		
		
func rules(uInput, AiInput):	#this is the thing that decides who wins. takes opponent and user input, returns win or lose bool
	{}
		
func opponentGenerate(): #when any 3 user buttons are pressed, call this and itll randomize the action and then change the image. returns AiInput
	{}
