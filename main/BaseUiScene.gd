class_name BaseUiClass
extends Control

@export var stoneMineButton: Button;
@export var copperMineButton: Button;
@export var coalMineButton: Button;
@export var rawIronMineButton: Button;
@export var furnaceButton: Button;
@export var merchantButton: Button;
@onready var achievementButton = $ContainerMines/MarginContainer/GridContainer/AchievementButton;

@export var stoneClickerScene: StoneClickerClass;
@export var copperClickerScene: RawCopperClickerclass;
@export var coalClickerScene: CoalClickerClass;
@export var rawIronClickerScene: RawIronClickerClass;
@export var furnaceScene: Control;
@onready var merchantScene = $MerchantScene;
@onready var achievementScene = $AchievementScreen;

@onready var sellButtonStone = $ContainerResources/MarginContainer/VBoxContainer/GridContainer/SellButtonStone;
@onready var sellButtonCoal = $ContainerResources/MarginContainer/VBoxContainer/GridContainer/SellButtonCoal;
@onready var sellButtonRawCopper = $ContainerResources/MarginContainer/VBoxContainer/GridContainer/SellButtonRawCopper;
@onready var sellButtonRawIron = $ContainerResources/MarginContainer/VBoxContainer/GridContainer/SellButtonRawIron;
@onready var sellButtonCopperMatte = $ContainerResources/MarginContainer/VBoxContainer/GridContainer/SellButtonCopperMatte;
@onready var sellButtonPigIron = $ContainerResources/MarginContainer/VBoxContainer/GridContainer/SellButtonPigIron;


@export var stoneResourceLabel: Label;
@export var coalResourceLabel: Label;
@export var rawCopperResourceLabel: Label;
@export var rawIronResourceLabel: Label;
@export var copperMatteResourceLabel: Label;
@export var pigIronResourceLabel: Label;
@export var zerreLabel: Label;

@onready var mineContainer = $Mines;

signal achievement_updated(achievement);
signal update_unlocks();

func _process(delta: float) -> void:
	#sellButtonStone.mouse_filter = MOUSE_FILTER_PASS;
	#print(sellButtonStone.mouse_filter);
	stoneResourceLabel.text = "Stone: %s" %GameData.stoneAmount;
	stoneResourceLabel.tooltip_text = "Generating %s stone per second" % stoneClickerScene.diggers;
	coalResourceLabel.text = "Coal: %s" %GameData.coalAmount;
	coalResourceLabel.tooltip_text = "Generating %s coal per second" % coalClickerScene.diggers;
	rawCopperResourceLabel.text = "Raw Copper: %s" %GameData.rawCopperAmount;
	rawCopperResourceLabel.tooltip_text = "Generating %s raw copper per second" % copperClickerScene.diggers;
	rawIronResourceLabel.text = "Raw Iron: %s" %GameData.rawIronAmount;
	rawIronResourceLabel.tooltip_text = "Generating %s raw iron per second" % rawIronClickerScene.diggers;
	copperMatteResourceLabel.text = "Copper Matte: %s" %GameData.copperMatteAmount;
	pigIronResourceLabel.text = "Pig Iron: %s" %GameData.pigIronAmount;
	zerreLabel.text = "Zerre: %s" %GameData.get_zerre_amount();

func _ready():
	stoneClickerScene.connect("main_menu_reset", main_menu);
	copperClickerScene.connect("main_menu_reset", main_menu);
	coalClickerScene.connect("main_menu_reset", main_menu);
	rawIronClickerScene.connect("main_menu_reset", main_menu);
	furnaceScene.connect("main_menu_reset", main_menu);
	merchantScene.connect("main_menu_reset", main_menu);
	achievementScene.connect("main_menu_reset", main_menu);

	stoneClickerScene.hide();
	copperClickerScene.hide();
	coalClickerScene.hide();
	rawIronClickerScene.hide();
	furnaceScene.hide();
	merchantScene.hide();
	achievementScene.hide();
	
	sellButtonStone.modulate.a = 0;
	sellButtonStone.set_disabled(true);
	#sellButtonStone.hide();
	sellButtonCoal.modulate.a = 0;
	sellButtonCoal.set_disabled(true);
	#sellButtonCoal.hide();
	sellButtonRawCopper.modulate.a = 0;
	sellButtonRawCopper.set_disabled(true);
	#sellButtonRawCopper.hide();
	sellButtonRawIron.modulate.a = 0;
	sellButtonRawIron.set_disabled(true);
	#sellButtonRawIron.hide();
	sellButtonCopperMatte.modulate.a = 0;
	sellButtonCopperMatte.set_disabled(true);
	#sellButtonCopperMatte.hide();
	sellButtonPigIron.modulate.a = 0;
	sellButtonPigIron.set_disabled(true);
	#sellButtonPigIron.hide();

	show_buttons_unlock();

func show_buttons_unlock() -> void:
	stoneMineButton.show();
	if ProgressionData.unlockedStoneSelling:
		sellButtonStone.modulate.a = 1;
		sellButtonStone.set_disabled(false);
	if ProgressionData.unlockedAchievements:
		achievementButton.show();
	else:
		achievementButton.hide();
	if ProgressionData.unlockedCopper:
		copperMineButton.show();
	else:
		copperMineButton.hide();
	if ProgressionData.unlockedCoal:
		coalMineButton.show();
	else:
		coalMineButton.hide();
	rawIronMineButton.hide();
	if ProgressionData.unlockedFurnace:
		furnaceButton.show();
	else:
		furnaceButton.hide();
	if ProgressionData.unlockedMerchant:
		merchantButton.show();
	else:
		merchantButton.hide();

func main_menu():
	get_node("Mines/StoneClickerScene").hide();
	get_node("Mines/RawCopperClickerScene").hide();
	get_node("Mines/CoalClickerScene").hide();
	get_node("Mines/RawIronClickerScene").hide();
	get_node("FurnaceScreen").hide();
	get_node("MerchantScene").hide();
	get_node("ContainerMines").show();
	get_node("AchievementScreen").hide();

func _on_stone_mine_button_button_down() -> void:
	get_node("Mines/StoneClickerScene").show();
	hide_buttons();
func _on_copper_mine_button_button_down() -> void:
	get_node("Mines/RawCopperClickerScene").show();
	hide_buttons();
func _on_coal_mine_button_button_down() -> void:
	get_node("Mines/CoalClickerScene").show();
	hide_buttons();
func _on_raw_iron_mine_button_button_down() -> void:
	get_node("Mines/RawIronClickerScene").show();
	hide_buttons();
func _on_furnace_button_button_down() -> void:
	get_node("FurnaceScreen").show();
	hide_buttons();
func _on_merchant_button_button_down() -> void:
	get_node("MerchantScene").show();
	hide_buttons();
func _on_button_button_down() -> void:
	get_node("AchievementScreen").show();
	hide_buttons();
func hide_buttons():
	get_node("ContainerMines").hide();
func show_buttons():
	get_node("ContainerMines").show();


func _on_sell_button_stone_button_down() -> void:
	if AchievementData.first_to_riches.state != Achievement.State.DONE:
		AchievementData.first_to_riches.state = Achievement.State.DONE;
		emit_signal("achievement_updated", AchievementData.first_to_riches);
		ProgressionData.unlockedDigger = true;
		emit_signal("update_unlocks")
	GameData.add_zerre_amount(GameData.STONE_VALUE * GameData.stoneAmount);
	GameData.add_amount(GameData.STONE_ID, -GameData.stoneAmount);
	pass # Replace with function body.

func _on_sell_button_coal_button_down() -> void:
	GameData.add_zerre_amount(GameData.COAL_VALUE * GameData.coalAmount);
	GameData.add_amount(GameData.COAL_ID, -GameData.coalAmount);
	pass # Replace with function body.

func _on_sell_button_raw_copper_button_down() -> void:
	GameData.add_zerre_amount(GameData.RAW_COPPER_VALUE * GameData.rawCopperAmount);
	GameData.add_amount(GameData.RAW_COPPER_ID, -GameData.rawCopperAmount);
	pass # Replace with function body.

func _on_sell_button_raw_iron_button_down() -> void:
	GameData.add_zerre_amount(GameData.RAW_IRON_VALUE * GameData.rawIronAmount);
	GameData.add_amount(GameData.RAW_IRON_ID, -GameData.rawIronAmount);
	pass # Replace with function body.

func _on_sell_button_copper_matte_button_down() -> void:
	GameData.add_zerre_amount(GameData.COPPER_MATTE_VALUE * GameData.copperMatteAmount);
	GameData.add_amount(GameData.COPPER_MATTE_ID, -GameData.copperMatteAmount);
	pass # Replace with function body.

func _on_sell_button_pig_iron_button_down() -> void:
	GameData.add_zerre_amount(GameData.PIG_IRON_VALUE * GameData.pigIronAmount);
	GameData.add_amount(GameData.PIG_IRON_ID, -GameData.pigIronAmount);
	pass # Replace with function body.


func _on_stone_clicker_scene_update_unlocks() -> void:
	show_buttons_unlock();
	pass # Replace with function body.
