if (HUDer.HUD_Mode == 1)
{
    draw_sprite(sprRingCont, Timer.Min, (view_xview[0] + 59), (view_yview[0] + 30))
    draw_sprite(sprDoubleDot, 0, (view_xview[0] + 69), (view_yview[0] + 30))
    draw_sprite(sprTimeCont, Timer.Sec, (view_xview[0] + 80), (view_yview[0] + 30))
}
