if (Style == 4)
{
    if ((Move == 1) && (Punch == 0))
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
            if ((((place_meeting(x, (y + vspeed + 1), Solid_Mask)) || (place_meeting(x, (y + vspeed + 1), Break_Mask))) || (place_meeting(x, (y + vspeed + 1), objSlopeParent1))) && (vspeed >= 0))
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
        else if ((((place_meeting(x, (y + vspeed + 1), Solid_Mask)) || (place_meeting(x, (y + vspeed + 1), Break_Mask))) || (place_meeting(x, (y + vspeed + 1), objSlopeParent1))) && (vspeed >= 0))
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
        if ((((((canSpriteChange == 1) && (ducking == 0)) && (up == 0)) && (spindash == 0)) && (Tornado_Mode == 0)) && (Punch == 0))
        {
            if instance_exists(Knuckles)
            {
                if (global.Sprite_Mode == 0)
                {
                    if (ground == 1)
                    {
                        if (global.vel == 0)
                            sprite_index = sprKnucklesStand
                        else if ((global.vel > -7) && (global.vel < 7))
                            sprite_index = sprKnucklesWalk
                        else
                            sprite_index = sprKnucklesRun
                        image_speed = abs(global.vel / 20)
                    }
                    else if (sprite_index == sprKnucklesJump)
                    {
                        sprite_index = sprKnucklesJump
                        image_speed = 0.2 + (abs(global.vel / 20))
                    }
                }
                if (global.Sprite_Mode == 1)
                {
                    if (ground == 1)
                    {
                        if (global.vel == 0)
                            sprite_index = sprKnucklesStandScary
                        else if ((global.vel > -7) && (global.vel < 7))
                            sprite_index = sprKnucklesWalkScary
                        else
                            sprite_index = sprKnucklesRunScary
                        image_speed = abs(global.vel / 20)
                    }
                    else if (sprite_index == sprKnucklesJumpScary)
                    {
                        sprite_index = sprKnucklesJumpScary
                        image_speed = 0.2 + (abs(global.vel / 20))
                    }
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
                vspeed = -6
            else
                vspeed = -4
            if instance_exists(Knuckles)
            {
                if (global.Sprite_Mode == 0)
                    sprite_index = sprKnucklesJump
                if (global.Sprite_Mode == 1)
                    sprite_index = sprKnucklesJumpScary
            }
        }
    }
    if (Up_Down == 1)
    {
        if ((((((((global.vel == 0) && (ground == 1)) && (up == 0)) && (ducking == 0)) && (rolling == 0)) && keyboard_check(vk_up)) && (Climb2 == 0)) && (Tornado_Mode == 0))
        {
            image_index = 0
            up = 1
            if instance_exists(Assistant1)
                Assistant1.Act = 1
        }
        if (((((((((global.vel == 0) && (ground == 1)) && (up == 0)) && (ducking == 0)) && (rolling == 0)) && keyboard_check(vk_down)) && (Hang == 0)) && (Climb2 == 0)) && (Tornado_Mode == 0))
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
    if instance_exists(Knuckles)
    {
        if (global.Sprite_Mode == 0)
        {
            if ((ground == 0) && (sprite_index == sprKnucklesDuck))
                sprite_index = sprKnucklesJump
        }
        if (global.Sprite_Mode == 1)
        {
            if ((ground == 0) && (sprite_index == sprKnucklesDuckScary))
                sprite_index = sprKnucklesJumpScary
        }
    }
    if instance_exists(Knuckles)
    {
        if (((GOD_OBJECT.Ball_Form == 0) && (ducking == 0)) && (Punch == 0))
            mask_index = sprKnucklesStandMask
        if ((rolling == 1) || (ducking == 1))
            mask_index = sprKnucklesDuckMask
        if (Punch == 1)
            mask_index = sprKnucklesPunch
        if (sprite_index == sprKnuckles_MindFucked)
            mask_index = sprKnucklesStandMask
    }
    if (SpinRoll == 1)
    {
        if (((((((((global.vel != 0) && (ground == 1)) && (up == 0)) && (ducking == 0)) && (rolling == 0)) && keyboard_check(vk_down)) && (canHit == 1)) && (Climb2 == 0)) && (Tornado_Mode == 0))
        {
            rolling = 1
            audio_play_sound(SFX_Rolling, 0, false)
        }
        if ((rolling == 1) && ((ground == 0) || (global.vel == 0)))
            canMove = 0
        canMove = 1
        if ((up == 1) && (spindash == 0))
        {
            if instance_exists(Knuckles)
            {
                if (global.Sprite_Mode == 0)
                    sprite_index = sprKnucklesUp
                if (global.Sprite_Mode == 1)
                    sprite_index = sprKnucklesUpScary
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
            if instance_exists(Knuckles)
            {
                if (global.Sprite_Mode == 0)
                    sprite_index = sprKnucklesDuck
                if (global.Sprite_Mode == 1)
                    sprite_index = sprKnucklesDuckScary
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
            if instance_exists(Knuckles)
            {
                if (global.Sprite_Mode == 0)
                    sprite_index = sprKnucklesJump
                if (global.Sprite_Mode == 1)
                    sprite_index = sprKnucklesJumpScary
            }
            canMove = 0
        }
        else if (spindash == 1)
        {
            if instance_exists(Knuckles)
                sprite_index = sprKnucklesSpindash
            image_speed = 0.25
            canMove = 0
        }
        if ((spindash == 1) && (ground == 0))
        {
            spindash = 0
            rolling = 1
        }
        if ((((((ground == 1) && (ducking == 1)) && keyboard_check_pressed(ord("Z"))) && (Hang == 0)) && (Climb2 == 0)) && (Tornado_Mode == 0))
        {
            image_speed = 0.55
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
            if instance_exists(Knuckles)
                sprite_index = sprKnucklesSpindash
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
                global.vel = image_xscale * (3.5 + spindashTimer)
                spindash = 0
                spindashTimer = 0
            }
        }
    }
    if (ground == 1)
        Repuls = 0
    if ((((vspeed <= -3) == 0 && ((GOD_OBJECT.Ball_Form == 1) || (GOD_OBJECT.Fall_Form == 1))) && keyboard_check_pressed(ord("Z"))) && (ground == 0))
        Glide = 1
    if ((Glide == 1) && keyboard_check(ord("Z")))
    {
        gravity = 0.15
        vspeed = 0
        if (global.Sprite_Mode == 0)
            sprite_index = sprKnucklesGlide
        if (global.Sprite_Mode == 1)
            sprite_index = sprKnucklesGlideScary
        if (global.vel == 0)
            global.vel = image_xscale * 2
        if (image_xscale == 1)
            global.vel += (acc / 2)
        if (image_xscale == -1)
            global.vel -= (acc / 2)
        image_speed = 0
        if ((global.vel > -1) && (global.vel < 1))
            image_index = 0
        if (((global.vel < -1) && (global.vel > -3)) || ((global.vel > 1) && (global.vel < 3)))
            image_index = 1
        if ((global.vel < -3) || (global.vel > 3))
            image_index = 2
        if (rolling == 1)
            rolling = 0
    }
    else if ((Glide == 1) && (!keyboard_check(ord("Z"))))
    {
        if (global.Sprite_Mode == 0)
            sprite_index = sprKnucklesFall
        if (global.Sprite_Mode == 1)
            sprite_index = sprKnucklesFallScary
        Glide = 0
    }
    if ((sprite_index == sprKnucklesFall) || (sprite_index == sprKnucklesFallScary))
    {
        image_speed = 0
        if (vspeed < 2)
            image_index = 0
        if (vspeed > 2)
            image_index = 1
    }
    if (Climb == 1)
    {
        if ((image_xscale == 1) && (Climb2 == 0))
        {
            if ((!(collision_rectangle(x, y, (bbox_right + 1), y, Solid_Mask, 1, 0))) && (!(collision_rectangle(x, y, (bbox_right + 1), y, Break_Mask, 1, 0))))
                x += 1
        }
        if ((image_xscale == -1) && (Climb2 == 0))
        {
            if ((!(collision_rectangle(x, y, (bbox_left - 1), y, Solid_Mask, 1, 0))) && (!(collision_rectangle(x, y, (bbox_left - 1), y, Break_Mask, 1, 0))))
                x -= 1
        }
        gravity = 0
        vspeed = 0
        if (global.Sprite_Mode == 0)
            sprite_index = sprKnucklesClimb
        if (global.Sprite_Mode == 1)
            sprite_index = sprKnucklesClimbScary
        if (keyboard_check(vk_up) || keyboard_check(vk_down))
            image_speed = 0.15
        else
            image_speed = 0
        if keyboard_check(vk_up)
            vspeed = -1
        if keyboard_check(vk_down)
            vspeed = 1
        if ((!keyboard_check(vk_up)) && (!keyboard_check(vk_down)))
        {
            image_index = 0
            vspeed = 0
        }
        if (keyboard_check_pressed(ord("Z")) && (FallOff == 0))
        {
            if (global.Sprite_Mode == 0)
                sprite_index = sprKnucklesJump
            if (global.Sprite_Mode == 1)
                sprite_index = sprKnucklesJumpScary
            vspeed = -4
            Climb = 0
            if (image_xscale == 1)
                global.vel = -2
            if (image_xscale == -1)
                global.vel = 2
        }
        if (image_xscale == 1)
        {
            if ((!(place_meeting((x + 35), (bbox_bottom + 10), Solid_Mask))) && (!(place_meeting((x + 35), (bbox_bottom + 10), Break_Mask))))
            {
                Climb = 0
                x -= 5
                sprite_index = sprKnucklesFall
                vspeed = 0
            }
        }
        if (image_xscale == -1)
        {
            if ((!(place_meeting((x - 35), (bbox_bottom + 10), Solid_Mask))) && (!(place_meeting((x - 35), (bbox_bottom + 10), Break_Mask))))
            {
                Climb = 0
                x += 5
                if (global.Sprite_Mode == 0)
                    sprite_index = sprKnucklesFall
                if (global.Sprite_Mode == 1)
                    sprite_index = sprKnucklesFallScary
                vspeed = 0
            }
        }
        if (image_xscale == 1)
        {
            if ((!(place_meeting((x + 35), (y - 40), Solid_Mask))) && (!(place_meeting((x + 35), (y - 40), Break_Mask))))
            {
                Climb = 0
                vspeed = -7
                audio_play_sound(SFX_Jump, 0, false)
                image_speed = 0.16
                if (global.Sprite_Mode == 0)
                    sprite_index = sprKnucklesJump
                if (global.Sprite_Mode == 1)
                    sprite_index = sprKnucklesJumpScary
            }
        }
        if (image_xscale == -1)
        {
            if ((!(place_meeting((x - 35), (y - 40), Solid_Mask))) && (!(place_meeting((x - 35), (y - 40), Break_Mask))))
            {
                Climb = 0
                vspeed = -7
                audio_play_sound(SFX_Jump, 0, false)
                image_speed = 0.16
                if (global.Sprite_Mode == 0)
                    sprite_index = sprKnucklesJump
                if (global.Sprite_Mode == 1)
                    sprite_index = sprKnucklesJumpScary
            }
        }
    }
    if (Climb2 == 1)
    {
        if (image_xscale == 1)
        {
            if ((collision_point((bbox_right + 5), bbox_bottom, Solid_Mask, 1, 0)) || (collision_point((bbox_right + 5), bbox_bottom, Break_Mask, 1, 0)))
                y -= 1
            else
                x += 1
        }
        if (image_xscale == -1)
        {
            if ((collision_point((bbox_left - 5), bbox_bottom, Solid_Mask, 1, 0)) || (collision_point((bbox_left - 5), bbox_bottom, Break_Mask, 1, 0)))
                y -= 1
            else
                x -= 1
        }
        Climb = 0
        image_speed = 0.18
        if (global.Sprite_Mode == 0)
            sprite_index = sprKnucklesClimbed
        if (global.Sprite_Mode == 1)
            sprite_index = sprKnucklesClimbedScary
    }
    if (Punch_Mode == 1)
    {
        if (((((((((Tornado_Mode == 0) && (up == 0)) && (ducking == 0)) && (Wait_mode == 0)) && (ground == 1)) && (Glide == 0)) && (Climb == 0)) && (Climb2 == 0)) && (rolling == 0))
        {
            if (keyboard_check_pressed(ord("D")) && (Punch == 0))
            {
                Punch = 1
                global.vel = 0
                if (global.Sprite_Mode == 0)
                    sprite_index = sprKnucklesPunch
                if (global.Sprite_Mode == 1)
                    sprite_index = sprKnucklesPunchScary
                image_speed = 0.15
                alarm[2] = 25
            }
        }
    }
    if (Tornado == 1)
    {
        if (((((((((((Tornado_Mode == 0) && (Tornado_On == 0)) && keyboard_check_pressed(ord("X"))) && (up == 0)) && (ducking == 0)) && (Wait_mode == 0)) && (GOD_OBJECT.Ball_Form == 0)) && (Climb2 == 0)) && (FallOff == 0)) && (Out == 0)) && (Repuls == 0))
        {
            Glide = 0
            Climb = 0
            Tornado_Mode = 1
            Tornado_On = 1
        }
    }
    if ((Tornado_Mode == 1) && (Tornado_On == 1))
    {
        Tornado_On = 2
        audio_play_sound(SFX_TornadoStart, 0, false)
        sprite_index = sprKnucklesTornado
        image_speed = 0.8
        alarm[5] = 1
        if keyboard_check(vk_left)
        {
            image_xscale = -1
            global.vel = (-maxSpeed2)
        }
        if keyboard_check(vk_right)
        {
            image_xscale = 1
            global.vel = maxSpeed2
        }
        if ((!keyboard_check(vk_left)) && (!keyboard_check(vk_right)))
            global.vel = image_xscale * maxSpeed2
    }
    if ((Tornado_Mode == 1) && ((global.vel < 0.5) && (global.vel > -0.5)))
    {
        Tornado_Mode = 0
        Tornado_On = 3
        alarm[3] = 250
    }
    if ((((Tornado_Mode == 1) && (ground == 1)) && keyboard_check_pressed(ord("Z"))) && (HUDer.HUD_Mode == 1))
        vspeed = -6
}
