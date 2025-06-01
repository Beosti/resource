class_name BaseUiClass
extends Control

var stoneMineScene = preload("res://stonemine/StoneClickerScene.tscn");
var copperMineScene = preload("res://coppermine/CopperClickerScene.tscn");

@export var stoneMineButton: Button;
@export var copperMineButton: Button;
@export var coalMineButton: Button;

@export var stoneClickerScene: StoneClickerClass;
@export var copperClickerScene: CopperClickerClass;
@export var coalClickerScene: CoalClickerClass;

@export var stoneResourceLabel: Label;
@export var coalResourceLabel: Label;
@export var rawCopperResourceLabel: Label;

@onready var mineContainer = $Mines;

func _ready():
	$Mines/StoneClicker.connect("main_menu_reset", main_menu);
	$Mines/CopperClicker.connect("main_menu_reset", main_menu);
	$Mines/CoalClicker.connect("main_menu_reset", main_menu);
	$Mines/StoneClicker.connect("dig_stone_signal", change_stone_mine_text);
	$Mines/CopperClicker.connect("dig_copper_signal", change_copper_mine_text);
	$Mines/CoalClicker.connect("dig_resource_signal", change_coal_mine_text);
	get_node("Mines/StoneClicker").hide();
	get_node("Mines/CopperClicker").hide();
	get_node("Mines/CoalClicker").hide();
	stoneMineButton.show();
	copperMineButton.show();
	coalMineButton.show();

func change_stone_mine_text():
	stoneResourceLabel.text = "Stone: %s" %stoneClickerScene.stone;
	stoneResourceLabel.tooltip_text = "Generating %s stone per second" % stoneClickerScene.diggers;
func change_copper_mine_text():
	rawCopperResourceLabel.text = "Raw copper: %s" %copperClickerScene.copper;
	rawCopperResourceLabel.tooltip_text = "Generating %s raw copper per second" % copperClickerScene.diggers;
func change_coal_mine_text():
	coalResourceLabel.text = "Coal: %s" %coalClickerScene.resource;
	coalResourceLabel.tooltip_text = "Generating %s coal per second" % coalClickerScene.diggers;

func main_menu():
	get_node("Mines/StoneClicker").hide();
	get_node("Mines/CopperClicker").hide();
	get_node("Mines/CoalClicker").hide();
	stoneMineButton.show();
	copperMineButton.show();
	coalMineButton.show();
	get_node("PanelContainer").show();

func _on_stone_mine_button_button_down() -> void:
	get_node("Mines/StoneClicker").show();
	hide_buttons();

func _on_copper_mine_button_button_down() -> void:
	get_node("Mines/CopperClicker").show();
	hide_buttons();

func _on_coal_mine_button_button_down() -> void:
	get_node("Mines/CoalClicker").show();
	hide_buttons();

func hide_buttons():
	get_node("PanelContainer").hide();
	stoneMineButton.hide();
	copperMineButton.hide();
	coalMineButton.hide();

func show_buttons():
	get_node("PanelContainer").show();
	stoneMineButton.show();
	copperMineButton.show();
	coalMineButton.show();
