
func void ZS_Guard()
{
	PrintDebugNpc(PD_TA_FRAME,"ZS_Guard");
	GuardPerception();
	Npc_PercEnable(self,PERC_ASSESSPLAYER,B_AssessSC);
	AI_Standup(self);
	AI_SetWalkMode(self,NPC_WALK);
	AI_RemoveWeapon(self);
	if(Npc_GetDistToWP(self,self.wp) > 400)
	{
		AI_GotoWP(self,self.wp);
	};
	B_InitArmor();
};

func void ZS_Guard_Loop()
{
	PrintDebugNpc(PD_TA_LOOP,"ZS_Guard_Loop");
	if(!Npc_IsOnFP(self,"GUARD"))
	{
		AI_GotoFP(self,"GUARD");
	};
	if((Npc_GetDistToNpc(self,hero) < 800) && !C_BodyStateContains(hero,BS_SNEAK))
	{
		B_SmartTurnToNpc(self,hero);
	}
	else
	{
		AI_AlignToFP(self);
	};
	B_PlayArmor();
	AI_Wait(self,0.5);
};

func void ZS_Guard_End()
{
	PrintDebugNpc(PD_TA_FRAME,"ZS_Guard_End");
	B_ExitArmor();
};

