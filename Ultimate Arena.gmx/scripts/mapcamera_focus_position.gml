/// mapcamera_focus_position(camera, gridX, gridY)
var _camera = argument0;
var _gx = argument1;
var _gy = argument2;

if (!instance_exists(_camera))
    return;

with (_camera)
{
    cx = clamp(_gx, 16, 496);
    cy = clamp(_gy, 16, 496);
    cz = mapcamera_get_ground_height(cx, cy);
}
