class_name AbstractClickerClass
extends Node

@export var labelResource: Label;
@export var labelDigger: Label;
@export var buttonDigger: Button;

@export var diggerTimer: Timer;

var resource : int = 0;
var diggers : int = 0;
var costDiggers : int = 10;
var resourceName : String = "";

signal main_menu_reset;
signal dig_resource_signal;

func _ready():
	self.connect("dig_resource_signal", update_resource_label_text);
	update_resource_label_text();
	update_digger_label_text();
	update_digger_button_text();

func _on_button_digger_button_down() -> void:
	if resource < costDiggers:
		return;
	if (diggers == 0):
		diggerTimer.start();
	dig_resource(-costDiggers);
	increase_digger(1);
	increase_digger_amount(5 * diggers);

func _on_button_dig_button_down() -> void:
	dig_resource(1);

func dig_resource(amount: int):
	resource += amount;
	dig_resource_signal.emit;

func increase_digger(amount: int):
	diggers += amount;
	update_digger_label_text();

func increase_digger_amount(amount: int):
	costDiggers += amount;
	update_digger_button_text();

func update_resource_label_text():
	labelResource.text = "%s: %s\nPassive generation: +%s/s" % [resourceName, resource, diggers];

func update_digger_label_text():
	labelDigger.text = "Diggers: %s" %diggers;

func update_digger_button_text():
	buttonDigger.text = "Diggers cost: %s" %costDiggers;

func _on_digger_timer_timeout() -> void:
	dig_resource(diggers);

func _on_main_ui_button_button_down() -> void:
	emit_signal("main_menu_reset");
