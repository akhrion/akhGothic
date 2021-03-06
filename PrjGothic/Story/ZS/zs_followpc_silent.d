
func void zs_followpc_silent()
{
	PrintDebugNpc(PD_TA_FRAME,"ZS_FollowPC");
	Npc_PercEnable(self,PERC_ASSESSENEMY,B_AssessEnemy);
	Npc_PercEnable(self,PERC_ASSESSPLAYER,b_followpc_silent_assesssc);
	Npc_SetPercTime(self,1);
	self.senses = SENSE_SEE | SENSE_HEAR | SENSE_SMELL;
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,ZS_ReactToDamage);
	Npc_PercEnable(self,PERC_ASSESSCASTER,B_AssessCaster);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,B_AssessMagic);
	Npc_PercEnable(self,PERC_ASSESSMURDER,ZS_AssessMurder);
	Npc_PercEnable(self,PERC_ASSESSDEFEAT,ZS_AssessDefeat);
	Npc_PercEnable(self,PERC_ASSESSFIGHTSOUND,B_AssessFightSound);
	Npc_PercEnable(self,PERC_ASSESSTALK,B_AssessTalk);
	Npc_PercEnable(self,PERC_MOVEMOB,B_MoveMob);
};

func int zs_followpc_silent_loop()
{
	PrintDebugNpc(PD_TA_LOOP,"ZS_FollowPC_Loop");
	PrintGlobals(PD_MST_DETAIL);
	if(Npc_GetDistToNpc(self,hero) > HAI_DIST_FOLLOWPC)
	{
		if(!C_BodyStateContains(self,BS_SWIM))
		{
			AI_SetWalkMode(self,NPC_RUN);
		};
		C_StopLookAt(self);
		AI_GotoNpc(self,hero);
	}
	else
	{
		B_SmartTurnToNpc(self,hero);
	};
	AI_Wait(self,1);
	return LOOP_CONTINUE;
};

func void zs_followpc_silent_end()
{
	PrintDebugNpc(PD_TA_FRAME,"ZS_FollowPC_End");
	self.senses = hero.senses;
};

func void b_followpc_silent_assesssc()
{
	PrintDebugNpc(PD_TA_FRAME,"B_FollowPC_AssessSC");
	if(Npc_GetDistToNpc(self,hero) < HAI_DIST_FOLLOWPC)
	{
		PrintDebugNpc(PD_TA_CHECK,"...SC-Meister jetzt nahe genug!");
		B_FullStop(self);
	};
	if(Npc_CheckInfo(self,1))
	{
		PrintDebugNpc(PD_TA_CHECK,"...wichtige Info zu vergeben!");
		hero.aivar[AIV_IMPORTANT] = TRUE;
		AI_StartState(self,ZS_Talk,0,"");
		return;
	};
};

