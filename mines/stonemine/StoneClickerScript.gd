class_name StoneClickerClass
extends AbstractClickerClass

func _ready():
	resourceName = GameData.STONE_RESOURCE;
	resourceID = GameData.STONE_ID;
	super._ready();
