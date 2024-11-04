if (Style == 2)
{
    if (Move == 1)
    {
        if (((keyboard_check(vk_left) && (!(place_meeting((x + abs(global.vel) * -1 - 1), y, Break_Mask)))) && (!(place_meeting((x + abs(global.vel) * -1 - 1), y, Solid_Mask)))) && ((canMove == 1) || ((rolling == 1) && (global.vel > 0))))
        {
            global.vel -= (acc * (1 + ground))
            if ((global.vel > 0) && (ground == 0))
                global.vel -= acc
            if ((global.vel <= 0) && (rolling == 0))
                image_xscale = -1
        }
        if (((keyboard_check(vk_right) && (!(place_meeting((x + abs(global.vel) + 1), y, Break_Mask)))) && (!(place_meeting((x + abs(global.vel) + 1), y, Solid_Mask)))) && ((canMove == 1) || ((rolling == 1) && (global.vel < 0))))
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
        if (global.vel > 0)
            global.vel -= (acc / (rolling + 1))
        else if (global.vel < 0)
            global.vel += (acc / (rolling + 1))
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
        if (Fly == 0)
        {
            if ((((place_meeting(x, (y + vspeed + 1), Solid_Mask)) || (place_meeting(x, (y + vspeed + 1), Break_Mask))) || (place_meeting(x, (y + vspeed + 1), objSlopeParent1))) && (vspeed >= 0))
            {
                gravity = 0
                if (vspeed > 8)
                    vspeed = 8
            }
            else
            {
                ground = 0
                if (Water_mode == 0)
                    gravity = 0.25
                if (Water_mode == 1)
                    gravity = 0.15
            }
        }
        else if ((((place_meeting(x, (y + vspeed + 1), Solid_Mask)) || (place_meeting(x, (y + vspeed + 1), Break_Mask))) || (place_meeting(x, (y + vspeed + 1), objSlopeParent1))) && (vspeed >= 0))
        {
            gravity = 0
            if (vspeed > 8)
                vspeed = 8
        }
        else
        {
            ground = 0
            if (Water_mode == 0)
                gravity = 0.02
            if (Water_mode == 1)
                gravity = 0.013
        }
    }
    if (Handle == 1)
    {
        if (((((canSpriteChange == 1) && (ducking == 0)) && (up == 0)) && (spindash == 0)) && (Repuls == 0))
        {
            if instance_exists(Tails)
            {
                if (global.Sprite_Mode == 0)
                {
                    if (ground == 1)
                    {
                        if (global.vel == 0)
                            sprite_index = sprTails_Stand
                        else if ((global.vel > -7) && (global.vel < 7))
                            sprite_index = sprTails_Walk
                        else
                            sprite_index = sprTails_Run
                        image_speed = abs(global.vel / 20)
                    }
                    else if (sprite_index == sprTails_Jump)
                    {
                        sprite_index = sprTails_Jump
                        image_speed = 0.2 + (abs(global.vel / 20))
                    }
                }
                if (global.Sprite_Mode == 1)
                {
                    if (global.Dark_Mode == 0)
                    {
                        if (ground == 1)
                        {
                            if (global.vel == 0)
                                sprite_index = sprTails_StandScary
                            else if ((global.vel > -6) && (global.vel < 6))
                                sprite_index = sprTails_WalkScary
                            else
                                sprite_index = sprTails_RunScary
                            image_speed = abs(global.vel / 20)
                        }
                        else if (sprite_index == sprTails_Jump)
                        {
                            sprite_index = sprTails_Jump
                            image_speed = 0.2 + (abs(global.vel / 20))
                        }
                    }
                    else if (ground == 1)
                    {
                        if (global.vel == 0)
                            sprite_index = sprTails_StandDark
                        else if ((global.vel > -6) && (global.vel < 6))
                            sprite_index = sprTails_WalkDark
                        else
                            sprite_index = sprTails_RunDark
                        image_speed = abs(global.vel / 20)
                    }
                    else if (sprite_index == sprTails_JumpDark)
                    {
                        sprite_index = sprTails_JumpDark
                        image_speed = 0.2 + (abs(global.vel / 20))
                    }
                }
                if (global.Sprite_Mode == 2)
                {
                    if (ground == 1)
                    {
                        if (global.vel == 0)
                            sprite_index = sprTailsBloody1_Stand
                        else if ((global.vel > -7) && (global.vel < 7))
                            sprite_index = sprTailsBloody1_Walk
                        else
                            sprite_index = sprTailsBloody1_Run
                        image_speed = abs(global.vel / 20)
                    }
                    else if (sprite_index == sprTailsBloody1_Jump)
                    {
                        sprite_index = sprTailsBloody1_Jump
                        image_speed = 0.2 + (abs(global.vel / 20))
                    }
                }
                if (global.Sprite_Mode == 3)
                {
                    if (ground == 1)
                    {
                        if (global.vel == 0)
                            sprite_index = sprTailsBloody2_Stand
                        else if ((global.vel > -7) && (global.vel < 7))
                            sprite_index = sprTailsBloody2_Walk
                        else
                            sprite_index = sprTailsBloody2_Run
                        image_speed = abs(global.vel / 20)
                    }
                    else if (sprite_index == sprTailsBloody1_Jump)
                    {
                        sprite_index = sprTailsBloody1_Jump
                        image_speed = 0.2 + (abs(global.vel / 20))
                    }
                }
                if (global.Sprite_Mode == 4)
                {
                    if (ground == 1)
                    {
                        if (global.vel == 0)
                            sprite_index = sprTails_StandBlack
                        else if ((global.vel > -7) && (global.vel < 7))
                            sprite_index = sprTails_WalkBlack
                        else
                            sprite_index = sprTails_RunBlack
                        image_speed = abs(global.vel / 20)
                    }
                    else if (sprite_index == sprTails_JumpBlack)
                    {
                        sprite_index = sprTails_JumpBlack
                        image_speed = 0.2 + (abs(global.vel / 20))
                    }
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
                vspeed = -7
            else
                vspeed = -6
            if instance_exists(Tails)
            {
                if (global.Sprite_Mode == 2)
                    sprite_index = sprTailsBloody1_Jump
                if (global.Sprite_Mode == 3)
                    sprite_index = sprTailsBloody1_Jump
                if (global.Sprite_Mode == 4)
                    sprite_index = sprTails_JumpBlack
                if (global.Sprite_Mode == 0)
                    sprite_index = sprTails_Jump
                if (global.Sprite_Mode == 1)
                {
                    if (global.Dark_Mode == 0)
                        sprite_index = sprTails_Jump
                    if (global.Dark_Mode == 1)
                        sprite_index = sprTails_JumpDark
                }
            }
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
    if instance_exists(Tails)
    {
        if (global.Sprite_Mode == 0)
        {
            if ((ground == 0) && (sprite_index == sprTails_Duck))
                sprite_index = sprTails_Jump
        }
        if (global.Sprite_Mode == 1)
        {
            if (global.Dark_Mode == 0)
            {
                if ((ground == 0) && (sprite_index == sprTails_DuckScary))
                    sprite_index = sprTails_Jump
            }
            if (global.Dark_Mode == 1)
            {
                if ((ground == 0) && (sprite_index == sprTails_DuckDark))
                    sprite_index = sprTails_JumpDark
            }
        }
        if (global.Sprite_Mode == 2)
        {
            if ((ground == 0) && (sprite_index == sprTailsBloody1_Duck))
                sprite_index = sprTailsBloody1_Jump
        }
        if (global.Sprite_Mode == 3)
        {
            if ((ground == 0) && (sprite_index == sprTailsBloody2_Duck))
                sprite_index = sprTailsBloody1_Jump
        }
        if (global.Sprite_Mode == 4)
        {
            if ((ground == 0) && (sprite_index == sprTails_DuckBlack))
                sprite_index = sprTails_JumpBlack
        }
    }
    if instance_exists(Tails)
        mask_index = sprTails_Stand
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
            if instance_exists(Tails)
            {
                if (global.Sprite_Mode == 0)
                    sprite_index = sprTails_Up
                if (global.Sprite_Mode == 1)
                {
                    if (global.Dark_Mode == 0)
                        sprite_index = sprTails_UpScary
                    if (global.Dark_Mode == 1)
                        sprite_index = sprTails_UpDark
                }
                if (global.Sprite_Mode == 2)
                    sprite_index = sprTailsBloody1_Up
                if (global.Sprite_Mode == 3)
                    sprite_index = sprTailsBloody2_Up
                if (global.Sprite_Mode == 4)
                    sprite_index = sprTails_UpBlack
            }
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
            if instance_exists(Tails)
            {
                if (global.Sprite_Mode == 0)
                    sprite_index = sprTails_Duck
                if (global.Sprite_Mode == 1)
                {
                    if (global.Dark_Mode == 0)
                        sprite_index = sprTails_DuckScary
                    if (global.Dark_Mode == 1)
                        sprite_index = sprTails_DuckDark
                }
                if (global.Sprite_Mode == 2)
                    sprite_index = sprTailsBloody1_Duck
                if (global.Sprite_Mode == 3)
                    sprite_index = sprTailsBloody2_Duck
                if (global.Sprite_Mode == 4)
                    sprite_index = sprTails_DuckBlack
            }
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
            if instance_exists(Tails)
            {
                if (global.Sprite_Mode == 2)
                    sprite_index = sprTailsBloody1_Jump
                if (global.Sprite_Mode == 3)
                    sprite_index = sprTailsBloody1_Jump
                if (global.Sprite_Mode == 4)
                    sprite_index = sprTails_JumpBlack
                if (global.Sprite_Mode == 1)
                {
                    if (global.Dark_Mode == 0)
                        sprite_index = sprTails_Jump
                    if (global.Dark_Mode == 1)
                        sprite_index = sprTails_JumpDark
                }
                if (global.Sprite_Mode == 0)
                    sprite_index = sprTails_Jump
            }
            canMove = 0
        }
        else if (spindash == 1)
        {
            if instance_exists(Tails)
            {
                if (global.Sprite_Mode == 2)
                    sprite_index = sprTailsBloody1_Spindash
                if (global.Sprite_Mode == 3)
                    sprite_index = sprTailsBloody1_Spindash
                if (global.Sprite_Mode == 4)
                    sprite_index = sprTails_SpindashBlack
                if (global.Sprite_Mode == 0)
                    sprite_index = sprTails_Spindash
                if (global.Sprite_Mode == 1)
                {
                    if (global.Dark_Mode == 0)
                        sprite_index = sprTails_Spindash
                    if (global.Dark_Mode == 1)
                        sprite_index = sprTails_SpindashDark
                }
            }
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
            image_speed = 0.35
            spindash = 1
            audio_play_sound(SFX_Spindash, 0, false)
            if (spindashTimer < 2)
                spindashTimer += 1.2
            if ((spindashTimer >= 2) && (spindashTimer < 4))
                spindashTimer += 1.5
            if ((spindashTimer >= 4) && (spindashTimer < 6))
                spindashTimer += 1.8
            if ((spindashTimer >= 6) && (spindashTimer < 8))
                spindashTimer += 2
            if (spindashTimer >= 8)
                spindashTimer += 2.3
            if instance_exists(Tails)
            {
                if (global.Sprite_Mode == 2)
                    sprite_index = sprTailsBloody1_Spindash
                if (global.Sprite_Mode == 3)
                    sprite_index = sprTailsBloody1_Spindash
                if (global.Sprite_Mode == 4)
                    sprite_index = sprTails_SpindashBlack
                if (global.Sprite_Mode == 0)
                    sprite_index = sprTails_Spindash
                if (global.Sprite_Mode == 1)
                {
                    if (global.Dark_Mode == 0)
                        sprite_index = sprTails_Spindash
                    if (global.Dark_Mode == 1)
                        sprite_index = sprTails_SpindashDark
                }
            }
        }
        spindashTimer -= (spindashTimer / 0.125 / 256)
        if (vspeed == 0)
        {
            if (((ground == 1) && (spindash == 1)) && keyboard_check_released(vk_down))
            {
                if (image_xscale == -1)
                {
                    if (((!(collision_rectangle((bbox_left - 7), (bbox_top + 1), bbox_right, bbox_bottom, Break_Mask, 0, 0))) && (!(collision_rectangle((bbox_left - 7), (bbox_top + 1), bbox_right, bbox_bottom, Solid_Mask, 0, 0)))) && (!(collision_rectangle((bbox_left - 4), (bbox_top + 1), bbox_right, bbox_bottom, Solid_Line, 0, 0))))
                    {
                        rolling = 1
                        audio_play_sound(SFX_Rolling, 0, false)
                        if instance_exists(Assistant1)
                        {
                            Assistant1.Act = 1
                            Assistant1.Access = 0
                        }
                        global.vel = image_xscale * (3.5 + spindashTimer)
                        spindash = 0
                        spindashTimer = 0
                    }
                    else
                    {
                        rolling = 0
                        audio_play_sound(SFX_Rolling, 0, false)
                        if instance_exists(Assistant1)
                        {
                            Assistant1.Act = 1
                            Assistant1.Access = 0
                        }
                        global.vel = 0
                        spindash = 0
                        spindashTimer = 0
                    }
                }
                if (image_xscale == 1)
                {
                    if (((!(collision_rectangle((bbox_right + 7), (bbox_top + 1), bbox_left, bbox_bottom, Break_Mask, 0, 0))) && (!(collision_rectangle((bbox_right + 7), (bbox_top + 1), bbox_left, bbox_bottom, Solid_Mask, 0, 0)))) && (!(collision_rectangle((bbox_right + 4), (bbox_top + 1), bbox_left, bbox_bottom, Solid_Line, 0, 0))))
                    {
                        rolling = 1
                        audio_play_sound(SFX_Rolling, 0, false)
                        if instance_exists(Assistant1)
                        {
                            Assistant1.Act = 1
                            Assistant1.Access = 0
                        }
                        global.vel = image_xscale * (3.5 + spindashTimer)
                        spindash = 0
                        spindashTimer = 0
                    }
                    else
                    {
                        rolling = 0
                        audio_play_sound(SFX_Rolling, 0, false)
                        if instance_exists(Assistant1)
                        {
                            Assistant1.Act = 1
                            Assistant1.Access = 0
                        }
                        global.vel = 0
                        spindash = 0
                        spindashTimer = 0
                    }
                }
            }
        }
    }
    if (ground == 1)
        Repuls = 0
    if ((((FlyAble == 1) && (Wait_mode == 0)) && (Repuls == 0)) && (Out == 0))
    {
        if ((ground == 0) && keyboard_check_pressed(ord("Z")))
        {
            Fly = 1
            if (rolling == 1)
                rolling = 0
            if (Repuls == 1)
                Repuls = 0
        }
        if ((Fly == 1) && (!keyboard_check_pressed(ord("Z"))))
        {
            FlyTime -= 1
            gravity = 0.075
            if (Water_mode == 0)
            {
                if (global.Sprite_Mode == 0)
                    sprite_index = sprTails_Fly
                if (global.Sprite_Mode == 0)
                    sprite_index = sprTails_Fly
                if (global.Sprite_Mode == 1)
                {
                    if (global.Dark_Mode == 0)
                        sprite_index = sprTails_FlyScary
                    else
                        sprite_index = sprTails_FlyDark
                }
                if (global.Sprite_Mode == 2)
                    sprite_index = sprTailsBloody1_Fly
                if (global.Sprite_Mode == 3)
                    sprite_index = sprTailsBloody2_Fly
                if (global.Sprite_Mode == 4)
                    sprite_index = sprTails_FlyBlack
            }
            else
                sprite_index = sprTailsSwiming
            image_speed = 0.15
        }
        else if ((Fly == 1) && keyboard_check_pressed(ord("Z")))
        {
            if ((!(collision_rectangle((bbox_right - 1), bbox_bottom, (bbox_left + 1), (bbox_top - 8), Solid_Mask, 0, 0))) && (!(collision_rectangle((bbox_right - 1), bbox_bottom, (bbox_left + 1), (bbox_top - 8), Break_Mask, 0, 0))))
                vspeed = -2
            else
                vspeed = 0
        }
        if ((FlyTime <= 0) && (Fly == 1))
        {
            vspeed = 1.8
            if (Water_mode == 0)
            {
                if (global.Dark_Mode == 0)
                    sprite_index = sprTails_FlyOut
                if (global.Dark_Mode == 1)
                    sprite_index = sprTails_FlyOutDark
                if (global.Sprite_Mode == 2)
                    sprite_index = sprTailsBloody1_FlyOut
                if (global.Sprite_Mode == 3)
                    sprite_index = sprTailsBloody2_FlyOut
                if (global.Sprite_Mode == 4)
                    sprite_index = sprTails_FlyOutBlack
                if (global.Sprite_Mode == 0)
                    sprite_index = sprTails_FlyOut
            }
            else
                sprite_index = sprTailsSwimingTired
            image_speed = 0.15
        }
        if ((((Fly == 1) && (ground == 0)) && keyboard_check_pressed(ord("X"))) && (rolling == 0))
        {
            if (global.Dark_Mode == 0)
                sprite_index = sprTails_Jump
            if (global.Dark_Mode == 1)
                sprite_index = sprTails_JumpDark
            if (global.Sprite_Mode == 2)
                sprite_index = sprTailsBloody1_Jump
            if (global.Sprite_Mode == 3)
                sprite_index = sprTailsBloody1_Jump
            if (global.Sprite_Mode == 4)
                sprite_index = sprTails_JumpBlack
            vspeed = 0
            Fly = 0
            canJump = 1
            rolling = 0
        }
    }
}
