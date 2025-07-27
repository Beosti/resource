extends Control

@export var firstAchievementContainer: PanelContainer;
@export var firstAchievementTextureButton: TextureButton;
@export var firstAchievement: Achievement;

@export var secondAchievementContainer: PanelContainer;
@export var secondAchievementTextureButton: TextureButton;
@export var secondAchievement: Achievement;

@export var thirdAchievementContainer: PanelContainer;
@export var thirdAchievementTextureButton: TextureButton;
@export var thirdAchievement: Achievement;

# Array for achievements
# Go through array check if achievement is done or not
# If it is not discovered at all then it is hidden
# if it is discovered then it can stay and tooltip changes
# if it is done then it has another color and tooltip changes

func _ready() -> void:
	var achievements = [
		{
			"achievement": firstAchievement,
			"button": firstAchievementTextureButton,
			"container": firstAchievementContainer
		},
		{
			"achievement": secondAchievement,
			"button": secondAchievementTextureButton,
			"container": secondAchievementContainer
		},
		{
			"achievement": thirdAchievement,
			"button": thirdAchievementTextureButton,
			"container": thirdAchievementContainer
		}
	]
	for i in achievements.size():
		_process_achievement(achievements[i]);

	# Unlock second achievement if first is DONE
	if firstAchievement.state == Achievement.State.DONE and secondAchievement.state != Achievement.State.DONE:
		secondAchievement.state = Achievement.State.DISCOVERED
	if secondAchievement.state == Achievement.State.DONE and thirdAchievement.state != Achievement.State.DONE:
		thirdAchievement.state = Achievement.State.DISCOVERED
	# Hide second if first is not DISCOVERED yet
	if firstAchievement.state == Achievement.State.DISCOVERED:
		secondAchievementContainer.hide()
	if secondAchievement.state != Achievement.State.DONE:
		thirdAchievementContainer.hide()

func _process_achievement(entry: Dictionary) -> void:
	var ach = entry.get("achievement", null) as Achievement
	var btn = entry["button"] as TextureButton
	var container = entry["container"] as PanelContainer


	match ach.state:
		Achievement.State.DISCOVERED:
			btn.texture_normal = ach.icon
			btn.tooltip_text = ach.description

		Achievement.State.DONE:
			btn.texture_normal = ach.icon
			btn.tooltip_text = "%s\n%s" % [ach.title, ach.description]

			var stylebox := StyleBoxFlat.new()
			stylebox.bg_color = Color8(212, 175, 55)
			container.add_theme_stylebox_override("panel", stylebox)
