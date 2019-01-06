///update_m_create(text,ID1,ID2,ID3,ID4,Dead)
if(argument0 == "ERROR" || argument0 == "")
    exit;

global.update_count++;

if (argument5 > 0 && global.deadUpdates)
{
    global.kill_count++;
    with (obj_updateBox)
    {
        currentPos++;
    }
    
    i = instance_create(0,0,obj_updateBox);
    i.boxColor = global.boxColor
    i.text = argument0;
    i.image1 = global.IMAGES[argument1];
    i.image2 = global.IMAGES[argument2];
    i.image3 = global.IMAGES[argument3];
    i.image4 = global.IMAGES[argument4];
    i.dead = argument5;
    i.fighters = 4;
    i.iSpd[0] = global.IMAGESP[argument1];
    i.iSpd[1] = global.IMAGESP[argument2];
    i.iSpd[2] = global.IMAGESP[argument3];
    i.iSpd[3] = global.IMAGESP[argument4];
    
    i = instance_create(0,0,obj_popup);
    i.fighter = global.IDLIST[argument1];
        
    if (global.boxColor == 0)
        global.boxColor = 1;
    else
        global.boxColor = 0; 
}
else if (argument5 < 1 && global.otherUpdates)
{
    with (obj_updateBox)
    {
        currentPos++;
    }
    i = instance_create(0,0,obj_updateBox);
    i.boxColor = global.boxColor
    i.text = argument0;
    i.image1 = global.IMAGES[argument1];
    i.image2 = global.IMAGES[argument2];
    i.image3 = global.IMAGES[argument3];
    i.image4 = global.IMAGES[argument4];
    i.dead = argument5;
    i.fighters = 4;
    i.iSpd[0] = global.IMAGESP[argument1];
    i.iSpd[1] = global.IMAGESP[argument2];
    i.iSpd[2] = global.IMAGESP[argument3];
    i.iSpd[3] = global.IMAGESP[argument4];
        
    if (global.boxColor == 0)
        global.boxColor = 1;
    else
        global.boxColor = 0; 
}
