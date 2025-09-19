///arena_ui(id)

//Controls the UI for most of the arena-related things

var WS = global.WSCALE;
var HS = global.HSCALE;

with (obj_uiButton)
{
    if (argument0 == id)
    {
        if (bID == 0)
        {
            if(global.extraFrames > 0)
                global.extraFrames--;
            else if(global.GAME_SPEED != 0 && global.GAME_SPEED < 40)
                global.GAME_SPEED++;
        }
        if (bID == 1)
        {
            if (global.GAME_SPEED == 0)
            {
                if(global.SAVE_SPEED < 1)
                    global.SAVE_SPEED = 12;
                global.GAME_SPEED = global.SAVE_SPEED;
            }
        }
        if (bID == 2)
        {
            if (global.GAME_SPEED != 0)
            {
                global.SAVE_SPEED = global.GAME_SPEED;
                global.GAME_SPEED = 0;
            }
        }
        if (bID == 3)
        {
            if (global.GAME_SPEED != 0 && global.GAME_SPEED > 1)
                global.GAME_SPEED--;
            else if(global.GAME_SPEED == 1)
            {
                if(global.extraFrames < 3)
                    global.extraFrames++;
            }
        }
        if (bID == 4)
        {
            with(obj_uiWindow)
            {
                if(wID == "Map")
                    zui_destroy();
            }
            with (zui_main()) 
            {
                create_window_map();
            }
        }
        if (bID == 5)
        {
            with(obj_uiWindow)
            {
                if(wID == "Stats")
                    zui_destroy();
            }
            create_window_stats();
        }
        if (bID == 6)
        {
            with(obj_uiWindow)
            {
                if(wID == "Sponsor Menu" || wID == "Sandbox")
                    zui_destroy();
            }
            with (zui_main()) 
            {
                create_window_sandbox();
            }
        }
        if (bID == 7)
        {
            with(obj_uiWindow)
            {
                if(wID == "Fighter List")
                    zui_destroy();
            }
            with (zui_main()) 
            {
                create_window_fighterlist();
            }
       
        
        }
        if (bID == 8)
        {
            with(obj_uiWindow)
            {
                if(wID == "Updates")
                    zui_destroy();
            }
            with (zui_main()) 
            {
                 create_window_updates();
            }
        }
        if (bID == 9)
        {
            with(obj_arenaController)
                showGroups = !showGroups;
        }
        if (bID == 10)
        {
            with(obj_uiWindow)
            {
                if(wID == "Shrinking Arena")
                    zui_destroy();
            }
            with (zui_main()) 
            {
                 create_window_arenashrink();
            }
        }
        if(bID == 11) //Newspaper
        {
            with(obj_uiWindow)
            {
                if(wID == "Ultimate News")
                    zui_destroy();
            }
            with (zui_main()) 
            {
                 create_window_newspaper();
            }
        }
        if (bID == 12)
        {
            with(obj_uiWindow)
            {
                if(wID == "3D Map")
                    zui_destroy();
            }
            with (zui_main()) 
            {
                create_window_3dmap();
            }
        }
        if(bID == 65)
        {
            with(obj_fighter)
                cameraFollow = 0;
            mapcamera_set_mode(MAPCAMERA_MODE_CENTER);

        }
        if(bID == 66)
        {
            with(obj_fighter)
                cameraFollow = 0;
            mapcamera_set_mode(MAPCAMERA_MODE_RANDOM);

        }
        if(bID == 67)
        {
            with(obj_fighter)
                cameraFollow = 0;
            mapcamera_set_mode(MAPCAMERA_MODE_CPU);

        }
        if(bID == 68)
        {
            with(obj_fighter)
                cameraFollow = 0;
            var _enable = true;
            with(obj_mapcamera)
                _enable = !chopperMode;

            if(_enable)
                mapcamera_set_mode(MAPCAMERA_MODE_CHOPPER);
            else
                mapcamera_set_mode(MAPCAMERA_MODE_FREE);
        }
        if (bID == 70)
        {
            if (type == 2)
            {
                type = 3;
                global.arenaShrink = 1;
                caption = "Shrinking Arena On";
            }
            else
            {
                type = 2;
                global.arenaShrink = 0;
                caption = "Shrinking Arena Off";
            }
        }
        if (bID == 71)
        {
            with(obj_arenaShrink)
                radius = 300;
        }
        if (bID == 79)
        {
            if (type == 2)
            {
                type = 3;
                global.otherUpdates = 1;
                caption = "Other Updates On";
            }
            else
            {
                type = 2;
                global.otherUpdates = 0;
                caption = "Other Updates Off";
            }
        }
        if (bID == 80)
        {
            if (type == 2)
            {
                type = 3;
                global.deadUpdates = 1;
                caption = "Death Updates On";
            }
            else
            {
                type = 2;
                global.deadUpdates = 0;
                caption = "Death Updates Off";
            }
        }
        if (bID == 81)
        {
            if (!instance_exists(obj_placeItem))
            {
                var e = instance_create(0,0,obj_placeItem);
                e.image = spr_itemBag;
            }
        }
        if (bID == 82)
        {
            if (!instance_exists(obj_placeItem))
            {
                var e = instance_create(0,0,obj_placeItem);
                e.image = spr_landmine;
            }
        }
        if (bID == 83)
        {
            with (zui_main()) 
            {
                with(zui_create(445,348,obj_uiWindow,-1)) 
                {
                    wID = "Event List";
                    zui_set_size(260,420);/*
                    with (zui_create(0, 0, obj_uiWindowCaption)) 
                    {
                        caption = "Event List";
                        draggable = 1;
                    }*/
                    zui_create(0,0,obj_uiExitButton,-1);
                    with(zui_create(0,24,obj_uiListbox))
                    {
                        //draw_callback = tag_draw_ui;
                        callback = evselect_ui;
                        zui_set_anchor(0,0);
                        zui_set_size(260,356);
                        type = 0;

                        initialize_listbox(global.eNAME,0,array_length_1d(global.eNAME)-1);
                        other.listID = id;
                        with(zui_create(0,0,obj_uiListboxScroll)){} 
                    }
                }
            }
        }  
    }
}

with (obj_uiWindow)
{
    if (argument0 == id)
    {
        if(wID == "Map")
        {
            draw_surface_stretched(obj_arenaController.map,0,24,HS*(512/720)*global.gs,HS*(512/720)*global.gs);
        }
        
        if(wID == "3D Map")
        {
            draw_surface_stretched(obj_mapcamera.Surf3D,0,24,HS*(512/720)*global.gs,HS*(512/720)*global.gs);
            var _mapWidth = HS*(512/720)*global.gs;
            var _mapHeight = _mapWidth;
            var _mapX = 0;
            var _mapY = 24;

            chopperActive = false;
            with(obj_mapcamera)
                if(chopperMode)
                    other.chopperActive = true;

            if(chopperActive)
            {
                var _cx = _mapX + _mapWidth/2;
                var _cy = _mapY + _mapHeight/2;
                var _arm = _mapWidth/12;
                var _gap = _mapWidth/36;

                draw_set_alpha(0.85);
                draw_set_color(c_white);
                draw_line_width(_cx - _arm, _cy, _cx - _gap, _cy, 2);
                draw_line_width(_cx + _gap, _cy, _cx + _arm, _cy, 2);
                draw_line_width(_cx, _cy - _arm, _cx, _cy - _gap, 2);
                draw_line_width(_cx, _cy + _gap, _cx, _cy + _arm, 2);
                draw_circle(_cx, _cy, _gap, true);
                draw_set_alpha(1);
                draw_set_halign(fa_middle);
                draw_set_valign(fa_top);
                draw_set_font(font0);
                draw_text(_cx, _mapY + 8, "Drag the joystick on the map to move the crosshair");

                var _windowLeft = __dx - __ax * __sx;
                var _windowTop = __dy - __ay * __sy;
                var _localMouseX = (global.__zui_mx - _windowLeft) / __sx;
                var _localMouseY = (global.__zui_my - _windowTop) / __sy;

                var _stickRadius = _mapWidth / 8;
                var _stickMargin = _mapWidth / 18;
                var _stickCenterX = _mapX + _mapWidth - _stickMargin - _stickRadius;
                var _stickCenterY = _mapY + _mapHeight - _stickMargin - _stickRadius;
                var _thumbRadius = _stickRadius * 0.35;

                var _pointerDown = device_mouse_check_button(0, mb_left);
                var _dxStick = _localMouseX - _stickCenterX;
                var _dyStick = _localMouseY - _stickCenterY;
                var _distance = sqrt(_dxStick * _dxStick + _dyStick * _dyStick);

                var _stickVecX = 0;
                var _stickVecY = 0;
                var _stickHeld = false;

                with(obj_mapcamera)
                {
                    _stickVecX = chopperStickVecX;
                    _stickVecY = chopperStickVecY;
                    _stickHeld = chopperStickHeld;
                }

                if(_pointerDown)
                {
                    if(_stickHeld || _distance <= _stickRadius)
                    {
                        var _normX = 0;
                        var _normY = 0;

                        if(_distance > 0)
                        {
                            var _scale = min(_distance, _stickRadius) / _stickRadius;
                            _normX = (_dxStick / _distance) * _scale;
                            _normY = (_dyStick / _distance) * _scale;
                        }

                        if(abs(_normX) < 0.05)
                            _normX = 0;
                        if(abs(_normY) < 0.05)
                            _normY = 0;

                        with(obj_mapcamera)
                        {
                            chopperStickHeld = true;
                            chopperStickVecX = clamp(_normX, -1, 1);
                            chopperStickVecY = clamp(_normY, -1, 1);
                            chopperInputX = chopperStickVecX;
                            chopperInputY = chopperStickVecY;
                            other._stickVecX = chopperStickVecX;
                            other._stickVecY = chopperStickVecY;
                        }

                        _stickHeld = true;
                    }
                }
                else if(_stickHeld)
                {
                    with(obj_mapcamera)
                    {
                        chopperStickHeld = false;
                        chopperStickVecX = 0;
                        chopperStickVecY = 0;
                        chopperInputX = 0;
                        chopperInputY = 0;
                        other._stickVecX = 0;
                        other._stickVecY = 0;
                    }
                    _stickVecX = 0;
                    _stickVecY = 0;
                    _stickHeld = false;
                }

                var _thumbX = _stickCenterX + _stickVecX * (_stickRadius - _thumbRadius);
                var _thumbY = _stickCenterY + _stickVecY * (_stickRadius - _thumbRadius);

                draw_set_alpha(0.35);
                draw_set_color(c_black);
                draw_circle(_stickCenterX, _stickCenterY, _stickRadius, false);
                draw_set_alpha(1);
                draw_set_color(c_white);
                draw_circle(_stickCenterX, _stickCenterY, _stickRadius, true);

                draw_set_alpha(_stickHeld ? 0.9 : 0.7);
                draw_set_color(make_color_rgb(180, 220, 255));
                draw_circle(_thumbX, _thumbY, _thumbRadius, false);
                draw_set_alpha(1);
                draw_set_color(c_white);
                draw_circle(_thumbX, _thumbY, _thumbRadius, true);
            }
            draw_set_font(font0);

            if(instance_exists(obj_arenaEvent))
            {
                var fl = floor(HS*(512/720) *global.gs) + 24
                
                draw_set_alpha(.6)
                draw_rectangle_colour(0,fl-24,HS*(512/720),fl,c_red,c_red,c_maroon,c_maroon,0);
                draw_set_alpha(1);
                draw_set_halign(fa_middle);
                draw_set_valign(fa_bottom);
                draw_text_colour((HS*(512/720))/2,fl-4,"Arena Event! " + obj_arenaEvent.description,c_white,c_white,c_silver,c_silver,1);
                
                with(obj_mapcamera)
                {
                    if(followFighterId != -1)
                    {
                        
                        fl -= 5;
                    
                        var caption = "Following: " + global.NAMES[followFighterId] + "#";
                        texture_set_interpolation(1);
                        draw_sprite_stretched(global.IMAGES[followFighterId],0,5,fl-89,64,64);
                        texture_set_interpolation(0);
                        if(instance_exists(followFighter))
                            caption += followFighter.caption;
                        else
                            caption += global.deathCause[followFighterId];
                        draw_set_valign(fa_bottom);
                        draw_set_halign(fa_left);
                        draw_set_color(c_black);
                        draw_text(74,fl-25,caption);
                        draw_text(74,fl-27,caption);
                        draw_text(73,fl-26,caption);
                        draw_text(75,fl-26,caption);
                        draw_set_color(c_white);
                        draw_text(74,fl-26,caption);
                    }
                }
            }
            else
            {
                with(obj_mapcamera)
                {
                    if(followFighterId != -1)
                    {
                        
                        var fl = floor(HS*(512/720)*global.gs) + 24
                    
                        var caption = "Following: " + global.NAMES[followFighterId] + "#";
                        texture_set_interpolation(1);
                        draw_sprite_stretched(global.IMAGES[followFighterId],0,5,fl-69,64,64);
                        texture_set_interpolation(0);
                        if(instance_exists(followFighter))
                            caption += followFighter.caption;
                        else
                            caption += global.deathCause[followFighterId];
                        draw_set_valign(fa_bottom);
                        draw_set_halign(fa_left);
                        draw_set_color(c_black);
                        draw_text(74,fl-5,caption);
                        draw_text(74,fl-7,caption);
                        draw_text(73,fl-6,caption);
                        draw_text(75,fl-6,caption);
                        draw_set_color(c_white);
                        draw_text(74,fl-6,caption);
                    }
                }
            }
        }
        
        if(wID == "Ultimate News")
        {
            var px = __x - 300;
            var py = __y - 276;
            
            
            draw_surface_stretched(obj_arenaController.news,0,24,600,600);
            draw_sprite(spr_cameraButton,1,0,24);
            
            if(mouse_check_button_pressed(mb_left))
            {
                show_debug_message(string(px) + ", " + string(py) + " - " + string(mouse_x) + ", " + string(mouse_y));
                //Screenshot News
                if(point_in_rectangle(mouse_x,mouse_y,px,py,px+14,py+14))
                {
                    var file = get_save_filename("Screenshot|*.png", "pic.png");
                    if(file != "")
                    {
                        surface_save(obj_arenaController.news,file);
                    }
                }
            }
        }
    
        if(wID == "Stats")
        {
    
            draw_surface_ext(obj_sideMenu.sidemenu,20,24,1,1,0,c_white,1);
            
        }
        if(wID == "Updates")
        {
            draw_surface_part(global.surf_updates,0,0,390,HS*(512/720)*global.gs - 75,0,24);
            
        }
        if(wID == "Sandbox")
        {
            draw_set_valign(fa_top);
            draw_text(70,77,"Care Package");
            draw_text(70,215,"Land Mine");
            draw_text(70,355,"Begin Event");
        }
        if(wID == "FIGHTER")
        {
            if(instance_exists(xID.fID) && xID.fID != -1)
            {   
                xID.left = xID.fID.x;
                xID.top = xID.fID.y;
                draw_statbars(xID.fID.HP,xID.fID.HUNGER,xID.fID.THIRST,xID.fID.SANITY,0);   
            }
            else
            {
                draw_statbars(0,0,0,0,1);
            }
        }
    }
}

with(obj_uiSlider)
{
    if(argument0 == id)
    {
        if(slID == 1) //Shrink Ticks
        {
            with(obj_arenaShrink)
                ticksUntilShrink = 301-round(300*argument1);
        }
    }
}
