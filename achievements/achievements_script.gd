extends Control

@export var firstAchievementContainer: PanelContainer;
@export var firstAchievementTextureButton: TextureButton;

@export var secondAchievementContainer: PanelContainer;
@export var secondAchievementTextureButton: TextureButton;

@export var thirdAchievementContainer: PanelContainer;
@export var thirdAchievementTextureButton: TextureButton;

@export var fourthAchievementContainer: PanelContainer;
@export var fourthAchievementTextureButton: TextureButton;

@export var fifthAchievementContainer: PanelContainer;
@export var fifthAchievementTextureButton: TextureButton;

@export var sixthAchievementContainer: PanelContainer;
@export var sixthAchievementTextureButton: TextureButton;

@export var seventhAchievementContainer: PanelContainer;
@export var seventhAchievementTextureButton: TextureButton;

# MINING 100 COAL QUEST -> UNLOCKING SPEED UP
@export var eighthAchievementContainer: PanelContainer;
@export var eighthAchievementTextureButton: TextureButton;

# SELLING COAL QUEST -> UNLOCKING COPPER + DIGGER
@export var ninthAchievementContainer: PanelContainer;
@export var ninthAchievementTextureButton: TextureButton;

@onready var timer = $Timer;

signal main_menu_reset;
signal achievement_gui_pop(achievement);

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
			"achievement": AchievementData.first_to_riches,
			"button": thirdAchievementTextureButton,
			"container": thirdAchievementContainer,
		},
		{
			"achievement": AchievementData.digger,
			"button": fourthAchievementTextureButton,
			"container": fourthAchievementContainer
		},
		{
			"achievement": AchievementData.mining_coal,
			"button": fifthAchievementTextureButton,
			"container": fifthAchievementContainer,
		},
		{
			"achievement": AchievementData.mining_coals,
			"button": sixthAchievementTextureButton,
			"container": sixthAchievementContainer,
		},
		{
			"achievement": AchievementData.mining_100_stones,
			"button": seventhAchievementTextureButton,
			"container": seventhAchievementContainer,
		},
		{
			"achievement": AchievementData.mining_100_coal,
			"button": eighthAchievementTextureButton,
			"container": eighthAchievementContainer,
		},
		{
			"achievement": AchievementData.selling_coal,
			"button": ninthAchievementTextureButton,
			"container": ninthAchievementContainer,
		}
	]
	# Unlock second achievement if first is DONE
	if AchievementData.mining_stone.state == Achievement.State.DONE and AchievementData.mining_stones.state != Achievement.State.DONE:
		AchievementData.mining_stones.state = Achievement.State.DISCOVERED;
		secondAchievementContainer.show();
	if AchievementData.mining_stones.state == Achievement.State.DONE and AchievementData.first_to_riches.state != Achievement.State.DONE:
		AchievementData.first_to_riches.state = Achievement.State.DISCOVERED;
		thirdAchievementContainer.show();
	if AchievementData.first_to_riches.state == Achievement.State.DONE and AchievementData.digger.state != Achievement.State.DONE:
		AchievementData.digger.state = Achievement.State.DISCOVERED;
		fourthAchievementContainer.show();
	if AchievementData.digger.state == Achievement.State.DONE and AchievementData.mining_coal.state != Achievement.State.DONE:
		AchievementData.mining_coal.state = Achievement.State.DISCOVERED;
		fifthAchievementContainer.show();
	if AchievementData.mining_coal.state == Achievement.State.DONE and AchievementData.mining_coals.state != Achievement.State.DONE:
		AchievementData.mining_coals.state = Achievement.State.DISCOVERED;
		sixthAchievementContainer.show();
	if (AchievementData.selling_coal.state == Achievement.State.DONE and AchievementData.selling_coal.state != Achievement.State.DONE):
		AchievementData.selling_coal.state = Achievement.State.DISCOVERED;
		ninthAchievementContainer.show();
	if AchievementData.mining_stones.state == Achievement.State.DONE and AchievementData.first_to_riches.state == Achievement.State.DONE and AchievementData.mining_100_stones.state != Achievement.State.DONE:
		AchievementData.mining_100_stones.state = Achievement.State.DISCOVERED;
		seventhAchievementContainer.show();
	if AchievementData.mining_coals.state == Achievement.State.DONE and AchievementData.mining_100_coal.state != Achievement.State.DONE:
		AchievementData.mining_100_coal.state = Achievement.State.DISCOVERED;
		AchievementData.selling_coal.state = Achievement.State.DISCOVERED;
		eighthAchievementContainer.show();
		ninthAchievementContainer.show();
	# Hide second if first is not DISCOVERED yet
	if AchievementData.mining_stone.state != Achievement.State.DONE:
		secondAchievementContainer.hide()
		print("check 1")
	if AchievementData.mining_stones.state != Achievement.State.DONE:
		thirdAchievementContainer.hide();
		print("check 2")
		if AchievementData.first_to_riches.state != Achievement.State.DONE:
			seventhAchievementContainer.hide(); 
			print("check 3")
	if AchievementData.first_to_riches.state != Achievement.State.DONE:
		fourthAchievementContainer.hide()
		print("check 4")
	if AchievementData.digger.state != Achievement.State.DONE:
		fifthAchievementContainer.hide();
		print("check 5")
	if AchievementData.mining_coal.state != Achievement.State.DONE:
		sixthAchievementContainer.hide();
		print("check 6")
	if (AchievementData.mining_coals.state != Achievement.State.DONE):
		print("check 7")
		eighthAchievementContainer.hide();
		ninthAchievementContainer.hide();
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

# Here goes all the achievements, when an achievement is done it gets triggered and comes here
func on_update_achievement(achievement):
	_ready(); # Calls the method to check if achievements are done or not and then changes them in the achievement screen
	show_popping_achievement(achievement); # method handling the gui achievement pop

func show_popping_achievement(achievement) -> void:
	emit_signal("achievement_gui_pop", achievement); # -> sends signal to other node to show the achievement
	timer.start();
	pass;

func _on_timer_timeout() -> void:
	emit_signal("achievement_gui_pop", null); # -> sends signal to other node to hide the achievement 
	timer.stop();
	pass # Replace with function body.
