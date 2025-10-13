@tool
extends EditorPlugin

const AUTOLOAD_NAME = "CoreEngine"
const AUTOLOAD_PATH = "res://addons/core_engine/utils/core_engine.gd"
const GROUP_SCENE_PATH = "res://addons/core_engine/panel/data_panel.tscn"

var plugin_panel: ScrollContainer
var group_panel: VBoxContainer

func _enter_tree():
	if not ProjectSettings.has_setting("autoload/" + AUTOLOAD_NAME):
		add_autoload_singleton(AUTOLOAD_NAME, AUTOLOAD_PATH)
	
	_create_plugin_panel()

func _exit_tree():
	if ProjectSettings.has_setting("autoload/" + AUTOLOAD_NAME):
		remove_autoload_singleton(AUTOLOAD_NAME)

	if is_instance_valid(plugin_panel):
		var content_container = plugin_panel.get_node_or_null("VBoxContainer")
		if content_container and content_container.get_child_count() == 0:
			if plugin_panel.get_parent() != null:
				remove_control_from_docks(plugin_panel)
			plugin_panel.free()

func _create_plugin_panel():
	plugin_panel = get_editor_interface().get_base_control().find_child("CorePanel", true, false)
	if plugin_panel:
		return

	plugin_panel = ScrollContainer.new()
	plugin_panel.name = "CorePanel"
	plugin_panel.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	plugin_panel.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	plugin_panel.horizontal_scroll_mode = ScrollContainer.SCROLL_MODE_DISABLED
	plugin_panel.set_follow_focus(true)

	var vbox_container = VBoxContainer.new()
	vbox_container.name = "VBoxContainer"
	vbox_container.set_v_size_flags(Control.SIZE_EXPAND_FILL)
	vbox_container.set_h_size_flags(Control.SIZE_EXPAND_FILL)
	vbox_container.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	vbox_container.add_theme_constant_override("separation", 12)
	
	plugin_panel.add_child(vbox_container)

	add_control_to_dock(DOCK_SLOT_RIGHT_UL, plugin_panel)
	CoreEngine.CorePanel = true
