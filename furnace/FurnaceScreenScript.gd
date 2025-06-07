extends Control

signal main_menu_reset;

func _on_main_ui_button_button_down() -> void:
	emit_signal("main_menu_reset");
