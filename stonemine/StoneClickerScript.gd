class_name StoneClickerClass
extends Control

@export var labelStone : Label;
@export var labelDigger: Label;
@export var buttonDigger: Button;

@export var diggerTimer: Timer;

var stone : int = 0;
var diggers : int = 0;
var costDiggers : int = 10;

signal main_menu_reset;
signal dig_stone_signal;

func _ready():
	self.connect("dig_stone_signal", update_stone_label_text);
	update_stone_label_text();
	update_digger_label_text();
	update_digger_button_text();

func _on_button_digger_button_down() -> void:
	if stone < costDiggers:
		return;
	if (diggers == 0):
		diggerTimer.start();
	dig_stone(-costDiggers);
	increase_digger(1);
	increase_digger_amount(5 * diggers);

func _on_button_dig_button_down() -> void:
	dig_stone(1);

func dig_stone(amount: int):
	stone += amount;
	dig_stone_signal.emit();

func increase_digger(amount: int):
	diggers += amount;
	update_digger_label_text();

func increase_digger_amount(amount: int):
	costDiggers += amount;
	update_text(buttonDigger.text, "Diggers cost: %s" %costDiggers);
	update_digger_button_text();

func update_stone_label_text():
	labelStone.text = "Stone: %s\nPassive generation: +%s/s" % [stone, diggers];

func update_digger_label_text():
	labelDigger.text = "Diggers: %s" %diggers;

func update_digger_button_text():
	buttonDigger.text = "Diggers cost: %s" %costDiggers;

func update_text(text: String, newText: String):
	text = newText;

func _on_digger_timer_timeout() -> void:
	dig_stone(diggers);

func _on_main_ui_button_button_down() -> void:
	emit_signal("main_menu_reset");
	pass;
	
