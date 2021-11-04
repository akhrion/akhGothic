func void ZS_RespawnWait()
{
	msg("ZS_RespawnWait",-1,70);
};
func int ZS_RespawnWait_Loop()
{
	/*
	msg("ZS_RespawnWait_Loop",-1,52);
	if(self.lp == Wld_GetDay())
	{
		msg("ZS_RespawnWait_CONTINUE",10,54);
		return LOOP_CONTINUE;
	};
	msg("ZS_RespawnWait_END",10,56);
	Wld_RemoveNpc(Hlp_GetInstanceID(self));
	Wld_InsertNpc(Hlp_GetInstanceID(self),self.wp);
	self.attribute[ATR_HITPOINTS] = 2;
	*/
	
	msg("ZS_RespawnWait_Loop",0,30);
	
	return LOOP_END;
};
func void ZS_RespawnWait_End()
{
};