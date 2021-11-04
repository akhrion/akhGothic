
func int C_AmIStronger(var C_Npc slf,var C_Npc oth)
{
	PrintDebugNpc(PD_ZS_DETAIL,"C_AmIStronger");
	if((2 * slf.level) > oth.level)
	{
		PrintDebugNpc(PD_ZS_DETAIL,"...yes");
		return TRUE;
	}
	else
	{
		PrintDebugNpc(PD_ZS_DETAIL,"...no");
	};
	return FALSE;
};

func int C_AmIWeaker(var C_Npc slf,var C_Npc oth)
{
	PrintDebugNpc(PD_ZS_DETAIL,"C_AmIWeaker");
	if((2 * slf.level) <= oth.level)
	{
		if((self.guild == GIL_ORCSCOUT) || (self.guild == GIL_ORCWARRIOR))
		{
			return FALSE;
		}
		else if((self.id == 863) || (self.id == 864) || (self.id == 858) || (self.id == 865) || (self.id == 866) || (self.id == 867) || (self.id == 868) || (self.id == 869) || (self.id == 870) || (self.id == 871) || (self.id == 874))
		{
			return FALSE;
		}
		else if(self.id == 1303)
		{
			return FALSE;
		}
		else if(self.id == 844)
		{
			return FALSE;
		}
		else if(self.id == 336)
		{
			return FALSE;
		}
		else if(self.id == 337)
		{
			return FALSE;
		}
		else if(self.id == 338)
		{
			return FALSE;
		}
		else if(self.id == 246)
		{
			return FALSE;
		}
		else if(self.id == 284)
		{
			return FALSE;
		}
		else if(self.id == 286)
		{
			return FALSE;
		}
		else if(self.id == 287)
		{
			return FALSE;
		}
		else if(self.id == 288)
		{
			return FALSE;
		}
		else if(self.id == 289)
		{
			return FALSE;
		}
		else if(self.id == 290)
		{
			return FALSE;
		}
		else if(self.id == 291)
		{
			return FALSE;
		}
		else if(self.id == 292)
		{
			return FALSE;
		}
		else if(self.id == 293)
		{
			return FALSE;
		}
		else if(self.id == 294)
		{
			return FALSE;
		}
		else if(self.id == 295)
		{
			return FALSE;
		}
		else if(self.id == 296)
		{
			return FALSE;
		}
		else if(self.id == 297)
		{
			return FALSE;
		}
		else if(self.id == 298)
		{
			return FALSE;
		}
		else if(self.id == 299)
		{
			return FALSE;
		}
		else if(self.id == 1490)
		{
			return FALSE;
		}
		else if(self.id == 1333)
		{
			return FALSE;
		}
		else if(self.id == 251)
		{
			return FALSE;
		}
		else if(self.id == 729)
		{
			return FALSE;
		}
		else if(self.id == 1422)
		{
			return FALSE;
		}
		else
		{
			PrintDebugNpc(PD_ZS_DETAIL,"...yes");
			return TRUE;
		};
	}
	else
	{
		PrintDebugNpc(PD_ZS_DETAIL,"...no");
	};
	return FALSE;
};

func int C_NpcIsInFightMode(var C_Npc oth)
{
	PrintDebugNpc(PD_ZS_Check,"C_NpcIsInFightMode");
	if(Npc_IsInFightMode(oth,FMODE_FAR) || Npc_IsInFightMode(oth,FMODE_MELEE) || Npc_IsInFightMode(oth,FMODE_FIST))
	{
		PrintDebugNpc(PD_ZS_Check,"...true");
		return TRUE;
	}
	else if(Npc_IsInFightMode(oth,FMODE_MAGIC))
	{
		if(Npc_GetActiveSpellCat(oth) == SPELL_BAD)
		{
			PrintDebugNpc(PD_ZS_Check,"...true");
			return TRUE;
		}
		else if((Npc_IsInState(self,ZS_GuardPassage) || Npc_WasInState(self,ZS_GuardPassage)) && ((Npc_GetActiveSpell(oth) == SPL_SLEEP) || (Npc_GetActiveSpell(oth) == SPL_CHARM)))
		{
			PrintDebugNpc(PD_ZS_Check,"...true");
			return TRUE;
		};
	}
	else
	{
		PrintDebugNpc(PD_ZS_Check,"...false");
	};
	return FALSE;
};

func int C_NpcIsInNeutralSpellMode(var C_Npc oth)
{
	PrintDebugNpc(PD_ZS_Check,"C_NpcIsInNeutralSpellMode");
	if(Npc_IsInFightMode(oth,FMODE_MAGIC) && ((Npc_GetActiveSpellCat(oth) == SPELL_GOOD) || (Npc_GetActiveSpellCat(oth) == SPELL_NEUTRAL)))
	{
		PrintDebugNpc(PD_ZS_Check,"...true");
		return TRUE;
	}
	else
	{
		PrintDebugNpc(PD_ZS_Check,"...false");
	};
	return FALSE;
};

func int C_NpcIsDown(var C_Npc slf)
{
	PrintDebugNpc(PD_ZS_DETAIL,"C_NpcIsDown");
	if(Npc_IsInState(slf,ZS_Unconscious) || Npc_IsInState(slf,ZS_MagicSleep) || Npc_IsDead(slf))
	{
		PrintDebugNpc(PD_ZS_DETAIL,"...true");
		return TRUE;
	}
	else
	{
		PrintDebugNpc(PD_ZS_DETAIL,"...false");
	};
	return FALSE;
};

func int C_NpcIsHuman(var C_Npc slf)
{
	PrintDebugNpc(PD_ZS_DETAIL,"C_NpcIsHuman");
	PrintDebugString(PD_ZS_DETAIL,"...name: ",slf.name);
	if(slf.guild < GIL_SEPERATOR_HUM)
	{
		PrintDebugNpc(PD_ZS_DETAIL,"...true");
		return TRUE;
	}
	else
	{
		PrintDebugNpc(PD_ZS_DETAIL,"...false");
	};
	return FALSE;
};

func int C_NpcIsMonster(var C_Npc slf)
{
	PrintDebugNpc(PD_ZS_DETAIL,"C_NpcIsMonster");
	PrintDebugString(PD_ZS_DETAIL,"...name: ",slf.name);
	if((slf.guild > GIL_SEPERATOR_HUM) && (slf.guild < GIL_SEPERATOR_ORC))
	{
		PrintDebugNpc(PD_ZS_DETAIL,"...true");
		return TRUE;
	}
	else
	{
		PrintDebugNpc(PD_ZS_DETAIL,"...false");
	};
	return FALSE;
};

func int C_NpcIsDangerousMonster(var C_Npc slf,var C_Npc oth)
{
	PrintDebugNpc(PD_ZS_DETAIL,"C_NpcIsDangerousMonster");
	if(
		C_NpcIsMonster(oth) &&
		(Wld_GetGuildAttitude(oth.guild,slf.guild) == ATT_HOSTILE) &&
		!oth.aivar[AIV_MOVINGMOB] &&
		!C_NpcIsDown(oth)
	)
	{
		PrintDebugNpc(PD_ZS_DETAIL,"...true");
		return TRUE;
	};
	PrintDebugNpc(PD_ZS_DETAIL,"...false");
	return FALSE;
};
func int C_NpcIsDangerousPerson(var C_NPC slf, var C_NPC oth)
{
	return false;
};
func int C_NpcIsDisgusting(var C_NPC slf, var C_NPC oth)
{
//	Print("C_NpcIsDisgusting");
	msgISI(slf.guild,"<",GIL_SEPERATOR_HUM,50,52);
	msgISI(oth.aivar[AIV_MM_REAL_ID], "==", ID_MEATBUG,50,54);
	PrintDebugNpc(PD_ZS_DETAIL,"C_NpcIsDisgusting");
	if(
		slf.guild < GIL_SEPERATOR_HUM &&
		oth.aivar[AIV_MM_REAL_ID] == ID_MEATBUG
	)
	{
	Print("C_NpcIsDisgusting TRUUUUE");
		PrintDebugNpc(PD_ZS_DETAIL,"...true");
		return true;
	};
	PrintDebugNpc(PD_ZS_DETAIL,"...false");
	return FALSE;
};

func int C_NpcIsOrc(var C_Npc slf)
{
	PrintDebugNpc(PD_ZS_DETAIL,"C_NpcIsOrc");
	if(slf.guild > GIL_SEPERATOR_ORC)
	{
		PrintDebugNpc(PD_ZS_DETAIL,"...true");
		return TRUE;
	}
	else
	{
		PrintDebugNpc(PD_ZS_DETAIL,"...false");
	};
	return FALSE;
};

func int C_NpcIsMonsterMage(var C_Npc slf)
{
	PrintDebugNpc(PD_ZS_DETAIL,"C_NpcIsMonsterMage");
	if((slf.fight_tactic == FAI_HUMAN_MAGE) && ((slf.guild == GIL_DEMON) || (slf.guild == GIL_ORCSHAMAN) || (slf.guild == GIL_UNDEADORC) || (slf.guild == GIL_GOLEM)))
	{
		PrintDebugNpc(PD_ZS_DETAIL,"...true");
		return TRUE;
	}
	else
	{
		PrintDebugNpc(PD_ZS_DETAIL,"...false");
	};
	return FALSE;
};

func int C_NpcIsMystic(var C_NPC oth)
{
	PrintDebugNpc(PD_ZS_DETAIL,"C_NpcIsMystic");
	if(
		oth.aivar[AIV_MM_REAL_ID] == GIL_SKELETON ||
		oth.aivar[AIV_MM_REAL_ID] == GIL_ZOMBIE ||
		oth.aivar[AIV_MM_REAL_ID] == GIL_UNDEADORC ||
		oth.aivar[AIV_MM_REAL_ID] == GIL_DEMON ||
		oth.aivar[AIV_MM_REAL_ID] == GIL_GOLEM ||
		oth.aivar[AIV_MM_REAL_ID] == GIL_SLF
	)
	{
		PrintDebugNpc(PD_ZS_DETAIL,"...true");
	};
	PrintDebugNpc(PD_ZS_DETAIL,"...false");
	return FALSE;	
};

func void Npc_SetPermAttitude(var C_Npc slf,var int att)
{
	PrintDebugNpc(PD_ZS_DETAIL,"Npc_SetPermAttitude()");
	Npc_SetAttitude(slf,att);
	Npc_SetTempAttitude(slf,att);
};

func int Npc_GetTempAttitude(var C_Npc slf,var C_Npc oth)
{
	PrintDebugNpc(PD_ZS_DETAIL,"Npc_GetTempAttitude()");
	return Npc_GetAttitude(slf,oth);
};

func int C_BodyStateContains(var C_Npc slf,var int bodystate)
{
	PrintDebugNpc(PD_ZS_DETAIL,"C_BodyStateContains()");
	PrintDebugInt(PD_ZS_DETAIL,"bodystate: ",bodystate);
	PrintDebugInt(PD_ZS_DETAIL,"bodystate&(BS_MAX|BS_FLAG_INTERRUPTABLE|BS_FLAG_FREEHANDS): ",bodystate & (BS_MAX | BS_FLAG_INTERRUPTABLE | BS_FLAG_FREEHANDS));
	PrintDebugInt(PD_ZS_DETAIL,"Npc_GetBodyState(slf): ",Npc_GetBodyState(slf));
	PrintDebugInt(PD_ZS_DETAIL,"Npc_GetBodyState(slf)&(BS_MAX|BS_FLAG_INTERRUPTABLE|BS_FLAG_FREEHANDS): ",Npc_GetBodyState(slf) & (BS_MAX | BS_FLAG_INTERRUPTABLE | BS_FLAG_FREEHANDS));
	if((Npc_GetBodyState(slf) & (BS_MAX | BS_FLAG_INTERRUPTABLE | BS_FLAG_FREEHANDS)) == (bodystate & (BS_MAX | BS_FLAG_INTERRUPTABLE | BS_FLAG_FREEHANDS)))
	{
		PrintDebugNpc(PD_ZS_DETAIL,"...true");
		return TRUE;
	}
	else
	{
		PrintDebugNpc(PD_ZS_DETAIL,"...false");
	};
	return FALSE;
};

func int C_NpcTypeIsFriend(var C_Npc slf,var C_Npc oth)
{
	PrintDebugNpc(PD_ZS_DETAIL,"C_NpcTypeIsFriend()");
	if(Npc_IsPlayer(oth) && (slf.npcType == npctype_friend))
	{
		PrintDebugNpc(PD_ZS_DETAIL,"...true");
		return TRUE;
	}
	else
	{
		PrintDebugNpc(PD_ZS_DETAIL,"...false");
	};
	return FALSE;
};

func int C_NpcIsGuard(var C_Npc slf)
{
	PrintDebugNpc(PD_ZS_DETAIL,"C_NpcIsGuard");
	if((slf.npcType == npctype_guard) || (slf.npcType == npctype_ow_guard) || (slf.npcType == NpcType_MINE_Guard) || (((slf.npcType == npctype_main) || (slf.npcType == npctype_friend)) && ((slf.guild == GIL_GRD) || (slf.guild == GIL_SLD) || (slf.guild == GIL_TPL))))
	{
		if(slf.fight_tactic != FAI_HUMAN_RANGED)
		{
			PrintDebugNpc(PD_ZS_DETAIL,"...true!");
			return TRUE;
		};
	};
	PrintDebugNpc(PD_ZS_DETAIL,"...false!");
	return FALSE;
};

func int C_NpcIsGuardArcher(var C_Npc slf)
{
	PrintDebugNpc(PD_ZS_DETAIL,"C_NpcIsGuardArcher");
	if((slf.npcType == npctype_guard) || (slf.npcType == npctype_ow_guard) || (slf.npcType == NpcType_MINE_Guard) || (((slf.npcType == npctype_main) || (slf.npcType == npctype_friend)) && ((slf.guild == GIL_GRD) || (slf.guild == GIL_SLD) || (slf.guild == GIL_TPL))))
	{
		if(slf.fight_tactic == FAI_HUMAN_RANGED)
		{
			PrintDebugNpc(PD_ZS_DETAIL,"...true!");
			return TRUE;
		};
	};
	PrintDebugNpc(PD_ZS_DETAIL,"...false!");
	return FALSE;
};

func int C_NpcIsBoss(var C_Npc slf)
{
	PrintDebugNpc(PD_ZS_DETAIL,"C_NpcIsBoss");
	if(Hlp_GetInstanceID(EBR_101_Scar) == Hlp_GetInstanceID(self))
	{
		return FALSE;
	}
	else if(Hlp_GetInstanceID(EBR_102_Arto) == Hlp_GetInstanceID(self))
	{
		return FALSE;
	}
	else if(Hlp_GetInstanceID(EBR_106_Bartholo) == Hlp_GetInstanceID(self))
	{
		return FALSE;
	}
	else if(Hlp_GetInstanceID(ebr_598_bartholo) == Hlp_GetInstanceID(self))
	{
		return FALSE;
	}
	else if((slf.guild == GIL_EBR) || (slf.guild == GIL_KDF) || (slf.guild == GIL_KDW) || (slf.guild == GIL_GUR))
	{
		PrintDebugNpc(PD_ZS_DETAIL,"...true");
		return TRUE;
	}
	else
	{
		PrintDebugNpc(PD_ZS_DETAIL,"...false");
	};
	return FALSE;
};

func int C_NpcIsWorker(var C_Npc slf)
{
	PrintDebugNpc(PD_ZS_DETAIL,"C_NpcIsWorker");
	if((slf.guild == GIL_VLK) || (slf.guild == GIL_STT) || (slf.guild == GIL_BAU) || (slf.guild == GIL_SFB) || (slf.guild == GIL_ORG) || (slf.guild == GIL_NOV))
	{
		PrintDebugNpc(PD_ZS_DETAIL,"...true");
		return TRUE;
	}
	else
	{
		PrintDebugNpc(PD_ZS_DETAIL,"...false");
	};
	return FALSE;
};

func int C_NpcIsMage(var C_Npc slf)
{
	PrintDebugNpc(PD_ZS_DETAIL,"C_NpcIsMage");
	if(slf.attribute[ATR_MANA_MAX] > 0)
	{
		PrintDebugNpc(PD_ZS_DETAIL,"...true");
		return TRUE;
	}
	else
	{
		PrintDebugNpc(PD_ZS_DETAIL,"...false");
	};
	return FALSE;
};

func int C_NpcBelongsToOldCamp(var C_Npc slf)
{
	PrintDebugNpc(PD_ZS_DETAIL,"C_NpcBelongsToOldCamp");
	if((slf.guild == GIL_VLK) || (slf.guild == GIL_STT) || (slf.guild == GIL_GRD) || (slf.guild == GIL_KDF) || (slf.guild == GIL_EBR))
	{
		PrintDebugNpc(PD_ZS_DETAIL,"...TRUE");
		return TRUE;
	}
	else
	{
		PrintDebugNpc(PD_ZS_DETAIL,"...FALSE");
	};
	return FALSE;
};

func int C_NpcBelongsToNewCamp(var C_Npc slf)
{
	PrintDebugNpc(PD_ZS_DETAIL,"C_NpcBelongsToNewCamp");
	if((slf.guild == GIL_BAU) || (slf.guild == GIL_SFB) || (slf.guild == GIL_ORG) || (slf.guild == GIL_SLD) || (slf.guild == GIL_KDW))
	{
		PrintDebugNpc(PD_ZS_DETAIL,"...TRUE");
		return TRUE;
	}
	else
	{
		PrintDebugNpc(PD_ZS_DETAIL,"...FALSE");
	};
	return FALSE;
};

func int C_NpcBelongsToPsiCamp(var C_Npc slf)
{
	PrintDebugNpc(PD_ZS_DETAIL,"C_NpcBelongsToPsiCamp");
	if((slf.guild == GIL_NOV) || (slf.guild == GIL_TPL) || (slf.guild == GIL_GUR))
	{
		PrintDebugNpc(PD_ZS_DETAIL,"...TRUE");
		return TRUE;
	}
	else
	{
		PrintDebugNpc(PD_ZS_DETAIL,"...FALSE");
	};
	return FALSE;
};

func int C_ChargeWasAttacked(var C_Npc guard,var C_Npc charge,var C_Npc attacker)
{
	PrintDebugNpc(PD_ZS_DETAIL,"C_ChargeWasAttacked");
	if(C_NpcIsGuard(guard) || C_NpcIsGuardArcher(guard) || (guard.npcType == npctype_guard) || (guard.npcType == NpcType_MINE_Guard) || (guard.guild == GIL_EBR))
	{
		PrintDebugNpc(PD_ZS_DETAIL,"...NSC ist Wache oder FK-Wache!");
		if((Npc_GetAttitude(guard,charge) == ATT_FRIENDLY) && (Npc_GetAttitude(guard,attacker) != ATT_FRIENDLY))
		{
			PrintDebugNpc(PD_ZS_DETAIL,"...true");
			return TRUE;
		};
	};
	PrintDebugNpc(PD_ZS_DETAIL,"...false");
	return FALSE;
};

func int C_NpcHasSpell(var C_Npc slf,var int spell)
{
	return Npc_HasSpell(slf,spell);
};

func int C_NpcHasAmmo(var C_Npc slf,var int category)
{
	var int count;
	PrintDebugNpc(PD_ZS_DETAIL,"C_NpcHasAmmo");
	if((category != ItAmArrow) && (category != ItAmBolt))
	{
		PrintDebugNpc(PD_ZS_DETAIL,"...ungültige Kategorie !!!");
		return 0;
	};
	count = Npc_GetInvItemBySlot(slf,INV_WEAPON,1);
	if(Hlp_IsValidItem(item) && (item.mainflag == ITEM_KAT_MUN))
	{
		PrintDebugInt(PD_ZS_DETAIL,"...gefundene Anzahl: ",count);
		if(Hlp_GetInstanceID(item) == category)
		{
			PrintDebugString(PD_ZS_DETAIL,"...Munitionstyp: ",item.name);
			return count;
		};
	};
	count = Npc_GetInvItemBySlot(slf,INV_WEAPON,2);
	if(Hlp_IsValidItem(item) && (item.mainflag == ITEM_KAT_MUN))
	{
		PrintDebugInt(PD_ZS_DETAIL,"...gefundene Anzahl: ",count);
		if(Hlp_GetInstanceID(item) == category)
		{
			PrintDebugString(PD_ZS_DETAIL,"...Munitionstyp: ",item.name);
			return count;
		};
	};
	count = Npc_GetInvItemBySlot(slf,INV_WEAPON,3);
	if(Hlp_IsValidItem(item) && (item.mainflag == ITEM_KAT_MUN))
	{
		PrintDebugInt(PD_ZS_DETAIL,"...gefundene Anzahl: ",count);
		if(Hlp_GetInstanceID(item) == category)
		{
			PrintDebugString(PD_ZS_DETAIL,"...Munitionstyp: ",item.name);
			return count;
		};
	};
	count = Npc_GetInvItemBySlot(slf,INV_WEAPON,4);
	if(Hlp_IsValidItem(item) && (item.mainflag == ITEM_KAT_MUN))
	{
		PrintDebugInt(PD_ZS_DETAIL,"...gefundene Anzahl: ",count);
		if(Hlp_GetInstanceID(item) == category)
		{
			PrintDebugString(PD_ZS_DETAIL,"...Munitionstyp: ",item.name);
			return count;
		};
	};
	count = Npc_GetInvItemBySlot(slf,INV_WEAPON,5);
	if(Hlp_IsValidItem(item) && (item.mainflag == ITEM_KAT_MUN))
	{
		PrintDebugInt(PD_ZS_DETAIL,"...gefundene Anzahl: ",count);
		if(Hlp_GetInstanceID(item) == category)
		{
			PrintDebugString(PD_ZS_DETAIL,"...Munitionstyp: ",item.name);
			return count;
		};
	};
	count = Npc_GetInvItemBySlot(slf,INV_WEAPON,6);
	if(Hlp_IsValidItem(item) && (item.mainflag == ITEM_KAT_MUN))
	{
		PrintDebugInt(PD_ZS_DETAIL,"...gefundene Anzahl: ",count);
		if(Hlp_GetInstanceID(item) == category)
		{
			PrintDebugString(PD_ZS_DETAIL,"...Munitionstyp: ",item.name);
			return count;
		};
	};
	return 0;
};

func int C_NpcHasWeapon(var C_Npc slf,var int category)
{
	PrintDebugNpc(PD_ZS_FRAME,"C_NpcHasWeapon");
	if((category != ITEM_KAT_NF) && (category != ITEM_KAT_FF))
	{
		PrintDebugNpc(PD_ZS_Check,"...ungültige Kategorie !!!");
		return FALSE;
	};
	Npc_GetInvItemBySlot(slf,INV_WEAPON,1);
	if(Hlp_IsValidItem(item) && (item.mainflag == category))
	{
		PrintDebugNpc(PD_ZS_Check,"...Waffe in Slot 1 !!!");
		if(category == ITEM_KAT_NF)
		{
			PrintDebugNpc(PD_ZS_Check,"...Nahkampfwaffe gefunden!");
			return TRUE;
		}
		else if(C_NpcHasAmmo(slf,item.munition))
		{
			PrintDebugNpc(PD_ZS_Check,"...Fernkampfwaffe mit ausreichend Ammo gefunden!");
			return TRUE;
		};
	};
	Npc_GetInvItemBySlot(slf,INV_WEAPON,2);
	if(Hlp_IsValidItem(item) && (item.mainflag == category))
	{
		PrintDebugNpc(PD_ZS_Check,"...Waffe in Slot 2 !!!");
		if(category == ITEM_KAT_NF)
		{
			PrintDebugNpc(PD_ZS_Check,"...Nahkampfwaffe gefunden!");
			return TRUE;
		}
		else if(C_NpcHasAmmo(slf,item.munition))
		{
			PrintDebugNpc(PD_ZS_Check,"...Fernkampfwaffe mit ausreichend Ammo gefunden!");
			return TRUE;
		};
	};
	Npc_GetInvItemBySlot(slf,INV_WEAPON,3);
	if(Hlp_IsValidItem(item) && (item.mainflag == category))
	{
		PrintDebugNpc(PD_ZS_Check,"...Waffe in Slot 3 !!!");
		if(category == ITEM_KAT_NF)
		{
			PrintDebugNpc(PD_ZS_Check,"...Nahkampfwaffe gefunden!");
			return TRUE;
		}
		else if(C_NpcHasAmmo(slf,item.munition))
		{
			PrintDebugNpc(PD_ZS_Check,"...Fernkampfwaffe mit ausreichend Ammo gefunden!");
			return TRUE;
		};
	};
	Npc_GetInvItemBySlot(slf,INV_WEAPON,4);
	if(Hlp_IsValidItem(item) && (item.mainflag == category))
	{
		PrintDebugNpc(PD_ZS_Check,"...Waffe in Slot 4 !!!");
		if(category == ITEM_KAT_NF)
		{
			PrintDebugNpc(PD_ZS_Check,"...Nahkampfwaffe gefunden!");
			return TRUE;
		}
		else if(C_NpcHasAmmo(slf,item.munition))
		{
			PrintDebugNpc(PD_ZS_Check,"...Fernkampfwaffe mit ausreichend Ammo gefunden!");
			return TRUE;
		};
	};
	Npc_GetInvItemBySlot(slf,INV_WEAPON,5);
	if(Hlp_IsValidItem(item) && (item.mainflag == category))
	{
		PrintDebugNpc(PD_ZS_Check,"...Waffe in Slot 5 !!!");
		if(category == ITEM_KAT_NF)
		{
			PrintDebugNpc(PD_ZS_Check,"...Nahkampfwaffe gefunden!");
			return TRUE;
		}
		else if(C_NpcHasAmmo(slf,item.munition))
		{
			PrintDebugNpc(PD_ZS_Check,"...Fernkampfwaffe mit ausreichend Ammo gefunden!");
			return TRUE;
		};
	};
	Npc_GetInvItemBySlot(slf,INV_WEAPON,6);
	if(Hlp_IsValidItem(item) && (item.mainflag == category))
	{
		PrintDebugNpc(PD_ZS_Check,"...Waffe in Slot 6 !!!");
		if(category == ITEM_KAT_NF)
		{
			PrintDebugNpc(PD_ZS_Check,"...Nahkampfwaffe gefunden!");
			return TRUE;
		}
		else if(C_NpcHasAmmo(slf,item.munition))
		{
			PrintDebugNpc(PD_ZS_Check,"...Fernkampfwaffe mit ausreichend Ammo gefunden!");
			return TRUE;
		};
	};
	return FALSE;
};

func int C_GetAttackReason(var C_Npc slf)
{
	PrintDebugNpc(PD_ZS_DETAIL,"C_GetAttackReason");
	return slf.aivar[AIV_ATTACKREASON];
};

func int C_OtherIsToleratedEnemy(var C_Npc slf,var C_Npc oth)
{
	var C_Item weapon;
	var int weaponInstance;
	PrintDebugNpc(PD_ZS_DETAIL,"C_OtherIsToleratedEnemy");
	if(C_NpcIsOrc(slf))
	{
		PrintDebugNpc(PD_ZS_DETAIL,"...'self' ist Ork!");
		weapon = Npc_GetReadiedWeapon(oth);
		if(Hlp_IsValidItem(weapon))
		{
			weaponInstance = Hlp_GetInstanceID(weapon);
			PrintDebugString(PD_ZS_DETAIL,"...gezogene Waffe von 'other': ",weapon.name);
			if(weaponInstance == UluMulu)
			{
				PrintDebugNpc(PD_ZS_DETAIL,"...true!");
				return TRUE;
			};
		};
		weapon = Npc_GetEquippedMeleeWeapon(oth);
		if(Hlp_IsValidItem(weapon))
		{
			weaponInstance = Hlp_GetInstanceID(weapon);
			PrintDebugString(PD_ZS_DETAIL,"...equippte Waffe von 'other': ",weapon.name);
			if(weaponInstance == UluMulu)
			{
				PrintDebugNpc(PD_ZS_DETAIL,"...true!");
				return TRUE;
			};
		};
	};
	PrintDebugNpc(PD_ZS_DETAIL,"...false!");
	return FALSE;
};

func void B_TolerateEnemy(var C_Npc slf,var C_Npc oth)
{
	var int npcInstance;
	PrintDebugNpc(PD_ZS_DETAIL,"B_TolerateEnemy");
	if(C_NpcIsOrc(slf) && (Npc_GetDistToNpc(slf,oth) > HAI_DIST_ASSESSTOLERATEDENEMY))
	{
		PrintDebugNpc(PD_ZS_DETAIL,"...'self' ist Ork und nah genug dran!");
		npcInstance = Hlp_GetInstanceID(slf);
		if((npcInstance == OrcScout) || (npcInstance == OrcWarrior1) || (npcInstance == OrcWarrior2))
		{
			PrintDebugNpc(PD_ZS_DETAIL,"...'self' ist anderer Ork!");
			if(!Npc_IsInState(slf,ZS_Upset))
			{
				PrintDebugNpc(PD_ZS_DETAIL,"...'self' noch nicht in ZS_FollowPC");
				Npc_ClearAIQueue(slf);
				AI_Standup(slf);
				AI_StartState(slf,ZS_Upset,1,"");
			};
		}
		else if(npcInstance == OrcWarrior3)
		{
			PrintDebugNpc(PD_ZS_DETAIL,"...'self' ist Ork Tempelkrieger!");
			if(!Npc_IsInState(slf,ZS_FollowPC))
			{
				PrintDebugNpc(PD_ZS_DETAIL,"...'self' noch nicht in ZS_FollowPC");
				Npc_ClearAIQueue(slf);
				AI_Standup(slf);
				AI_StartState(slf,ZS_FollowPC,1,"");
			};
		};
	};
};

func int c_npcisguarding(var C_Npc slf)
{
	if(slf.id == 872)
	{
		return TRUE;
	};
	if((slf.id == 840) || (slf.id == 804))
	{
		return TRUE;
	};
	if((slf.id == 818) || (slf.id == 819) || (slf.id == 859))
	{
		return TRUE;
	};
	if((slf.id == 1442) || (slf.id == 1441))
	{
		return TRUE;
	};
	if(slf.id == 336)
	{
		return TRUE;
	};
	if((slf.id == 732) || (slf.id == 723))
	{
		return TRUE;
	};
	if((slf.id == 212) || (slf.id == 213))
	{
		return TRUE;
	};
	if(slf.id == 218)
	{
		return TRUE;
	};
	if(slf.id == 224)
	{
		return TRUE;
	};
	if(slf.id == 998)
	{
		return TRUE;
	};
	if((slf.id == 251) || (slf.id == 729) || (slf.id == 1422))
	{
		return TRUE;
	};
	if(slf.id == 328)
	{
		return TRUE;
	};
	if(slf.id == 726)
	{
		return TRUE;
	};
	if((slf.id == 404) || (slf.id == 406))
	{
		return TRUE;
	};
	if((slf.id == 100) && (Kapitel >= 4))
	{
		return TRUE;
	};
	if(((slf.id == 1433) || (slf.id == 1401) || (slf.id == 1400)) && Npc_KnowsInfo(hero,Grd_263_Asghan_OPEN))
	{
		return TRUE;
	};
	if((slf.id == 263) && Npc_KnowsInfo(hero,Grd_263_Asghan_OPEN))
	{
		return TRUE;
	};
	if(slf.id == 867)
	{
		return TRUE;
	};
	return FALSE;
};

func string Text_GetWeaponProt(var string desc, var int b,var int e,var int p)
{
	return ConcatStrings(
		   ConcatStrings(
	       ConcatStrings(
		   ConcatStrings(
	       ConcatStrings(
			desc,
		    IntToString(b)),"\"),
			IntToString(e)),"\"),
			IntToString(p));
};
func string Text_GetMagicProt(var string desc, var int a,var int d,var int q,var int f)
{
	return ConcatStrings(
		   ConcatStrings(
		   ConcatStrings(
	       ConcatStrings(
		   ConcatStrings(
	       ConcatStrings(
	       ConcatStrings(
			desc,
		    IntToString(a)),"\"),
			IntToString(d)),"\"),
			IntToString(q)),"\"),
			IntToString(f));
};

func int C_Npc_IsNearestWP(var C_NPC npc, var string WP)
{
	if(Hlp_StrCmp(Npc_GetNearestWP(npc),wp))
	{
		return true;
	};
	return false;
};

func string C_Npc_GetNearestWPArr2(var C_NPC npc,var string wp1,var string wp2)
{
	var int wp1d;var int wp2d;
	wp1d = Npc_GetDistToWP(npc,wp1);
	wp2d = Npc_GetDistToWP(npc,wp2);
	if(wp1d < wp2d)
	{
		return wp1;
	};
	return wp2;
};

func string C_Npc_GetNextWPArr5(var C_NPC npc,var int sz, var string wp1,var string wp2,var string wp3,var string wp4,var string wp5)
{
	var int wp1d;var int wp2d;var int wp3d;var int wp4d; var int wp5d;
	wp1d = Npc_GetDistToWP(npc,wp1);
	wp2d = Npc_GetDistToWP(npc,wp2);
	wp3d = Npc_GetDistToWP(npc,wp3);
	wp4d = Npc_GetDistToWP(npc,wp4);
	wp5d = Npc_GetDistToWP(npc,wp5);
	if(
		sz >= 5 && (
			wp5d <= wp4d ||
			wp4d < wp5d
		)
	)
	{
		msg("C_Npc_GetNextWPArr5: 5",30,30);
		return wp5;
	}
	else if(
		sz >= 4 && (
			wp4d <= wp3d ||
			wp3d < wp4d
		)
	)
	{
		msg("C_Npc_GetNextWPArr5: 4",30,32);
		return wp4;
	}
	else if(
		sz >= 3 && (
			wp3d <= wp2d ||
			wp2d < wp3d
		)
	)
	{
		msg("C_Npc_GetNextWPArr5: 3",30,34);
		return wp3;
	}
	else if(
		sz >= 2 && (
			wp2d <= wp1d ||
			wp1d < wp2d
		)
	)
	{
		msg("C_Npc_GetNextWPArr5: 2",30,36);
		return wp2;
	};
	msg("C_Npc_GetNextWPArr5: 1",30,38);
	return wp1;
};

func int C_Npc_IsNearestWPArr2(var C_NPC npc,var string wp1,var string wp2)
{
	var int wp1d;var int wp2d;
	wp1d = Npc_GetDistToWP(npc,wp1);
	wp2d = Npc_GetDistToWP(npc,wp2);
	if(wp1d < wp2d)
	{
		return true;
	};
	return false;
};

func int C_WP_GetDistToWP(var string wp1,var string wp2)
{
	return false;
};
func int C_Npc_IsBetweenWP(var C_NPC npc,var string wp1,var string wp2)
{
	return false;
};
func int C_BewertenArmor(var C_NPC npc)
{
	var C_ITEM armor;
	armor = Npc_GetEquippedArmor(npc);
	if(armor == (VLK_ARMOR_L|VLK_ARMOR_M|NOV_ARMOR_L|SFB_ARMOR_L|ORG_ARMOR_L|GRD_ARMOR_I))
	{return 1;}
	else if(armor == (STT_ARMOR_M|NOV_ARMOR_M|ORG_ARMOR_M))
	{return 2;}
	else if(armor == (STT_ARMOR_H|NOV_ARMOR_H|ORG_ARMOR_H))
	{return 3;}
	else if(armor == (GRD_ARMOR_L|SLD_ARMOR_L|TPL_ARMOR_L))
	{return 4;}
	else if(armor == (GRD_ARMOR_M|SLD_ARMOR_M|TPL_ARMOR_M))
	{return 5;}
	else if(armor == (GRD_ARMOR_H|SLD_ARMOR_H|TPL_ARMOR_H))
	{return 6;}
	else if(armor == (EBR_ARMOR_M|EBR_ARMOR_H|EBR_ARMOR_H2))
	{return 7;}
	else if(armor == (KDF_ARMOR_L|KDF_ARMOR_H|KDW_ARMOR_L|KDW_ARMOR_H|GUR_ARMOR_M|GUR_ARMOR_H|DMB_ARMOR_M))
	{return 8;};
	return 0;
};
func int C_Npc_IsBelongToCamp(var C_NPC npc,var int camp)
{
	if(camp == OLDCAMP)
	{
		if(
			npc.guild == GIL_EBR ||
			npc.guild == GIL_GRD ||
			npc.guild == GIL_STT ||
			npc.guild == GIL_KDF ||
			npc.guild == GIL_VLK
		)
		{
			return true;
		};
	}
	else if(camp == NEWCAMP)
	{
		if(
			npc.guild == GIL_KDW ||
			npc.guild == GIL_SLD ||
			npc.guild == GIL_ORG ||
			npc.guild == GIL_BAU ||
			npc.guild == GIL_SFB
		)
		{
			return true;
		};
	}
	else if(camp == PSICAMP)
	{
		if(
			npc.guild == GIL_GUR ||
			npc.guild == GIL_NOV ||
			npc.guild == GIL_TPL
		)
		{
			return true;
		};
	};
	return false;
};

