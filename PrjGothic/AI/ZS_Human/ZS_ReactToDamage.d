
func void ZS_ReactToDamage()
{
	PrintDebugNpc(PD_ZS_FRAME,"ZS_ReactToDamage");
	PrintGlobals(PD_ZS_Check);
	C_ZSInit();
	Npc_PercEnable(self,PERC_ASSESSMAGIC,B_AssessMagic);
	Npc_PercEnable(self,PERC_ASSESSMURDER,B_CombatAssessMurder);
	Npc_PercEnable(self,PERC_ASSESSDEFEAT,B_CombatAssessDefeat);
	B_WhirlAround(self,other);
	if((self.id == 888) || (self.id == 889))
	{
		GOPSTOPPED_BRIDGE = TRUE;
	};
	if((self.id == 574) && Npc_KnowsInfo(hero,DIA_Mud_FirstEXIT) && (MUD_HIT == FALSE))
	{
		MUD_HIT = TRUE;
	};
	if(
		(Hlp_GetInstanceID(Org_858_Quentin) == Hlp_GetInstanceID(self)) ||
		(Hlp_GetInstanceID(Org_869_Raeuber) == Hlp_GetInstanceID(self)) ||
		(Hlp_GetInstanceID(Org_870_Raeuber) == Hlp_GetInstanceID(self)) ||
		(Hlp_GetInstanceID(Org_865_Raeuber) == Hlp_GetInstanceID(self)) ||
		(Hlp_GetInstanceID(Org_866_Raeuber) == Hlp_GetInstanceID(self)) ||
		(Hlp_GetInstanceID(Org_864_Raeuber) == Hlp_GetInstanceID(self))
	)
	{
		b_setorg2hostile();
		if((QUENTIN_GANG_QUEST_STARTED == LOG_RUNNING) && !Npc_KnowsInfo(hero,dia_raven_quentin))
		{
			QUENTIN_GANG_QUEST_STARTED = LOG_FAILED;
			Log_SetTopicStatus(QUENTIN_GANG,LOG_FAILED);
			B_LogEntry(QUENTIN_GANG,"Теперь можно забыть о связях с преступным миром!");
		};
	};
	var C_ITEM itm;
	itm = Npc_GetReadiedWeapon(other);
	if(
		self.aivar[AIV_SPECIALCOMBATDAMAGEREACTION] ||
		isFlagsContainCategorie(itm.flags,ITEM_MISSION)
	)
	{
		B_SpecialCombatDamageReaction();
		return;
	};
	if(Npc_IsInFightMode(other,FMODE_FAR) || Npc_IsInFightMode(other,FMODE_MAGIC))
	{
		self.aivar[AIV_LASTHITBYRANGEDWEAPON] = TRUE;
	}
	else
	{
		self.aivar[AIV_LASTHITBYRANGEDWEAPON] = FALSE;
	};
	if(self.id == 574)
	{
		return;
	};
	if(!C_NpcIsMonster(other))
	{
		if(Npc_IsPlayer(other))
		{
			self.aivar[AIV_BEENATTACKED] = 1;
			if((Npc_GetTempAttitude(self,other) == ATT_FRIENDLY) || (self.npcType == npctype_friend))
			{
				PrintDebugNpc(PD_ZS_Check,"...NSC FRIENDLY zum Angreifer");
				C_LookAtNpc(self,other);
				B_Say(self,other,"WHATAREYOUDOING");
				Npc_SetTempAttitude(self,ATT_ANGRY);
				AI_ContinueRoutine(self);
				return;
			}
			else
			{
				PrintDebugNpc(PD_ZS_Check,"...NSC nicht FRIENDLY zum Angreifer!");
				if(Npc_GetPermAttitude(self,other) != ATT_HOSTILE)
				{
					Npc_SetPermAttitude(self,ATT_ANGRY);
				};
				Npc_SetTempAttitude(self,ATT_HOSTILE);
			};
		};
		AI_StartState(self,ZS_AssessEnemy,0,"");
	}
	else
	{
		AI_StartState(self,ZS_AssessMonster,0,"");
	};
};

