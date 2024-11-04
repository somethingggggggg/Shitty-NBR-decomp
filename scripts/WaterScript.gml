if collision_rectangle(bbox_right, bbox_top, bbox_left, bbox_bottom, GHZ_Water, 0, 0)
{
    Water_mode = 1
    WaterMark = 1
    PersObj_Stuffer.Bubbles = 1
}
if (!(collision_rectangle(bbox_right, bbox_top, bbox_left, bbox_bottom, GHZ_Water, 0, 0)))
    Water_mode = 0
if (Water_mode == 1)
{
    with (Pers_Obj)
    {
        if (Fly == 10)
            gravity = 0.15
    }
    if (Air1 > 0)
        Air1 -= 1
    if (Air2 > 0)
        Air2 -= 1
    if (WaterDanger == 0)
    {
        if ((Air1 <= 0) && (Air2 > 0))
        {
            WaterDanger = 1
            audio_stop_music()
            audio_play_music(131, 0)
            PersObj_Stuffer.Bubbles = 0
        }
    }
    if (WaterDanger == 1)
    {
        PersObj_Stuffer.BubbleNumber = 1
        if (Air2 <= 0)
        {
            WaterDanger = 2
            instance_create(x, y, PlayerDeath)
            instance_destroy()
        }
    }
}
if (Water_mode == 0)
{
    if (WaterMark != 0)
    {
        WaterMark = 0
        with (Pers_Obj)
        {
            Air1 = 1000
            Air2 = 1735
            Water_mode = 0
            gravity = 0.25
            if (WaterDanger != 0)
            {
                audio_stop_music()
                if (GOD_OBJECT.BloodyHill == 0)
                    audio_play_music(3, 1)
                if (GOD_OBJECT.BloodyHill == 1)
                    audio_play_music(16, 1)
                WaterDanger = 0
            }
            PersObj_Stuffer.BubbleNumber = 0
            PersObj_Stuffer.Bubbles = 0
        }
    }
}
