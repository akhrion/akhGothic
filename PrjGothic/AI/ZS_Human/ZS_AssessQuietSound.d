func void AssessThreat()
{
};
func void ZS_AssessQuietSound()
{
	PrintDebugNpc(PD_ZS_FRAME,"ZS_AssessQuietSound");
	C_ZSInit();
	if(hero.guild == GIL_MEATBUG)
	{
		AI_ContinueRoutine(self);
		return;
	};
	if(Snd_IsSourceNpc(self))
	{
		if(C_NpcIsMonster(other))
		{
			AI_StartState(self,ZS_AssessMonster,0,"");
			return;
		}
		else if(C_NpcIsHuman(other))
		{
			AI_StartState(self,ZS_AssessPerson,0,"");
			return;
		};
	}
	else
	{
		AI_StartState(self,ZS_AssessItem,0,"");
		return;
	};
	Print(".............UNKNOWN QUIET SOUND");
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,ZS_ReactToDamage);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,B_AssessMagic);
	Npc_PercEnable(self,PERC_ASSESSSURPRISE,ZS_AssessSurprise);
	Npc_PercEnable(self,PERC_ASSESSENEMY,B_AssessEnemy);
	Npc_PercEnable(self,PERC_ASSESSFIGHTER,B_AssessFighter);
	Npc_PercEnable(self,PERC_ASSESSTHREAT,B_AssessFighter);
	Npc_PercEnable(self,PERC_ASSESSWARN,B_AssessWarn);
	Npc_PercEnable(self,PERC_ASSESSMURDER,ZS_AssessMurder);
	Npc_PercEnable(self,PERC_ASSESSDEFEAT,ZS_AssessDefeat);
	Npc_PercEnable(self,PERC_ASSESSFIGHTSOUND,B_AssessFightSound);
	Npc_PercEnable(self,PERC_CATCHTHIEF,ZS_CatchThief);
	Npc_PercEnable(self,PERC_ASSESSTHEFT,B_AssessTheft);
	Npc_PercEnable(self,PERC_ASSESSTALK,B_RefuseTalk);
	Npc_PercEnable(self,PERC_ASSESSENTERROOM,B_AssessEnterRoom);
	Npc_PercEnable(self,PERC_ASSESSUSEMOB,B_AssessUseMob);
	if(Snd_IsSourceNpc(self))
	{
//		msg("npc..",-1,56);
		AI_TurnToNpc(self,other);
	}
	else
	{
//		msg("item..",-1,58);
//		AI_TurnToSound(self);
//		AI_TurnToNpc(self,item);
	};
};

func int ZS_AssessQuietSound_Loop()
{
	PrintDebugNpc(PD_ZS_LOOP,"ZS_AssessQuietSound_Loop");
	if(Snd_IsSourceNpc(self))
	{
		if(Npc_CanSeeNpc(self,other))
		{
			PrintDebugNpc(PD_ZS_LOOP,"...SC entdeckt!");
			B_AssessSC();
			if((Npc_GetDistToNpc(self,other) < PERC_DIST_FLEE) && !other.aivar[AIV_INVINCIBLE])
			{
				PrintDebugNpc(PD_ZS_LOOP,"...SC in Fluchtradius!");
				Npc_ClearAIQueue(self);
				AI_StartState(self,ZS_ObserveIntruder,0,"");
			}
			else
			{
				PrintDebugNpc(PD_ZS_LOOP,"...SC auЯerhalb Fluchtradius oder in Gesprдch!");
				return LOOP_END;
			};
		}
		else
		{
			PrintDebugNpc(PD_ZS_LOOP,"...SC immer noch nicht entdeckt!");
			if(Npc_GetStateTime(self) > 5)
			{
				PrintDebugNpc(PD_ZS_LOOP,"...nach 5 Sekunden genug gewartet!");
				return LOOP_END;
			}
			else
			{
				AI_Wait(self,1);
			};
		};
	};
	return 0;
};

func void ZS_AssessQuietSound_End()
{
	PrintDebugNpc(PD_ZS_FRAME,"ZS_AssessQuietSound_End");
};

