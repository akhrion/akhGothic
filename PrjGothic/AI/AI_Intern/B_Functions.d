
func void B_GotoWPNextToNpc(var C_Npc slf,var C_Npc oth)
{
	var string waypoint;
	PrintDebugNpc(PD_ZS_DETAIL,"B_GotoWPNextToNpc");
	waypoint = Npc_GetNextWP(oth);
	AI_GotoWP(slf,waypoint);
};

func void B_CantSeeTurn()
{
	PrintDebugNpc(PD_ZS_DETAIL,"B_CantSeeTurn");
	if(!C_BodyStateContains(self,BS_SIT) && !Npc_CanSeeNpc(self,other))
	{
		PrintDebugNpc(PD_ZS_Check,"B_CantSeeTurn If");
		AI_TurnToNPC(self,other);
	};
};

func int C_LookAtNpc(var C_Npc slf,var C_Npc oth)
{
	AI_LookAtNpc(slf,oth);
	PrintDebugNpc(PD_ZS_DETAIL,"C_LookAtNpc");
	return 1;
};

func int C_StopLookAt(var C_Npc slf)
{
	AI_StopLookAt(slf);
	PrintDebugNpc(PD_ZS_DETAIL,"C_StopLookAt");
	return 1;
};

func void B_SmartTurnToNpc(var C_Npc slf,var C_Npc oth)
{
	PrintDebugNpc(PD_ZS_DETAIL,"B_SmartTurnToNpc");
	if(
		!C_BodyStateContains(slf,BS_SIT) ||
		C_BodyStateContains(slf,BS_ITEMINTERACT) ||
		C_BodyStateContains(slf,BS_MOBINTERACT) ||
		C_BodyStateContains(slf,BS_MOBINTERACT_INTERRUPT)
	)
	{
		PrintDebugNpc(PD_ZS_DETAIL,"...sitzt nicht und ist nicht am Mobsi");
		if(!Npc_CanSeeNpc(slf,oth))
		{
			PrintDebugNpc(PD_ZS_DETAIL,"...kann Ziel nicht sehen!");
			AI_TurnToNPC(slf,oth);
		}
		else
		{
			C_LookAtNpc(slf,oth);
		};
	};
};

func void B_Say(var C_Npc slf,var C_Npc oth,var string text)
{
	var string pipe;
	pipe = ConcatStrings("B_Say: ",text);
	PrintDebugNpc(PD_ZS_FRAME,pipe);
	B_SmartTurnToNpc(slf,oth);
	AI_OutputSVM(slf,oth,text);
};

func void B_SayOverlay(var C_Npc slf,var C_Npc oth,var string text)
{
	var string pipe;
	pipe = ConcatStrings("B_SayOverlay: ",text);
	PrintDebugNpc(PD_ZS_FRAME,pipe);
	B_SmartTurnToNpc(slf,oth);
	AI_OutputSVM_Overlay(slf,oth,text);
};

func void B_StandUp(var C_Npc slf)
{
	PrintDebugNpc(PD_ZS_DETAIL,"B_StandUp");
	if(C_BodyStateContains(slf,BS_SIT))
	{
		if(slf.aivar[AIV_HangAroundStatus] == 1)
		{
			AI_PlayAni(slf,"T_SIT_2_STAND");
			slf.aivar[AIV_HangAroundStatus] = 0;
		}
		else if(slf.aivar[AIV_HangAroundStatus] == 4)
		{
			AI_UseMob(slf,"SMALL THRONE",-1);
			slf.aivar[AIV_HangAroundStatus] = 0;
		}
		else if(slf.aivar[AIV_HangAroundStatus] == 2)
		{
			AI_UseMob(slf,"BENCH",-1);
			slf.aivar[AIV_HangAroundStatus] = 0;
		}
		else if(slf.aivar[AIV_HangAroundStatus] == 3)
		{
			AI_UseMob(slf,"CHAIR",-1);
			slf.aivar[AIV_HangAroundStatus] = 0;
		};
	};
};

func void B_CallComrades()
{
	PrintDebugNpc(PD_ZS_DETAIL,"B_CallComrades");
	B_SayOverlay(self,NULL,"$GETTHINGSRIGHT");
	Npc_SendPassivePerc(self,PERC_ASSESSWARN,self,other);
};

func void B_CallGuards()
{
	PrintDebugNpc(PD_ZS_DETAIL,"B_CallGuards");
	B_SayOverlay(self,NULL,"$HELP");
	Npc_SendPassivePerc(self,PERC_ASSESSWARN,self,other);
};

func void B_IntruderAlert(var C_Npc slf,var C_Npc oth)
{
	PrintDebugNpc(PD_ZS_DETAIL,"B_IntruderAlert");
	B_SayOverlay(slf,NULL,"$IntruderAlert");
	Npc_SendPassivePerc(slf,PERC_ASSESSWARN,slf,oth);
};

func void B_FullStop(var C_Npc npc)
{
	PrintDebugNpc(PD_ZS_DETAIL,"B_FullStop");
	Npc_ClearAIQueue(npc);
	AI_StandupQuick(npc);
};

func void B_ResetTempAttitude(var C_Npc slf)
{
	PrintDebugNpc(PD_ZS_DETAIL,"B_ResetTempAttitude");
	Npc_SetTempAttitude(slf,Npc_GetPermAttitude(slf,hero));
};

func void B_WhirlAround(var C_Npc slf,var C_Npc oth)
{
	PrintDebugNpc(PD_ZS_DETAIL,"B_WhirlAround");
	if(Npc_CanSeeNpc(slf,oth))
	{
		PrintDebugNpc(PD_ZS_DETAIL,"...KANN Ziel sehen!");
		AI_TurnToNPC(slf,oth);
	}
	else
	{
		PrintDebugNpc(PD_ZS_DETAIL,"...kann Ziel NICHT sehen!");
		AI_WhirlAround(slf,oth);
	};
};

func void B_DropWeapon(var C_Npc slf)
{
	var C_Item itm;
	var int itemid;
	PrintDebugNpc(PD_ZS_DETAIL,"B_DropWeapon");
	itm = Npc_GetReadiedWeapon(slf);
	if(Hlp_IsValidItem(itm))
	{
		itemid = Hlp_GetInstanceID(itm);
		PrintDebugNpc(PD_ZS_DETAIL,itm.name);
		AI_DropItem(slf,itemid);
	};
};

func void B_RegainDroppedWeapon(var C_Npc slf)
{
	Npc_PerceiveAll(slf);
	if(Wld_DetectItem(slf,ITEM_KAT_NF) || Wld_DetectItem(slf,ITEM_KAT_FF))
	{
		if((slf.id == 1422) || (slf.id == 251) || (slf.id == 729))
		{
			if(Npc_OwnedByNpc(item,slf))
			{
				AI_TakeItem(slf,item);
				AI_EquipBestMeleeWeapon(slf);
			};
		}
		else if(!Npc_IsPlayer(slf) && Npc_CanSeeItem(slf,item))
		{
			PrintDebugNpc(PD_ZS_Check,"...NSC hebt seine Waffen wieder auf!");
			AI_TakeItem(slf,item);
			AI_EquipBestMeleeWeapon(slf);
			AI_EquipBestRangedWeapon(slf);
		};
	};
};

func void B_RegainDroppedArmor(var C_Npc slf)
{
	Npc_PerceiveAll(slf);
	if(Wld_DetectItem(slf,ITEM_KAT_ARMOR))
	{
		if(!Npc_IsPlayer(slf))
		{
			PrintDebugNpc(PD_ZS_Check,"...NSC hebt seine Rьstung wieder auf!");
			AI_TakeItem(slf,item);
			AI_EquipBestArmor(slf);
		};
	};
};

func void B_GotoFP(var C_Npc slf,var string fp)
{
	PrintDebugNpc(PD_TA_LOOP,"B_GotoFP");
	if(!Npc_IsOnFP(self,fp))
	{
		PrintDebugString(PD_TA_CHECK,"...nicht auf passendem Freepoint ",fp);
		if(Wld_IsNextFPAvailable(self,fp))
		{
			PrintDebugString(PD_TA_CHECK,"Gehe zu Freepoint ",fp);
			AI_SetWalkMode(self,NPC_WALK);
			AI_GotoNextFP(self,fp);
		};
	};
};

func void B_StopGotoHero()
{
	PrintDebugNpc(PD_ZS_FRAME,"B_StopGotoHero");
	if(Npc_IsPlayer(other))
	{
		PrintDebugNpc(PD_ZS_DETAIL,"...Kollision mit Spieler!");
		Npc_PercDisable(self,PERC_MOVENPC);
		B_FullStop(self);
	};
};

func void B_SetAttackReason(var C_Npc slf,var int reason)
{
	PrintDebugNpc(PD_ZS_DETAIL,"B_SetAttackReason");
	slf.aivar[AIV_ATTACKREASON] = reason;
};

func void B_KillNpc(var int npcInstance)
{
	var C_Npc npc;
	var int itemInstance;
	PrintDebugNpc(PD_ZS_DETAIL,"B_KillNpc");
	npc = Hlp_GetNpc(npcInstance);
	if(!Npc_IsDead(npc))
	{
		npc.flags = 0;
		CreateInvItem(npc,ItMi_Stuff_OldCoin_01);
		Npc_ChangeAttribute(npc,ATR_HITPOINTS,-npc.attribute[ATR_HITPOINTS_MAX]);
		if(Npc_GetInvItemBySlot(npc,INV_WEAPON,1))
		{
			PrintDebugNpc(PD_ZS_DETAIL,"...Waffe in Slot 1 gefunden!");
			itemInstance = Hlp_GetInstanceID(item);
			Npc_RemoveInvItem(npc,itemInstance);
		};
		if(Npc_GetInvItemBySlot(npc,INV_WEAPON,2))
		{
			PrintDebugNpc(PD_ZS_DETAIL,"...Waffe in Slot 2 gefunden!");
			itemInstance = Hlp_GetInstanceID(item);
			Npc_RemoveInvItem(npc,itemInstance);
		};
		Npc_RemoveInvItem(npc,itarrune_2_1_firebolt);
		Npc_RemoveInvItem(npc,itarrune_2_2_fireball);
		Npc_RemoveInvItems(npc,ItAmArrow,Npc_HasItems(npc,ItAmArrow));
		Npc_RemoveInvItems(npc,ItAmBolt,Npc_HasItems(npc,ItAmBolt));
		if(npc.guild == GIL_KDF)
		{
			Npc_RemoveInvItems(npc,ItFo_Potion_Health_01,Npc_HasItems(npc,ItFo_Potion_Health_01));
			Npc_RemoveInvItems(npc,ItFo_Potion_Health_02,Npc_HasItems(npc,ItFo_Potion_Health_02));
			Npc_RemoveInvItems(npc,ItFo_Potion_Health_03,Npc_HasItems(npc,ItFo_Potion_Health_03));
			Npc_RemoveInvItems(npc,ItFo_Potion_Mana_01,Npc_HasItems(npc,ItFo_Potion_Mana_01));
			Npc_RemoveInvItems(npc,ItFo_Potion_Mana_02,Npc_HasItems(npc,ItFo_Potion_Mana_02));
			Npc_RemoveInvItems(npc,ItFo_Potion_Mana_03,Npc_HasItems(npc,ItFo_Potion_Mana_03));
			Npc_RemoveInvItem(npc,Schutzring_Total2);
			Npc_RemoveInvItem(npc,Schutzring_Magie2_Fire2);
		}
		else if(npc.guild == GIL_SFB)
		{
			Npc_RemoveInvItem(npc,ItMwPickaxe);
			Npc_RemoveInvItem(npc,ItMw_1H_Nailmace_01);
			Npc_RemoveInvItem(npc,ItMw_1H_Hatchet_01);
			Npc_RemoveInvItem(npc,ItMw_1H_Sword_Short_01);
		}
		else if(npc.guild == GIL_SLD)
		{
			Npc_RemoveInvItem(npc,ItRw_Bow_Long_01);
			Npc_RemoveInvItem(npc,ItMw_1H_Mace_War_03);
			Npc_RemoveInvItem(npc,ItMw_2H_Axe_Heavy_02);
		}
		else if(npc.guild == GIL_ORG)
		{
			Npc_RemoveInvItem(npc,ItMw_1H_Mace_03);
			Npc_RemoveInvItem(npc,ItMw_1H_Mace_War_01);
			Npc_RemoveInvItem(npc,ItRw_Bow_Long_01);
		};
	};
};

func void B_UseFakeScroll()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,hero);
	};
	CreateInvItem(self,Fakescroll);
	AI_UseItemToState(self,Fakescroll,1);
	AI_Wait(self,3);
	AI_UseItemToState(self,Fakescroll,-1);
};

func void B_ChangeGuild(var int npcInstance,var int newGuild)
{
	var C_Npc npc;
	PrintDebugNpc(PD_ZS_DETAIL,"B_ChangeGuild");
	npc = Hlp_GetNpc(npcInstance);
	Npc_SetTrueGuild(npc,newGuild);
	npc.guild = newGuild;
};

func void B_ExchangeRoutine(var int npcInstance,var string newRoutine)
{
	var C_Npc npc;
	PrintDebugNpc(PD_ZS_DETAIL,"B_ExchangeRoutine");
	npc = Hlp_GetNpc(npcInstance);
	Npc_ExchangeRoutine(npc,newRoutine);
	AI_ContinueRoutine(npc);
};

func void B_SetPermAttitude(var int npcInstance,var int newAttitude)
{
	var C_Npc npc;
	PrintDebugNpc(PD_ZS_DETAIL,"B_SetPermAttitude");
	npc = Hlp_GetNpc(npcInstance);
	Npc_SetAttitude(npc,newAttitude);
	Npc_SetTempAttitude(npc,newAttitude);
};

func void B_LogEntry(var string topic,var string entry)
{
	PrintDebugNpc(PD_ZS_DETAIL,"B_LogEntry");
	Log_AddEntry(topic,entry);
	PrintScreen(NAME_NewLogEntry,-1,_YPOS_MESSAGE_LOGENTRY,"font_old_10_white.tga",_TIME_MESSAGE_LOGENTRY);
	Snd_Play("LogEntry");
};

func void B_ClearImmortal(var int npcInstance)
{
	var C_Npc npc;
	PrintDebugNpc(PD_ZS_DETAIL,"B_ClearImmortal");
	npc = Hlp_GetNpc(npcInstance);
	if(npc.flags == NPC_FLAG_IMMORTAL)
	{
		npc.flags = 0;
	};
};

func void B_SetImmortal(var int npcInstance)
{
	var C_Npc npc;
	PrintDebugNpc(PD_ZS_DETAIL,"B_SetImmortal");
	npc = Hlp_GetNpc(npcInstance);
	if(npc.flags != NPC_FLAG_IMMORTAL)
	{
		npc.flags = 2;
	};
};

func void B_SetNpcType(var int npcInstance,var int newNpctype)
{
	var C_Npc npc;
	PrintDebugNpc(PD_ZS_DETAIL,"B_SetNpcType");
	npc = Hlp_GetNpc(npcInstance);
	npc.npcType = newNpctype;
};


var string screenmessage;
var string screenmessage2;

func void b_printtrademsg1(var string trademsg1)
{
	CreateInvItem(hero,fakeitem);
	SCREENMESSAGE = trademsg1;
	AI_UseItem(hero,fakeitem);
};

func void b_printtrademsg2(var string trademsg2)
{
	CreateInvItem(hero,fakeitem2);
	SCREENMESSAGE2 = trademsg2;
	AI_UseItem(hero,fakeitem2);
};

func void B_GiveInvItems(var C_Npc giver,var C_Npc taker,var int itemInstance,var int amount)
{
	PrintDebugNpc(PD_ZS_DETAIL,"B_GiveInvItems");
	Npc_RemoveInvItems(giver,itemInstance,amount);
	CreateInvItems(taker,itemInstance,amount);
};

func int B_CheckForImportantInfo(var C_Npc slf,var C_Npc oth)
{
	var C_Npc her;
	var C_Npc rock;
	PrintDebugNpc(PD_ZS_FRAME,"B_CheckForImportantInfo");
	if((oth.aivar[AIV_INVINCIBLE] == FALSE) && C_NpcIsHuman(oth))
	{
		PrintDebugNpc(PD_ZS_Check,"...SC spricht nicht!");
		her = Hlp_GetNpc(PC_Hero);
		rock = Hlp_GetNpc(PC_Rockefeller);
		if((Hlp_GetInstanceID(her) != Hlp_GetInstanceID(hero)) && (Hlp_GetInstanceID(rock) != Hlp_GetInstanceID(hero)))
		{
			return FALSE;
		};
		if(Npc_CheckInfo(slf,1))
		{
			PrintDebugNpc(PD_ZS_Check,"...wichtige Info zu vergeben!");
			PrintDebugNpc(PD_ZS_Check,"...SC springt nicht oder NSC ist Durchgangswache!");
			if(!C_BodyStateContains(oth,BS_FALL))
			{
				PrintDebugNpc(PD_ZS_Check,"...fдllt nicht!");
				if(!C_BodyStateContains(oth,BS_SWIM))
				{
					PrintDebugNpc(PD_ZS_Check,"...schwimmt nicht!");
					if(!C_BodyStateContains(oth,BS_DIVE))
					{
						PrintDebugNpc(PD_ZS_Check,"...taucht nicht!");
						oth.aivar[AIV_IMPORTANT] = TRUE;
						B_FullStop(oth);
						if(C_BodyStateContains(slf,BS_SIT) || !Npc_CanSeeNpc(slf,oth))
						{
							Npc_ClearAIQueue(slf);
							AI_Standup(slf);
						}
						else
						{
							B_FullStop(slf);
						};
						AI_StartState(slf,ZS_Talk,0,"");
						Npc_PercDisable(slf,PERC_ASSESSFIGHTER);
						return TRUE;
					};
				};
			};
		};
	};
	return FALSE;
};

func void B_InitGuildAttitudes()
{
	PrintDebugNpc(PD_ZS_FRAME,"B_InitGuildAttitudes");
	if(OC_BANNED == FALSE)
	{
		Wld_ExchangeGuildAttitudes("GIL_ATTITUDES");
	}
	else
	{
		Wld_ExchangeGuildAttitudes("GIL_ATTITUDES_FMTAKEN");
	};
	if(NC_BANNED == TRUE)
	{
		B_SetPermAttitude(Kdw_600_Saturas,ATT_HOSTILE);
		B_SetPermAttitude(Kdw_601_Myxir,ATT_HOSTILE);
		B_SetPermAttitude(Kdw_602_Merdarion,ATT_HOSTILE);
		B_SetPermAttitude(Kdw_603_Nefarius,ATT_HOSTILE);
		B_SetPermAttitude(KDW_604_Cronos,ATT_HOSTILE);
		B_SetPermAttitude(KDW_605_Riordian,ATT_HOSTILE);
		B_SetPermAttitude(SLD_726_Soeldner,ATT_HOSTILE);
		B_SetPermAttitude(SLD_723_Soeldner,ATT_HOSTILE);
		B_SetPermAttitude(SLD_732_Soeldner,ATT_HOSTILE);
		B_ClearImmortal(Kdw_600_Saturas);
		B_ClearImmortal(Kdw_601_Myxir);
		B_ClearImmortal(Kdw_602_Merdarion);
		B_ClearImmortal(Kdw_603_Nefarius);
		B_ClearImmortal(KDW_604_Cronos);
		B_ClearImmortal(KDW_605_Riordian);
		B_SetNpcType(Kdw_600_Saturas,npctype_main);
		B_SetNpcType(Kdw_601_Myxir,npctype_main);
		B_SetNpcType(Kdw_602_Merdarion,npctype_main);
		B_SetNpcType(Kdw_603_Nefarius,npctype_main);
		B_SetNpcType(KDW_604_Cronos,npctype_main);
		B_SetNpcType(KDW_605_Riordian,npctype_main);
	};
};

func void B_PracticeCombat(var string waypoint)
{
	PrintDebugNpc(PD_ZS_FRAME,"B_PracticeCombat");
};

func void B_PrintGuildCondition(var int level)
{
	var string msg;
	PrintDebugNpc(PD_ZS_FRAME,"B_PrintGuildCondition");
	msg = ConcatStrings(_STR_MESSAGE_Joincamp,IntToString(level));
	PrintScreen(msg,-1,_YPOS_MESSAGE_Joincamp,"font_old_10_white.tga",_TIME_MESSAGE_Joincamp);
};

func void B_Print(var string msg)
{
	PrintDebugNpc(PD_ZS_FRAME,"B_Print");
	PrintScreen(msg,-1,_YPOS_MESSAGE_Joincamp,"font_old_10_white.tga",_TIME_MESSAGE_Joincamp);
};


var int Knows_GetTeeth;
var int Knows_GetFur;
var int Knows_GetClaws;
var int Knows_GetHide;
var int Knows_GetBFSting;
var int Knows_GetMCPlates;
var int Knows_GetMCMandibles;
var int Knows_GetUluMulu;

func void b_learn_trophies_teeth()
{
	PrintScreen("Навык: добыча клыков",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	Knows_GetTeeth = TRUE;
	Log_CreateTopic(GE_AnimalTrophies,LOG_NOTE);
	B_LogEntry(GE_AnimalTrophies,"Навык добычи клыков: волк, орочья собака, глорх, жерх, ищейка, мракорис.");
//	Npc_SetTalentSkill(hero,NPC_TALENT_FIREMASTER,1);
	Npc_SetTalentSkill(hero,NPC_TALENT_FIREMASTER,Npc_GetTalentSkill(hero,NPC_TALENT_FIREMASTER)+2);
};

func void b_learn_trophies_fur()
{
	PrintScreen("Навык: добыча шкур",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	Knows_GetFur = TRUE;
	Log_CreateTopic(GE_AnimalTrophies,LOG_NOTE);
	B_LogEntry(GE_AnimalTrophies,"Навык добычи шкур: волк, орочья собака, мракорис, тролль.");
//	Npc_SetTalentSkill(hero,NPC_TALENT_FIREMASTER,1);
	Npc_SetTalentSkill(hero,NPC_TALENT_FIREMASTER,Npc_GetTalentSkill(hero,NPC_TALENT_FIREMASTER)+2);
};

func void b_learn_trophies_claws()
{
	PrintScreen("Навык: добыча когтей",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	Knows_GetClaws = TRUE;
	Log_CreateTopic(GE_AnimalTrophies,LOG_NOTE);
	B_LogEntry(GE_AnimalTrophies,"Навык добычи когтей: ящерица, глорх, шныг, жерх, штек.");
//	Npc_SetTalentSkill(hero,NPC_TALENT_FIREMASTER,1);
	Npc_SetTalentSkill(hero,NPC_TALENT_FIREMASTER,Npc_GetTalentSkill(hero,NPC_TALENT_FIREMASTER)+2);
};

func void b_learn_trophies_reptilefur()
{
	PrintScreen("Навык: добыча шкур рептилий",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	Knows_GetHide = TRUE;
	Log_CreateTopic(GE_AnimalTrophies,LOG_NOTE);
	B_LogEntry(GE_AnimalTrophies,"Навык добычи шкур рептилий: шныг, болотожор.");
//	Npc_SetTalentSkill(hero,NPC_TALENT_FIREMASTER,1);
	Npc_SetTalentSkill(hero,NPC_TALENT_FIREMASTER,Npc_GetTalentSkill(hero,NPC_TALENT_FIREMASTER)+2);
};

func void b_learn_trophies_sting()
{
	PrintScreen("Навык: добыча жала шершня",-1,-1,"FONT_OLD_20_WHITE.TGA",10);
	Knows_GetBFSting = TRUE;
	Log_CreateTopic(GE_AnimalTrophies,LOG_NOTE);
	B_LogEntry(GE_AnimalTrophies,"Навык добычи жала шершня.");
//	Npc_SetTalentSkill(hero,NPC_TALENT_FIREMASTER,1);
	Npc_SetTalentSkill(hero,NPC_TALENT_FIREMASTER,Npc_GetTalentSkill(hero,NPC_TALENT_FIREMASTER)+1);
};

func void b_learn_trophies_plates()
{
	PrintScreen("Навык: добыча панцирных пластин",-1,-1,"FONT_OLD_20_WHITE.TGA",3);
	Knows_GetMCPlates = TRUE;
	Log_CreateTopic(GE_AnimalTrophies,LOG_NOTE);
	B_LogEntry(GE_AnimalTrophies,"Навык добычи панцирных пластин ползунов-воинов.");
//	Npc_SetTalentSkill(hero,NPC_TALENT_FIREMASTER,1);
	Npc_SetTalentSkill(hero,NPC_TALENT_FIREMASTER,Npc_GetTalentSkill(hero,NPC_TALENT_FIREMASTER)+2);
};

func void b_learn_trophies_mandibles()
{
	PrintScreen("Навык: добыча челюстей ползунов",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	Knows_GetMCMandibles = TRUE;
	Log_CreateTopic(GE_AnimalTrophies,LOG_NOTE);
	B_LogEntry(GE_AnimalTrophies,"Навык добычи челюстей ползунов.");
//	Npc_SetTalentSkill(hero,NPC_TALENT_FIREMASTER,1);
	Npc_SetTalentSkill(hero,NPC_TALENT_FIREMASTER,Npc_GetTalentSkill(hero,NPC_TALENT_FIREMASTER)+1);
};

func void b_learn_trophies_ulumulu()
{
	PrintScreen("Навык: добыча особых трофеев",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	Knows_GetUluMulu = TRUE;
	Log_CreateTopic(GE_AnimalTrophies,LOG_NOTE);
	B_LogEntry(GE_AnimalTrophies,"Навык добычи особых трофеев: язык огненной ящерицы, рог мракориса, клык болотожора и клык тролля.");
//	Npc_SetTalentSkill(hero,NPC_TALENT_FIREMASTER,1);
	Npc_SetTalentSkill(hero,NPC_TALENT_FIREMASTER,Npc_GetTalentSkill(hero,NPC_TALENT_FIREMASTER)+4);
};

func int B_isTempPassExpired(var C_NPC slf, var C_NPC oth)
{
	if(slf.id == 212 && Npc_IsPlayer(oth))
	{
		if(tempPassExpires_grd212 < getTimestamp())
		{
			return true;
		};
	};
	return false;
};

func int B_isGoingExit(var C_NPC slf, var C_NPC oth, var string guardedArea)
{
	if(
		Npc_GetDistToWP(slf,guardedArea) > Npc_GetDistToWP(oth,guardedArea)
	)
	{
		return true;
	};
	return false;
};
