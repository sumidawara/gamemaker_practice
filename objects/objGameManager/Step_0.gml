show_debug_message(shake_time);

switch(global.gameState)
{
	case GameState.title:
		menuSelect(TITLE);
		break;
		
	case GameState.playing:
		global.playerMoveable =true;
		break;
		
	case GameState.gameOver:
		shake = true;
		menuSelect(GAMEOVER);
		global.playerMoveable = false;
		break;
		
	case GameState.gameClear:
		menuSelect(GAMECLEAR);
		global.playerMoveable = false;
		break;
		
	case GameState.stageSelect:
		menuSelect(STAGESELECT);
		global.playerMoveable = false;
		break;
}


if (shake == true) 
{ 
	shake_time -= 1; 
	var _xval = choose(-shake_magnitude, shake_magnitude); 
	var _yval = choose(-shake_magnitude, shake_magnitude); 
	camera_set_view_pos(view_camera[0], _xval, _yval); 

	if (shake_time <= 0) 
	{ 
		shake_magnitude -= SHAKE_FADE; 

		if (shake_magnitude <= 0) 
		{
		    camera_set_view_pos(view_camera[0], 0, 0); 
		    shake = false;
		}
	} 
}