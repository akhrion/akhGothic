//Ставит флаг ваншота на персонажа, с этим флагом персонаж умирает от одного выстрела
func void Npc_SetOneShot(var C_Npc npc_,var int mode_)
{
	if(GIL_SCAVENGER == npc_.guild)
	{
//		Scavenger.aivar[AIV_MM_bOneShot] = mode_;
	}
	else if(GIL_MOLERAT == npc_.guild)
	{
//		Molerat.aivar[AIV_MM_bOneShot] = mode_;
	}
	else if(GIL_WOLF == npc_.guild)
	{
//		Wolf.aivar[AIV_MM_bOneShot] = mode_;
	}
	else if(GIL_ORCDOG == npc_.guild)
	{
//		OrcDog.aivar[AIV_MM_bOneShot] = mode_;
	}
	else if(GIL_SNAPPER == npc_.guild)
	{
//		Snapper.aivar[AIV_MM_bOneShot] = mode_;
	}
	else if(GIL_SNAPPER == npc_.guild)
	{
//		Razor.aivar[AIV_MM_bOneShot] = mode_;
	}
	else if(GIL_BLOODFLY == npc_.guild)
	{
//		Bloodfly.aivar[AIV_MM_bOneShot] = mode_;
	}
	else if(GIL_WARAN == npc_.guild)
	{
//		Waran.aivar[AIV_MM_bOneShot] = mode_;
	}
	else if(GIL_LURKER == npc_.guild)
	{
//		Lurker.aivar[AIV_MM_bOneShot] = mode_;
	}
	else if(GIL_SWAMPSHARK == npc_.guild)
	{
//		Swampshark.aivar[AIV_MM_bOneShot] = mode_;
	}
	else if(GIL_MINECRAWLER == npc_.guild)
	{
//		MineCrawler.aivar[AIV_MM_bOneShot] = mode_;
	}
	else if(GIL_SHADOWBEAST == npc_.guild)
	{
//		Shadowbeast.aivar[AIV_MM_bOneShot] = mode_;
	};
};
func int Npc_IsOneShot(var C_Npc npc_)
{
	if(
		GIL_SCAVENGER == npc_.guild
	&&	OneShot_Scavenger_Counter > OneShot_Scavenger
	)
	{
		return true;
	}
	else if(
		GIL_MOLERAT == npc_.guild
	&&	OneShot_Molerat_Counter > OneShot_Molerat
	)
	{
		return true;
	}
	else if(
		GIL_BLOODFLY == npc_.guild
	&&	OneShot_Bloodfly_Counter > OneShot_Bloodfly
	)
	{
		return true;
	}
	else if(
		GIL_SNAPPER == npc_.guild
	&&	OneShot_Snapper_Counter > OneShot_Snapper
	)
	{
		return true;
	}
	else if(
		GIL_SNAPPER == npc_.guild
	&&	OneShot_Snapper_Counter > OneShot_Snapper
	)
	{
		return true;
	}
	else if(
		GIL_LURKER == npc_.guild
	&&	OneShot_Lurker_Counter > OneShot_Lurker
	)
	{
		return true;
	}
	else if(
		GIL_WARAN == npc_.guild
	&&	OneShot_Waran_Counter > OneShot_Waran
	)
	{
		return true;
	}
	else if(
		GIL_WOLF == npc_.guild
	&&	OneShot_Wolf_Counter > OneShot_Wolf
	)
	{
		return true;
	}
	else if(
		GIL_ORCDOG == npc_.guild
	&&	OneShot_OrcDog_Counter > OneShot_OrcDog
	)
	{
		return true;
	}
	else if(
		GIL_MINECRAWLER == npc_.guild
	&&	OneShot_MineCrawler_Counter > OneShot_MineCrawler
	)
	{
		return true;
	}
	else if(
		GIL_SWAMPSHARK == npc_.guild
	&&	OneShot_Swampshark_Counter > OneShot_Swampshark
	)
	{
		return true;
	}
	else if(
		GIL_SHADOWBEAST == npc_.guild
	&&	OneShot_Shadowbeast_Counter > OneShot_Shadowbeast
	)
	{
		return true;
	};
//	Game_CheckOneShotCounters(npc_);
	return false;
};
func void Game_CheckOneShotCounters(var C_Npc vict_)
{
	if(Npc_IsOneShot(vict_)){return;};
	if(GIL_SCAVENGER == vict_.guild)
	{
		OneShot_Scavenger_Counter +=1;
		if(OneShot_Scavenger_Counter > OneShot_Scavenger)
		{
			Npc_SetOneShot(vict_,true);
		};
	}
	else if(GIL_MOLERAT == vict_.guild)
	{
		OneShot_Molerat_Counter +=1;
		if(OneShot_Molerat_Counter > OneShot_Molerat)
		{
			Npc_SetOneShot(vict_,true);
		};
	}
	else if(GIL_BLOODFLY == vict_.guild)
	{
		OneShot_Bloodfly_Counter +=1;
		if(OneShot_Bloodfly_Counter > OneShot_Bloodfly)
		{
			Npc_SetOneShot(vict_,true);
		};
	}
	else if(GIL_WOLF == vict_.guild)
	{
		OneShot_Wolf_Counter +=1;
		if(OneShot_Wolf_Counter > OneShot_Wolf)
		{
			Npc_SetOneShot(vict_,true);
		};
	}
	else if(GIL_ORCDOG == vict_.guild)
	{
		OneShot_OrcDog_Counter +=1;
		if(OneShot_OrcDog_Counter > OneShot_OrcDog)
		{
			Npc_SetOneShot(vict_,true);
		};
	}
	else if(GIL_WARAN == vict_.guild)
	{
		OneShot_Waran_Counter +=1;
		if(OneShot_Waran_Counter > OneShot_Waran)
		{
			Npc_SetOneShot(vict_,true);
		};
	}
	else if(GIL_LURKER == vict_.guild)
	{
		OneShot_Lurker_Counter +=1;
		if(OneShot_Lurker_Counter > OneShot_Lurker)
		{
			Npc_SetOneShot(vict_,true);
		};
	}
	else if(GIL_SNAPPER == vict_.guild)
	{
		OneShot_Snapper_Counter +=1;
		if(OneShot_Snapper_Counter > OneShot_Snapper)
		{
			Npc_SetOneShot(vict_,true);
		};
	}
	else if(GIL_SNAPPER == vict_.guild)
	{
		OneShot_Razor_Counter +=1;
		if(OneShot_Razor_Counter > OneShot_Razor)
		{
			Npc_SetOneShot(vict_,true);
		};
	}
	else if(GIL_MINECRAWLER == vict_.guild)
	{
		OneShot_MineCrawler_Counter +=1;
		if(OneShot_MineCrawler_Counter > OneShot_MineCrawler)
		{
			Npc_SetOneShot(vict_,true);
		};
	}
	else if(GIL_SWAMPSHARK == vict_.guild)
	{
		OneShot_Swampshark_Counter +=1;
		if(OneShot_Swampshark_Counter > OneShot_Swampshark)
		{
			Npc_SetOneShot(vict_,true);
		};
	}
	else if(GIL_SHADOWBEAST == vict_.guild)
	{
		OneShot_Shadowbeast_Counter +=1;
		if(OneShot_Shadowbeast_Counter > OneShot_Shadowbeast)
		{
			Npc_SetOneShot(vict_,true);
		};
	};
};
func void Game_CheckOneShotCounters_Old(var C_Npc vict_)
{
	if(GIL_SCAVENGER == vict_.guild)
	{
		OneShot_Scavenger_Counter +=1;
		if(OneShot_Scavenger_Counter > OneShot_Scavenger)
		{
			Npc_SetOneShot(vict_,true);
		};
	};
};
//Проверяет должен-ли таргет умереть с одного выстрела
func void SC_OneShot(var C_NPC shtr, var C_NPC vict)
{
	if(!Npc_IsPlayer(shtr)){return;};
	if(!Npc_IsInFightMode(shtr,FMODE_FAR)){return;};
//	if(!Npc_InOneShotList()){return;};
	if(!Npc_IsAnimal(vict)){return;};
	PrintI(OneShot_Scavenger_Counter+100);
	if(!Npc_IsOneShot(vict)){return;};
	SC_bOneShot = true;
};
//Функция возвращает TRUE если ГГ имеет право носить оружие в Старом Лагере.
func int SC_HasRightKeepWeapon()
{
	if(
		Diego_BringList == LOG_SUCCESS
	||	Thorus_MordragKo == LOG_SUCCESS
	||	Achieve_bPovarenok
	)
	{
		return true;
	};
	return false;
};
func int SC_IsWorkOnThorus()
{
	if(Thorus_MordragKo == LOG_SUCCESS)
	{
		return true;
	};
	return false;
};
func int SC_IsHunter()
{
	return false;
};
func void Achieve_Give(var string str_)
{
	Log_AddEntry(ACHIEVES_TITLE,str_);
	B_PrintB(str_);
};
func int SC_WasInCamp(var int inxCamp)
{
	if(inxCamp == PSICAMP){return SC_WasInPsiCamp;};
	if(inxCamp == OLDCAMP){return SC_WasInOldCamp;};
	if(inxCamp == NEWCAMP){return SC_WasInNewCamp;};
	return false;
};
var string wpKiller;
func void EVENT_Killers_Spawn()
{
};
func void EVENT_Killers()
{
	if(getCurDayHours() > 6 && getCurDayHours() < 22){return;};
	if(
		!Bloodwyn_ProtectionPaid
	&&	!Hlp_Random(10)
	)
	{
		wpKiller = Npc_GetNearestWP(hero);
		Wld_InsertNpc(Non_1640_Killer,"OC1");
	};
};
func int Npc_HasMana(var C_NPC npc)
{
	return npc.attribute[ATR_MANA] > 0;
};
func int Npc_IsCompletelyDead(var C_Npc npc)
{
	PrintI(npc.guild);
	if(
		npc.guild != GIL_SKELETON
	&&	npc.guild != GIL_ZOMBIE
	)
	{
		return true;
	};
	if(!Npc_HasMana(npc))
	{
		return true;
	};
	if(!B_Npc_GetLastTargetID(npc))
	{
		if(Hlp_GetInstanceID(other) != -1)
		{
			B_Npc_SetLastTargetByID(npc,Hlp_GetInstanceID(other));
		}
		else
		{
			Print("Hlp_GetInstanceID return -1 into Npc_IsCompletelyDead");
			B_Npc_SetLastTargetByID(npc,0);
		};
	};
	B_Revive(npc);
	return false;
};
func int Npc_WasConvertedIntoDeadMan(var C_NPC killer)
{
	if(B_Npc_GetID(killer) != ID_TEST_SKELETON)
	{
		return false;
	};
	B_Revive(killer);
	return true;
};
