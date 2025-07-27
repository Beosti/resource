extends Node

var achievements = [];


func load_achievements():
	achievements.clear()
	for file in DirAccess.get_files_at("res://achievements/achievements"):
		if file.ends_with(".tres"):
			var ach = load("res://achievements/achievements/" + file)
			achievements.append(ach)

func unlock_achievement(ID: String):
	for ach in achievements:
		if ach.ID == ID and ach.state != Achievement.State.DONE:
			ach.state = Achievement.State.DONE
			print("Achievement unlocked:", ach.ID)
			# Call signal or function to update UI, save progress, etc.
