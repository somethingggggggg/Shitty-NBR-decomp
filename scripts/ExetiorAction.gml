if (Style == 3)
{
    if (Move == 1)
    {
        if (((keyboard_check(vk_left) && (!(place_meeting((x + abs(global.vel) * -1 - 1), y, Solid_Mask)))) && ((canMove == 1) || ((rolling == 1) && (global.vel > 0)))) && (BurstUpOn != 1))
        {
            global.vel -= (acc * (1 + ground))
            if ((global.vel > 0) && (ground == 0))
                global.vel -= acc
            if ((global.vel <= 0) && (rolling == 0))
                image_xscale = -1
        }
        if (((keyboard_check(vk_right) && (!(place_meeting((x + abs(global.vel) + 1), y, Solid_Mask)))) && ((canMove == 1) || ((rolling == 1) && (global.vel < 0)))) && (BurstUpOn != 1))
        {
            global.vel += (acc * (1 + ground))
            if ((global.vel < 0) && (ground == 0))
                global.vel += acc
            if ((global.vel >= 0) && (rolling == 0))
                image_xscale = 1
        }
    }
    if (ground == 1)
    {
        if (rolling == 0)
        {
            if (global.vel > 0)
                global.vel -= (acc / (rolling + 1))
            else if (global.vel < 0)
                global.vel += (acc / (rolling + 1))
        }
        if (rolling == 1)
        {
            if (global.vel > 0)
                global.vel -= (acc2 / (rolling + 1))
            else if (global.vel < 0)
                global.vel += (acc2 / (rolling + 1))
        }
    }
    if ((global.vel > maxSpeed) && (rolling == 0))
        global.vel = maxSpeed
    else if ((global.vel < (-maxSpeed)) && (rolling == 0))
        global.vel = (-maxSpeed)
    if ((global.vel > maxSpeed) && (rolling == 1))
        global.vel = maxSpeed2
    else if ((global.vel < (-maxSpeed)) && (rolling == 1))
        global.vel = (-maxSpeed2)
    if ((global.vel > (-acc)) && (global.vel < acc))
    {
        global.vel = 0
        rolling = 0
    }
    x += global.vel
    if (Grav == 1)
    {
        if (Water_mode == 0)
        {
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
        }
        else if ((collision_rectangle(x, y, x, (y + vspeed + 1), Solid_Mask, 0, 0)) && (vspeed >= 0))
        {
            gravity = 0
            if (vspeed > 8)
                vspeed = 8
        }
        else
        {
            ground = 0
            gravity = 0.1
        }
    }
    if (Handle == 1)
    {
        if (((((canSpriteChange == 1) && (ducking == 0)) && (up == 0)) && (spindash == 0)) && (BurstUpOn == 0))
        {
            if instance_exists(ExetiorRace)
            {
                if (ground == 1)
                {
                    if (global.vel == 0)
                        sprite_index = sprExetior_MStand
                    else if ((global.vel > -7) && (global.vel < 7))
                        sprite_index = sprExetior_MWalk
                    else
                        sprite_index = sprExetior_MRun
                    image_speed = abs(global.vel / 20)
                }
                else if (sprite_index == sprExetior_MJump)
                {
                    sprite_index = sprExetior_MJump
                    image_speed = 0.2 + (abs(global.vel / 20))
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
            if (Water_mode == 0)
                vspeed = -13
            else
                vspeed = -16
            if instance_exists(ExetiorRace)
                sprite_index = sprExetior_MJump
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
    if instance_exists(ExetiorRace)
    {
        if ((ground == 0) && (sprite_index == sprExetior_MDuck))
            sprite_index = sprExetior_MJump
    }
    if instance_exists(ExetiorRace)
        mask_index = sprExetior_MStand
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
            if instance_exists(ExetiorRace)
                sprite_index = sprExetior_MUp
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
            if instance_exists(ExetiorRace)
                sprite_index = sprExetior_MDuck
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
            if instance_exists(ExetiorRace)
                sprite_index = sprExetior_MJump
            canMove = 0
        }
        else if (spindash == 1)
        {
            if instance_exists(ExetiorRace)
                sprite_index = sprExetior_MSpindash
            image_speed = 0.25
            canMove = 0
        }
        if ((spindash == 1) && (ground == 0))
        {
            spindash = 0
            rolling = 1
        }
        if (((((ground == 1) && (ducking == 1)) && keyboard_check_pressed(ord("Z"))) && (Hang == 0)) && (BurstUpOn == 0))
        {
            image_speed = 0.55
            spindash = 1
            audio_play_sound(SFX_Spindash, 0, false)
            if (spindashTimer < 2)
                spindashTimer += 1.2
            if ((spindashTimer >= 2) && (spindashTimer < 6))
                spindashTimer += 3.5
            if ((spindashTimer >= 6) && (spindashTimer < 8))
                spindashTimer += 4.8
            if ((spindashTimer >= 8) && (spindashTimer < 10))
                spindashTimer += 5.4
            if (spindashTimer >= 8)
                spindashTimer += 6
            if instance_exists(ExetiorRace)
                sprite_index = sprExetior_MSpindash
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
if (BurstUp == 1)
{
    if (canJump == 1)
    {
        if (image_xscale == 1)
        {
            if (keyboard_check(vk_right) && (collision_rectangle(x, y, (bbox_right + 5), y, Solid_Mask, 1, 0)))
            {
                if (keyboard_check_pressed(ord("Z")) && (BurstUpOn == 0))
                {
                    sprite_index = sprExetior_MCling
                    alarm[1] = 40
                    BurstUpOn = 1
                    alarm[11] = 5
                    audio_play_sound(SFX_Grab, 0, false)
                    vspeed = 0
                    global.vel = 0
                }
            }
        }
        if (image_xscale == -1)
        {
            if (keyboard_check(vk_left) && (collision_rectangle(x, y, (bbox_left - 5), y, Solid_Mask, 1, 0)))
            {
                if (keyboard_check_pressed(ord("Z")) && (BurstUpOn == 0))
                {
                    sprite_index = sprExetior_MCling
                    alarm[1] = 40
                    BurstUpOn = 1
                    alarm[11] = 5
                    audio_play_sound(SFX_Grab, 0, false)
                    vspeed = 0
                    global.vel = 0
                }
            }
        }
    }
    if (BurstUpOn == 1)
    {
        if (image_xscale == 1)
        {
            if (!(collision_rectangle(x, y, (bbox_right + 1), y, Solid_Mask, 1, 0)))
                x += 1
        }
        if (image_xscale == -1)
        {
            if (!(collision_rectangle(x, y, (bbox_left - 1), y, Solid_Mask, 1, 0)))
                x -= 1
        }
        gravity = 0
        if (Act == 1)
        {
            if keyboard_check_pressed(ord("Z"))
            {
                gravity = 0.25
                Act = 0
                BurstUpOn = 2
                alarm[1] = 15
                sprite_index = sprExetior_MJump
                audio_play_sound(SFX_Rolling, 0, false)
                vspeed = -15
            }
        }
    }
}
