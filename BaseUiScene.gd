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
	stoneMineButton.text = "Stone Mine\nStone: %s" %stoneClickerScene.stone; 
func change_copper_mine_text():
	copperMineButton.text = "Copper Mine\nRaw copper: %s" %copperClickerScene.copper;
func change_coal_mine_text():
	coalMineButton.text = "Coal Mine\nCoal: %s" %coalClickerScene.resource;

func main_menu():
	get_node("Mines/StoneClicker").hide();
	get_node("Mines/CopperClicker").hide();
	get_node("Mines/CoalClicker").hide();
	stoneMineButton.show();
	copperMineButton.show();
	coalMineButton.show();

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
	stoneMineButton.hide();
	copperMineButton.hide();
	coalMineButton.hide();

func show_buttons():
	stoneMineButton.show();
	copperMineButton.show();
	coalMineButton.show();
