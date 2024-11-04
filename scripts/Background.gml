if (room == AAZ_8)
{
    if ((view_object[0] == Pers_Obj) && ((view_xview[0] != 0) && (view_xview[0] != (room_width - 320))))
    {
        if (Move == 1)
        {
            background_hspeed[1] = global.vel / 1.8
            background_hspeed[3] = global.vel / 1.8
        }
        else
        {
            background_hspeed[1] = hspeed / 1.8
            background_hspeed[3] = hspeed / 1.8
        }
        background_y[1] = view_yview[0]
    }
    else
    {
        background_hspeed[1] = 0
        background_hspeed[3] = 0
        background_y[1] = view_yview[0]
    }
}
if (room == HS2_10)
{
    if ((view_object[0] == Pers_Obj) && ((view_xview[0] != 0) && (view_xview[0] != (room_width - 320))))
    {
        if (Move == 1)
            background_hspeed[1] = global.vel / 1.8
        else
            background_hspeed[1] = hspeed / 1.8
        background_y[1] = view_yview[0]
    }
    else
    {
        background_hspeed[1] = 0
        background_y[1] = view_yview[0]
    }
}
if (room == TrapChoise_13)
{
    if ((view_object[0] == Pers_Obj) && ((view_xview[0] != 0) && (view_xview[0] != (room_width - 320))))
    {
        if (Move == 1)
            background_hspeed[1] = global.vel / 2
        else
            background_hspeed[1] = hspeed / 2
        background_y[1] = view_yview[0]
    }
    else
    {
        background_hspeed[1] = 0
        background_y[1] = view_yview[0]
    }
}
if (room == TailsSolo1_14)
{
    if ((view_object[0] == Pers_Obj) || (view_object[0] == TTS1_Exetior1))
    {
        background_y[1] = view_yview[0] - 90
        background_y[2] = view_yview[0] + 20
        background_y[3] = view_yview[0] - 90
        background_y[4] = view_yview[0]
        if ((view_xview[0] != 0) && (view_xview[0] != (room_width - 320)))
        {
            if (Move == 1)
            {
                background_hspeed[1] = global.vel / 2.5
                background_hspeed[2] = global.vel / 3
                background_hspeed[3] = global.vel / 2
                background_hspeed[4] = global.vel / 2
            }
            else
            {
                background_hspeed[1] = hspeed / 2
                background_hspeed[2] = hspeed / 3
                background_hspeed[3] = hspeed / 2
                background_hspeed[4] = hspeed / 2
            }
        }
        else
        {
            background_hspeed[1] = 0
            background_hspeed[2] = 0
            background_hspeed[3] = 0
            background_hspeed[4] = 0
        }
    }
    if (view_object[0] == TTS1_InRing)
    {
        background_y[1] = view_yview[0] - 90
        background_y[2] = view_yview[0] + 20
        background_y[3] = view_yview[0] - 90
        background_y[4] = view_yview[0]
    }
}
if (room == TailsSolo1Exetior_15)
{
    if ((view_object[0] == Pers_Obj) || (view_object[0] == TTS1E_Cam))
    {
        background_y[1] = view_yview[0] - 90
        background_y[2] = view_yview[0] + 20
        background_y[3] = view_yview[0] - 90
        background_y[4] = view_yview[0]
        if ((view_xview[0] != 0) && (view_xview[0] != (room_width - 320)))
        {
            if (Move == 1)
            {
                background_hspeed[1] = global.vel / 2.5
                background_hspeed[2] = global.vel / 3
                background_hspeed[3] = global.vel / 2
                background_hspeed[4] = global.vel / 2
            }
            else
            {
                background_hspeed[1] = hspeed / 2
                background_hspeed[2] = hspeed / 3
                background_hspeed[3] = hspeed / 2
                background_hspeed[4] = hspeed / 2
            }
        }
        else
        {
            background_hspeed[1] = 0
            background_hspeed[2] = 0
            background_hspeed[3] = 0
            background_hspeed[4] = 0
        }
    }
}
if (room == LastVoid16)
{
    if ((view_object[0] == Pers_Obj) && ((view_xview[0] != 0) && (view_xview[0] != (room_width - 320))))
    {
        if (Move == 1)
        {
            background_hspeed[1] = global.vel / 2
            background_hspeed[2] = global.vel / 2
            background_hspeed[3] = global.vel / 2
            background_hspeed[4] = global.vel / 2
        }
        else
        {
            background_hspeed[1] = hspeed / 2
            background_hspeed[2] = hspeed / 2
            background_hspeed[3] = hspeed / 2
            background_hspeed[4] = hspeed / 2
        }
    }
    else
    {
        background_hspeed[1] = 0
        background_hspeed[2] = 0
        background_hspeed[3] = 0
        background_hspeed[4] = 0
    }
}
if (room == PostLastVoid_18)
{
    if ((view_object[0] == PostLV_Exetior) && ((view_xview[0] != 0) && (view_xview[0] != (room_width - 320))))
    {
        background_hspeed[1] = hspeed / 2
        background_hspeed[2] = hspeed / 2
        background_hspeed[3] = hspeed / 2
        background_hspeed[4] = hspeed / 2
    }
    else
    {
        background_hspeed[1] = 0
        background_hspeed[2] = 0
        background_hspeed[3] = 0
        background_hspeed[4] = 0
    }
}
if (room == YCR_Main21)
{
    if ((view_object[0] == Pers_Obj) && ((view_xview[0] != 0) && (view_xview[0] != (room_width - 320))))
        background_hspeed[2] = global.vel / 3
    else
        background_hspeed[2] = 0
}
if (room == Ellipsis26)
{
    if (!instance_exists(ELPSMG_Eggman))
    {
        if (GOD_OBJECT.OutBike == 0)
        {
            if ((view_object[0] == Pers_Obj) && ((view_xview[0] != 0) && (view_xview[0] != (room_width - 320))))
            {
                if (GOD_OBJECT.POMB == 0)
                {
                    background_hspeed[1] = global.vel / 2.5
                    background_hspeed[2] = global.vel / 4
                    background_hspeed[3] = global.vel / 2.5
                }
                if (GOD_OBJECT.POMB == 1)
                {
                    background_hspeed[1] = hspeed / 2.5
                    background_hspeed[2] = hspeed / 4
                    background_hspeed[3] = hspeed / 2.5
                }
            }
            else
            {
                background_hspeed[1] = 0
                background_hspeed[2] = 0
                background_hspeed[3] = 0
            }
        }
        if (GOD_OBJECT.OutBike == 1)
        {
            if ((view_object[0] == ELPS_OutRider) && ((view_xview[0] != 0) && (view_xview[0] != (room_width - 320))))
            {
                background_hspeed[1] = hspeed / 2.5
                background_hspeed[2] = hspeed / 4
                background_hspeed[3] = hspeed / 2.5
            }
            else
            {
                background_hspeed[1] = 0
                background_hspeed[2] = 0
                background_hspeed[3] = 0
            }
        }
    }
    if instance_exists(ELPSMG_Eggman)
    {
        if ((x > 90) && (x < 630))
        {
            view_xview[1] = x - 90
            background_hspeed[6] = ELPSMG_Eggman.vel / 2
            background_hspeed[7] = ELPSMG_Eggman.vel / 3
        }
        else
        {
            background_hspeed[6] = 0
            background_hspeed[7] = 0
        }
    }
}
