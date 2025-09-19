/// mapcamera_set_mode(mode, data)
var _mode = argument0;
var _data = argument_count > 1 ? argument1 : noone;

with (obj_mapcamera)
{
    mapMode = other._mode;
    var _cameraId = id;

    chopperMode = (other._mode == MAPCAMERA_MODE_CHOPPER);

    if (!chopperMode)
    {
        chopperInputX = 0;
        chopperInputY = 0;
        chopperStickVecX = 0;
        chopperStickVecY = 0;
        chopperStickHeld = false;
    }

    followRandom = false;
    followCPU = false;
    followFighter = noone;
    followFighterId = -1;

    switch (other._mode)
    {
        case MAPCAMERA_MODE_FREE:
            mapcamera_focus_position(_cameraId, cx, cy);
        break;

        case MAPCAMERA_MODE_CENTER:
            mapcamera_focus_position(_cameraId, 256, 256);
        break;

        case MAPCAMERA_MODE_RANDOM:
            followRandom = true;
        break;

        case MAPCAMERA_MODE_CPU:
            followRandom = true;
            followCPU = true;
        break;

        case MAPCAMERA_MODE_CHOPPER:
            mapcamera_focus_position(_cameraId, cx, cy);
        break;

        case MAPCAMERA_MODE_FOLLOW:
            var _fighter = other._data;
            if (instance_exists(_fighter))
            {
                followFighter = _fighter;
                followFighterId = _fighter.fighterID;
                mapcamera_focus_on_fighter(_cameraId, _fighter);
            }
        break;
    }
}

mapcamera_update_chopper_button();
