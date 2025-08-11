extends PanelContainer

@onready var textLabel = $RichTextLabel;

func _ready() -> void:
	self.hide();

func _on_achievement_screen_achievement_gui_pop(achievement) -> void:
	if (!self.visible):
		var achievementPrint = achievement as Achievement;
		textLabel.text = achievementPrint.flavorText;
		self.show();
	else:
		self.hide();
