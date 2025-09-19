/// mapcamera_update_chopper_button()
var _active = false;
with (obj_mapcamera)
{
    _active = chopperMode;
}

with (obj_uiButton)
{
    if (bID == 68)
    {
        caption = _active ? "Chopper Gunner (On)" : "Chopper Gunner (Off)";
    }
}
