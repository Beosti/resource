class_name MerchantSceneScript
extends Control

@onready var gridContainerResources = $PanelContainer/MarginContainer/GridContainerResources;
signal main_menu_reset;

func _ready():
	gridContainerResources.get_child(1).text = "Stone value: %s" %GameData.STONE_VALUE;
	gridContainerResources.get_child(4).text = "Cole value: %s" %GameData.COAL_VALUE;
	gridContainerResources.get_child(7).text = "Raw Copper value: %s" %GameData.RAW_COPPER_VALUE;
	gridContainerResources.get_child(10).text = "Raw Iron value: %s" %GameData.RAW_IRON_VALUE;
	gridContainerResources.get_child(13).text = "Copper Matte value: %s" %GameData.COPPER_MATTE_VALUE;
	gridContainerResources.get_child(16).text = "Pig Iron value: %s" %GameData.PIG_IRON_VALUE;

func _on_line_edit_stone_text_submitted(new_text: String) -> void:
	if (!new_text.is_valid_int()):
		return;
	if (new_text.to_int() > GameData.stoneAmount):
		return;
	GameData.add_amount(GameData.STONE_ID, -new_text.to_int());
	GameData.add_zerre_amount(GameData.STONE_VALUE * new_text.to_int());
	gridContainerResources.get_child(2).clear();

func _on_line_edit_coal_text_submitted(new_text: String) -> void:
	if (!new_text.is_valid_int()):
		return;
	if (new_text.to_int() > GameData.coalAmount):
		return;
	GameData.add_amount(GameData.COAL_ID, -new_text.to_int());
	GameData.add_zerre_amount(GameData.COAL_VALUE * new_text.to_int());
	gridContainerResources.get_child(5).clear();

func _on_line_edit_raw_copper_text_submitted(new_text: String) -> void:
	if (!new_text.is_valid_int()):
		return;
	if (new_text.to_int() > GameData.rawCopperAmount):
		return;
	GameData.add_amount(GameData.RAW_COPPER_ID, -new_text.to_int());
	GameData.add_zerre_amount(GameData.RAW_COPPER_VALUE * new_text.to_int());
	gridContainerResources.get_child(8).clear();

func _on_line_edit_raw_iron_text_submitted(new_text: String) -> void:
	if (!new_text.is_valid_int()):
		return;
	if (new_text.to_int() > GameData.rawIronAmount):
		return;
	GameData.add_amount(GameData.RAW_IRON_ID, -new_text.to_int());
	GameData.add_zerre_amount(GameData.RAW_IRON_VALUE * new_text.to_int());
	gridContainerResources.get_child(11).clear();

func _on_line_edit_copper_matte_text_submitted(new_text: String) -> void:
	if (!new_text.is_valid_int()):
		return;
	if (new_text.to_int() > GameData.copperMatteAmount):
		return;
	GameData.add_amount(GameData.COPPER_MATTE_ID, -new_text.to_int());
	GameData.add_zerre_amount(GameData.COPPER_MATTE_VALUE * new_text.to_int());
	gridContainerResources.get_child(13).clear();

func _on_line_edit_pig_iron_text_changed(new_text: String) -> void:
	if (!new_text.is_valid_int()):
		return;
	if (new_text.to_int() > GameData.pigIronAmount):
		return;
	GameData.add_amount(GameData.PIG_IRON_ID, -new_text.to_int());
	GameData.add_zerre_amount(GameData.PIG_IRON_VALUE * new_text.to_int());
	gridContainerResources.get_child(16).clear();

func _on_main_ui_button_button_down() -> void:
	emit_signal("main_menu_reset");
