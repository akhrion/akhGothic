
func void ZS_Boss()
{
	GuardPerception();
//	Npc_PercEnable(self,PERC_ASSESSPLAYER,B_AssessSC);
	Npc_SetStateTime(self,2);
	AI_Standup(self);
	AI_SetWalkMode(self,NPC_WALK);
	AI_GotoWP(self,self.wp);
	if(Wld_IsFPAvailable(self,"FP_STAND") && (self.id != 328))
	{
		AI_GotoFP(self,"FP_STAND");
		AI_AlignToFP(self);
	}
	else
	{
		AI_AlignToWP(self);
	};
	AI_RemoveWeapon(self);
	AI_PlayAni(self,"T_STAND_2_HGUARD");
};

func int ZS_Boss_loop()
{
	var int zufall;
	npc_main_loop(self);
	zufall = Hlp_Random(1000);
	if(zufall >= 800)
	{
		AI_Wait(self,5);
		AI_PlayAni(self,"T_HGUARD_2_STAND");
		AI_Wait(self,1);
		AI_PlayAni(self,"T_STAND_2_HGUARD");
		AI_Wait(self,1);
		return LOOP_CONTINUE;
	}
	else if(zufall >= 300)
	{
		AI_PlayAni(self,"T_HGUARD_LOOKAROUND");
		return LOOP_CONTINUE;
	};
	AI_StopLookAt(self);
	return LOOP_END;
};

func void ZS_Boss_end()
{
	AI_PlayAni(self,"T_HGUARD_2_STAND");
};

