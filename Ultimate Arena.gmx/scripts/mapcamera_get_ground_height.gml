/// mapcamera_get_ground_height(gridX, gridY)
var _hx = clamp(floor(argument0), 0, 511);
var _hy = clamp(floor(argument1), 0, 511);
return buffer_get_height(obj_maptest.hBuff, _hx, _hy) * 128 / 255;
