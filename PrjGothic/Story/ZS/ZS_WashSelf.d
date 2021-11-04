
func void ZS_WashSelf()
{
	B_SetPerception(self);
	AI_SetWalkMode(self,NPC_WALK);
	if(!Npc_IsOnFP(self,"WASH"))
	{
		AI_GotoWP(self,self.wp);
	};
	if(Wld_IsFPAvailable(self,"WASH"))
	{
		AI_GotoFP(self,"WASH");
		AI_AlignToFP(self);
		AI_PlayAni(self,"T_STAND_2_WASH");
	};
};

func void ZS_WashSelf_Loop()
{
	if(!Npc_IsOnFP(self,"WASH"))
	{
		if(Wld_IsNextFPAvailable(self,"WASH"))
		{
			AI_SetWalkMode(self,NPC_WALK);
			AI_GotoNextFP(self,"WASH");
			AI_PlayAni(self,"T_STAND_2_WASH");
		};
	};
	AI_Wait(self,1);
};

func void ZS_WashSelf_End()
{
	if(Npc_IsOnFP(self,"WASH"))
	{
		AI_PlayAni(self,"T_WASH_2_STAND");
	};
};

