extends Camera2D

const ZOOM_INCREMENT := 0.05
const ZOOM_MIN       := 0.1
const ZOOM_MAX       := 2.0
var panning          := false
var zoom_level       := 1.0


func _unhandled_input(_event: InputEvent) -> void:
    if _event is InputEventMouseButton:
        match _event.button_index:
            MOUSE_BUTTON_LEFT:
                if _event.pressed:
                    panning = true
                else:
                    panning = false
                get_tree().get_root().set_input_as_handled()
            MOUSE_BUTTON_WHEEL_UP:
                zoom_level = clamp(zoom_level + ZOOM_INCREMENT, ZOOM_MIN, ZOOM_MAX)
                zoom = zoom_level * Vector2.ONE
                get_tree().get_root().set_input_as_handled()
            MOUSE_BUTTON_WHEEL_DOWN:
                zoom_level = clamp(zoom_level - ZOOM_INCREMENT, ZOOM_MIN, ZOOM_MAX)
                zoom = zoom_level * Vector2.ONE
                get_tree().get_root().set_input_as_handled()
    elif _event is InputEventMouseMotion and panning:
        get_tree().get_root().set_input_as_handled()
        if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
            global_position -= _event.relative / zoom_level
        else:
            panning = false
