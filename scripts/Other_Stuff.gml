if instance_exists(Pers_Obj)
{
    if (((((place_meeting(x, (y + 2 * vspeed + 2), Solid_Line)) || (place_meeting(x, (y + vspeed + 1), objSlopeParent1))) || (place_meeting(x, (y + vspeed + 1), Break_Mask))) || (place_meeting(x, (y + vspeed + 1), Solid_Mask))) && (HitDrop == 1))
    {
        HitDrop = 0
        Tornado_Mode = 0
        Tornado_On = 3
        alarm[3] = 250
        Move = 1
        Out = 0
        canMove = 1
        canSpriteChange = 1
        image_alpha = 0.5
        alarm[0] = 90
    }
    if (room == ScrapBrain20)
    {
        if ((collision_rectangle(bbox_right, y, bbox_left, (bbox_bottom + 1), YCR_MoverR, 1, 0)) && (ground == 1))
            hspeed = 1.4
        if ((collision_rectangle(bbox_right, y, bbox_left, (bbox_bottom + 1), YCR_MoverL, 1, 0)) && (ground == 1))
            hspeed = -1.4
        if ((!(collision_rectangle(bbox_right, y, bbox_left, (bbox_bottom + 1), YCR_MoverR, 1, 0))) && (!(collision_rectangle(bbox_right, y, bbox_left, (bbox_bottom + 1), YCR_MoverL, 1, 0))))
            Pers_Obj.hspeed = 0
    }
}
