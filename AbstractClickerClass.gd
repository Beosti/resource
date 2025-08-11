class_name AbstractClickerClass
extends Node

@export var labelResource: Label;
@export var labelDigger: Label;
@export var buttonDigger: Button;

@export var diggerTimer: Timer;

@onready var timer = $DiggerTimer;
@onready var buttonTimer = $Upgrades/MarginContainer/GridContainer/Button;
@onready var labelSpeedDigger = $ValueDiggerspeed;

var diggers : int = 0;
var costDiggers : int = 10;
var costDiggersSpeed : int = 100;
var resourceName : String = "resource";
var resourceID : String = "id";
signal main_menu_reset;
signal dig_resource_signal;
signal achievement_updated(achievement);

func _ready():
	self.connect("dig_resource_signal", update_resource_label_text);
	labelResource.text = "%s: 0" %resourceName;
	update_resource_label_text();
	update_digger_label_text();
	update_digger_button_text();
	update_digger_speed_button_text()

func _on_button_digger_button_down() -> void:
	if GameData.get_zerre_amount() < costDiggers:
		return;
	if (diggers == 0):
		diggerTimer.start();
		AchievementData.digger.state = Achievement.State.DONE;
		emit_signal("achievement_updated", AchievementData.digger);
	GameData.add_zerre_amount(-costDiggers);
	increase_digger(1);
	increase_digger_amount(5 * diggers);

func _on_button_button_down() -> void:
	if GameData.get_zerre_amount() < costDiggersSpeed:
		return;
	if (diggers == 0):
		return;
	GameData.add_zerre_amount(-costDiggersSpeed);
	timer.set_wait_time(timer.get_wait_time() - timer.get_wait_time() * 0.1) # speeds up by 10%
	increase_digger_speed_amount(costDiggersSpeed * 2);
	update_digger_speed_button_text()
	
func _on_button_dig_button_down() -> void:
	dig_resource(1);

func dig_resource(amount: int):
	GameData.add_amount(resourceID, amount);
	dig_resource_signal.emit();

func increase_digger(amount: int):
	diggers += amount;
	update_digger_label_text();

func increase_digger_amount(amount: int):
	costDiggers += amount;
	update_digger_button_text();

func increase_digger_speed_amount(amount: int):
	costDiggersSpeed += amount;

func update_resource_label_text():
	labelResource.text = "%s: %d\nPassive generation: +%d per %d seconds" % [resourceName, GameData.get_amount(resourceID), diggers, timer.get_wait_time()]

func update_digger_label_text():
	labelDigger.text = "Diggers: %s" %diggers;

func update_digger_speed_button_text():
	labelSpeedDigger.text = "Speed digger: 1 resource per %s seconds" %timer.get_wait_time();

func update_digger_button_text():
	buttonDigger.text = "Diggers cost: %s" %costDiggers;

func _on_digger_timer_timeout() -> void:
	dig_resource(diggers);

func _on_main_ui_button_button_down() -> void:
	emit_signal("main_menu_reset");
