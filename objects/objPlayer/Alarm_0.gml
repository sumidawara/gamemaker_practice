//Player死亡時の透明化処理
if(dieState < 101)
{
	image_alpha = (100 - dieState) / 100;
	dieState += 5;
	
	alarm[0] = 1;
}