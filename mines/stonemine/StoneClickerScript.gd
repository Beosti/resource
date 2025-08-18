class_name StoneClickerClass
extends AbstractClickerClass

signal update_unlocks;

func _ready():
	resourceName = GameData.STONE_RESOURCE;
	resourceID = GameData.STONE_ID;
	super._ready();

func dig_resource(amount: int):
	super(amount);
	GameData.stoneMined += 1;
	# Achievement "Mining Stone" -> Dig your first stone
	if (AchievementData.mining_stone.state != Achievement.State.DONE):
		ProgressionData.unlockedAchievements = true;
		emit_signal("update_unlocks", "Unlocked: achievements tab");
		AchievementData.mining_stone.state = Achievement.State.DONE;
		emit_signal("achievement_updated", AchievementData.mining_stone);
	# Achievement "Mining Stones" -> Dig your first ten stones
	if (GameData.stoneMined == 10 && AchievementData.mining_stones.state != Achievement.State.DONE):
		AchievementData.mining_stones.state = Achievement.State.DONE;
		emit_signal("achievement_updated", AchievementData.mining_stones);
		ProgressionData.unlockedStoneSelling = true;
		emit_signal("update_unlocks", "Unlocked: stone selling");
	if (GameData.stoneMined == 100 && AchievementData.first_to_riches.state == Achievement.State.DONE && AchievementData.mining_100_stones.state != Achievement.State.DONE):
		AchievementData.mining_100_stones.state = Achievement.State.DONE;
		emit_signal("achievement_updated", AchievementData.mining_100_stones);
		emit_signal("update_unlocks", "Unlocked: Digger speed up");
		#speed_up_button();s

func _on_button_digger_button_down() -> void:
	super();
	# Achievement "Digger" -> acquire your first digger
	if (AchievementData.digger.state != Achievement.State.DONE):
		AchievementData.digger.state = Achievement.State.DONE;
		emit_signal("achievement_updated", AchievementData.digger);
		ProgressionData.unlockedCoal = true;
		emit_signal("update_unlocks", "Unlocked: coal mine");

func digger_button_show() -> void:
	if ProgressionData.unlockedDigger:
		buttonDigger.show();

func digger_speed_up_button_show() -> void:
	if ProgressionData.unlockedStoneSpeedDigger:
		buttonTimer.show();
