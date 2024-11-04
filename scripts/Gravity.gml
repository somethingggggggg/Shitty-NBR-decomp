if ((place_meeting(x, (y + vspeed + 1), Solid_Mask)) && (vspeed >= 0))
{
    ground = 1
    gravity = 0
    if (vspeed > 8)
        vspeed = 8
}
else
{
    ground = 0
    gravity = 0.25
}
