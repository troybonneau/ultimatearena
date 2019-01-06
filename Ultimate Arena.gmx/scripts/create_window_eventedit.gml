with(zui_create(window_get_width()*.6, window_get_height()/2 - 60, obj_uiWindow))
{
    global.charVersion = 1;
    global.workshopID = -1;
    global.creator = -1;
    zui_set_size(500, 298);
    wID = "Editor Window";
    
    with(zui_create(0, 0, obj_uiWindowCaption))
    {
        caption = "Event Editor";
    }
    with(zui_create(15, 45, obj_uiLabel))
    {
        caption = "Event Name: ";
        halign = fa_left;
    }
    with(zui_create(14, 55, obj_uiField))
    {
        callback = eventedit_ui;
        fID = 0;
        maxLength = string_width("WWWWWWWWWWWWWWW");
        width = maxLength+6;
        zui_set_anchor(0,0);
        zui_set_size(width,18);
    }
    with(zui_create(15, 90, obj_uiLabel))
    {
        caption = "Description: ";
        halign = fa_left;
    }
    with(zui_create(14, 100, obj_uiField))
    {
        callback = eventedit_ui;
        fID = 1;
        maxLength = string_width("WWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW");
        width = maxLength+6;
        zui_set_anchor(0,0);
        zui_set_size(width,18);
    }
    with(zui_create(15, 135, obj_uiLabel))
    {
        caption = "Death Percentage: ";
        halign = fa_left;
    }
    with(zui_create(14, 145, obj_uiField))
    {
        callback = eventedit_ui;
        fID = 2;
        maxLength = string_width("100");
        width = maxLength+6;
        zui_set_anchor(0,0);
        zui_set_size(width,18);
    }
    with(zui_create(47,152,obj_uiLabel))
    {
        caption = "-";
    }
    with(zui_create(54, 145, obj_uiField))
    {
        callback = eventedit_ui;
        fID = 3;
        maxLength = string_width("100");
        width = maxLength+6;
        zui_set_anchor(0,0);
        zui_set_size(width,18);
    }
    with(zui_create(15, 180, obj_uiLabel))
    {
        caption = "Updates: ";
        halign = fa_left;
    }
    with(zui_create(14, 190, obj_uiMultiField))
    {
        callback = eventedit_ui;
        mID = 0;
        maxLength = 600;
        width = 440;
        zui_set_anchor(0,0);
        zui_set_size(width,18);
    }
    with(zui_create(465, 200, obj_uiLabel))
    {
        caption = "1/1";
        halign = fa_left;
        lID = 1;
    }
    with (zui_create(15, 225, obj_uiButton)) 
    {
        zui_set_anchor(0,0);
        zui_set_size(130, 30);
        caption = "Add Update";
        callback = eventedit_ui;
        bID = 4;
    }
    with (zui_create(155, 225, obj_uiButton)) 
    {
        zui_set_anchor(0,0);
        zui_set_size(130, 30);
        caption = "Delete Update";
        callback = eventedit_ui;
        bID = 5;
    }
    with (zui_create(440, 225, obj_uiButton)) 
    {
        zui_set_anchor(0,0);
        zui_set_size(20, 20);
        caption = "<";
        callback = eventedit_ui;
        bID = 6;
    }
    with (zui_create(470, 225, obj_uiButton)) 
    {
        zui_set_anchor(0,0);
        zui_set_size(20, 20);
        caption = ">";
        callback = eventedit_ui;
        bID = 7;
    }
    with (zui_create(365, 263, obj_uiButton)) 
    {
        zui_set_anchor(0,0);
        zui_set_size(130, 30);
        caption = "Save Event";
        callback = eventedit_ui;
        bID = 2;
    }
    with (zui_create(220, 263, obj_uiButton)) 
    {
        zui_set_anchor(0,0);
        zui_set_size(130, 30);
        caption = "New Event";
        callback = eventedit_ui;
        bID = 3;
    }
    with(zui_create(25, __height - 20, obj_uiCheckbox))
    {
        type = 0;
        callback = eventedit_ui;
        cID = 0;
        value = 0;
        bID = 1;
    }
    with(zui_create(55, __height - 20, obj_uiLabel))
    {
        caption = "Add to Steam Workshop";
        halign = fa_left;
    }
}
