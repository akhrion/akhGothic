
func int mc_oldmine_asghan()
{
	PrintDebugNpc(PD_ITEM_MOBSI,"MC_OLDMINE_ASGHAN");
	if(Npc_KnowsInfo(hero,Grd_263_Asghan_OPEN_NOW) && (OLDMINE_GATE_OPEN == FALSE))
	{
		OLDMINE_GATE_OPEN = TRUE;
		return TRUE;
	}
	else
	{
		G_PrintScreen(_STR_MESSAGE_WHEEL_STUCKS);
	};
	return FALSE;
};

func int mc_oldmine_entrance()
{
	PrintDebugNpc(PD_ITEM_MOBSI,"MC_OLDMINE_ENTRANCE");
	PrintGlobals(PD_ITEM_MOBSI);
	if((Kapitel >= 4) && Hlp_IsValidNpc(self))
	{
		PrintDebugNpc(PD_ITEM_MOBSI,"...заблокировано.");
		G_PrintScreen(_STR_MESSAGE_WHEEL_STUCKS);
		AI_OutputSVM_Overlay(hero,NULL,"$PICKBROKE");
		return FALSE;
	}
	else
	{
		PrintDebugNpc(PD_ITEM_MOBSI,"...готово к работе.");
	};
	return TRUE;
};

func int mc_monasteryruin_gate()
{
	PrintDebugNpc(PD_ITEM_MOBSI,"MC_MONASTERYRUIN_GATE");
	if(MonasteryRuin_GateOpen == FALSE)
	{
		PrintDebugNpc(PD_ITEM_MOBSI,"...еще не открыто.");
		AI_UseMob(hero,"VWHEEL",1);
		AI_UseMob(hero,"VWHEEL",-1);
		MonasteryRuin_GateOpen = TRUE;
		return TRUE;
	}
	else
	{
		PrintDebugNpc(PD_ITEM_MOBSI,"...уже открыто.");
	};
	return TRUE;
};

func int mc_ogy_gate()
{
	PrintDebugNpc(PD_ITEM_MOBSI,"MC_OGY_GATE");
	if(CorAngar_GotoOGY)
	{
		PrintDebugNpc(PD_ITEM_MOBSI,"...closed");
		return TRUE;
	}
	else
	{
		PrintDebugNpc(PD_ITEM_MOBSI,"...open");
		G_PrintScreen(_STR_MESSAGE_WHEEL_STUCKS);
	};
	return FALSE;
};


var int FM_GateOpen;

func int mc_fm_gate()
{
	PrintDebugNpc(PD_ITEM_MOBSI,"MC_FM_GATE");
	if((Kapitel == 4) && (FM_GateOpen == FALSE))
	{
		PrintDebugNpc(PD_ITEM_MOBSI,"...closed");
		AI_UseMob(hero,"VWHEEL",1);
		AI_UseMob(hero,"VWHEEL",-1);
		FM_GateOpen = TRUE;
		B_ExchangeRoutine(PC_Fighter,"WaitFM");
		return TRUE;
	}
	else
	{
		PrintDebugNpc(PD_ITEM_MOBSI,"...open");
		if(!FM_GateOpen)
		{
			G_PrintScreen(_STR_MESSAGE_WHEEL_STUCKS);
		};
	};
	return FALSE;
};

func int evt_trollschlucht_gate_trigger()
{
	PrintDebugNpc(PD_ITEM_MOBSI,"EVT_TROLLSCHLUCHT_GATE_TRIGGER");
	if(Saturas_BringFoci > 0)
	{
		if(Troll_Wheel == 0)
		{
			G_PrintScreen(_STR_MESSAGE_WHEEL_STUCKS);
			Troll_Wheel = 1;
			return FALSE;
		}
		else if(Troll_Wheel == 1)
		{
			G_PrintScreen(_STR_MESSAGE_WHEEL_STUCKS);
			return FALSE;
		}
		else if(Troll_Wheel == 2)
		{
			AI_UseMob(hero,"VWHEEL",1);
			AI_UseMob(hero,"VWHEEL",-1);
			Troll_Wheel = 3;
			Wld_InsertNpc(BlackGobboWarrior,"LOCATION_12_13");
			Wld_InsertNpc(BlackGobboWarrior,"LOCATION_12_13");
			Wld_InsertNpc(BlackGobboWarrior,"LOCATION_12_13");
			Wld_InsertNpc(BlackGobboWarrior,"LOCATION_12_13");
			Wld_InsertNpc(BlackGobboWarrior,"LOCATION_12_14");
			Wld_InsertNpc(BlackGobboWarrior,"LOCATION_12_14");
			Wld_InsertNpc(BlackGobboWarrior,"LOCATION_12_14");
			Wld_InsertNpc(BlackGobboWarrior,"LOCATION_12_14");
			return TRUE;
		}
		else
		{
			return FALSE;
		};
	}
	else
	{
		G_PrintScreen(_STR_MESSAGE_WHEEL_STUCKS);
	};
	return FALSE;
};


var int OrcCity_GateOpen;

func int MC_OrcCity_Gate()
{
	PrintDebugNpc(PD_ITEM_MOBSI,"MC_OrcCity_Gate");
	if((Kapitel >= 5) && (OrcCity_GateOpen == FALSE))
	{
		PrintDebugNpc(PD_ITEM_MOBSI,"...closed");
		AI_UseMob(hero,"VWHEEL",1);
		AI_UseMob(hero,"VWHEEL",-1);
		OrcCity_GateOpen = TRUE;
		return TRUE;
	}
	else
	{
		PrintDebugNpc(PD_ITEM_MOBSI,"...open");
		if(!OrcCity_GateOpen)
		{
			G_PrintScreen(_STR_MESSAGE_WHEEL_STUCKS);
		};
	};
	return FALSE;
};

func int MC_OrcCity_Sunctum_OuterGate()
{
	PrintDebugNpc(PD_ITEM_MOBSI,"MC_OrcCity_Sanctum_OuterGate");
	OrcCity_Sanctum_OuterGateTried = TRUE;
	if((Kapitel >= 5) && Npc_HasItems(hero,ItMi_Stuff_Idol_Sleeper_01) && (OrcCity_Sanctum_OuterGateOpen == FALSE))
	{
		PrintDebugNpc(PD_ITEM_MOBSI,"...closed");
		G_PrintScreen(_STR_MESSAGE_OCLEVER_MOVES);
		AI_UseMob(hero,"LEVER",1);
		AI_UseMob(hero,"LEVER",-1);
		OrcCity_Sanctum_OuterGateOpen = TRUE;
		return TRUE;
	}
	else
	{
		PrintDebugNpc(PD_ITEM_MOBSI,"...open");
		if(!OrcCity_Sanctum_OuterGateOpen)
		{
			G_PrintScreen(_STR_MESSAGE_OCLEVER_STUCKS);
		};
	};
	return FALSE;
};

func int evt_wheel_01_conditionfunc()
{
	return TRUE;
};

func void evt_wheel_01_s0()
{
	Wld_SendUntrigger("EVT_OW_STARTLOCKOUT_MOVER");
	GATE_01_STATE = 0;
};

func void evt_wheel_01_s1()
{
	if(GATE_01_STATE == 1)
	{
		AI_UseMob(hero,"VWHEEL",0);
	};
	if(GATE_01_STATE == 0)
	{
		Wld_SendTrigger("EVT_OW_STARTLOCKOUT_MOVER");
		GATE_01_STATE = 1;
	};
};

func int evt_wheel_02_conditionfunc()
{
	return TRUE;
};

func void evt_wheel_02_s0()
{
	Wld_SendUntrigger("EVT_OC_MAINGATE01_01");
	GATE_02_STATE = 0;
};

func void evt_wheel_02_s1()
{
	if(GATE_02_STATE == 1)
	{
		AI_UseMob(hero,"VWHEEL",0);
	};
	if(GATE_02_STATE == 0)
	{
		Wld_SendTrigger("EVT_OC_MAINGATE01_01");
		GATE_02_STATE = 1;
	};
};

func int evt_wheel_03_conditionfunc()
{
	return TRUE;
};

func void evt_wheel_03_s0()
{
	Wld_SendUntrigger("EVT_OC_MAINGATE02_02");
	GATE_03_STATE = 0;
};

func void evt_wheel_03_s1()
{
	if(GATE_03_STATE == 1)
	{
		AI_UseMob(hero,"VWHEEL",0);
	};
	if(GATE_03_STATE == 0)
	{
		Wld_SendTrigger("EVT_OC_MAINGATE02_02");
		GATE_03_STATE = 1;
	};
};

func int evt_wheel_04_conditionfunc()
{
	return TRUE;
};

func void evt_wheel_04_s0()
{
	Wld_SendUntrigger("EVT_OC_INNERMAINGATE");
	GATE_04_STATE = 0;
};

func void evt_wheel_04_s1()
{
	if(GATE_04_STATE == 1)
	{
		AI_UseMob(hero,"VWHEEL",0);
	};
	if(GATE_04_STATE == 0)
	{
		Wld_SendTrigger("EVT_OC_INNERMAINGATE");
		GATE_04_STATE = 1;
	};
};

func int evt_wheel_05_conditionfunc()
{
	return TRUE;
};

func void evt_wheel_05_s0()
{
	Wld_SendUntrigger("EVT_NC_LOCKOUT_MOVER_01");
	GATE_05_STATE = 0;
};

func void evt_wheel_05_s1()
{
	if(GATE_05_STATE == 1)
	{
		AI_UseMob(hero,"VWHEEL",0);
	};
	if(GATE_05_STATE == 0)
	{
		Wld_SendTrigger("EVT_NC_LOCKOUT_MOVER_01");
		GATE_05_STATE = 1;
	};
};

func int evt_wheel_06_conditionfunc()
{
	return TRUE;
};

func void evt_wheel_06_s0()
{
	Wld_SendUntrigger("EVT_NC_MAINGATE01_MOVER");
	GATE_06_STATE = 0;
};

func void evt_wheel_06_s1()
{
	if(GATE_06_STATE == 1)
	{
		AI_UseMob(hero,"VWHEEL",0);
	};
	if(GATE_06_STATE == 0)
	{
		Wld_SendTrigger("EVT_NC_MAINGATE01_MOVER");
		GATE_06_STATE = 1;
	};
};

func int evt_wheel_07_conditionfunc()
{
	return TRUE;
};

func void evt_wheel_07_s0()
{
	if(Kapitel < 4)
	{
		Wld_SendUntrigger("EVT_AM_LOB_GATE_BIG");
		GATE_07_STATE = 0;
	}
	else
	{
		AI_PlayAni(self,"T_VWHEEL_S0_2_STAND");
		AI_Wait(self,0.5);
		AI_PlayAni(self,"T_DONTKNOW");
		AI_OutputSVM(self,self,"$DOESNTWORK");
	};
};

func void evt_wheel_07_s1()
{
	if(Kapitel >= 4)
	{
		AI_PlayAni(self,"T_VWHEEL_S1_2_STAND");
		AI_Wait(self,0.5);
		AI_PlayAni(self,"T_DONTKNOW");
		AI_OutputSVM(self,self,"$DOESNTWORK");
	}
	else if(GATE_07_STATE == 1)
	{
		AI_UseMob(hero,"VWHEEL",0);
	}
	else if(GATE_07_STATE == 0)
	{
		Wld_SendTrigger("EVT_AM_LOB_GATE_BIG");
		GATE_07_STATE = 1;
	};
};

func int evt_wheel_d01_conditionfunc()
{
	return TRUE;
};

func void evt_wheel_d01_s0()
{
	Wld_SendUntrigger("CAGEDOORS");
	GATE_D01_STATE = 0;
};

func void evt_wheel_d01_s1()
{
	if(GATE_D01_STATE == 1)
	{
		AI_UseMob(hero,"SWITCH",0);
	};
	if(GATE_D01_STATE == 0)
	{
		Wld_SendTrigger("CAGEDOORS");
		GATE_D01_STATE = 1;
	};
};

func int evt_wheel_d02_conditionfunc()
{
	return TRUE;
};

func void evt_wheel_d02_s0()
{
	Wld_SendUntrigger("CAGEDOORS_NEW");
	GATE_D02_STATE = 0;
};

func void evt_wheel_d02_s1()
{
	if(GATE_D02_STATE == 1)
	{
		AI_UseMob(hero,"SWITCH",0);
	};
	if(GATE_D02_STATE == 0)
	{
		Wld_SendTrigger("CAGEDOORS_NEW");
		GATE_D02_STATE = 1;
	};
};

func int evt_wheel_d03_conditionfunc()
{
	return TRUE;
};

func void evt_wheel_d03_s0()
{
	Wld_SendUntrigger("CAGEDOORS_NEW2");
	GATE_D03_STATE = 0;
};

func void evt_wheel_d03_s1()
{
	if(GATE_D03_STATE == 1)
	{
		AI_UseMob(hero,"SWITCH",0);
	};
	if(GATE_D03_STATE == 0)
	{
		Wld_SendTrigger("CAGEDOORS_NEW2");
		GATE_D03_STATE = 1;
	};
};

func int evt_wheel_d05_conditionfunc()
{
	return TRUE;
};

func void evt_wheel_d05_s0()
{
	if(GATE_D05_STATE == 1)
	{
		Wld_SendUntrigger("EVT_SURF_ORCSECRET_01");
		GATE_D05_STATE = 0;
	}
	else if(GATE_D05_STATE == 0)
	{
		Wld_SendTrigger("EVT_SURF_ORCSECRET_01");
		GATE_D05_STATE = 1;
	};
};

func void evt_wheel_d05_s1()
{
	if(GATE_D05_STATE == 1)
	{
		Wld_SendUntrigger("EVT_SURF_ORCSECRET_01");
		GATE_D05_STATE = 0;
	}
	else if(GATE_D05_STATE == 0)
	{
		Wld_SendTrigger("EVT_SURF_ORCSECRET_01");
		GATE_D05_STATE = 1;
	};
};

func int evt_wheel_d06_conditionfunc()
{
	return TRUE;
};

func void evt_wheel_d06_s0()
{
	if(GATE_D06_STATE == 1)
	{
		Wld_SendUntrigger("EVT_SURF_ORCSECRET_02");
		GATE_D06_STATE = 0;
	}
	else if(GATE_D06_STATE == 0)
	{
		Wld_SendTrigger("EVT_SURF_ORCSECRET_02");
		GATE_D06_STATE = 1;
	};
};

func void evt_wheel_d06_s1()
{
	if(GATE_D06_STATE == 1)
	{
		Wld_SendUntrigger("EVT_SURF_ORCSECRET_02");
		GATE_D06_STATE = 0;
	}
	else if(GATE_D06_STATE == 0)
	{
		Wld_SendTrigger("EVT_SURF_ORCSECRET_02");
		GATE_D06_STATE = 1;
	};
};

func int evt_wheel_d07_conditionfunc()
{
	if(GATE_D07_STATE == 0)
	{
		return TRUE;
	}
	else
	{
		G_PrintScreen(_STR_MESSAGE_OCLEVER_STUCKS);
	};
	return FALSE;
};

func void evt_wheel_d07_s1()
{
	Wld_SendTrigger("EVT_OW_MOUNTAINRUIN_01");
	Wld_InsertNpc(SkeletonSH,"LOCATION_19_03_ROOM6_BARRELCHAMBER2");
	Wld_InsertNpc(SkeletonSH,"LOCATION_19_03_ROOM6_BARRELCHAMBER2");
	Wld_InsertNpc(SkeletonSH,"LOCATION_19_03_ROOM6_BARRELCHAMBER2");
	GATE_D07_STATE = 1;
};

func int evt_wheel_08_conditionfunc()
{
	return TRUE;
};

func void evt_wheel_08_s0()
{
	if(GATE_08_STATE == 1)
	{
		AI_PlayAni(self,"T_VWHEEL_S1_2_STAND");
		AI_Wait(self,0.5);
		AI_PlayAni(self,"T_DONTKNOW");
		AI_OutputSVM(self,self,"$DOESNTWORK");
	};
};

func void evt_wheel_08_s1()
{
	if(GATE_08_STATE == 0)
	{
		Wld_SendTrigger("EVT_OW_FOKUS_GATE_MOVER_01");
		GATE_08_STATE = 1;
		MonasteryRuin_GateOpen = TRUE;
	};
};

func int evt_wheel_09_conditionfunc()
{
	if((OrcCity_Sanctum_OuterGateOpen == FALSE) && (Kapitel >= 5) && Npc_HasItems(hero,ItMi_Stuff_Idol_Sleeper_01))
	{
		return TRUE;
	}
	else if((OrcCity_Sanctum_OuterGateOpen == FALSE) && (Kapitel >= 5) && !Npc_HasItems(hero,ItMi_Stuff_Idol_Sleeper_01))
	{
		AI_OutputSVM_Overlay(self,self,"$NEEDKEY");
	};
	return FALSE;
};

func void evt_wheel_09_s0()
{
	if((OrcCity_Sanctum_OuterGateOpen == FALSE) && (Kapitel >= 5) && Npc_HasItems(hero,ItMi_Stuff_Idol_Sleeper_01))
	{
		Wld_SendTrigger("IDOL_FIGG");
		Wld_SendTrigger("EVT_ORC_GATE_02");
		Npc_RemoveInvItem(hero,ItMi_Stuff_Idol_Sleeper_01);
		OrcCity_Sanctum_OuterGateOpen = TRUE;
	}
	else
	{
		AI_Wait(self,0.5);
		AI_PlayAni(self,"T_DONTKNOW");
		AI_OutputSVM(self,self,"$DOESNTWORK");
	};
};

func void evt_wheel_09_s1()
{
	if((OrcCity_Sanctum_OuterGateOpen == FALSE) && (Kapitel >= 5) && Npc_HasItems(hero,ItMi_Stuff_Idol_Sleeper_01))
	{
		Wld_SendTrigger("EVT_ORC_GATE_02");
		Wld_SendTrigger("IDOL_FIGG");
		Npc_RemoveInvItem(hero,ItMi_Stuff_Idol_Sleeper_01);
		OrcCity_Sanctum_OuterGateOpen = TRUE;
	}
	else
	{
		AI_Wait(self,0.5);
		AI_PlayAni(self,"T_DONTKNOW");
		AI_OutputSVM(self,self,"$DOESNTWORK");
	};
};

func int evt_wheel_10_conditionfunc()
{
	return TRUE;
};

func void evt_wheel_10_s0()
{
	if(CorAngar_GotoOGY == TRUE)
	{
		Wld_SendUntrigger("EVT_ORCGRAVYARD_MOVER_01");
		GATE_10_STATE = 0;
	}
	else
	{
		AI_PlayAni(self,"T_VWHEEL_S0_2_STAND");
		AI_Wait(self,0.5);
		AI_PlayAni(self,"T_DONTKNOW");
		AI_OutputSVM(self,self,"$DOESNTWORK");
	};
};

func void evt_wheel_10_s1()
{
	if(CorAngar_GotoOGY == FALSE)
	{
		AI_PlayAni(self,"T_VWHEEL_S1_2_STAND");
		AI_Wait(self,0.5);
		AI_PlayAni(self,"T_DONTKNOW");
		AI_OutputSVM(self,self,"$DOESNTWORK");
	}
	else if(GATE_10_STATE == 1)
	{
		AI_UseMob(hero,"VWHEEL",0);
	}
	else if(GATE_10_STATE == 0)
	{
		Wld_SendTrigger("EVT_ORCGRAVYARD_MOVER_01");
		if(CORKALOMLEFT == FALSE)
		{
			b_corkalomleft();
		};
		GATE_10_STATE = 1;
	};
};

func int evt_wheel_11_conditionfunc()
{
	return TRUE;
};

func void evt_wheel_11_s0()
{
	Wld_SendUntrigger("OC_ARENA_GATE");
	GATE_11_STATE = 0;
};

func void evt_wheel_11_s1()
{
	if(GATE_11_STATE == 1)
	{
		AI_UseMob(hero,"VWHEEL",0);
	};
	if(GATE_11_STATE == 0)
	{
		Wld_SendTrigger("OC_ARENA_GATE");
		GATE_11_STATE = 1;
	};
};

func int evt_wheel_12_conditionfunc()
{
	return TRUE;
};

func void evt_wheel_12_s0()
{
	Wld_SendUntrigger("ORC_ARENA_GATE_OUT");
	GATE_12_STATE = 0;
};

func void evt_wheel_12_s1()
{
	if(GATE_12_STATE == 1)
	{
		AI_UseMob(hero,"VWHEEL",0);
	};
	if(GATE_12_STATE == 0)
	{
		Wld_SendTrigger("ORC_ARENA_GATE_OUT");
		GATE_12_STATE = 1;
	};
};

func int evt_wheel_13_conditionfunc()
{
	return TRUE;
};

func void evt_wheel_13_s0()
{
	Wld_SendUntrigger("ORC_ARENA_GATE_IN");
	GATE_13_STATE = 0;
};

func void evt_wheel_13_s1()
{
	if(GATE_13_STATE == 1)
	{
		AI_UseMob(hero,"VWHEEL",0);
	};
	if(GATE_13_STATE == 0)
	{
		Wld_SendTrigger("ORC_ARENA_GATE_IN");
		GATE_13_STATE = 1;
	};
};

func int evt_wheel_d04_conditionfunc()
{
	return TRUE;
};

func void evt_wheel_d04_s0()
{
	AI_PlayAni(self,"T_LEVER_S1_2_STAND");
	AI_OutputSVM_Overlay(hero,NULL,"$PICKBROKE");
};

func void evt_wheel_d04_s1()
{
	if(GATE_D04_STATE == 1)
	{
		AI_PlayAni(self,"T_LEVER_S1_2_STAND");
		AI_OutputSVM_Overlay(hero,NULL,"$PICKBROKE");
	};
	if(GATE_D04_STATE == 0)
	{
		Wld_SendTrigger("AM_GATE");
		GATE_D04_STATE = 1;
	};
};

func void evt_teleportstation_func()
{
	Wld_PlayEffect("SPELLFX_TELEPORT_RING",hero,hero,0,0,0,FALSE);
	Snd_Play("MFX_TELEPORT_CAST");
	Npc_ClearAIQueue(hero);
	AI_Teleport(hero,"DT_E1_05");
};

func void evt_ogy_calom_func()
{
	if(CorAngar_GotoOGY == TRUE)
	{
		if(CORKALOMLEFT == FALSE)
		{
			b_corkalomleft();
		};
	};
};

func int ll1_cf()
{
	if(Npc_GetTalentSkill(hero,NPC_TALENT_PICKLOCK) < 1)
	{
		PrintScreen(_STR_CANNOTUSE_LOCKS_NO_SKILL,-1,_YPOS_MESSAGE_Joincamp,"font_old_10_white.tga",2);
	}
	else if(Npc_HasItems(hero,ItKeLockpick))
	{
		return TRUE;
	}
	else
	{
		PrintScreen(_STR_MESSAGE_INTERACT_NO_KEY_NO_LOCKPICK,-1,_YPOS_MESSAGE_Joincamp,"font_old_10_white.tga",2);
	};
	return FALSE;
};

func int ll2_cf()
{
	if(Npc_GetTalentSkill(hero,NPC_TALENT_PICKLOCK) < 1)
	{
		PrintScreen(_STR_CANNOTUSE_LOCKS_NO_SKILL,-1,_YPOS_MESSAGE_Joincamp,"font_old_10_white.tga",2);
	}
	else if(Npc_GetTalentSkill(hero,NPC_TALENT_PICKLOCK) < 2)
	{
		PrintScreen(_STR_CANNOTUSE_LOCKS_LOW_SKILL,-1,_YPOS_MESSAGE_Joincamp,"font_old_10_white.tga",2);
	}
	else if(Npc_HasItems(hero,ItKeLockpick))
	{
		return TRUE;
	}
	else
	{
		PrintScreen(_STR_MESSAGE_INTERACT_NO_KEY_NO_LOCKPICK,-1,_YPOS_MESSAGE_Joincamp,"font_old_10_white.tga",2);
	};
	return FALSE;
};

func int ll2_itke_gomez_01_cf()
{
	if(Npc_HasItems(hero,ItKe_Gomez_01))
	{
		AI_Wait(self,0.7);
		Snd_Play3d(self,"DOOR_LOCK");
		PrintScreen("Использован ключ Гомеза.",-1,37,"FONT_OLD_10_WHITE.TGA",3);
		return TRUE;
	}
	else if(Npc_GetTalentSkill(hero,NPC_TALENT_PICKLOCK) < 1)
	{
		PrintScreen(_STR_CANNOTUSE_LOCKS_NO_SKILL,-1,_YPOS_MESSAGE_Joincamp,"font_old_10_white.tga",2);
	}
	else if(Npc_GetTalentSkill(hero,NPC_TALENT_PICKLOCK) < 2)
	{
		PrintScreen(_STR_CANNOTUSE_LOCKS_LOW_SKILL,-1,_YPOS_MESSAGE_Joincamp,"font_old_10_white.tga",2);
	}
	else if(Npc_HasItems(hero,ItKeLockpick))
	{
		return TRUE;
	}
	else
	{
		PrintScreen(_STR_MESSAGE_INTERACT_NO_KEY_NO_LOCKPICK,-1,_YPOS_MESSAGE_Joincamp,"font_old_10_white.tga",2);
	};
	return FALSE;
};

func int itke_gomez_01_cf()
{
	if(ITKE_GOMEZ_01_USED == TRUE)
	{
		return TRUE;
	}
	else if(Npc_HasItems(hero,ItKe_Gomez_01))
	{
		AI_Wait(self,0.7);
		AI_PlayAni(self,"T_CHESTBIG_S0_PICKRIGHT");
		Snd_Play3d(self,"DOOR_LOCK");
		PrintScreen("Использован ключ Гомеза.",-1,37,"FONT_OLD_10_WHITE.TGA",3);
		ITKE_GOMEZ_01_USED = TRUE;
		return TRUE;
	}
	else if(Npc_IsPlayer(self))
	{
		AI_OutputSVM_Overlay(self,self,"$NEEDKEY");
		PrintScreen(_STR_MESSAGE_INTERACT_NO_KEY,-1,_YPOS_MESSAGE_Joincamp,"font_old_10_white.tga",2);
	};
	return FALSE;
};

func int itke_gomez_02_cf()
{
	if(ITKE_GOMEZ_02_USED == TRUE)
	{
		return TRUE;
	}
	else if(Npc_HasItems(hero,ItKe_Gomez_01))
	{
		AI_Wait(self,0.7);
		AI_PlayAni(self,"T_CHESTBIG_S0_PICKRIGHT");
		Snd_Play3d(self,"DOOR_LOCK");
		PrintScreen("Использован ключ Гомеза.",-1,37,"FONT_OLD_10_WHITE.TGA",3);
		ITKE_GOMEZ_02_USED = TRUE;
		return TRUE;
	}
	else if(Npc_IsPlayer(self))
	{
		AI_OutputSVM_Overlay(self,self,"$NEEDKEY");
		PrintScreen(_STR_MESSAGE_INTERACT_NO_KEY,-1,_YPOS_MESSAGE_Joincamp,"font_old_10_white.tga",2);
	};
	return FALSE;
};

func int itke_gomez_03_cf()
{
	if(ITKE_GOMEZ_03_USED == TRUE)
	{
		return TRUE;
	}
	else if(Npc_HasItems(hero,ItKe_Gomez_01))
	{
		AI_Wait(self,0.7);
		AI_PlayAni(self,"T_CHESTBIG_S0_PICKRIGHT");
		Snd_Play3d(self,"DOOR_LOCK");
		PrintScreen("Использован ключ Гомеза.",-1,37,"FONT_OLD_10_WHITE.TGA",3);
		ITKE_GOMEZ_03_USED = TRUE;
		return TRUE;
	}
	else if(Npc_IsPlayer(self))
	{
		AI_OutputSVM_Overlay(self,self,"$NEEDKEY");
		PrintScreen(_STR_MESSAGE_INTERACT_NO_KEY,-1,_YPOS_MESSAGE_Joincamp,"font_old_10_white.tga",2);
	};
	return FALSE;
};

func int itke_quentin_cf()
{
	if(ITKE_QUENTIN_USED == TRUE)
	{
		return TRUE;
	}
	else if(Npc_HasItems(hero,itke_quentin))
	{
		AI_Wait(self,0.7);
		AI_PlayAni(self,"T_CHESTBIG_S0_PICKRIGHT");
		Snd_Play3d(self,"DOOR_LOCK");
		PrintScreen("Использован ключ Квентина.",-1,37,"FONT_OLD_10_WHITE.TGA",3);
		ITKE_QUENTIN_USED = TRUE;
		return TRUE;
	}
	else if(Npc_IsPlayer(self))
	{
		AI_OutputSVM_Overlay(self,self,"$NEEDKEY");
		PrintScreen(_STR_MESSAGE_INTERACT_NO_KEY,-1,_YPOS_MESSAGE_Joincamp,"font_old_10_white.tga",2);
	};
	return FALSE;
};

func int itke_weaponry_01_cf()
{
	if(ITKE_WEAPONRY_01_USED == TRUE)
	{
		return TRUE;
	}
	else if(Npc_HasItems(hero,itke_weaponry))
	{
		AI_Wait(self,0.7);
		AI_PlayAni(self,"T_CHESTBIG_S0_PICKRIGHT");
		Snd_Play3d(self,"DOOR_LOCK");
		PrintScreen("Использован ключ от оружейной.",-1,37,"FONT_OLD_10_WHITE.TGA",3);
		ITKE_WEAPONRY_01_USED = TRUE;
		return TRUE;
	}
	else if(Npc_IsPlayer(self))
	{
		AI_OutputSVM_Overlay(self,self,"$NEEDKEY");
		PrintScreen(_STR_MESSAGE_INTERACT_NO_KEY,-1,_YPOS_MESSAGE_Joincamp,"font_old_10_white.tga",2);
	};
	return FALSE;
};

func int itke_weaponry_02_cf()
{
	if(ITKE_WEAPONRY_02_USED == TRUE)
	{
		return TRUE;
	}
	else if(Npc_HasItems(hero,itke_weaponry))
	{
		AI_Wait(self,0.7);
		AI_PlayAni(self,"T_CHESTBIG_S0_PICKRIGHT");
		Snd_Play3d(self,"DOOR_LOCK");
		PrintScreen("Использован ключ от оружейной.",-1,37,"FONT_OLD_10_WHITE.TGA",3);
		ITKE_WEAPONRY_02_USED = TRUE;
		return TRUE;
	}
	else if(Npc_IsPlayer(self))
	{
		AI_OutputSVM_Overlay(self,self,"$NEEDKEY");
		PrintScreen(_STR_MESSAGE_INTERACT_NO_KEY,-1,_YPOS_MESSAGE_Joincamp,"font_old_10_white.tga",2);
	};
	return FALSE;
};

func int itke_weaponry_03_cf()
{
	if(ITKE_WEAPONRY_03_USED == TRUE)
	{
		return TRUE;
	}
	else if(Npc_HasItems(hero,itke_weaponry))
	{
		AI_Wait(self,0.7);
		AI_PlayAni(self,"T_CHESTBIG_S0_PICKRIGHT");
		Snd_Play3d(self,"DOOR_LOCK");
		PrintScreen("Использован ключ от оружейной.",-1,37,"FONT_OLD_10_WHITE.TGA",3);
		ITKE_WEAPONRY_03_USED = TRUE;
		return TRUE;
	}
	else if(Npc_IsPlayer(self))
	{
		AI_OutputSVM_Overlay(self,self,"$NEEDKEY");
		PrintScreen(_STR_MESSAGE_INTERACT_NO_KEY,-1,_YPOS_MESSAGE_Joincamp,"font_old_10_white.tga",2);
	};
	return FALSE;
};

func int itke_weaponry_04_cf()
{
	if(ITKE_WEAPONRY_04_USED == TRUE)
	{
		return TRUE;
	}
	else if(Npc_HasItems(hero,itke_weaponry))
	{
		AI_Wait(self,0.7);
		AI_PlayAni(self,"T_CHESTBIG_S0_PICKRIGHT");
		Snd_Play3d(self,"DOOR_LOCK");
		PrintScreen("Использован ключ от оружейной.",-1,37,"FONT_OLD_10_WHITE.TGA",3);
		ITKE_WEAPONRY_04_USED = TRUE;
		return TRUE;
	}
	else if(Npc_IsPlayer(self))
	{
		AI_OutputSVM_Overlay(self,self,"$NEEDKEY");
		PrintScreen(_STR_MESSAGE_INTERACT_NO_KEY,-1,_YPOS_MESSAGE_Joincamp,"font_old_10_white.tga",2);
	};
	return FALSE;
};

func int itke_berg_01_cf()
{
	if(ITKE_BERG_USED == TRUE)
	{
		return TRUE;
	}
	else if(Npc_HasItems(hero,ItKe_BERG_01))
	{
		AI_Wait(self,0.7);
		AI_PlayAni(self,"T_CHESTBIG_S0_PICKRIGHT");
		Snd_Play3d(self,"DOOR_LOCK");
		PrintScreen("Использован ржавый ключ.",-1,37,"FONT_OLD_10_WHITE.TGA",3);
		ITKE_BERG_USED = TRUE;
		return TRUE;
	}
	else if(Npc_IsPlayer(self))
	{
		AI_OutputSVM_Overlay(self,self,"$NEEDKEY");
		PrintScreen(_STR_MESSAGE_INTERACT_NO_KEY,-1,_YPOS_MESSAGE_Joincamp,"font_old_10_white.tga",2);
	};
	return FALSE;
};

func int itke_focus5_cf()
{
	if(ITKE_FOCUS5_USED == TRUE)
	{
		return TRUE;
	}
	else if(Npc_HasItems(hero,ItKe_Focus5))
	{
		AI_Wait(self,0.7);
		AI_PlayAni(self,"T_CHESTBIG_S0_PICKRIGHT");
		Snd_Play3d(self,"DOOR_LOCK");
		PrintScreen("Использован ключ из склепа.",-1,37,"FONT_OLD_10_WHITE.TGA",3);
		ITKE_FOCUS5_USED = TRUE;
		return TRUE;
	}
	else if(Npc_IsPlayer(self))
	{
		AI_OutputSVM_Overlay(self,self,"$NEEDKEY");
		PrintScreen(_STR_MESSAGE_INTERACT_NO_KEY,-1,_YPOS_MESSAGE_Joincamp,"font_old_10_white.tga",2);
	};
	return FALSE;
};

func int itke_sunkentower_01_cf()
{
	if(ITKE_SUNKENTOWER_01_USED == TRUE)
	{
		return TRUE;
	}
	else if(Npc_HasItems(hero,ItKe_SunkenTower))
	{
		AI_Wait(self,0.7);
		AI_PlayAni(self,"T_CHESTSMALL_S0_PICKRIGHT");
		Snd_Play3d(self,"DOOR_LOCK");
		PrintScreen("Использован ключ Ксардаса.",-1,37,"FONT_OLD_10_WHITE.TGA",3);
		ITKE_SUNKENTOWER_01_USED = TRUE;
		return TRUE;
	}
	else if(Npc_IsPlayer(self))
	{
		AI_OutputSVM_Overlay(self,self,"$NEEDKEY");
		PrintScreen(_STR_MESSAGE_INTERACT_NO_KEY,-1,_YPOS_MESSAGE_Joincamp,"font_old_10_white.tga",2);
	};
	return FALSE;
};

func int itke_sunkentower_02_cf()
{
	if(ITKE_SUNKENTOWER_02_USED == TRUE)
	{
		return TRUE;
	}
	else if(Npc_HasItems(hero,ItKe_SunkenTower))
	{
		AI_Wait(self,0.7);
		AI_PlayAni(self,"T_CHESTSMALL_S0_PICKRIGHT");
		Snd_Play3d(self,"DOOR_LOCK");
		PrintScreen("Использован ключ Ксардаса.",-1,37,"FONT_OLD_10_WHITE.TGA",3);
		ITKE_SUNKENTOWER_02_USED = TRUE;
		return TRUE;
	}
	else if(Npc_IsPlayer(self))
	{
		AI_OutputSVM_Overlay(self,self,"$NEEDKEY");
		PrintScreen(_STR_MESSAGE_INTERACT_NO_KEY,-1,_YPOS_MESSAGE_Joincamp,"font_old_10_white.tga",2);
	};
	return FALSE;
};

func int itke_focus4_cf()
{
	if(ITKE_FOCUS4_USED == TRUE)
	{
		return TRUE;
	}
	else if(Npc_HasItems(hero,ItKe_Focus4))
	{
		AI_Wait(self,0.7);
		Snd_Play3d(self,"DOOR_LOCK");
		PrintScreen("Использован ключ из пещеры.",-1,37,"FONT_OLD_10_WHITE.TGA",3);
		ITKE_FOCUS4_USED = TRUE;
		return TRUE;
	}
	else if(Npc_IsPlayer(self))
	{
		AI_OutputSVM_Overlay(self,self,"$NEEDKEY");
		PrintScreen(_STR_MESSAGE_INTERACT_NO_KEY,-1,_YPOS_MESSAGE_Joincamp,"font_old_10_white.tga",2);
	};
	return FALSE;
};

func int itkecavalorn01_cf()
{
	if(CAVALORN_KEY_USED == TRUE)
	{
		return TRUE;
	}
	else if(Npc_HasItems(hero,ItKeCavalorn01))
	{
		AI_Wait(self,0.7);
		Snd_Play3d(self,"DOOR_LOCK");
		PrintScreen("Использован ключ Кавалорна.",-1,37,"FONT_OLD_10_WHITE.TGA",3);
		CAVALORN_KEY_USED = TRUE;
		return TRUE;
	}
	else if(Npc_IsPlayer(self))
	{
		AI_OutputSVM_Overlay(self,self,"$NEEDKEY");
		PrintScreen(_STR_MESSAGE_INTERACT_NO_KEY,-1,_YPOS_MESSAGE_Joincamp,"font_old_10_white.tga",2);
	};
	return FALSE;
};

func int itke_freemine_cf()
{
	if(FREEMINE_KEY_USED == TRUE)
	{
		return TRUE;
	}
	else if(Npc_HasItems(hero,ItKe_Freemine))
	{
		AI_Wait(self,0.7);
		Snd_Play3d(self,"DOOR_LOCK");
		PrintScreen("Использован ключ от Свободной шахты.",-1,37,"FONT_OLD_10_WHITE.TGA",3);
		FREEMINE_KEY_USED = TRUE;
		return TRUE;
	}
	else if(Npc_IsPlayer(self))
	{
		AI_OutputSVM_Overlay(self,self,"$NEEDKEY");
		PrintScreen(_STR_MESSAGE_INTERACT_NO_KEY,-1,_YPOS_MESSAGE_Joincamp,"font_old_10_white.tga",2);
	};
	return FALSE;
};

func int itke_yberion_cf()
{
	if(ITKE_YBERION_USED == TRUE)
	{
		return TRUE;
	}
	else if(Npc_HasItems(hero,itke_yberion))
	{
		AI_Wait(self,0.7);
		AI_PlayAni(self,"T_CHESTBIG_S0_PICKRIGHT");
		Snd_Play3d(self,"DOOR_LOCK");
		PrintScreen("Использован ключ Юбериона.",-1,37,"FONT_OLD_10_WHITE.TGA",3);
		ITKE_YBERION_USED = TRUE;
		return TRUE;
	}
	else if(Npc_IsPlayer(self))
	{
		AI_OutputSVM_Overlay(self,self,"$NEEDKEY");
		PrintScreen(_STR_MESSAGE_INTERACT_NO_KEY,-1,_YPOS_MESSAGE_Joincamp,"font_old_10_white.tga",2);
	};
	return FALSE;
};

func int itke_psi_kalom_01_cf()
{
	if(PSILABKEY_USED == TRUE)
	{
		return TRUE;
	}
	else if(Npc_HasItems(hero,itke_psi_kalom_01))
	{
		AI_Wait(self,0.7);
		AI_PlayAni(self,"T_CHESTBIG_S0_PICKRIGHT");
		Snd_Play3d(self,"DOOR_LOCK");
		PrintScreen("Использован ключ из лаборатории.",-1,37,"FONT_OLD_10_WHITE.TGA",3);
		PSILABKEY_USED = TRUE;
		return TRUE;
	}
	else if(Npc_IsPlayer(self))
	{
		AI_OutputSVM_Overlay(self,self,"$NEEDKEY");
		PrintScreen(_STR_MESSAGE_INTERACT_NO_KEY,-1,_YPOS_MESSAGE_Joincamp,"font_old_10_white.tga",2);
	};
	return FALSE;
};

func int dungeonkey_01_cf()
{
	if(DUNGEONKEY_01_USED == TRUE)
	{
		return TRUE;
	}
	else if(Npc_HasItems(hero,DungeonKey))
	{
		AI_Wait(self,0.7);
		Snd_Play3d(self,"DOOR_LOCK");
		PrintScreen("Использован ключ от подземелья.",-1,37,"FONT_OLD_10_WHITE.TGA",3);
		DUNGEONKEY_01_USED = TRUE;
		return TRUE;
	}
	else if(Npc_IsPlayer(self))
	{
		AI_OutputSVM_Overlay(self,self,"$NEEDKEY");
		PrintScreen(_STR_MESSAGE_INTERACT_NO_KEY,-1,_YPOS_MESSAGE_Joincamp,"font_old_10_white.tga",2);
	};
	return FALSE;
};

func int dungeonkey_02_cf()
{
	if(DUNGEONKEY_02_USED == TRUE)
	{
		return TRUE;
	}
	else if(Npc_HasItems(hero,DungeonKey))
	{
		AI_Wait(self,0.7);
		Snd_Play3d(self,"DOOR_LOCK");
		PrintScreen("Использован ключ от подземелья.",-1,37,"FONT_OLD_10_WHITE.TGA",3);
		DUNGEONKEY_02_USED = TRUE;
		return TRUE;
	}
	else if(Npc_IsPlayer(self))
	{
		AI_OutputSVM_Overlay(self,self,"$NEEDKEY");
		PrintScreen(_STR_MESSAGE_INTERACT_NO_KEY,-1,_YPOS_MESSAGE_Joincamp,"font_old_10_white.tga",2);
	};
	return FALSE;
};

func int dungeonkey_03_cf()
{
	if(DUNGEONKEY_03_USED == TRUE)
	{
		return TRUE;
	}
	else if(Npc_HasItems(hero,DungeonKey))
	{
		AI_Wait(self,0.7);
		Snd_Play3d(self,"DOOR_LOCK");
		PrintScreen("Использован ключ от подземелья.",-1,37,"FONT_OLD_10_WHITE.TGA",3);
		DUNGEONKEY_03_USED = TRUE;
		return TRUE;
	}
	else if(Npc_IsPlayer(self))
	{
		AI_OutputSVM_Overlay(self,self,"$NEEDKEY");
		PrintScreen(_STR_MESSAGE_INTERACT_NO_KEY,-1,_YPOS_MESSAGE_Joincamp,"font_old_10_white.tga",2);
	};
	return FALSE;
};

func int itke_gilbert_cf()
{
	if(GILBERT_KEY_USED == TRUE)
	{
		return TRUE;
	}
	else if(Npc_HasItems(hero,itke_gilbert))
	{
		AI_Wait(self,0.7);
		Snd_Play3d(self,"DOOR_LOCK");
		PrintScreen("Использован дубликат ключа.",-1,37,"FONT_OLD_10_WHITE.TGA",3);
		GILBERT_KEY_USED = TRUE;
		return TRUE;
	}
	else if(Npc_IsPlayer(self))
	{
		AI_OutputSVM_Overlay(self,self,"$NEEDKEY");
		PrintScreen(_STR_MESSAGE_INTERACT_NO_KEY,-1,_YPOS_MESSAGE_Joincamp,"font_old_10_white.tga",2);
	};
	return FALSE;
};

func int itkey_ob_smith_01_cf()
{
	if(OB_SMITH_KEY_USED == TRUE)
	{
		return TRUE;
	}
	else if(Npc_HasItems(hero,itkey_ob_smith_01))
	{
		AI_Wait(self,0.7);
		Snd_Play3d(self,"DOOR_LOCK");
		PrintScreen("Использован железный ключ.",-1,37,"FONT_OLD_10_WHITE.TGA",3);
		OB_SMITH_KEY_USED = TRUE;
		return TRUE;
	}
	else if(Npc_IsPlayer(self))
	{
		AI_OutputSVM_Overlay(self,self,"$NEEDKEY");
		PrintScreen(_STR_MESSAGE_INTERACT_NO_KEY,-1,_YPOS_MESSAGE_Joincamp,"font_old_10_white.tga",2);
	};
	return FALSE;
};

func int itke_storage_01_cf()
{
	if(ITKE_STORAGE_01_USED == TRUE)
	{
		return TRUE;
	}
	else if(
		Npc_HasItems(hero,ItKe_Storage_01) ||
		Npc_HasItems(hero,ItKe_Nek_01)
	)
	{
		AI_Wait(self,0.7);
		Snd_Play3d(self,"DOOR_LOCK");
		PrintScreen("Использован ключ от склада.",-1,37,"FONT_OLD_10_WHITE.TGA",3);
		ITKE_STORAGE_01_USED = TRUE;
		return TRUE;
	}
	else if(Npc_IsPlayer(self))
	{
		AI_OutputSVM_Overlay(self,self,"$NEEDKEY");
		PrintScreen(_STR_MESSAGE_INTERACT_NO_KEY,-1,_YPOS_MESSAGE_Joincamp,"font_old_10_white.tga",2);
	};
	return FALSE;
};

func int itke_storage_02_cf()
{
	if(ITKE_STORAGE_02_USED == TRUE)
	{
		return TRUE;
	}
	else if(
		Npc_HasItems(hero,ItKe_Storage_01) ||
		Npc_HasItems(hero,ItKe_Nek_01)
	)
	{
		AI_Wait(self,0.7);
		Snd_Play3d(self,"DOOR_LOCK");
		PrintScreen("Использован ключ от склада.",-1,37,"FONT_OLD_10_WHITE.TGA",3);
		ITKE_STORAGE_02_USED = TRUE;
		return TRUE;
	}
	else if(Npc_IsPlayer(self))
	{
		AI_OutputSVM_Overlay(self,self,"$NEEDKEY");
		PrintScreen(_STR_MESSAGE_INTERACT_NO_KEY,-1,_YPOS_MESSAGE_Joincamp,"font_old_10_white.tga",2);
	};
	return FALSE;
};

func int itke_storage_03_cf()
{
	if(ITKE_STORAGE_03_USED == TRUE)
	{
		return TRUE;
	}
	else if(Npc_HasItems(hero,ItKe_Storage_01))
	{
		AI_Wait(self,0.7);
		Snd_Play3d(self,"DOOR_LOCK");
		PrintScreen("Использован ключ от склада.",-1,37,"FONT_OLD_10_WHITE.TGA",3);
		ITKE_STORAGE_03_USED = TRUE;
		return TRUE;
	}
	else if(Npc_IsPlayer(self))
	{
		AI_OutputSVM_Overlay(self,self,"$NEEDKEY");
		PrintScreen(_STR_MESSAGE_INTERACT_NO_KEY,-1,_YPOS_MESSAGE_Joincamp,"font_old_10_white.tga",2);
	};
	return FALSE;
};

func int ll2_itkey_rb_01_cf()
{
	if(LORD_KEY_USED == TRUE)
	{
		return TRUE;
	}
	else if(Npc_HasItems(hero,ItKey_RB_01))
	{
		AI_Wait(self,0.7);
		AI_PlayAni(self,"T_CHESTBIG_S0_PICKRIGHT");
		Snd_Play3d(self,"DOOR_LOCK");
		PrintScreen("Использован ключ Лорда.",-1,37,"FONT_OLD_10_WHITE.TGA",3);
		LORD_KEY_USED = TRUE;
		return TRUE;
	}
	else if(Npc_GetTalentSkill(hero,NPC_TALENT_PICKLOCK) < 1)
	{
		PrintScreen(_STR_CANNOTUSE_LOCKS_NO_SKILL,-1,_YPOS_MESSAGE_Joincamp,"font_old_10_white.tga",2);
	}
	else if(Npc_GetTalentSkill(hero,NPC_TALENT_PICKLOCK) < 2)
	{
		PrintScreen(_STR_CANNOTUSE_LOCKS_LOW_SKILL,-1,_YPOS_MESSAGE_Joincamp,"font_old_10_white.tga",2);
	}
	else if(Npc_HasItems(hero,ItKeLockpick))
	{
		return TRUE;
	}
	else
	{
		PrintScreen(_STR_MESSAGE_INTERACT_NO_KEY_NO_LOCKPICK,-1,_YPOS_MESSAGE_Joincamp,"font_old_10_white.tga",2);
	};
	return FALSE;
};

func int ll2_orik_key_cf()
{
	if(ORIK_KEY_USED == TRUE)
	{
		return TRUE;
	}
	else if(Npc_HasItems(hero,orik_key))
	{
		AI_Wait(self,0.7);
		AI_PlayAni(self,"T_CHESTBIG_S0_PICKRIGHT");
		Snd_Play3d(self,"DOOR_LOCK");
		PrintScreen("Использован ключ Орика.",-1,37,"FONT_OLD_10_WHITE.TGA",3);
		ORIK_KEY_USED = TRUE;
		return TRUE;
	}
	else if(Npc_GetTalentSkill(hero,NPC_TALENT_PICKLOCK) < 1)
	{
		PrintScreen(_STR_CANNOTUSE_LOCKS_NO_SKILL,-1,_YPOS_MESSAGE_Joincamp,"font_old_10_white.tga",2);
	}
	else if(Npc_GetTalentSkill(hero,NPC_TALENT_PICKLOCK) < 2)
	{
		PrintScreen(_STR_CANNOTUSE_LOCKS_LOW_SKILL,-1,_YPOS_MESSAGE_Joincamp,"font_old_10_white.tga",2);
	}
	else if(Npc_HasItems(hero,ItKeLockpick))
	{
		return TRUE;
	}
	else
	{
		PrintScreen(_STR_MESSAGE_INTERACT_NO_KEY_NO_LOCKPICK,-1,_YPOS_MESSAGE_Joincamp,"font_old_10_white.tga",2);
	};
	return FALSE;
};

func int ll2_itke_tower_01_cf()
{
	if(ITKE_TOWER_01_USED == TRUE)
	{
		return TRUE;
	}
	else if(Npc_HasItems(hero,itke_tower_01))
	{
		AI_Wait(self,0.7);
		Snd_Play3d(self,"DOOR_LOCK");
		PrintScreen("Использован ключ от башни.",-1,37,"FONT_OLD_10_WHITE.TGA",3);
		ITKE_TOWER_01_USED = TRUE;
		return TRUE;
	}
	else if(Npc_GetTalentSkill(hero,NPC_TALENT_PICKLOCK) < 1)
	{
		PrintScreen(_STR_CANNOTUSE_LOCKS_NO_SKILL,-1,_YPOS_MESSAGE_Joincamp,"font_old_10_white.tga",2);
	}
	else if(Npc_GetTalentSkill(hero,NPC_TALENT_PICKLOCK) < 2)
	{
		PrintScreen(_STR_CANNOTUSE_LOCKS_LOW_SKILL,-1,_YPOS_MESSAGE_Joincamp,"font_old_10_white.tga",2);
	}
	else if(Npc_HasItems(hero,ItKeLockpick))
	{
		return TRUE;
	}
	else
	{
		PrintScreen(_STR_MESSAGE_INTERACT_NO_KEY_NO_LOCKPICK,-1,_YPOS_MESSAGE_Joincamp,"font_old_10_white.tga",2);
	};
	return FALSE;
};

func int ll2_itke_tower_02_cf()
{
	if(ITKE_TOWER_02_USED == TRUE)
	{
		return TRUE;
	}
	else if(Npc_HasItems(hero,itke_tower_01))
	{
		AI_Wait(self,0.7);
		Snd_Play3d(self,"DOOR_LOCK");
		PrintScreen("Использован ключ от башни.",-1,37,"FONT_OLD_10_WHITE.TGA",3);
		ITKE_TOWER_02_USED = TRUE;
		return TRUE;
	}
	else if(Npc_GetTalentSkill(hero,NPC_TALENT_PICKLOCK) < 1)
	{
		PrintScreen(_STR_CANNOTUSE_LOCKS_NO_SKILL,-1,_YPOS_MESSAGE_Joincamp,"font_old_10_white.tga",2);
	}
	else if(Npc_GetTalentSkill(hero,NPC_TALENT_PICKLOCK) < 2)
	{
		PrintScreen(_STR_CANNOTUSE_LOCKS_LOW_SKILL,-1,_YPOS_MESSAGE_Joincamp,"font_old_10_white.tga",2);
	}
	else if(Npc_HasItems(hero,ItKeLockpick))
	{
		return TRUE;
	}
	else
	{
		PrintScreen(_STR_MESSAGE_INTERACT_NO_KEY_NO_LOCKPICK,-1,_YPOS_MESSAGE_Joincamp,"font_old_10_white.tga",2);
	};
	return FALSE;
};

func int itke_om_02_cf()
{
	if(ITKE_OM_02_USED == TRUE)
	{
		return TRUE;
	}
	else if(Npc_HasItems(hero,ItKe_OM_02))
	{
		AI_Wait(self,0.7);
		AI_PlayAni(self,"T_CHESTBIG_S0_PICKRIGHT");
		Snd_Play3d(self,"DOOR_LOCK");
		PrintScreen("Использован ключ Аарона.",-1,37,"FONT_OLD_10_WHITE.TGA",3);
		ITKE_OM_02_USED = TRUE;
		return TRUE;
	}
	else if(Npc_IsPlayer(self))
	{
		AI_OutputSVM_Overlay(self,self,"$NEEDKEY");
		PrintScreen(_STR_MESSAGE_INTERACT_NO_KEY,-1,_YPOS_MESSAGE_Joincamp,"font_old_10_white.tga",2);
	};
	return FALSE;
};

func int itke_om_03_01_cf()
{
	if(ITKE_OM_03_01_USED == TRUE)
	{
		return TRUE;
	}
	else if(Npc_HasItems(hero,ItKe_OM_03))
	{
		AI_Wait(self,0.7);
		AI_PlayAni(self,"T_CHESTBIG_S0_PICKRIGHT");
		Snd_Play3d(self,"DOOR_LOCK");
		PrintScreen("Использован ключ от склада.",-1,37,"FONT_OLD_10_WHITE.TGA",3);
		ITKE_OM_03_01_USED = TRUE;
		return TRUE;
	}
	else if(Npc_IsPlayer(self))
	{
		AI_OutputSVM_Overlay(self,self,"$NEEDKEY");
		PrintScreen(_STR_MESSAGE_INTERACT_NO_KEY,-1,_YPOS_MESSAGE_Joincamp,"font_old_10_white.tga",2);
	};
	return FALSE;
};

func int itke_om_03_02_cf()
{
	if(ITKE_OM_03_02_USED == TRUE)
	{
		return TRUE;
	}
	else if(Npc_HasItems(hero,ItKe_OM_03))
	{
		AI_Wait(self,0.7);
		AI_PlayAni(self,"T_CHESTBIG_S0_PICKRIGHT");
		Snd_Play3d(self,"DOOR_LOCK");
		PrintScreen("Использован ключ от склада.",-1,37,"FONT_OLD_10_WHITE.TGA",3);
		ITKE_OM_03_02_USED = TRUE;
		return TRUE;
	}
	else if(Npc_IsPlayer(self))
	{
		AI_OutputSVM_Overlay(self,self,"$NEEDKEY");
		PrintScreen(_STR_MESSAGE_INTERACT_NO_KEY,-1,_YPOS_MESSAGE_Joincamp,"font_old_10_white.tga",2);
	};
	return FALSE;
};

