extends Control

@export var firstAchievementContainer: PanelContainer;
@export var firstAchievementTextureButton: TextureButton;

@export var secondAchievementContainer: PanelContainer;
@export var secondAchievementTextureButton: TextureButton;

@export var thirdAchievementContainer: PanelContainer;
@export var thirdAchievementTextureButton: TextureButton;
@export var thirdAchievement: Achievement;

# Array for achievements
# Go through array check if achievement is done or not
# If it is not discovered at all then it is hidden
# if it is discovered then it can stay and tooltip changes
# if it is done then it has another color and tooltip changes

signal main_menu_reset;

func _on_main_ui_button_button_down() -> void:
	emit_signal("main_menu_reset");

func _ready() -> void:
	var achievements = [
		{
			"achievement": AchievementData.mining_stone,
			"button": firstAchievementTextureButton,
			"container": firstAchievementContainer
		},
		{
			"achievement": AchievementData.mining_stones,
			"button": secondAchievementTextureButton,
			"container": secondAchievementContainer
		},
		{
			"achievement": thirdAchievement,
			"button": thirdAchievementTextureButton,
			"container": thirdAchievementContainer
		}
	]
	# Unlock second achievement if first is DONE
	if AchievementData.mining_stone.state == Achievement.State.DONE and AchievementData.mining_stones.state != Achievement.State.DONE:
		AchievementData.mining_stones.state = Achievement.State.DISCOVERED
		secondAchievementContainer.show();
	if AchievementData.mining_stones.state == Achievement.State.DONE and thirdAchievement.state != Achievement.State.DONE:
		thirdAchievement.state = Achievement.State.DISCOVERED
	# Hide second if first is not DISCOVERED yet
	if AchievementData.mining_stone.state == Achievement.State.DISCOVERED:
		secondAchievementContainer.hide()
	if AchievementData.mining_stones.state != Achievement.State.DONE:
		thirdAchievementContainer.hide()
	# do something when receiving a signal
	for i in achievements.size():
		_process_achievement(achievements[i]);





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


func _on_stone_clicker_scene_achievement_updated() -> void:
	_ready();
	pass # Replace with function body.
