#macro SELECTED_COLOR c_yellow

var _gap = 40;

draw_set_color(c_white);
draw_set_halign(fa_center);

switch(global.gameState)
{
	case GameState.title:
		draw_text(view_wview * 0.5, view_hview * 0.5, "Press Space");
		break;
		
		
	case GameState.playing:
		break;
		
		
	case GameState.gameOver:
		draw_text(view_wview * 0.5, view_hview * 0.5, "Game Over");
		
		for(var i = 0; i < array_length(menu[GAMEOVER]); i++)
		{
			if(i == index) draw_set_color(SELECTED_COLOR);
			draw_text(view_wview * 0.5, view_hview * 0.5 + _gap * (i + 1), menu[GAMEOVER][i]);
			draw_set_color(c_white)
		}	
		
		break;
		
		
	case GameState.gameClear:
		draw_text(view_wview * 0.5, view_hview * 0.5, "Game Over");	
	
		for(var i = 0; i < array_length(menu[GAMECLEAR]); i++)
		{
			if(i == index) draw_set_color(SELECTED_COLOR);
			draw_text(view_wview * 0.5, view_hview * 0.5 + _gap * (i + 1), menu[GAMECLEAR][i]);
			draw_set_color(c_white)
		}
		
		break;
		
		
	case GameState.stageSelect:
		var _stageCount = array_length(menu[STAGESELECT])
		for(var i = 0; i < _stageCount; i++)
		{
			if(i == index) draw_set_color(SELECTED_COLOR);
			draw_text(view_wview * 0.5, view_hview * 0.5 + _gap * (i - _stageCount / 2), menu[STAGESELECT][i]);
			draw_set_color(c_white)
		}
		
		break;
}