if(global.playerMoveable)
{
	key_right = keyboard_check(vk_right)
	key_left = keyboard_check(vk_left);
	key_down = keyboard_check(vk_down);
	key_up = keyboard_check(vk_up);

	xSpd = (key_right - key_left) * moveSpd;
	ySpd = (key_down - key_up) * moveSpd;

	//when touched with wall
	if(place_meeting(x + xSpd, y, objWall)){
		repeat(abs(xSpd)){
			if(!place_meeting(x + sign(xSpd), y, objWall)){
				x += sign(xSpd);	
			}
		}
		xSpd = 0;
	}
	if(place_meeting(x, y + ySpd, objWall)){
		repeat(abs(ySpd)){
			if(!place_meeting(x , y + sign(ySpd), objWall)){
				y += sign(ySpd);	
			}
		}
		ySpd = 0;
	}

	x += xSpd;
	y += ySpd;	
}