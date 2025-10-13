@tool
extends EditorPlugin

const AUTOLOAD_NAME = "CoreEngine"
const AUTOLOAD_PATH = "res://addons/core_engine/utils/core_engine.gd"
const PANEL_SCENE_PATH = "res://addons/core_engine/panel/core_panel.tscn"

var plugin_panel: ScrollContainer

func _enter_tree():
	if not ProjectSettings.has_setting("autoload/" + AUTOLOAD_NAME):
		add_autoload_singleton(AUTOLOAD_NAME, AUTOLOAD_PATH)
	
	_create_plugin_panel()

func _exit_tree():
	if ProjectSettings.has_setting("autoload/" + AUTOLOAD_NAME):
		remove_autoload_singleton(AUTOLOAD_NAME)

	if is_instance_valid(plugin_panel):
		if plugin_panel.get_parent() != null:
			remove_control_from_docks(plugin_panel)
		plugin_panel.free()

func _create_plugin_panel():
	plugin_panel = get_editor_interface().get_base_control().find_child("CorePanel", true, false)
	if plugin_panel:
		return

	var scene = load(PANEL_SCENE_PATH)
	if scene and scene is PackedScene:
		plugin_panel = scene.instantiate()
		add_control_to_dock(DOCK_SLOT_RIGHT_UL, plugin_panel)
	else:
		push_error("Could not load CorePanel scene from: " + PANEL_SCENE_PATH)
