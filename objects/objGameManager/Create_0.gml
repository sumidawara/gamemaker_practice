enum GameState {
	playing,
	gameOver,
	gameClear,
	stageSelect,
	title
}

#macro SHAKE_TIME_INITIAL 15
#macro SHAKE_MAGNITUDE_INITIAL 3
#macro SHAKE_FADE 1

shake = false;
shake_time = SHAKE_TIME_INITIAL;
shake_magnitude = SHAKE_MAGNITUDE_INITIAL;

#macro GAMEOVER 0
#macro GAMECLEAR 1
#macro STAGESELECT 2
#macro TITLE 3

menu[GAMEOVER][0] = "Retry"
menu[GAMEOVER][1] = "Stage Select"
menu[GAMEOVER][2] = "Title"

menu[GAMECLEAR][0] = "Next Stage"
menu[GAMECLEAR][1] = "Stage Select"
menu[GAMECLEAR][2] = "Title"

menu[STAGESELECT][0] = "Stage1"
menu[STAGESELECT][1] = "Stage2"
menu[STAGESELECT][2] = "Stage3"
menu[STAGESELECT][3] = "Stage4"
menu[STAGESELECT][4] = "Stage5"

menu[TITLE][0] = ""

index = 0;

depth = -100

rmNext = -1

function menuSelect(_gamenumber)
{
	var _up = keyboard_check_pressed(vk_up)
	var _down = keyboard_check_pressed(vk_down)
	var _select = keyboard_check_pressed(vk_space)

	var _move = _down - _up;

	if(_move != 0)
	{
		index += _move
	
		var _size = array_length(menu[_gamenumber])
		index = index mod _size
		if(index < 0) index += _size;
	}
	
	if(_select)
	{
		switch(_gamenumber)
		{
			case GAMEOVER:
				switch(index)
				{
					case 0: //Retry
						room_restart();
						global.gameState = GameState.playing
						break;
					case 1: //Stage Select
						room_goto(rmStageSelect);
						global.gameState = GameState.stageSelect;
						break;
					case 2: //Title
						room_goto(rmTitle);
						global.gameState = GameState.title;
						break;
				}
				break;
				
				
			case GAMECLEAR:
				switch(index)
				{
					case 0: //Next Stage
						room_goto(rmNext);
						global.gameState = GameState.playing
						break;
					case 1: //Stage Select
						room_goto(rmStageSelect);
						global.gameState = GameState.stageSelect;
						break;
					case 2: //Title
						room_goto(rmTitle);
						global.gameState = GameState.title;
						break;
				}
				break;
				
				
			case STAGESELECT:
				switch(index)
				{
					case 0: 
						room_goto(rmStage1);
						global.gameState = GameState.playing
						break;
					case 1:
						room_goto(rmStage2);
						global.gameState = GameState.playing
						break;
					case 2:
						room_goto(rmStage3)
						global.gameState = GameState.playing
						break;
					case 3:
						room_goto(rmStage4)
						global.gameState = GameState.playing
						break;
					case 4:
						room_goto(rmStage5)
						global.gameState = GameState.playing
						break;
				}
				break;
			
			case TITLE:
				room_goto(rmStageSelect);
				global.gameState = GameState.stageSelect;
		}
		
		index = 0;
	}
}

global.gameState = GameState.title;
global.playerMoveable = false;