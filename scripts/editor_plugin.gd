@tool
extends EditorPlugin

const AUTOLOAD_NAME = "ResourceEditor"
const AUTOLOAD_PATH = "res://addons/resource_editor/utils/resource_editor.gd"
const PANEL_SCENE_PATH = "res://addons/resource_editor/panel/cafe_side_panel.tscn"
const RESOURCE_TOP_PANEL_SCENE_PATH = "res://addons/resource_editor/panel/resource_top_panel.tscn"

var plugin_panel: ScrollContainer
var resource_top_panel_instance: Control

func _enable_plugin() -> void:
	if not ProjectSettings.has_setting("autoload/" + AUTOLOAD_NAME):
		add_autoload_singleton(AUTOLOAD_NAME, AUTOLOAD_PATH)

func _disable_plugin() -> void:
	if ProjectSettings.has_setting("autoload/" + AUTOLOAD_NAME):
		remove_autoload_singleton(AUTOLOAD_NAME)

func _enter_tree():	
	_create_plugin_panel()

	var scene = load(RESOURCE_TOP_PANEL_SCENE_PATH)
	if scene and scene is PackedScene:
		resource_top_panel_instance = scene.instantiate()
		EditorInterface.get_editor_main_screen().add_child(resource_top_panel_instance)
		resource_top_panel_instance.hide()
	else:
		push_error("Could not load ResourceTopPanel scene from: " + RESOURCE_TOP_PANEL_SCENE_PATH)

func _exit_tree():
	if is_instance_valid(plugin_panel):
		if plugin_panel.get_parent() != null:
			remove_control_from_docks(plugin_panel)
		plugin_panel.free()

	if is_instance_valid(resource_top_panel_instance):
		resource_top_panel_instance.queue_free()

func _create_top_panel():
	pass

func _has_main_screen():
	return true

func _make_visible(visible):
	if is_instance_valid(resource_top_panel_instance):
		resource_top_panel_instance.visible = visible

func _get_plugin_name():
	return "Resources"

func _create_plugin_panel():
	plugin_panel = get_editor_interface().get_base_control().find_child("CafeSidePanel", true, false)
	if plugin_panel:
		return

	var scene = load(PANEL_SCENE_PATH)
	if scene and scene is PackedScene:
		plugin_panel = scene.instantiate()
		add_control_to_dock(DOCK_SLOT_RIGHT_UL, plugin_panel)
	else:
		push_error("Could not load CafeSidePanel scene from: " + PANEL_SCENE_PATH)
