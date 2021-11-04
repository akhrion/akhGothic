
func void ZS_Meditate()
{
	PrintDebugNpc(PD_TA_FRAME,"ZS_Meditate");
	Npc_PercEnable(self,PERC_ASSESSENEMY,B_AssessEnemy);
	Npc_PercEnable(self,PERC_ASSESSFIGHTER,B_AssessFighter);
	Npc_PercEnable(self,PERC_ASSESSPLAYER,B_AssessSC);
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,ZS_ReactToDamage);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,B_AssessMagic);
	Npc_PercEnable(self,PERC_ASSESSCASTER,B_AssessCaster);
	Npc_PercEnable(self,PERC_ASSESSTHREAT,B_AssessFighter);
	Npc_PercEnable(self,PERC_ASSESSWARN,B_AssessWarn);
	Npc_PercEnable(self,PERC_ASSESSMURDER,ZS_AssessMurder);
	Npc_PercEnable(self,PERC_ASSESSDEFEAT,ZS_AssessDefeat);
	Npc_PercEnable(self,PERC_DRAWWEAPON,B_AssessFighter);
	Npc_PercEnable(self,PERC_ASSESSFIGHTSOUND,B_AssessFightSound);
	Npc_PercEnable(self,PERC_CATCHTHIEF,ZS_CatchThief);
	Npc_PercEnable(self,PERC_ASSESSTHEFT,B_AssessTheft);
	Npc_PercEnable(self,PERC_ASSESSSURPRISE,ZS_AssessSurprise);
	Npc_PercEnable(self,PERC_OBSERVESUSPECT,B_ObserveSuspect);
	Npc_PercEnable(self,PERC_OBSERVEINTRUDER,B_ObserveIntruder);
	Npc_PercEnable(self,PERC_ASSESSTALK,B_AssessTalk);
	Npc_PercEnable(self,PERC_ASSESSCALL,ZS_ReactToCall);
	Npc_PercEnable(self,PERC_ASSESSUSEMOB,B_AssessUseMob);
	Npc_PercEnable(self,PERC_ASSESSENTERROOM,B_AssessEnterRoom);
	Npc_PercEnable(self,PERC_MOVEMOB,B_MoveMob);
	Npc_PercEnable(self,PERC_MOVENPC,B_MoveNpc);
	AI_SetWalkMode(self,NPC_WALK);
	if(!Npc_IsOnFP(self,"MEDITATE") && !C_BodyStateContains(self,BS_SIT))
	{
		AI_GotoWP(self,self.wp);
	};
	if(Wld_IsFPAvailable(self,"MEDITATE") && !C_BodyStateContains(self,BS_SIT))
	{
		AI_GotoFP(self,"MEDITATE");
		AI_AlignToFP(self);
	};
	Wld_DetectNpc(self,-1,ZS_Teaching,-1);
	if(Npc_GetDistToNpc(self,other) <= PERC_DIST_INTERMEDIAT)
	{
		B_SmartTurnToNpc(self,other);
	};
	if(!C_BodyStateContains(self,BS_SIT))
	{
		AI_PlayAniBS(self,"T_STAND_2_PRAY",BS_SIT);
	};
};

func void ZS_Meditate_Loop()
{
	var int praytime;
	PrintDebugNpc(PD_TA_LOOP,"ZS_Meditate_Loop");
	praytime = Hlp_Random(100);
	C_StopLookAt(self);
	if(praytime >= 80)
	{
		AI_PlayAniBS(self,"T_PRAY_RANDOM",BS_SIT);
	};
	if(praytime >= 90)
	{
		B_SayOverlay(self,NULL,"$OM");
	};
	AI_Wait(self,1);
};

func void ZS_Meditate_End()
{
	C_StopLookAt(self);
	AI_PlayAniBS(self,"T_PRAY_2_STAND",BS_STAND);
	PrintDebugNpc(PD_TA_FRAME,"ZS_Meditate_End");
};

