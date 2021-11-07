func void B_AssessMurder()
{
	PrintDebug("B_AssessMurder");
	if(victim.guild == GIL_MEATBUG)
	{
		return;
	};
	AI_StartState(self,ZS_AssessMurder,0,"");
};