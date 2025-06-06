class_name BaseUiClass
extends Control

@export var stoneMineButton: Button;
@export var copperMineButton: Button;
@export var coalMineButton: Button;
@export var rawIronMineButton: Button;

@export var stoneClickerScene: StoneClickerClass;
@export var copperClickerScene: RawCopperClickerclass;
@export var coalClickerScene: CoalClickerClass;
@export var rawIronClickerScene: RawIronClickerClass;

@export var stoneResourceLabel: Label;
@export var coalResourceLabel: Label;
@export var rawCopperResourceLabel: Label;
@export var rawIronResourceLabel: Label;

@onready var mineContainer = $Mines;

func _ready():
	stoneClickerScene.connect("main_menu_reset", main_menu);
	copperClickerScene.connect("main_menu_reset", main_menu);
	coalClickerScene.connect("main_menu_reset", main_menu);
	rawIronClickerScene.connect("main_menu_reset", main_menu);
	
	stoneClickerScene.connect("dig_resource_signal", change_stone_mine_text);
	copperClickerScene.connect("dig_resource_signal", change_copper_mine_text);
	coalClickerScene.connect("dig_resource_signal", change_coal_mine_text);
	rawIronClickerScene.connect("dig_resource_signal", change_raw_iron_mine_text);
	
	stoneClickerScene.hide();
	copperClickerScene.hide();
	coalClickerScene.hide();
	rawIronClickerScene.hide();
	stoneMineButton.show();
	copperMineButton.show();
	coalMineButton.show();
	rawIronMineButton.show();

func change_stone_mine_text():
	stoneResourceLabel.text = "Stone: %s" %GameData.stoneAmount;
	stoneResourceLabel.tooltip_text = "Generating %s stone per second" % stoneClickerScene.diggers;
func change_copper_mine_text():
	rawCopperResourceLabel.text = "Raw copper: %s" %GameData.rawCopperAmount;
	rawCopperResourceLabel.tooltip_text = "Generating %s raw copper per second" % copperClickerScene.diggers;
func change_coal_mine_text():
	coalResourceLabel.text = "Coal: %s" %GameData.coalAmount;
	coalResourceLabel.tooltip_text = "Generating %s coal per second" % coalClickerScene.diggers;
func change_raw_iron_mine_text():
	rawIronResourceLabel.text = "Raw Iron: %s" %GameData.rawIronAmount;
	rawIronResourceLabel.tooltip_text = "Generating %s raw iron per second" % rawIronClickerScene.diggers;

func main_menu():
	get_node("Mines/StoneClickerScene").hide();
	get_node("Mines/RawCopperClickerScene").hide();
	get_node("Mines/CoalClickerScene").hide();
	get_node("Mines/RawIronClickerScene").hide();
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

func hide_buttons():
	get_node("ContainerMines").hide();

func show_buttons():
	get_node("ContainerMines").show();
