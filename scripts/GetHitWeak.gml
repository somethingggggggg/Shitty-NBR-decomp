var t, angle, n, spd;
with (Tails)
{
    audio_play_sound(SFX_Hit, 1, false)
    if (canHit == 1)
    {
        with (SW)
            instance_destroy()
        HitDrop = 1
        Out = 1
        FlyTime = 225
        Fly = 0
        Repuls = 0
        up = 0
        ducking = 0
        Move = 0
        Shield = 0
        canHit = 0
        canSpriteChange = 0
        canMove = 0
        rolling = 0
        spindash = 0
        if (global.Sprite_Mode == 2)
            sprite_index = sprTailsBloody1_Hit
        if (global.Sprite_Mode == 4)
            sprite_index = sprTails_HitBlack
        if ((global.Sprite_Mode == 0) || (global.Sprite_Mode == 1))
        {
            if (global.Dark_Mode == 0)
                sprite_index = sprTailsHit
            if (global.Dark_Mode == 1)
                sprite_index = sprTails_HitDark
        }
        image_speed = 0.12
        image_index = 0
        vspeed = -5
        global.vel = image_xscale * -2.5
        ground = 0
        t = 0
        angle = 101.25
        n = 0
        spd = 2.5
    }
}
with (Knuckles)
{
    if (Knock == 0)
    {
        audio_play_sound(SFX_Hit, 1, false)
        if (canHit == 1)
        {
            with (SW)
                instance_destroy()
            HitDrop = 1
            Out = 1
            FlyTime = 225
            Fly = 0
            Repuls = 0
            up = 0
            ducking = 0
            Move = 0
            Shield = 0
            canHit = 0
            canSpriteChange = 0
            canMove = 0
            rolling = 0
            spindash = 0
            Glide = 0
            Climb = 0
            Climb2 = 0
            Punch = 0
            Tornado_Mode = 0
            if ((global.Sprite_Mode == 0) || (global.Sprite_Mode == 1))
                sprite_index = sprKnucklesHit
            image_speed = 0.12
            image_index = 0
            vspeed = -5
            global.vel = image_xscale * -2.5
            ground = 0
            t = 0
            angle = 101.25
            n = 0
            spd = 2.5
        }
    }
    if (Knock == 1)
    {
        Knock = 0
        audio_play_sound(SFX_Hit, 1, false)
        if (canHit == 1)
        {
            with (SW)
                instance_destroy()
            HitDrop = 1
            Out = 1
            FlyTime = 225
            Fly = 0
            Repuls = 0
            up = 0
            ducking = 0
            Move = 0
            Shield = 0
            canHit = 0
            canSpriteChange = 0
            canMove = 0
            rolling = 0
            spindash = 0
            Glide = 0
            Climb = 0
            Climb2 = 0
            Punch = 0
            Tornado_Mode = 0
            if ((global.Sprite_Mode == 0) || (global.Sprite_Mode == 1))
                sprite_index = sprKnucklesHit
            image_speed = 0.12
            image_index = 0
            vspeed = -5
            global.vel = image_xscale * -2.5
            ground = 0
            t = 0
            angle = 101.25
            n = 0
            spd = 2.5
        }
    }
}
