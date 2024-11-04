while ((place_meeting(x, y, objSlopeParent1)) && (vspeed >= 0))
{
    y -= 0.2
    ground = 1
}
while (((place_meeting(x, (y + maxSpeed + 1), objSlopeParent1)) && (!(place_meeting(x, (y + 1), objSlopeParent1)))) && (vspeed >= 0))
{
    y += 0.2
    ground = 1
}
