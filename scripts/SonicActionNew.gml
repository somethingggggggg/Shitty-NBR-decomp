if (Move == 1)
{
    if ((keyboard_check(vk_left) && (!(collision_rectangle(bbox_right, (bbox_top + 15), (bbox_left - 1), bbox_top, Break_Mask, 0, 0)))) && (!(collision_rectangle(bbox_right, (bbox_top + 15), (bbox_left - 1), bbox_top, Solid_Mask, 0, 0))))
    {
        global.vel -= acc
        image_xscale = -1
    }
    if ((keyboard_check(vk_right) && (!(collision_rectangle(bbox_left, (bbox_top + 15), (bbox_right + 1), bbox_top, Break_Mask, 0, 0)))) && (!(collision_rectangle(bbox_left, (bbox_top + 15), (bbox_right + 1), bbox_top, Solid_Mask, 0, 0))))
    {
        global.vel += acc
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
