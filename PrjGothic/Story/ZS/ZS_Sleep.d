
func void ZS_Sleep()
{
	PrintDebugNpc(PD_TA_FRAME,"ZS_Sleep");
	B_SetPerception(self);
	AI_RemoveWeapon(self);
	AI_SetWalkMode(self,NPC_WALK);
	if(!C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT))
	{
		if(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == 0)
		{
			AI_GotoWP(self,self.wp);
		};
	};
};

func int zs_sleep_loop()
{
	PrintDebugNpc(PD_TA_LOOP,"ZS_Sleep_Loop");
	if(Npc_GetDistToWP(self,self.wp) > 300)
	{
		AI_SetWalkMode(self,NPC_WALK);
		AI_GotoWP(self,self.wp);
	}
	else
	{
		AI_StartState(self,ZS_SleepBed,1,"");
	};
	AI_Wait(self,1);
	return LOOP_CONTINUE;
};

func void zs_sleep_end()
{
	PrintDebugNpc(PD_TA_FRAME,"ZS_Sleep_End");
};

func void ZS_SleepBed()
{
	PrintDebugNpc(PD_TA_FRAME,"ZS_SleepBed_Loop");
	LightSleepPerception();
	Npc_PercEnable(self,PERC_ASSESSENTERROOM,b_sleepenterroom);
	AI_RemoveWeapon(self);
	AI_SetWalkMode(self,NPC_WALK);
	if(Wld_IsMobAvailable(self,"BED"))
	{
		AI_UseMob(self,"BED",1);
		Mdl_StartFaceAni(self,"S_EYESCLOSED",1,-1);
	}
	else if(Wld_IsMobAvailable(self,"BEDHIGH"))
	{
		AI_UseMob(self,"BEDHIGH",1);
		Mdl_StartFaceAni(self,"S_EYESCLOSED",1,-1);
	}
	else if(Wld_IsMobAvailable(self,"BEDLOW"))
	{
		AI_UseMob(self,"BEDLOW",1);
		Mdl_StartFaceAni(self,"S_EYESCLOSED",1,-1);
	}
	else if(Wld_IsMobAvailable(self,"CHAIR"))
	{
		AI_UseMob(self,"CHAIR",1);
	}
	else
	{
		AI_StartState(self,ZS_StandAround,1,"");
	};
};

func int ZS_SleepBed_Loop()
{
	PrintDebugNpc(PD_TA_LOOP,"ZS_SleepBed_Loop");
	AI_Wait(self,1);
	if(self.attribute[ATR_HITPOINTS] < self.attribute[ATR_HITPOINTS_MAX])
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
	};
	return LOOP_CONTINUE;
};

func void ZS_SleepBed_End()
{
	PrintDebugNpc(PD_TA_FRAME,"ZS_SleepBed_End");
	if(Wld_IsTime(6,0,9,30))
	{
		B_Say(self,NULL,"$AWAKE");
	};
	AI_UseMob(self,"BEDHIGH",-1);
	AI_UseMob(self,"BEDLOW",-1);
	AI_UseMob(self,"BED",-1);
	B_ResetFaceExpression(self);
};

func void B_SleepQuietSound()
{
	PrintDebugNpc(PD_TA_DETAIL,"B_SleepQuietSound");
	if((Npc_GetDistToNpc(self,other) < PERC_DIST_DIALOG) && Npc_CanSeeNpcFreeLOS(self,other) && (other.guild != GIL_MEATBUG))
	{
		AI_StartState(self,ZS_WakeUp,0,"");
	}
	else
	{
		B_TossAndTurn();
	};
};

func void b_sleepenterroom()
{
	PrintDebugNpc(PD_TA_DETAIL,"B_SleepEnterRoom");
	if(C_BodyStateContains(other,BS_SNEAK) || (other.guild == GIL_MEATBUG) || (other.guild == GIL_BLOODFLY) || !Npc_CanSeeNpcFreeLOS(self,other))
	{
		return;
	}
	else if(c_pcinmyroomisthief())
	{
		AI_StartState(self,ZS_WakeUp,0,"");
	}
	else
	{
		return;
	};
};

