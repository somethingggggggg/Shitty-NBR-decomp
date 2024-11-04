if (Style == 1)
{
    if (Handle == 1)
    {
        if ((((canSpriteChange == 1) && (ducking == 0)) && (up == 0)) && (spindash == 0))
        {
            if instance_exists(Sonic)
            {
                if (ground == 1)
                {
                    if (hsp == 0)
                        sprite_index = sprSonicStand
                    else if ((hsp > -7) && (hsp < 7))
                        sprite_index = sprSonicWalk
                    else
                        sprite_index = sprSonicRun
                    image_speed = abs(hsp / 20)
                }
                else if (sprite_index == sprSonicBall)
                {
                    sprite_index = sprSonicBall
                    image_speed = 0.2 + (abs(hsp / 20))
                }
            }
        }
    }
    if (Jump == 1)
    {
        if ((((((ground == 1) && keyboard_check_pressed(ord("Z"))) && (ducking == 0)) && (up == 0)) && (spindash == 0)) && (Hang == 0))
        {
            canJump = 1
            audio_play_sound(SFX_Jump, 0, false)
            if (GOD_OBJECT.Obj_Angle == -1)
                global.vel = (-global.vel)
            if (GOD_OBJECT.Obj_Angle == 1)
                global.vel = (-global.vel)
            if (Water_mode == 0)
                vspeed = -7
            else
                vspeed = -5
            if instance_exists(Sonic)
                sprite_index = sprSonicBall
        }
    }
    if (Up_Down == 1)
    {
        if ((((((global.vel == 0) && (ground == 1)) && (up == 0)) && (ducking == 0)) && (rolling == 0)) && keyboard_check(vk_up))
        {
            image_index = 0
            up = 1
            if instance_exists(Assistant1)
                Assistant1.Act = 1
        }
        if (((((((global.vel == 0) && (ground == 1)) && (up == 0)) && (ducking == 0)) && (rolling == 0)) && keyboard_check(vk_down)) && (Hang == 0))
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
        if ((ducking == 1) && ((!keyboard_check(vk_down)) || (ground == 0)))
        {
            ducking = 0
            up = 0
            canMove = 1
        }
    }
    if instance_exists(Sonic)
    {
        if ((ground == 0) && (sprite_index == sprSonicDuck))
            sprite_index = sprSonicBall
    }
    if instance_exists(Sonic)
        mask_index = sprSonicStand
    if (SpinRoll == 1)
    {
        if (((((((global.vel != 0) && (ground == 1)) && (up == 0)) && (ducking == 0)) && (rolling == 0)) && keyboard_check(vk_down)) && (canHit == 1))
        {
            rolling = 1
            audio_play_sound(SFX_Rolling, 0, false)
        }
        if ((rolling == 1) && ((ground == 0) || (global.vel == 0)))
            canMove = 0
        canMove = 1
        if ((up == 1) && (spindash == 0))
        {
            if instance_exists(Sonic)
                sprite_index = sprSonicUp
            if (image_index < 1)
                image_speed = 0.15
            if (image_index >= 1)
            {
                image_speed = 0
                image_index = 1
            }
            canMove = 0
        }
        if ((ducking == 1) && (spindash == 0))
        {
            if instance_exists(Sonic)
                sprite_index = sprSonicDuck
            if (image_index < 1)
                image_speed = 0.15
            if (image_index >= 1)
            {
                image_speed = 0
                image_index = 1
            }
            canMove = 0
        }
        else if (rolling == 1)
        {
            if instance_exists(Sonic)
                sprite_index = sprSonicBall
            canMove = 0
        }
        else if (spindash == 1)
        {
            if instance_exists(Sonic)
                sprite_index = sprSonicSpindash
            image_speed = 0.25
            canMove = 0
        }
        if ((spindash == 1) && (ground == 0))
        {
            spindash = 0
            rolling = 1
        }
        if ((((ground == 1) && (ducking == 1)) && keyboard_check_pressed(ord("Z"))) && (Hang == 0))
        {
            image_speed = 0.55
            spindash = 1
            audio_play_sound(SFX_Spindash, 0, false)
            if (spindashTimer < 10)
                spindashTimer += 1.5
            if (spindashTimer >= 10)
                spindashTimer += 3
            if instance_exists(Sonic)
                sprite_index = sprSonicSpindash
        }
        spindashTimer -= (spindashTimer / 0.125 / 256)
        if (vspeed == 0)
        {
            if (((ground == 1) && (spindash == 1)) && keyboard_check_released(vk_down))
            {
                rolling = 1
                audio_play_sound(SFX_Rolling, 0, false)
                if instance_exists(Assistant1)
                {
                    Assistant1.Act = 1
                    Assistant1.Access = 0
                }
                global.vel = image_xscale * (5 + spindashTimer)
                spindash = 0
                spindashTimer = 0
            }
        }
    }
    if (ground == 1)
        Repuls = 0
}
