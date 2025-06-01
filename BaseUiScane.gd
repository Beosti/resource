class_name BaseUiClass
extends Control

var stoneMineScene = preload("res://stonemine/StoneClickerScene.tscn");
var copperMineScene = preload("res://coppermine/CopperClickerScene.tscn");

@export var stoneMineButton: Button;
@export var copperMineButton: Button;

@export var stoneClickerScene: StoneClickerClass;

@onready var mineContainer = $Mines;

func _ready():
	$Mines/StoneClicker.connect("main_menu_reset", main_menu);
	$Mines/CopperClicker.connect("main_menu_reset", main_menu);
	$Mines/StoneClicker.connect("dig_stone_signal", change_stone_mine_text);
	get_node("Mines/StoneClicker").hide();
	get_node("Mines/CopperClicker").hide();
	stoneMineButton.show();
	copperMineButton.show();

func change_stone_mine_text():
	stoneMineButton.text = "Stone Mine\nStone: %s" %stoneClickerScene.stone; 

func main_menu():
	get_node("Mines/StoneClicker").hide();
	get_node("Mines/CopperClicker").hide();
	stoneMineButton.show();
	copperMineButton.show();

func _on_stone_mine_button_button_down() -> void:
	get_node("Mines/StoneClicker").show();
	hide_buttons();

func _on_copper_mine_button_button_down() -> void:
	get_node("Mines/CopperClicker").show();
	hide_buttons();

func hide_buttons():
	stoneMineButton.hide();
	copperMineButton.hide();

func show_buttons():
	stoneMineButton.show();
	copperMineButton.show();
