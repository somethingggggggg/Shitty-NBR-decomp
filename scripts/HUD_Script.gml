if (HUD_Mode == 1)
{
    with (Sonic)
    {
        draw_sprite(sprSonic_HUDLive, 0, (view_xview[0] + 35), (view_yview[0] + 240))
        draw_sprite(sprLive_Cont, global.Lives, (view_xview[0] + 55), (view_yview[0] + 244))
        draw_sprite(sprDesk, 0, (view_xview[0] + 35), (view_yview[0] + 30))
        draw_sprite(sprRingCont, Sonic.rings, (view_xview[0] + 75), (view_yview[0] + 30))
        draw_set_font(global.FontCard2)
        draw_text_color((view_xview[0] + 90), (view_yview[0] + 8), global.Score, c_white, c_white, c_white, c_white, 1)
    }
    with (Tails)
    {
        if (Fly == 1)
            draw_sprite(sprTailsJump_HUD, 0, (view_xview[0] + 270), (view_yview[0] + 245))
        draw_sprite(sprTails_HUDLive, 0, (view_xview[0] + 35), (view_yview[0] + 240))
        draw_sprite(sprDesk, 0, (view_xview[0] + 35), (view_yview[0] + 30))
        draw_set_font(global.FontCard2)
        draw_text_color((view_xview[0] + 75), (view_yview[0] + 40), Tails.rings, c_white, c_white, c_white, c_white, 1)
        draw_set_font(global.FontCard3)
        draw_text_color((view_xview[0] + 55), (view_yview[0] + 242), global.Lives, c_white, c_white, c_white, c_white, 1)
        draw_set_font(global.FontCard2)
        draw_text_color((view_xview[0] + 90), (view_yview[0] + 8), global.Score, c_white, c_white, c_white, c_white, 1)
    }
    with (Knuckles)
    {
        if (((Tornado_Mode == 0) && (Tornado_On == 0)) && (Punch == 0))
            draw_sprite(sprTornadoIcon, 0, (view_xview[0] + 270), (view_yview[0] + 25))
        if (((Tornado_Mode == 0) && (Punch == 0)) && (ground == 1))
            draw_sprite(sprPunchIcon, 0, (view_xview[0] + 280), (view_yview[0] + 240))
        draw_sprite(sprKnuckles_HUDLive, 0, (view_xview[0] + 35), (view_yview[0] + 240))
        draw_sprite(sprLive_Cont, global.Lives, (view_xview[0] + 55), (view_yview[0] + 244))
        draw_sprite(sprDesk, 0, (view_xview[0] + 35), (view_yview[0] + 30))
        draw_sprite(sprRingCont, Knuckles.rings, (view_xview[0] + 75), (view_yview[0] + 46))
        draw_sprite(sprTimeCont, GOD_OBJECT.TT1, (view_xview[0] + 85), (view_yview[0] + 14))
        draw_set_font(global.FontCard2)
        draw_text_color((view_xview[0] + 90), (view_yview[0] + 8), global.Score, c_white, c_white, c_white, c_white, 1)
        if ((GOD_OBJECT.TT2 > 0) && (GOD_OBJECT.TT2 < 10))
            draw_sprite(sprRingCont, GOD_OBJECT.TT2, (view_xview[0] + 70), (view_yview[0] + 14))
        if (GOD_OBJECT.TT2 > 9)
            draw_sprite(sprTimeCont, GOD_OBJECT.TT2, (view_xview[0] + 70), (view_yview[0] + 14))
    }
    with (EggB2_MSonic)
    {
        if ((Move == 1) && (ShowMode == 0))
        {
            draw_sprite(sprLifeEnergy, 0, (view_xview[0] + 60), (view_yview[0] + 15))
            draw_sprite(sprTimeCont2, (LifeEnergy - 1), (view_xview[0] + 125), (view_yview[0] + 15))
            draw_sprite_ext(sprMSonicShield, ShieldSpin, (view_xview[0] + 300), (view_yview[0] + 15), 1, 1, 0, -1, ShieldAlpha)
            draw_sprite(sprMetal_HUDLive, 0, (view_xview[0] + 35), (view_yview[0] + 240))
            draw_sprite(sprLive_Cont, global.Lives, (view_xview[0] + 55), (view_yview[0] + 244))
            draw_set_font(global.FontCard2)
            draw_text_color((view_xview[0] + 90), (view_yview[0] + 8), global.Score, c_white, c_white, c_white, c_white, 1)
            if ((HealthUp == 0) && (LifeEnergy < 100))
                draw_sprite_ext(sprHealthUpIcon, ShieldSpin, (view_xview[0] + 300), (view_yview[0] + 37), 1, 1, 0, -1, 1)
        }
        if (ShowMode == 1)
        {
            draw_sprite(sprLifeEnergy, 0, (view_xview[0] + 60), (view_yview[0] + 15))
            draw_sprite(sprTimeCont2, (LifeEnergy - 1), (view_xview[0] + 125), (view_yview[0] + 15))
        }
    }
    with (Eggman)
    {
        draw_sprite(sprEggman_HUDLive, 0, (view_xview[0] + 35), (view_yview[0] + 240))
        draw_sprite(sprLive_Cont, global.Lives, (view_xview[0] + 55), (view_yview[0] + 244))
        draw_sprite(sprDesk, 0, (view_xview[0] + 35), (view_yview[0] + 30))
        draw_sprite(sprRingCont, Eggman.rings, (view_xview[0] + 75), (view_yview[0] + 46))
        draw_sprite(sprTimeCont, GOD_OBJECT.TT1, (view_xview[0] + 85), (view_yview[0] + 14))
        draw_set_font(global.FontCard2)
        draw_text_color((view_xview[0] + 90), (view_yview[0] + 8), global.Score, c_white, c_white, c_white, c_white, 1)
        if ((GOD_OBJECT.TT2 > 0) && (GOD_OBJECT.TT2 < 10))
            draw_sprite(sprRingCont, GOD_OBJECT.TT2, (view_xview[0] + 70), (view_yview[0] + 14))
        if (GOD_OBJECT.TT2 > 9)
            draw_sprite(sprTimeCont, GOD_OBJECT.TT2, (view_xview[0] + 70), (view_yview[0] + 14))
    }
}
