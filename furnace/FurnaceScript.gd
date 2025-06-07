class_name FurnaceClass
extends Control

@export var amountCoalInText: LineEdit;
@export var amountOreInText: LineEdit;
@export var optionButton: OptionButton;
@export var timer: Timer;
@export var waitTimerLabel: Label;

@onready var amountCoalInFurnaceText = $ControlCoal/ControlTextCoal/TextCoal;
@onready var amountRawOreInFurnaceText = $ControlOre/ControlTextOre/TextOre;

var amountCoalInFurnace: int;
var typeOreInFurnace: String;
var amountOreInFurnace: int;

signal smelt_ore_signal(typeOre: String);

# Displays of text
func _process(delta: float) -> void:
	waitTimerLabel.text = "%.1f" %timer.get_time_left();
	amountCoalInFurnaceText.text = "%s" %amountCoalInFurnace;
	amountRawOreInFurnaceText.text = "%s" %amountOreInFurnace;

# Submitting of coal, goes through a few checks and then changes the gamedata
func _on_amount_coal_text_submitted(new_text: String) -> void:
	if (!new_text.is_valid_int()):
		return;
	if (amountCoalInText.text.is_empty()):
		return;
	if (new_text.to_int() > GameData.coalAmount):
		return;
	amountCoalInText.clear();
	GameData.add_amount(GameData.COAL_ID, -new_text.to_int());
	amountCoalInFurnace += new_text.to_int();
	print("Total coal: %s" %amountCoalInFurnace);
	if (amountOreInFurnace > 0 && amountCoalInFurnace > 0):
		timer.start();

# Submitting of unprocessed ore, goes through a few checks and then changes the amounts
func _on_amount_ore_text_submitted(new_text: String) -> void:
	if (!new_text.is_valid_int()):
		return;
	if (amountOreInText.text.is_empty()):
		return;
	if (amountOreInFurnace == 0):
		typeOreInFurnace = optionButton.get_item_text(optionButton.get_selected_id());
	if (optionButton.get_item_text(optionButton.get_selected_id()) != typeOreInFurnace):
		return;
	if (new_text.to_int() > GameData.get_amount(GameData.match_id(optionButton.get_item_text(optionButton.get_selected_id())))):
		return;
	print(optionButton.get_item_text(optionButton.get_selected_id()));
	amountOreInText.clear();
	GameData.add_amount(GameData.match_id(optionButton.get_item_text(optionButton.get_selected_id())), -new_text.to_int());
	amountOreInFurnace += new_text.to_int();
	print("Total ore in furnace: %s" %amountOreInFurnace);
	if (amountOreInFurnace > 0 && amountCoalInFurnace > 0):
		timer.start();

# When ore is cooked does some additions etc.
func _on_timer_timeout() -> void:
	if (typeOreInFurnace == GameData.RAW_COPPER_RESOURCE):
		GameData.add_amount(GameData.COPPER_MATTE_ID, 1);
		smelt_ore_signal.emit(GameData.COPPER_MATTE_ID);
	if (typeOreInFurnace == GameData.RAW_IRON_RESOURCE):
		GameData.add_amount(GameData.PIG_IRON_ID, 1);
		smelt_ore_signal.emit(GameData.PIG_IRON_ID);
	amountCoalInFurnace -= 1;
	amountOreInFurnace -= 1;
	if (amountCoalInFurnace == 0):
		print("no coal anymore");
		timer.stop();
		return
	if (amountOreInFurnace == 0):
		print("no ore anymore");
		timer.stop();
		return;
