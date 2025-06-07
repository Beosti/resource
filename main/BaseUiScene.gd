class_name BaseUiClass
extends Control

@export var stoneMineButton: Button;
@export var copperMineButton: Button;
@export var coalMineButton: Button;
@export var rawIronMineButton: Button;
@export var furnaceButton: Button;
@export var merchantButton: Button;

@export var stoneClickerScene: StoneClickerClass;
@export var copperClickerScene: RawCopperClickerclass;
@export var coalClickerScene: CoalClickerClass;
@export var rawIronClickerScene: RawIronClickerClass;
@export var furnaceScene: Control;
@onready var merchantScene = $MerchantScene;

@export var stoneResourceLabel: Label;
@export var coalResourceLabel: Label;
@export var rawCopperResourceLabel: Label;
@export var rawIronResourceLabel: Label;
@export var copperMatteResourceLabel: Label;
@export var pigIronResourceLabel: Label;
@export var zerreLabel: Label;

@onready var mineContainer = $Mines;


func _process(delta: float) -> void:
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

	stoneClickerScene.hide();
	copperClickerScene.hide();
	coalClickerScene.hide();
	rawIronClickerScene.hide();
	furnaceScene.hide();
	merchantScene.hide();
	
	stoneMineButton.show();
	copperMineButton.show();
	coalMineButton.show();
	rawIronMineButton.show();
	furnaceButton.show();
	merchantButton.show();

func main_menu():
	get_node("Mines/StoneClickerScene").hide();
	get_node("Mines/RawCopperClickerScene").hide();
	get_node("Mines/CoalClickerScene").hide();
	get_node("Mines/RawIronClickerScene").hide();
	get_node("FurnaceScreen").hide();
	get_node("MerchantScene").hide();
	get_node("ContainerMines").show();
	

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
func hide_buttons():
	get_node("ContainerMines").hide();
func show_buttons():
	get_node("ContainerMines").show();
