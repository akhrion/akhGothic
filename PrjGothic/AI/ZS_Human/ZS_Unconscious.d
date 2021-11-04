
func void ZS_Unconscious()
{
	if(!Npc_IsPlayer(self))
	{
		if(Npc_HasItems(self,ItMw_1H_Sledgehammer_01))
		{
			Npc_RemoveInvItems(self,ItMw_1H_Sledgehammer_01,Npc_HasItems(self,ItMw_1H_Sledgehammer_01));
		};
		if(Npc_HasItems(self,itmw_trainsword))
		{
			Npc_RemoveInvItems(self,itmw_trainsword,Npc_HasItems(self,itmw_trainsword));
		};
		if(Npc_HasItems(self,ItMwPickaxe))
		{
			if(((self.guild == GIL_SFB) && (self.npcType == npctype_ambient)) || (self.npcType == Npctype_MINE_Ambient))
			{
				Npc_RemoveInvItems(self,ItMwPickaxe,Npc_HasItems(self,ItMwPickaxe));
			};
		};
	};
	if(self.id == 251)
	{
		if(ARENA_BET_KHARIM == TRUE)
		{
			ARENA_BET_KHARIM_WON = TRUE;
		}
		else if(ARENA_BET_GORHANIS == TRUE)
		{
			ARENA_BET_GORHANIS_WON = TRUE;
		}
		else if(ARENA_BET_KIRGO == TRUE)
		{
			ARENA_BET_KHARIM_WON = TRUE;
			ARENA_BET_GORHANIS_WON = TRUE;
		};
	};
	if(self.id == 729)
	{
		if(ARENA_BET_KIRGO == TRUE)
		{
			ARENA_BET_KIRGO_WON = TRUE;
		}
		else if(ARENA_BET_GORHANIS == TRUE)
		{
			ARENA_BET_GORHANIS_WON = TRUE;
		}
		else if(ARENA_BET_KHARIM == TRUE)
		{
			ARENA_BET_KIRGO_WON = TRUE;
			ARENA_BET_GORHANIS_WON = TRUE;
		};
	};
	if(self.id == 1422)
	{
		if(ARENA_BET_KHARIM == TRUE)
		{
			ARENA_BET_KHARIM_WON = TRUE;
		}
		else if(ARENA_BET_KIRGO == TRUE)
		{
			ARENA_BET_KIRGO_WON = TRUE;
		}
		else if(ARENA_BET_GORHANIS == TRUE)
		{
			ARENA_BET_KIRGO_WON = TRUE;
			ARENA_BET_KHARIM_WON = TRUE;
		};
	};
	if((self.id == 219) || (self.id == 251) || (self.id == 1312) || (self.id == 1316) || (self.id == 1351) || (self.id == 705) || (self.id == 729) || (self.id == 511) || (self.id == 576))
	{
		if(Npc_HasItems(self,ItMw_1H_Sword_01))
		{
			Npc_RemoveInvItems(self,ItMw_1H_Sword_01,Npc_HasItems(self,ItMw_1H_Sword_01));
		};
		if(Npc_HasItems(self,ItMiSwordblade))
		{
			Npc_RemoveInvItems(self,ItMiSwordblade,Npc_HasItems(self,ItMiSwordblade));
		};
	};
	if((((self.guild == GIL_GRD) || (self.guild == GIL_STT) || (self.guild == GIL_GUR) || (self.guild == GIL_EBR)) && (Kapitel > 3) && !Npc_IsPlayer(self)) || (self.aivar[43] == TRUE))
	{
		Npc_ChangeAttribute(self,ATR_HITPOINTS,-1);
		AI_PlayAni(self,"S_DEADB");
		AI_StartState(self,ZS_Dead,0,"");
		B_DeathXP();
		return;
	}
	else
	{
		PrintDebugNpc(PD_ZS_FRAME,"ZS_Unconscious");
		C_ZSInit();
		Npc_PercEnable(self,PERC_ASSESSMAGIC,B_AssessMagic);
		Mdl_ApplyRandomAni(self,"S_WOUNDED","T_WOUNDED_BREATH");
		Mdl_ApplyRandomAniFreq(self,"S_WOUNDED",0);
		Mdl_ApplyRandomAni(self,"S_WOUNDEDB","T_WOUNDEDB_BREATH");
		Mdl_ApplyRandomAniFreq(self,"S_WOUNDEDB",0);
		self.aivar[AIV_PLUNDERED] = FALSE;
		if(self.id != 840)
		{
			self.aivar[AIV_PASSGATE] = TRUE;
		};
		if(Npc_CanSeeNpc(self,other) && (self.guild < GIL_SEPERATOR_ORC))
		{
			PrintDebugNpc(PD_ZS_Check,"...NSC kann T‰ter sehen!");
			if(!Npc_IsPlayer(self))
			{
				B_AssessAndMemorize(NEWS_DEFEAT,NEWS_SOURCE_WITNESS,self,other,self);
			};
		};
		C_StopLookAt(self);
		AI_StopPointAt(self);
		if(C_BodyStateContains(self,BS_SWIM))
		{
			PrintDebugNpc(PD_ZS_Check,"...NSC ertrinkt!");
			AI_StartState(self,ZS_Dead,0,"");
			B_UnconciousXP();
			return;
		};
		if(Npc_IsPlayer(other) || (C_NpcIsHuman(other) && other.aivar[AIV_PARTYMEMBER]) || (C_NpcIsMonster(other) && other.aivar[AIV_MOVINGMOB]))
		{
			PrintDebugNpc(PD_ZS_Check,"...von SC oder Partymember besiegt!");
			B_UnconciousXP();
			self.aivar[AIV_WASDEFEATEDBYSC] = TRUE;
		};
		if(Npc_IsPlayer(self))
		{
			PrintDebugNpc(PD_ZS_Check,"...SC besiegt!");
			other.aivar[AIV_HASDEFEATEDSC] = TRUE;
		};
	};
	if(self.id == 251)
	{
		if(PLAYERINARENA == TRUE)
		{
			PLAYERINARENA = FALSE;
			Wld_SendTrigger("OC_ARENA_GATE");
			B_ExchangeRoutine(Tpl_1422_GorHanis,"START");
			B_ExchangeRoutine(Sld_729_Kharim,"START");
		};
	};
	if(self.id == 729)
	{
		if(PLAYERINARENA == TRUE)
		{
			PLAYERINARENA = FALSE;
			Wld_SendTrigger("OC_ARENA_GATE");
			B_ExchangeRoutine(Tpl_1422_GorHanis,"START");
			B_ExchangeRoutine(GRD_251_Kirgo,"START");
		};
	};
	if(self.id == 1422)
	{
		if(PLAYERINARENA == TRUE)
		{
			PLAYERINARENA = FALSE;
			Wld_SendTrigger("OC_ARENA_GATE");
			B_ExchangeRoutine(GRD_251_Kirgo,"START");
			B_ExchangeRoutine(Sld_729_Kharim,"START");
		};
	};
	if(Npc_IsPlayer(self) && (PLAYERINARENA == TRUE))
	{
		PLAYERINARENA = FALSE;
		Wld_SendTrigger("OC_ARENA_GATE");
	};
};

func int ZS_Unconscious_Loop()
{
	PrintDebugNpc(PD_ZS_LOOP,"ZS_Unconscious_Loop");
	if((self.id == 1422) || (self.id == 251) || (self.id == 729))
	{
		if(Npc_GetStateTime(self) > 3)
		{
			return 1;
		};
	}
	else if(Npc_GetStateTime(self) > HAI_TIME_UNCONSCIOUS)
	{
		PrintDebugNpc(PD_ZS_Check,"...Schleifen-Ende");
		return 1;
	};
	AI_Wait(self,1);
	return 0;
};

func void ZS_Unconscious_End()
{
	PrintDebugNpc(PD_ZS_FRAME,"ZS_Unconscious_End");
	if(C_NpcIsOrc(self) && !Npc_IsPlayer(self))
	{
		PrintDebugNpc(PD_ZS_FRAME,"ZS_Unconscious_End: Me, Orc -> temp-HOSTILE");
		AI_Standup(self);
		Npc_PerceiveAll(self);
		if(Wld_DetectItem(self,ITEM_KAT_NF) || Wld_DetectItem(self,ITEM_KAT_FF))
		{
			PrintDebugNpc(PD_ZS_Check,"ZS_Unconscious_End: Me, Orc -> Waffe aufheben");
			if(Npc_CanSeeItem(self,item))
			{
				AI_TakeItem(self,item);
			};
		};
		Npc_SetTempAttitude(self,ATT_HOSTILE);
		AI_ContinueRoutine(self);
		return;
	};
	if(!Npc_IsPlayer(self))
	{
		B_ResetTempAttitude(self);
	};
	AI_Standup(self);
	AI_StopLookAt(self);
	B_RegainDroppedWeapon(self);
	if(Npc_HasNews(self,NEWS_DEFEAT,other,self) && !Npc_IsInState(other,ZS_Unconscious) && !Npc_IsDead(other))
	{
		PrintDebugNpc(PD_ZS_Check,"...NSC kann den Attackierer noch sehen und der ist bei Bewuﬂtsein!");
		AI_QuickLook(self,other);
		if(self.id == 251)
		{
			B_Say(self,other,"$HEDEFEATEDHIM");
		}
		else if(self.id == 729)
		{
			B_Say(self,other,"$ITWASAGOODFIGHT");
		}
		else if(self.id == 1422)
		{
			B_Say(self,other,"$LOOKAWAY");
		}
		else if(C_AmIStronger(self,other))
		{
			B_Say(self,other,"$YOULLBESORRYFORTHIS");
		}
		else if(Npc_GetPermAttitude(self,other) != ATT_HOSTILE)
		{
			B_Say(self,other,"$YESYES");
		};
	};
	AI_StartState(self,ZS_HealSelf,1,"");
};

