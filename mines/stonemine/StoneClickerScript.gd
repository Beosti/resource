class_name StoneClickerClass
extends AbstractClickerClass

func _ready():
	resourceName = GameData.STONE_RESOURCE;
	resourceID = GameData.STONE_ID;
	super._ready();

func dig_resource(amount: int):
	super(amount);
	if (AchievementData.mining_stone.state != Achievement.State.DONE):
		AchievementData.mining_stone.state = Achievement.State.DONE;
		emit_signal("achievement_updated")
