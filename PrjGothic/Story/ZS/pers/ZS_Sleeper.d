
func void ZS_Sleeper()
{
	PrintDebugNpc(PD_MST_FRAME,"ZS_Sleeper");
	Npc_PercEnable(self,PERC_ASSESSPLAYER,B_Sleeper_AssessSC);
	Npc_SetPercTime(self,0.5);
	AI_AlignToWP(self);
};

func int ZS_Sleeper_loop()
{
	if(Npc_IsDead(GUR_1212_MadCorKalom) && !Npc_IsDead(hero))
	{
		if(SLEEPER_AWAKEN == 0)
		{
			SLEEPER_AWAKEN = 1;
			AI_PlayAni(Sleeper,"T_HURT");
			Snd_Play("SLE_AMBIENT");
			Npc_SetStateTime(self,0);
		};
		AI_TurnToNPC(self,hero);
		if(Npc_GetStateTime(self) > 5)
		{
			Snd_Play("SLE_AMBIENT_A1");
			AI_PlayAni(Sleeper,"T_HURT");
			Wld_PlayEffect("SPELLFX_SLEEPER_FIREBALL",self,hero,3,150,DAM_FIRE,TRUE);
			Npc_SetStateTime(self,0);
		};
	};
	return 0;
};

func void ZS_Sleeper_end()
{
	PrintDebugNpc(PD_MST_FRAME,"ZS_Sleeper_end");
};

func void B_Sleeper_AssessSC()
{
	if((Npc_GetDistToNpc(self,hero) < 800) && !Npc_IsInState(hero,ZS_MagicSleep))
	{
		Snd_Play("SLE_AMBIENT");
		B_FullStop(hero);
		AI_StartState(hero,ZS_MagicSleep,0,"");
	};
};

