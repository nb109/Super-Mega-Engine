/// escapeWall(): avoids getting stuck into walls

while !place_free(x, y) {
    if place_free(x-1, y) {
        show_debug_message(object_get_name(object_index) + " Stuck: Move 1 pixel to the left");
        x--;
    }
    else if place_free(x+1, y) {
        show_debug_message(object_get_name(object_index) + " Stuck: Move 1 pixel to the right");
        x++;
    }
    else if place_free(x, y-1) {
        show_debug_message(object_get_name(object_index) + " Stuck: Move 1 pixel up");
        y--;
    }
    else if place_free(x, y+1) {
        show_debug_message(object_get_name(object_index) + " Stuck: Move 1 pixel down");
        y++;
    }
    else {
        show_debug_message(object_get_name(object_index) + " Stuck: Nowhere to go! Let's try to keep moving forward.");
        x += sign(image_xscale);
        break;
    }
}


if (cfgDebug || debug_mode) && position_meeting(x, y+5, objSolid) {
    //show_error("Stuck!", false);
    show_debug_message("Stuck!");
}

if (cfgDebug || debug_mode) && place_meeting(x, y, objSolid) {
    //show_error("Stuck!", false);
    show_debug_message("Stuck!?");
}