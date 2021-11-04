
func void B_MoveMob()
{
	var string door;
	door = Npc_GetDetectedMob(self);
	if(Hlp_StrCmp(door,"DOOR"))
	{
		if(Wld_GetMobState(self,door) == 0)
		{
			Npc_ClearAIQueue(self);
			AI_UseMob(self,door,1);
			AI_UseMob(self,door,-1);
		};
	}
	else
	{
		return;
	};
	if(Npc_IsInState(self,ZS_Babe_Flee) || Npc_IsInState(self,ZS_Flee) || Npc_IsInState(self,ZS_Attack) || Npc_IsInState(self,ZS_ClearRoom) || Npc_IsInState(self,ZS_ClearRoomWait))
	{
	}
	else
	{
		AI_ContinueRoutine(self);
	};
};

