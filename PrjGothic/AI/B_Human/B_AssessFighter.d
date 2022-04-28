
func int SC_MyTarget()
{
	return (self.aivar[AIV_LASTTARGET] == Hlp_GetInstanceID(hero));
};

func void B_AssessFighter()
{
	PrintDebugNpc(PD_ZS_FRAME,"B_AssessFighter");
	var C_NPC oth;
	oth = Hlp_GetNpc(other);
	if((self.id == 888) && (GOPSTOPPED_BRIDGE == TRUE))
	{
		Npc_SetTempAttitude(self,ATT_HOSTILE);
		Npc_SetAttitude(self,ATT_HOSTILE);
	};
	if((self.id == 889) && (GOPSTOPPED_BRIDGE == TRUE))
	{
		Npc_SetTempAttitude(self,ATT_HOSTILE);
		Npc_SetAttitude(self,ATT_HOSTILE);
	};
	if(self.npcType == Npctype_ROGUE)
	{
		B_SetRoguesToHostile();
	};
	if(C_NpcIsHuman(other))
	{
		PrintDebugNpc(PD_ZS_FRAME,"...'fighter' ist Mensch!");
		if(Npc_IsInCutscene(other))
		{
			PrintDebugNpc(PD_ZS_Check,"...Waffenziehender in Cutscene!");
			return;
		};
		if(Npc_IsInState(other,ZS_MagicSleep))
		{
			PrintDebugNpc(PD_ZS_Check,"...SC in magischem Schlaf!");
			return;
		};

		var C_NPC othTrgt;
		if(Npc_GetTarget(oth))
		{
			othTrgt = Hlp_GetNpc(other);
			if(
				Npc_GetAttitude(self,othTrgt) == ATT_HOSTILE
			)
			{
				msgSS("B_AssessFighter: self",self.name[0],60,58);
				msgSS("B_AssessFighter: oth",oth.name[0],60,60);
				msgSS("B_AssessFighter: trgt",othTrgt.name[0],60,62);
				PrintDebugNpc(PD_ZS_Check,"...SC fight with our enemy");
				return;
			}
			else if(Hlp_GetInstanceID(othTrgt) == Hlp_GetInstanceID(self))
			{
				var C_Npc myTarget;
				myTarget = Hlp_GetNpc(self.aivar[AIV_LASTTARGET]);
				if(SC_MyTarget())
				{
					PrintDebugNpc(PD_ZS_Check,"...SC fight with me");
					return;
				}
				else if(
					Npc_GetAttitude(oth,myTarget) == ATT_HOSTILE
				)
				{
					PrintDebugNpc(PD_ZS_Check,"...I fight against SC's enemy");
					return;
				};
			};
		};

		if(!Npc_IsPlayer(oth))
		{
			PrintDebugNpc(PD_ZS_Check,"...NSC ist kein Spieler!");
//			return;
		}
		else if(Npc_IsInState(self,ZS_GuardPassage))
		{
			B_CheckForImportantInfo(self,oth);
		};
		if(Npc_IsInFightMode(oth,FMODE_FIST))
		{
			PrintDebugNpc(PD_ZS_Check,"...Fighter hat nur Fдuste 'gezogen'!");
			return;
		};
		if(C_NpcTypeIsFriend(self,oth) || (Npc_GetAttitude(self,oth) == ATT_FRIENDLY))
		{
			PrintDebugNpc(PD_ZS_Check,"...NSC ist NPCTYPE_FRIEND oder ATT_FRIENDLY!");
			return;
		};
		if(oth.aivar[AIV_INVINCIBLE] == TRUE)
		{
			PrintDebugNpc(PD_ZS_Check,"...Fighter ist im Dialog!");
			return;
		};
		if(Npc_IsInFightMode(oth,FMODE_MELEE) && !c_npcisguarding(self))
		{
			PrintDebugNpc(PD_ZS_Check,"...Fighter fьhrt Nahkampfwaffe!");
			if(Npc_GetDistToNpc(self,oth) < HAI_DIST_MELEE)
			{
				PrintDebugNpc(PD_ZS_Check,"...und ist in Nahkampfreichweite");
				B_FullStop(self);
				Npc_SetTarget(self,oth);
				Npc_GetTarget(self);
				AI_StartState(self,ZS_AssessFighter,0,"");
				return;
			};
		};
		if(Npc_IsInFightMode(oth,FMODE_FAR) && !c_npcisguarding(self))
		{
			PrintDebugNpc(PD_ZS_Check,"...Fighter fьhrt Fernkampfwaffe!");
			if(Npc_GetDistToNpc(self,oth) < HAI_DIST_RANGED)
			{
				PrintDebugNpc(PD_ZS_Check,"...und ist in Fernkampfreichweite!");
				B_FullStop(self);
				AI_StartState(self,ZS_AssessFighter,0,"");
				return;
			};
		};
		if(Npc_IsInFightMode(oth,FMODE_MAGIC) && !c_npcisguarding(self))
		{
			PrintDebugNpc(PD_ZS_Check,"...Fighter fьhrt Zauberspruch!");
			if((Npc_GetDistToNpc(self,oth) < HAI_DIST_RANGED) && (Npc_GetActiveSpellCat(oth) == SPELL_BAD))
			{
				PrintDebugNpc(PD_ZS_Check,"...und zwar einen Kampfzauber & innerhalb Fernkampfreichweite!");
				B_FullStop(self);
				AI_StartState(self,ZS_AssessFighter,0,"");
				return;
			}
			else if((Npc_IsInState(self,ZS_GuardPassage) || Npc_WasInState(self,ZS_GuardPassage)) && ((Npc_GetActiveSpell(oth) == SPL_SLEEP) || (Npc_GetActiveSpell(oth) == SPL_CHARM)))
			{
				PrintDebugNpc(PD_ZS_Check,"...Schlaf-/Charmezauber von Durchgangswache gesehen!");
				B_FullStop(self);
				AI_StartState(self,ZS_AssessFighter,0,"");
				return;
			};
		};
	}
	else
	{
		PrintDebugNpc(PD_ZS_Check,"... 'fighter' ist Monster/Orc!");
		if(C_NpcIsDangerousMonster(self,other))
		{
			PrintDebugNpc(PD_ZS_Check,"... 'fighter' ist gefдhrliches Monster!");
			if(Npc_GetDistToNpc(self,other) < HAI_DIST_ASSESS_MONSTER)
			{
				B_FullStop(self);
				AI_StartState(self,ZS_AssessMonster,0,"");
				return;
			};
		};
	};
};

