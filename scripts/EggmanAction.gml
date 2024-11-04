if (Style == 5)
{
    if (Move == 1)
    {
        if (((keyboard_check(vk_left) && (!(place_meeting((x + abs(global.vel) * -1 - 1), y, Break_Mask)))) && (!(place_meeting((x + abs(global.vel) * -1 - 1), y, Solid_Mask)))) && (((((canMove == 1) || ((rolling == 1) && (global.vel > 0))) && (Climb == 0)) && (Climb2 == 0)) && (Tornado_Mode == 0)))
        {
            global.vel -= (acc * (1 + ground))
            if ((global.vel > 0) && (ground == 0))
                global.vel -= acc
            if ((global.vel <= 0) && (rolling == 0))
                image_xscale = -1
        }
        if (((keyboard_check(vk_right) && (!(place_meeting((x + abs(global.vel) + 1), y, Break_Mask)))) && (!(place_meeting((x + abs(global.vel) + 1), y, Solid_Mask)))) && (((((canMove == 1) || ((rolling == 1) && (global.vel < 0))) && (Climb == 0)) && (Climb2 == 0)) && (Tornado_Mode == 0)))
        {
            global.vel += (acc * (1 + ground))
            if ((global.vel < 0) && (ground == 0))
                global.vel += acc
            if ((global.vel >= 0) && (rolling == 0))
                image_xscale = 1
        }
    }
    if ((ground == 1) && (Climb == 0))
    {
        if (global.vel > 0)
            global.vel -= (acc / (rolling + 1))
        else if (global.vel < 0)
            global.vel += (acc / (rolling + 1))
    }
    if (Tornado_Mode == 0)
    {
        if ((global.vel > maxSpeed) && (rolling == 0))
            global.vel = maxSpeed
        else if ((global.vel < (-maxSpeed)) && (rolling == 0))
            global.vel = (-maxSpeed)
        if ((global.vel > maxSpeed) && (rolling == 1))
            global.vel = maxSpeed2
        else if ((global.vel < (-maxSpeed)) && (rolling == 1))
            global.vel = (-maxSpeed2)
    }
    if ((global.vel > (-acc)) && (global.vel < acc))
    {
        global.vel = 0
        rolling = 0
    }
    x += global.vel
    if (Grav == 1)
    {
        if (((Fly == 0) && (Glide == 0)) && (Climb2 == 0))
        {
            if (((((place_meeting(x, (y + vspeed + 1), Solid_Mask)) || (place_meeting(x, (y + vspeed + 1), MovingMask))) || (place_meeting(x, (y + vspeed + 1), Break_Mask))) || (place_meeting(x, (y + vspeed + 1), objSlopeParent1))) && (vspeed >= 0))
            {
                gravity = 0
                if (vspeed > 8)
                    vspeed = 8
            }
            else
            {
                ground = 0
                gravity = 0.25
            }
        }
        else if (((((place_meeting(x, (y + vspeed + 1), Solid_Mask)) || (place_meeting(x, (y + vspeed + 1), MovingMask))) || (place_meeting(x, (y + vspeed + 1), Break_Mask))) || (place_meeting(x, (y + vspeed + 1), objSlopeParent1))) && (vspeed >= 0))
        {
            gravity = 0
            if (vspeed > 8)
                vspeed = 8
        }
        else
        {
            ground = 0
            gravity = 0.02
        }
    }
    if (Handle == 1)
    {
        if ((((canSpriteChange == 1) && (ducking == 0)) && (up == 0)) && (spindash == 0))
        {
            if instance_exists(Eggman)
            {
                if (global.Sprite_Mode == 0)
                {
                    if (ground == 1)
                    {
                        if (global.vel == 0)
                            sprite_index = sprEggman_Stand
                        else if ((global.vel > -3) && (global.vel < 3))
                            sprite_index = sprEggman_Walk
                        else
                            sprite_index = sprEggman_Run
                        image_speed = abs(global.vel / 20)
                    }
                    else if (sprite_index == sprEggman_Jump)
                    {
                        sprite_index = sprEggman_Jump
                        image_speed = 0.2 + (abs(global.vel / 20))
                    }
                }
            }
        }
    }
    if ((Jump == 1) && (GOD_OBJECT.FUCKYOUJUMP == 0))
    {
        if (((((((((ground == 1) && keyboard_check_pressed(ord("Z"))) && (ducking == 0)) && (up == 0)) && (spindash == 0)) && (Hang == 0)) && (Climb2 == 0)) && (Tornado_Mode == 0)) && (GOD_OBJECT.POMB == 0))
        {
            canJump = 1
            audio_play_sound(SFX_Jump, 0, false)
            if (GOD_OBJECT.POMB == 0)
            {
                if (Water_mode == 0)
                    vspeed = -4
                else
                    vspeed = -6
            }
            if (GOD_OBJECT.POMB == 1)
            {
                if (Water_mode == 0)
                    vspeed = MovingMask.vspeed - 4
                else
                    vspeed = MovingMask.vspeed - 6
            }
            if instance_exists(Eggman)
            {
                if (global.Sprite_Mode == 0)
                    sprite_index = sprEggman_Jump
            }
        }
    }
    if (Up_Down == 1)
    {
        if ((((((((global.vel == 0) && (ground == 1)) && (up == 0)) && (ducking == 0)) && (rolling == 0)) && keyboard_check(vk_up)) && (Climb2 == 0)) && (Tornado_Mode == 0))
        {
            image_index = 0
            up = 1
            sprite_index = sprEggman_Up
            if instance_exists(Assistant1)
                Assistant1.Act = 1
        }
        if (((((((((global.vel == 0) && (ground == 1)) && (up == 0)) && (ducking == 0)) && (rolling == 0)) && keyboard_check(vk_down)) && (Hang == 0)) && (Climb2 == 0)) && (Tornado_Mode == 0))
        {
            image_index = 0
            ducking = 1
            sprite_index = sprEggman_Duck
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
    if instance_exists(Eggman)
        mask_index = sprEggman_StandMask
}
