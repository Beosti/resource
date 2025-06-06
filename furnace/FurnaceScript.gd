class_name FurnaceClass
extends Control

@export var amountCoalInText: LineEdit;
@export var amountOreInText: LineEdit;
@export var labelOutput: Label;
@export var optionButton: OptionButton;
@export var timer: Timer;
@export var waitTimerLabel: Label;

@onready var amountCoalInFurnaceText = $AmountCoalInFurnace;
@onready var amountRawOreInFurnaceText = $AmountRawOreInFurnace;

var amountCoalInFurnace: int;
var typeOreInFurnace: String;
var amountOreInFurnace: int;
var amountPureOre: int;

signal smelt_ore_signal;

func _process(delta: float) -> void:
	waitTimerLabel.text = "%.1f" %timer.get_time_left();
	amountCoalInFurnaceText.text = "%s" %amountCoalInFurnace;
	amountRawOreInFurnaceText.text = "%s" %amountOreInFurnace;

func _on_amount_coal_text_submitted(new_text: String) -> void:
	if (!new_text.is_valid_int()):
		return;
	if (amountCoalInText.text.is_empty()):
		return;
	amountCoalInText.clear();
	amountCoalInFurnace += new_text.to_int();
	print("Total coal: %s" %amountCoalInFurnace);
	if (amountOreInFurnace > 0 && amountCoalInFurnace > 0):
		timer.start();

func _on_amount_ore_text_submitted(new_text: String) -> void:
	if (!new_text.is_valid_int()):
		return;
	if (amountOreInText.text.is_empty()):
		return;
	if (amountOreInFurnace == 0):
		typeOreInFurnace = optionButton.get_item_text(optionButton.get_selected_id());
	if (optionButton.get_item_text(optionButton.get_selected_id()) != typeOreInFurnace):
		return;
	print(optionButton.get_item_text(optionButton.get_selected_id()));
	amountOreInText.clear();
	amountOreInFurnace += new_text.to_int();
	print("Total ore in furnace: %s" %amountOreInFurnace);
	if (amountOreInFurnace > 0 && amountCoalInFurnace > 0):
		timer.start();

func _on_timer_timeout() -> void:
	print("extra ore!")
	if (typeOreInFurnace == GameData.RAW_COPPER_RESOURCE):
		GameData.add_amount(GameData.COPPER_MATTE_ID, 1);
	if (typeOreInFurnace == GameData.RAW_IRON_RESOURCE):
		GameData.add_amount(GameData.PIG_IRON_ID, 1);
	smelt_ore_signal.emit();
	amountPureOre += 1;
	amountCoalInFurnace -= 1;
	amountOreInFurnace -= 1;
	#labelOutput.text = "%s" %amountPureOre;
	if (amountCoalInFurnace == 0):
		print("no coal anymore");
		timer.stop();
		return
	if (amountOreInFurnace == 0):
		print("no ore anymore");
		timer.stop();
		return;
