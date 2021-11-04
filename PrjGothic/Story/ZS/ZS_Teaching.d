
func void ZS_Teaching()
{
	PrintDebugNpc(PD_TA_FRAME,"ZS_Teaching");
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
	Npc_SetPercTime(self,1);
	AI_SetWalkMode(self,NPC_WALK);
	if(!Npc_IsOnFP(self,"TEACHING"))
	{
		AI_GotoWP(self,self.wp);
	}
	else
	{
		AI_AlignToFP(self);
	};
};

func void ZS_Teaching_Loop()
{
	var int guardreaktion;
	PrintDebugNpc(PD_TA_LOOP,"ZS_Teaching_Loop");
	B_GotoFP(self,"TEACHING");
	AI_AlignToFP(self);
	guardreaktion = Hlp_Random(1000);
	if(self.voice == 11)
	{
		Mdl_StartFaceAni(self,"S_EYESCLOSED",1,-1);
	}
	else if(guardreaktion >= 900)
	{
		AI_OutputSVM(self,NULL,"$TEACH01");
	}
	else if(guardreaktion >= 800)
	{
		AI_OutputSVM(self,NULL,"$TEACH02");
	}
	else if(guardreaktion >= 700)
	{
		AI_OutputSVM(self,NULL,"$TEACH03");
	}
	else if(guardreaktion >= 600)
	{
		AI_OutputSVM(self,NULL,"$TEACH04");
	}
	else if(guardreaktion >= 500)
	{
		AI_OutputSVM(self,NULL,"$TEACH05");
	}
	else if(guardreaktion >= 400)
	{
		AI_OutputSVM(self,NULL,"$TEACH06");
	}
	else if(guardreaktion >= 300)
	{
		AI_OutputSVM(self,NULL,"$TEACH07");
	};
	AI_Wait(self,1);
};

func void ZS_Teaching_End()
{
	PrintDebugNpc(PD_TA_FRAME,"ZS_Teaching_End");
	if(self.voice == 11)
	{
		B_ResetFaceExpression(self);
	};
};

