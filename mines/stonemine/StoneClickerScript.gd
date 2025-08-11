class_name StoneClickerClass
extends AbstractClickerClass

func _ready():
	resourceName = GameData.STONE_RESOURCE;
	resourceID = GameData.STONE_ID;
	super._ready();

func dig_resource(amount: int):
	super(amount);
	# Achievement "Mining Stone" -> Dig your first stone
	if (AchievementData.mining_stone.state != Achievement.State.DONE):
		AchievementData.mining_stone.state = Achievement.State.DONE;
		emit_signal("achievement_updated", AchievementData.mining_stone);
	# Achievement "Mining Stones" -> Dig your first ten stones
	if (GameData.stoneAmount == 10 && AchievementData.mining_stones.state != Achievement.State.DONE):
		AchievementData.mining_stones.state = Achievement.State.DONE;
		emit_signal("achievement_updated", AchievementData.mining_stones);
