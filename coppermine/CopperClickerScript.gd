class_name CopperClickerClass;
extends Control

@export var labelCopper : Label;
@export var labelDigger: Label;
@export var buttonDigger: Button;

@export var diggerTimer: Timer;

var copper : int = 0;
var diggers : int = 0;
var costDiggers : int = 10;

signal main_menu_reset;

func _ready():
	update_copper_label_text();
	update_digger_label_text();
	update_digger_button_text();

func _on_button_digger_button_down() -> void:
	if copper < costDiggers:
		return;
	if (diggers == 0):
		diggerTimer.start();
	dig_copper(-costDiggers);
	increase_digger(1);
	increase_digger_amount(5 * diggers);

func _on_button_dig_button_down() -> void:
	dig_copper(1);
	update_copper_label_text();

func dig_copper(amount: int):
	copper += amount;
	update_copper_label_text();

func increase_digger(amount: int):
	diggers += amount;
	update_digger_label_text();

func increase_digger_amount(amount: int):
	costDiggers += amount;
	update_digger_button_text();

func update_copper_label_text():
	labelCopper.text = "Raw copper: %s\nPassive generation: +%s/s" % [copper, diggers];

func update_digger_label_text():
	labelDigger.text = "Diggers: %s" %diggers;

func update_digger_button_text():
	buttonDigger.text = "Acquire digger: %s copper" %costDiggers;

func _on_digger_timer_timeout() -> void:
	dig_copper(diggers);


func _on_main_menu_reset_button_button_down() -> void:
	main_menu_reset.emit();
	pass # Replace with function body.
