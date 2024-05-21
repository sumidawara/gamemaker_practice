shake_time = SHAKE_TIME_INITIAL;
shake_magnitude = SHAKE_MAGNITUDE_INITIAL;

switch(room)
{
	case rmStage1:
	rmNext = rmStage2;
	break;
	
	case rmStage2:
	rmNext = rmStage3;
	break;
	
	case rmStage3:
	rmNext = rmStage4;
	break;
	
	case rmStage4:
	rmNext = rmStage5;
	break;
	
	case rmStage5:
	rmNext = rmStage1;
	break;
}