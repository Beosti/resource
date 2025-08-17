extends PanelContainer

@onready var textLabel = $RichTextLabel;

func _ready() -> void:
	self.hide();
	print("HIDDEN")

func _on_unlock_gui_pop(unlock_string: String = "") -> void:
	if (!self.visible):
		print(unlock_string)
		textLabel.text = "[center]" + unlock_string + "[/center]";
		var timer : Timer = Timer.new();
		add_child(timer);
		timer.one_shot = true;
		timer.autostart = false;
		timer.wait_time = 2.5;
		timer.timeout.connect(hide_itself);
		timer.start();
		self.show();

func hide_itself() -> void:
	self.hide();
