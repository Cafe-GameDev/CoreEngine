extends ScrollContainer

@onready var docs_button: Button = $VBoxContainer/DocsButton

const DOCS : String = "https://www.cafegame.dev/cafeengine"

func _on_docs_button_pressed() -> void:
	OS.shell_open(DOCS)
