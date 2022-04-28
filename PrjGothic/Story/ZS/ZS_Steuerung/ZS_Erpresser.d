func int isErpresserSawSC()
{
	if(Npc_GetDistToPlayer(self) < 2000)
	{
		if(Npc_CanSeeNpcFreeLOS(self,hero))
		{
			return true;
		};
	};
	return false;
};
func void ZS_ErpresserGoToGuard()
{
	msg("ZS_ErpresserGoToGuard",50,42);
	B_SetPerception(self);
	Npc_SetPercTime(self,1);
	self.wp = "OW_PATH_056";
	Npc_ClearAIQueue(self);
	AI_Wait(self,3);
	B_SmartTurnToNpc(self,hero);
	AI_PointAtNpc(self,hero);
	AI_Wait(self,1);
	AI_StopPointAt(self);
	if(Npc_GetDistToWP(self,self.wp) > 200)
	{
		AI_SetWalkmode(self,NPC_RUN);
	}
	else
	{
		AI_SetWalkmode(self,NPC_WALK);
	};
	AI_GotoWP(self,self.wp);
};
func int ZS_ErpresserGoToGuard_Loop()
{
	msg("ZS_ErpresserGoToGuard_Loop",50,44);
	if(Npc_GetStateTime(self) < 7)
	{
		return LOOP_CONTINUE;
	}
	else if(isErpresserSawSC())
	{
		msgSI("ZS_ErpresserGoToGuard_Loop: ",Npc_GetStateTime(self),50,46);
		B_SmartTurnToNpc(self,hero);
		AI_StartState(self,ZS_ErpresserComeToMe,0,"");
		return LOOP_CONTINUE;
	}
	else
	{
		return LOOP_END;
	};
	return LOOP_CONTINUE;
};
func void ZS_ErpresserGoToGuard_End()
{
	msg("ZS_ErpresserGoToGuard_End",50,48);
	AI_StartState(self,ZS_Erpresser,1,"");
};
func void ZS_ErpresserGoPee()
{
	Print("go to PEE");
	B_SetPerception(self);
	Npc_SetPercTime(self,1);
	self.wp = "PATH_AROUND_HILL02";
	AI_SetWalkmode(self,NPC_WALK);
	AI_GotoWP(self,self.wp);
};
func int ZS_ErpresserGoPee_Loop()
{
Print("ZS_ErpresserGoPee_Loop");
	if(isErpresserSawSC())
	{
		AI_StartState(self,ZS_ErpresserGoToGuard,0,"");
	};
	if(Npc_GetStateTime(self) > 20)
	{
		return LOOP_END;
	};
	return LOOP_CONTINUE;
};
func void ZS_ErpresserGoPee_End()
{
	AI_StartState(self,ZS_Erpresser,1,"");
};
func int isErpresserPee()
{
	if(Hlp_StrCmp(self.wp,"PATH_AROUND_HILL02"))
	{
		return true;
	};
	return false;
};
func void ZS_ErpresserComeToMe()
{
	msg("ZS_ErpresserComeToMe",50,50);
	B_SetPerception(self);
	Npc_SetPercTime(self,1);
	self.voice = 19;
	B_SayOverlay(self,hero,"$DIEMONSTER");
//	AI_Output(self,hero,"888_Erpresser_NULL_0"); //(радушно) Иди сюда дружище!
};
func int ZS_ErpresserComeToMe_Loop()
{
	return LOOP_END;
};
func void ZS_ErpresserComeToMe_End()
{
	self.voice = 13;
	AI_StartState(self,ZS_ErpresserGoToGuard_Loop,1,"");
};
func void ZS_Erpresser()
{
	PrintDebugNpc(PD_TA_FRAME,"ZS_Erpresser");
	Npc_PercEnable(self,PERC_ASSESSPLAYER,B_AssessSC);
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,ZS_ReactToDamage);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,B_AssessMagic);
	Npc_PercEnable(self,PERC_ASSESSCASTER,B_AssessCaster);
	Npc_PercEnable(self,PERC_ASSESSTHREAT,B_AssessFighter);
	Npc_PercEnable(self,PERC_DRAWWEAPON,B_AssessFighter);
	Npc_PercEnable(self,PERC_ASSESSFIGHTSOUND,B_AssessFightSound);
	Npc_PercEnable(self,PERC_ASSESSQUIETSOUND,B_AssessQuietSound);
	Npc_PercEnable(self,PERC_ASSESSTALK,B_AssessTalk);
	Npc_SetPercTime(self,1);
	self.wp = "OW_PATH_056";
	AI_SetWalkMode(self,NPC_WALK);
	AI_GotoWP(self,self.wp);
	if(Wld_IsNextFPAvailable(self,"FP_SMALLTALK_A_START_PATH_ERPRESSER"))
	{
		AI_GotoNextFP(self,"FP_SMALLTALK_A_START_PATH_ERPRESSER");
		AI_AlignToFP(self);
	};
	AI_RemoveWeapon(self);
	AI_PlayAni(self,"T_STAND_2_HGUARD");
};

func int ZS_Erpresser_Loop()
{
	Print("ZS_Erpresser_Loop");
	PrintDebugNpc(PD_TA_LOOP,"ZS_Erpresser_Loop");
	var int zufall;
	zufall = Hlp_Random(1000);
	if(
		!isErpresserSawSC() &&
		!isErpresserPee()
	)
	{
		if(!Hlp_Random(20))
		{
			AI_StartState(self,ZS_ErpresserGoPee,1,"");
		};
	}
	else if(isErpresserSawSC())
	{
		AI_StartState(self,ZS_ErpresserGoToGuard,0,"");
	};
	if(zufall >= 800)
	{
		if(zufall >= 950)
		{
			AI_AlignToWP(self);
			AI_LookAt(self,"PATH_AROUND_HILL01");
			AI_Wait(self,3);
		};
		AI_Wait(self,5);
		AI_PlayAni(self,"T_HGUARD_2_STAND");
		AI_Wait(self,1);
		AI_PlayAni(self,"T_STAND_2_HGUARD");
		AI_Wait(self,1);
		return LOOP_CONTINUE;
	}
	else if(zufall >= 300)
	{
		if(zufall >= 400)
		{
			var C_NPC aidan;
			aidan = Hlp_GetNpc(Hlp_GetInstanceID(ORG_859_AIDAN));
				AI_TurnAway(self,aidan);
			AI_LookAt(self,"OW_PATH_SCAVENGER13_SPAWN01");
			AI_Wait(self,1);
		};
		AI_PlayAni(self,"T_HGUARD_LOOKAROUND");
		return LOOP_CONTINUE;
	};
	AI_StopLookAt(self);
	return LOOP_END;



	if(Npc_GetDistToNpc(self,hero) > 2000)
	{
		self.aivar[AIV_HAS_ERPRESSED] = 0;
		return LOOP_END;
	};
	B_SmartTurnToNpc(self,other);
	AI_Wait(self,0.5);
	return LOOP_CONTINUE;
};

func void ZS_Erpresser_End()
{
	PrintDebugNpc(PD_TA_FRAME,"ZS_Erpresser_End");
	AI_PlayAni(self,"T_HGUARD_2_STAND");
};

