if(dieState > 0) return 0;

//効果音
audio_play_sound(hit, 1, false)

//破片の放出
for(var i = 0;i < 20; i++)
{	
	instance_create_layer(x+sprite_width / 2 , y+sprite_height/2, layer, objPlayerDebris);
}

//Player死亡時の透明化処理
alarm[0] = 1;

global.gameState = GameState.gameOver;