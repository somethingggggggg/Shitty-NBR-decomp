if (Move == 1)
{
    if (((keyboard_check(vk_left) && (!(place_meeting((x + abs(vel) * -1 - 1), y, Break_Mask)))) && (!(place_meeting((x + abs(vel) * -1 - 1), y, Solid_Mask)))) && (((((canMove == 1) || ((rolling == 1) && (vel > 0))) && (Climb == 0)) && (Climb2 == 0)) && (Tornado_Mode == 0)))
    {
        vel -= (acc * (1 + ground))
        if ((vel > 0) && (ground == 0))
            vel -= acc
        if ((vel <= 0) && (rolling == 0))
            image_xscale = -1
    }
    if (((keyboard_check(vk_right) && (!(place_meeting((x + abs(vel) + 1), y, Break_Mask)))) && (!(place_meeting((x + abs(vel) + 1), y, Solid_Mask)))) && (((((canMove == 1) || ((rolling == 1) && (vel < 0))) && (Climb == 0)) && (Climb2 == 0)) && (Tornado_Mode == 0)))
    {
        vel += (acc * (1 + ground))
        if ((vel < 0) && (ground == 0))
            vel += acc
        if ((vel >= 0) && (rolling == 0))
            image_xscale = 1
    }
}
if ((ground == 1) && (Climb == 0))
{
    if (vel > 0)
        vel -= (acc / (rolling + 1))
    else if (vel < 0)
        vel += (acc / (rolling + 1))
}
if (Tornado_Mode == 0)
{
    if ((vel > maxSpeed) && (rolling == 0))
        vel = maxSpeed
    else if ((vel < (-maxSpeed)) && (rolling == 0))
        vel = (-maxSpeed)
    if ((vel > maxSpeed) && (rolling == 1))
        vel = maxSpeed2
    else if ((vel < (-maxSpeed)) && (rolling == 1))
        vel = (-maxSpeed2)
}
if ((vel > (-acc)) && (vel < acc))
{
    vel = 0
    rolling = 0
}
x += vel
if (Grav == 1)
{
    if (((Fly == 0) && (Glide == 0)) && (Climb2 == 0))
    {
        if (((((place_meeting(x, (y + vspeed + 1), Solid_Mask)) || (place_meeting(x, (y + vspeed + 1), MovingMask))) || (place_meeting(x, (y + vspeed + 1), Break_Mask))) || (place_meeting(x, (y + vspeed + 1), objSlopeParent1))) && (vspeed >= 0))
        {
            gravity = 0
            if (vspeed > 6)
                vspeed = 6
        }
        else
        {
            ground = 0
            gravity = 0.15
        }
    }
    else if (((((place_meeting(x, (y + vspeed + 1), Solid_Mask)) || (place_meeting(x, (y + vspeed + 1), MovingMask))) || (place_meeting(x, (y + vspeed + 1), Break_Mask))) || (place_meeting(x, (y + vspeed + 1), objSlopeParent1))) && (vspeed >= 0))
    {
        gravity = 0
        if (vspeed > 6)
            vspeed = 6
    }
    else
    {
        ground = 0
        gravity = 0.15
    }
}
if (Handle == 1)
{
    if ((((canSpriteChange == 1) && (ducking == 0)) && (up == 0)) && (spindash == 0))
    {
        if instance_exists(ELPSMG_Eggman)
        {
            if (ground == 1)
            {
                if (vel == 0)
                    sprite_index = sprELPSMG_EggmanStand
                else if ((vel > -2) && (vel < 2))
                    sprite_index = sprELPSMG_EggmanWalk
                else
                    sprite_index = sprELPSMG_EggmanWalk
                image_speed = 0.15
            }
            else if (sprite_index == sprELPSMG_EggmanJump)
            {
                sprite_index = sprELPSMG_EggmanJump
                image_speed = 0.1
            }
        }
    }
}
if (Jump == 1)
{
    if ((((((((ground == 1) && keyboard_check_pressed(ord("Z"))) && (ducking == 0)) && (up == 0)) && (spindash == 0)) && (Hang == 0)) && (Climb2 == 0)) && (Tornado_Mode == 0))
    {
        canJump = 1
        audio_play_sound(SFX_Jump, 0, false)
        if (Water_mode == 0)
            vspeed = -3
        else
            vspeed = -4
        if instance_exists(ELPSMG_Eggman)
            sprite_index = sprELPSMG_EggmanJump
    }
}
if (Up_Down == 1)
{
    if ((((((((vel == 0) && (ground == 1)) && (up == 0)) && (ducking == 0)) && (rolling == 0)) && keyboard_check(vk_up)) && (Climb2 == 0)) && (Tornado_Mode == 0))
    {
        image_index = 0
        up = 1
        if instance_exists(Assistant1)
            Assistant1.Act = 1
    }
    if (((((((((vel == 0) && (ground == 1)) && (up == 0)) && (ducking == 0)) && (rolling == 0)) && keyboard_check(vk_down)) && (Hang == 0)) && (Climb2 == 0)) && (Tornado_Mode == 0))
    {
        image_index = 0
        ducking = 1
    }
    if ((up == 1) && ((!keyboard_check(vk_up)) || (ground == 0)))
    {
        ducking = 0
        up = 0
        canMove = 1
        if instance_exists(Assistant1)
        {
            Assistant1.FlyDelay = 0
            Assistant1.alarm[0] = 0
        }
    }
    if (GOD_OBJECT.Speak == 0)
    {
        if ((ducking == 1) && ((!keyboard_check(vk_down)) || (ground == 0)))
        {
            ducking = 0
            up = 0
            canMove = 1
        }
    }
}
if instance_exists(ELPSMG_Eggman)
    mask_index = sprELPSMG_EggmanMask
if ((x > 90) && (x < 630))
    view_xview[1] = x - 90
if (x <= 90)
    view_xview[1] = 0
if (view_xview[1] >= 545)
    view_xview[1] = 545
if (bbox_top < (view_yview[1] + 40))
{
    view_yview[1] -= 1
    if (background_y[6] <= view_yview[1])
    {
        background_y[6] += 0.2
        background_y[7] += 0.03
    }
    if (background_y[6] > (view_yview[1] - 1))
        background_y[6] = view_yview[1]
}
if (bbox_bottom > (view_yview[1] + 100))
{
    view_yview[1] += 1
    if ((background_y[6] + 179) >= (view_yview[1] + 140))
    {
        background_y[6] -= 0.2
        background_y[7] -= 0.03
    }
    if ((background_y[6] + 178) < (view_yview[1] + 140))
        background_y[6] = view_yview[1] - 39
}
