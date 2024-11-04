if instance_exists(Sonic)
{
    if (Repuls == 1)
        sprite_index = sprSonicBall
}
if instance_exists(Tails)
{
    if (Repuls == 1)
    {
        if (global.Dark_Mode == 0)
            sprite_index = sprTailsSpringUp
        else
            sprite_index = sprTailsSpringUpDark
    }
    if (Repuls == 1)
    {
        if (vspeed >= 1)
        {
            Repuls = 0
            if (global.Dark_Mode == 0)
                sprite_index = sprTailsFall
            else
                sprite_index = sprTails_FallDark
        }
    }
}
if instance_exists(Knuckles)
{
    if (Repuls == 1)
    {
        if (global.Sprite_Mode == 0)
            sprite_index = sprKnucklesSpringUp
        if (global.Sprite_Mode == 1)
            sprite_index = sprKnucklesSpringUpScary
    }
    if (Repuls == 1)
    {
        if (vspeed >= 1)
        {
            Repuls = 0
            if (global.Sprite_Mode == 0)
                sprite_index = sprKnucklesFall
            if (global.Sprite_Mode == 1)
                sprite_index = sprKnucklesFallScary
        }
    }
}
if (!instance_exists(Tails))
{
    if (Repuls == 1)
    {
        image_speed = 0
        if (vspeed <= 0)
            image_index = 0
        if ((vspeed >= -1) && (vspeed <= 1))
            image_index = 1
        if (vspeed > 1)
        {
            Repuls = 0
            image_index = 2
        }
    }
}
