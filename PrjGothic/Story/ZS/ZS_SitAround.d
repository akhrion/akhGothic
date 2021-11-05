
func void ZS_SitAround()
{
	PrintDebugNpc(PD_TA_FRAME,"ZS_SitAround");
	B_SetPerception(self);
	if((Npc_GetDistToWP(self,self.wp) > PERC_DIST_FLEE) && !C_BodyStateContains(self,BS_SIT))
	{
		PrintDebugNpc(PD_TA_CHECK,"...zu weit weg vom TA-Startpunkt!");
		AI_Standup(self);
		AI_RemoveWeapon(self);
		AI_SetWalkMode(self,NPC_WALK);
		AI_GotoWP(self,self.wp);
	};
};

func int ZS_SitAround_Loop()
{
	var int sitreaktion;
	PrintDebugNpc(PD_TA_LOOP,"ZS_SitAround_Loop");
	npc_main_loop(self);
	if(!C_BodyStateContains(self,BS_SIT))
	{
		PrintDebugNpc(PD_TA_CHECK,"...NSC sitzt noch nicht!");
		AI_RemoveWeapon(self);
		if(Wld_IsMobAvailable(self,"BENCH"))
		{
			PrintDebugNpc(PD_TA_CHECK,"...Bank gefunden!");
			AI_UseMob(self,"BENCH",1);
			self.aivar[AIV_HangAroundStatus] = 2;
		}
		else if(Wld_IsMobAvailable(self,"CHAIR"))
		{
			PrintDebugNpc(PD_TA_CHECK,"...Stuhl gefunden!");
			AI_UseMob(self,"CHAIR",1);
			self.aivar[AIV_HangAroundStatus] = 3;
		}
		else if(Wld_IsMobAvailable(self,"SMALL THRONE"))
		{
			PrintDebugNpc(PD_TA_CHECK,"...kl. Thron gefunden!");
			AI_UseMob(self,"SMALL THRONE",1);
			self.aivar[AIV_HangAroundStatus] = 4;
		}
		else
		{
			PrintDebugNpc(PD_TA_CHECK,"...keine Sitzgelegenheit gefunden!");
			AI_StartState(self,ZS_StandAround,1,"");
			return LOOP_CONTINUE;
		};
	}
	else
	{
		sitreaktion = Hlp_Random(100);
		PrintDebugInt(PD_TA_DETAIL,"...Zufallsani-Wurf:",sitreaktion);
		if(sitreaktion >= 95)
		{
			B_Pee(self);
		}
		else if(sitreaktion >= 90)
		{
			if(self.aivar[AIV_HangAroundStatus] == 3)
			{
				AI_PlayAniBS(self,"R_CHAIR_RANDOM_1",BS_SIT);
			}
			else if(self.aivar[AIV_HangAroundStatus] == 2)
			{
				AI_PlayAniBS(self,"R_BENCH_RANDOM_1",BS_SIT);
			};
		}
		else if(sitreaktion >= 85)
		{
			if(self.aivar[AIV_HangAroundStatus] == 3)
			{
				AI_PlayAniBS(self,"R_CHAIR_RANDOM_2",BS_SIT);
			}
			else if(self.aivar[AIV_HangAroundStatus] == 2)
			{
				AI_PlayAniBS(self,"R_BENCH_RANDOM_2",BS_SIT);
			};
		}
		else if(sitreaktion >= 80)
		{
			if(self.aivar[AIV_HangAroundStatus] == 3)
			{
				AI_PlayAniBS(self,"R_CHAIR_RANDOM_3",BS_SIT);
			}
			else if(self.aivar[AIV_HangAroundStatus] == 2)
			{
				AI_PlayAniBS(self,"R_BENCH_RANDOM_3",BS_SIT);
			};
		}
		else if(sitreaktion >= 75)
		{
			if(self.aivar[AIV_HangAroundStatus] == 3)
			{
				AI_PlayAniBS(self,"R_CHAIR_RANDOM_4",BS_SIT);
			}
			else if(self.aivar[AIV_HangAroundStatus] == 2)
			{
				AI_PlayAniBS(self,"R_BENCH_RANDOM_4",BS_SIT);
			};
		};
	};
	AI_Wait(self,1);
	return LOOP_CONTINUE;
};

func void ZS_SitAround_End()
{
	PrintDebugNpc(PD_TA_FRAME,"ZS_SitAround_End");
	if(self.aivar[AIV_HangAroundStatus] == 1)
	{
		if(C_BodyStateContains(self,BS_SIT))
		{
			AI_PlayAni(self,"T_SIT_2_STAND");
		};
		self.aivar[AIV_HangAroundStatus] = 0;
	}
	else if(self.aivar[AIV_HangAroundStatus] == 4)
	{
		AI_UseMob(self,"SMALL THRONE",-1);
		self.aivar[AIV_HangAroundStatus] = 0;
	}
	else if(self.aivar[AIV_HangAroundStatus] == 2)
	{
		AI_UseMob(self,"BENCH",-1);
		self.aivar[AIV_HangAroundStatus] = 0;
	}
	else if(self.aivar[AIV_HangAroundStatus] == 3)
	{
		AI_UseMob(self,"CHAIR",-1);
		self.aivar[AIV_HangAroundStatus] = 0;
	};
};

func void zs_sit()
{
	B_SetPerception(self);
	if((Npc_GetDistToWP(self,self.wp) > PERC_DIST_FLEE) && !C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_RemoveWeapon(self);
		AI_SetWalkMode(self,NPC_WALK);
		AI_GotoWP(self,self.wp);
	};
};

func int zs_sit_loop()
{
	npc_main_loop(self);
	if(!C_BodyStateContains(self,BS_SIT))
	{
		AI_RemoveWeapon(self);
		AI_AlignToFP(self);
		AI_PlayAniBS(self,"T_STAND_2_SIT",BS_SIT);
		self.aivar[AIV_HangAroundStatus] = 1;
	};
	AI_Wait(self,1);
	return LOOP_CONTINUE;
};

func void zs_sit_end()
{
	if(self.aivar[AIV_HangAroundStatus] == 1)
	{
		if(C_BodyStateContains(self,BS_SIT))
		{
			AI_PlayAni(self,"T_SIT_2_STAND");
		};
		self.aivar[AIV_HangAroundStatus] = 0;
	};
};

