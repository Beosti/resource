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
	# Achievement "Digging coal" -> dig your first coal
	if (AchievementData.mining_coal.state != Achievement.State.DONE):
		ProgressionData.unlockedCoalSelling = true;
		emit_signal("update_unlocks"); # -> unlocks sell button
		AchievementData.mining_coal.state = Achievement.State.DONE;
		emit_signal("achievement_updated", AchievementData.mining_coal); # -> done achievement
