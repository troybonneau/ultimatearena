/// mapcamera_focus_on_fighter(camera, fighter)
var _camera = argument0;
var _fighter = argument1;

if (!instance_exists(_camera) || !instance_exists(_fighter))
    return;

var _gridX = floor(clamp(_fighter.y, 0, 511));
var _gridY = floor(clamp(512 - _fighter.x, 0, 511));

mapcamera_focus_position(_camera, _gridX, _gridY);
