extends AbstractClickerClass
class_name CoalClickerClass

signal update_unlocks;

func _ready():
	resourceName = GameData.COAL_RESOURCE;
	resourceID = GameData.COAL_ID;
	super._ready();

# override from AbstractClickerClass
func dig_resource(amount: int):
	super(amount);
	GameData.coalMined += 1;
	# Achievement "Digging coal" -> dig your first coal
	if (AchievementData.mining_coal.state != Achievement.State.DONE):
		ProgressionData.unlockedMerchant = true;
		emit_signal("update_unlocks", "Unlocked: merchant tab"); # -> unlocks sell button
		AchievementData.mining_coal.state = Achievement.State.DONE;
		emit_signal("achievement_updated", AchievementData.mining_coal); # -> done achievement
	if (GameData.coalMined == 10 && AchievementData.mining_coals.state != Achievement.State.DONE):
		AchievementData.mining_coals.state = Achievement.State.DONE;
		emit_signal("achievement_updated", AchievementData.mining_coals);
		ProgressionData.unlockedCoalSelling = true;
		emit_signal("update_unlocks", "Unlocked: coal selling");
	if (GameData.coalMined == 100 && AchievementData.mining_100_coal.state != Achievement.State.DONE):
		AchievementData.mining_100_coal.state = Achievement.State.DONE;
		emit_signal("achievement_updated", AchievementData.mining_100_coal);
		emit_signal("update_unlocks", "Unlocked: coal speed up digger", AchievementData.mining_100_coal.title) 

func digger_button_show() -> void:
	buttonDigger.show();


func _on_unlock_speed_digger_coal() -> void:
	buttonTimer.show();
