func void ZS_Bleeding()
{
};
func int ZS_Bleeding_Loop()
{
//Мда уж..
	if(Npc_GetStateTime(self) > 5)
	{
		self.attribute[ATR_HITPOINTS] -=1;
		Npc_SetStateTime(self,0);
		return LOOP_CONTINUE;
	};
	return LOOP_CONTINUE;
};
func void ZS_Bleeding_End()
{
};