prototype def_RESPAWN(RESPAWN)
{
	isRespawnRequested = false;
	isArrEmpty = true;
	lastRespawnTime = 0;
	delay = 60;
	arrSize = 200;
	main = akh_Respawn;
	memoDeath = akh_memo_death;
	flush = akh_RespawnRequested;
};