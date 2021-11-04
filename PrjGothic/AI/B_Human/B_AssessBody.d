
func void B_AssessBody()
{
	PrintDebugNpc(PD_ZS_FRAME,"B_AssessBody");
	PrintGlobals(PD_ZS_Check);
	if(Npc_GetDistToNpc(self,other) < 1000)
	{
		if(
			
			self.guild > GIL_SEPERATOR_HUM &&
			self.guild < GIL_SEPERATOR_ORC
		)
		{
			PrintDebugNpc(PD_ZS_Check,"...Kцrper nдher als 10m!");
			B_FullStop(self);
			AI_StartState(self,ZS_AssessBody,0,"");
		};
	};
};

func void b_sayplunder()
{
	if(B_Plunder())
	{
		B_Say(self,other,"$ITookYourOre");
	}
	else
	{
		B_Say(self,other,"$ShitNoOre");
	};
	other.aivar[AIV_PLUNDERED] = TRUE;
};

func void b_checkitems_orik()
{
	if(Npc_HasItems(other,orik_key) || Npc_HasItems(other,Oriks_Axt))
	{
		B_Say(self,other,"$YouStoleFromMe");
		if(Npc_HasItems(other,orik_key))
		{
			PrintScreen("Орик забрал свой ключ.",-1,40,"FONT_OLD_10_WHITE.TGA",3);
			Npc_RemoveInvItem(other,orik_key);
			CreateInvItem(self,orik_key);
		};
		if(Npc_HasItems(other,Oriks_Axt))
		{
			PrintScreen("Орик забрал свой топор.",-1,43,"FONT_OLD_10_WHITE.TGA",3);
			Npc_RemoveInvItem(other,Oriks_Axt);
			CreateInvItem(self,Oriks_Axt);
			AI_EquipBestMeleeWeapon(self);
		};
		B_Plunder();
	}
	else
	{
		b_sayplunder();
	};
};

func void b_checkitems_lord()
{
	if(Npc_HasItems(other,ItKey_RB_01) || Npc_HasItems(other,Heerscherstab))
	{
		B_Say(self,other,"$YouStoleFromMe");
		if(Npc_HasItems(other,ItKey_RB_01))
		{
			PrintScreen("Лорд забрал свой ключ.",-1,40,"FONT_OLD_10_WHITE.TGA",3);
			Npc_RemoveInvItem(other,ItKey_RB_01);
		};
		if(Npc_HasItems(other,Heerscherstab))
		{
			PrintScreen("Лорд забрал свой посох.",-1,43,"FONT_OLD_10_WHITE.TGA",3);
			Npc_RemoveInvItem(other,Heerscherstab);
			CreateInvItem(self,Heerscherstab);
			AI_EquipBestMeleeWeapon(self);
		};
		B_Plunder();
	}
	else
	{
		b_sayplunder();
	};
};

func void b_checkitems_cavalorn()
{
	if(Npc_HasItems(other,ItKeCavalorn01))
	{
		B_Say(self,other,"$YouStoleFromMe");
		PrintScreen("Кавалорн забрал свой ключ.",-1,40,"FONT_OLD_10_WHITE.TGA",3);
		Npc_RemoveInvItem(other,ItKeCavalorn01);
		B_Plunder();
	}
	else
	{
		b_sayplunder();
	};
};

func void b_checkitems_whistler()
{
	if(Npc_HasItems(other,Whistlers_Schwert))
	{
		B_Say(self,other,"$YouStoleFromMe");
		PrintScreen("Уистлер забрал свой меч.",-1,40,"FONT_OLD_10_WHITE.TGA",3);
		Npc_RemoveInvItem(other,Whistlers_Schwert);
		CreateInvItem(self,Whistlers_Schwert);
		AI_EquipBestMeleeWeapon(self);
		if((Whistler_BuyMySword == LOG_RUNNING) && (Kapitel == 1))
		{
			Whistler_BuyMySword = LOG_FAILED;
			B_LogEntry(CH1_JoinOC,"Я все испортил. Уистлер рассержен на меня.");
		};
		B_Plunder();
	}
	else
	{
		b_sayplunder();
	};
};

func void b_checkitems_aaron()
{
	if(Npc_HasItems(other,ItKe_OM_02))
	{
		B_Say(self,other,"$YouStoleFromMe");
		PrintScreen("Аарон забрал свой ключ.",-1,40,"FONT_OLD_10_WHITE.TGA",3);
		Npc_RemoveInvItem(other,ItKe_OM_02);
		CreateInvItem(self,ItKe_OM_02);
		AARON_KEY_TAKEN = TRUE;
		B_LogEntry(CH2_SnipesDeal,"Аарон забрал у меня свой ключ...");
		Log_SetTopicStatus(CH2_SnipesDeal,LOG_FAILED);
		B_Plunder();
	}
	else
	{
		b_sayplunder();
	};
};

func void b_checkitems_ulbert()
{
	if(Npc_HasItems(other,ItKe_OM_03))
	{
		B_Say(self,other,"$YouStoleFromMe");
		PrintScreen("Ульберт забрал ключ от склада.",-1,40,"FONT_OLD_10_WHITE.TGA",3);
		Npc_RemoveInvItem(other,ItKe_OM_03);
		CreateInvItem(self,ItKe_OM_03);
		B_Plunder();
	}
	else
	{
		b_sayplunder();
	};
};

func void b_checkitems_bartholo()
{
	if(Npc_HasItems(other,ItKe_Storage_01))
	{
		B_Say(self,other,"$YouStoleFromMe");
		PrintScreen("Бартоло забрал ключ от склада.",-1,40,"FONT_OLD_10_WHITE.TGA",3);
		Npc_RemoveInvItem(other,ItKe_Storage_01);
		if(!Npc_HasItems(self,ItKe_Storage_01))
		{
			CreateInvItem(self,ItKe_Storage_01);
		};
		B_Plunder();
	}
	else
	{
		b_sayplunder();
	};
};

func void b_checkitems_grd279()
{
	if(Npc_HasItems(other,itke_weaponry))
	{
		B_Say(self,other,"$YouStoleFromMe");
		PrintScreen("Стражник забрал ключ от оружейной.",-1,40,"FONT_OLD_10_WHITE.TGA",3);
		Npc_RemoveInvItem(other,itke_weaponry);
		CreateInvItem(self,itke_weaponry);
		B_Plunder();
	}
	else
	{
		b_sayplunder();
	};
};

func void b_checkitems_scar()
{
	if(Npc_HasItems(other,Scars_Schwert))
	{
		B_Say(self,other,"$YouStoleFromMe");
		PrintScreen("Шрам забрал свой меч.",-1,40,"FONT_OLD_10_WHITE.TGA",3);
		Npc_RemoveInvItem(other,Scars_Schwert);
		CreateInvItem(self,Scars_Schwert);
		AI_EquipBestMeleeWeapon(self);
		B_Plunder();
	}
	else
	{
		b_sayplunder();
	};
};

func void b_checkitems_arto()
{
	if(Npc_HasItems(other,Artos_Schwert))
	{
		B_Say(self,other,"$YouStoleFromMe");
		PrintScreen("Арто забрал свой меч.",-1,40,"FONT_OLD_10_WHITE.TGA",3);
		Npc_RemoveInvItem(other,Artos_Schwert);
		CreateInvItem(self,Artos_Schwert);
		AI_EquipBestMeleeWeapon(self);
		B_Plunder();
	}
	else
	{
		b_sayplunder();
	};
};

func void b_checkitems_stone()
{
	if(Npc_HasItems(other,itkey_ob_smith_01))
	{
		B_Say(self,other,"$YouStoleFromMe");
		PrintScreen("Стоун забрал железный ключ.",-1,40,"FONT_OLD_10_WHITE.TGA",3);
		Npc_RemoveInvItem(other,itkey_ob_smith_01);
		CreateInvItem(self,itkey_ob_smith_01);
		B_Plunder();
	}
	else
	{
		b_sayplunder();
	};
};

func void b_checkitems_kalom()
{
	if(Npc_HasItems(other,KalomsRecipe))
	{
		B_Say(self,other,"$YouStoleFromMe");
		PrintScreen("Кор Галом забрал свой рецепт.",-1,40,"FONT_OLD_10_WHITE.TGA",3);
		Npc_RemoveInvItem(other,KalomsRecipe);
		CreateInvItem(self,KalomsRecipe);
		B_Plunder();
	}
	else
	{
		b_sayplunder();
	};
};

func void b_checkitems_torlof()
{
	if(Npc_HasItems(other,Torlofs_Axt))
	{
		B_Say(self,other,"$YouStoleFromMe");
		PrintScreen("Торлоф забрал свой топор.",-1,40,"FONT_OLD_10_WHITE.TGA",3);
		Npc_RemoveInvItem(other,Torlofs_Axt);
		CreateInvItem(self,Torlofs_Axt);
		AI_EquipBestMeleeWeapon(self);
		B_Plunder();
	}
	else
	{
		b_sayplunder();
	};
};

func void b_checkitems_cord()
{
	if(Npc_HasItems(other,Cords_Spalter))
	{
		B_Say(self,other,"$YouStoleFromMe");
		PrintScreen("Корд забрал свой меч.",-1,40,"FONT_OLD_10_WHITE.TGA",3);
		Npc_RemoveInvItem(other,Cords_Spalter);
		CreateInvItem(self,Cords_Spalter);
		AI_EquipBestMeleeWeapon(self);
		B_Plunder();
	}
	else
	{
		b_sayplunder();
	};
};

func void ZS_AssessBody()
{
	PrintDebugNpc(PD_ZS_FRAME,"ZS_AssessBody");
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,ZS_ReactToDamage);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,B_AssessMagic);
	Npc_PercEnable(self,PERC_ASSESSENEMY,B_AssessEnemy);
	Npc_PercEnable(self,PERC_ASSESSFIGHTER,B_AssessFighter);
	Npc_PercEnable(self,PERC_ASSESSMURDER,ZS_AssessMurder);
	Npc_PercEnable(self,PERC_ASSESSDEFEAT,ZS_AssessDefeat);
	Npc_PercEnable(self,PERC_ASSESSFIGHTSOUND,B_AssessFightSound);
	Npc_PercEnable(self,PERC_CATCHTHIEF,ZS_CatchThief);
	Npc_PercEnable(self,PERC_ASSESSTHEFT,B_AssessTheft);
	Npc_PercEnable(self,PERC_ASSESSTALK,B_RefuseTalk);
	if(other.aivar[AIV_PLUNDERED] == TRUE)
	{
		PrintDebugNpc(PD_ZS_Check,"...Kцrper bereits geplьndert!");
		AI_ContinueRoutine(self);
	};
	if(Npc_GetDistToNpc(self,other) > PERC_DIST_INTERMEDIAT)
	{
		PrintDebugNpc(PD_ZS_Check,"...Kцrper zu weit weg!");
		AI_ContinueRoutine(self);
	};
};

func int ZS_AssessBody_Loop()
{
	PrintDebugNpc(PD_ZS_LOOP,"ZS_AssessBody_Loop");
	B_FullStop(self);
	AI_GotoNpc(self,other);
	return LOOP_END;
};

func void ZS_AssessBody_End()
{
	PrintDebugNpc(PD_ZS_FRAME,"ZS_AssessBody_End");
	if(other.aivar[AIV_PLUNDERED] == TRUE)
	{
		AI_ContinueRoutine(self);
	};
	AI_PlayAni(self,"T_PLUNDER");
	if(((Hlp_GetInstanceID(VLK_505_Buddler) == Hlp_GetInstanceID(self)) || (Hlp_GetInstanceID(VLK_506_Buddler) == Hlp_GetInstanceID(self))) && (LETTER_TOLD == 2))
	{
		if(Npc_HasItems(hero,ItWr_Fire_Letter_01))
		{
			PrintScreen("Отобрано запечатанное письмо.",-1,40,"FONT_OLD_10_WHITE.TGA",3);
			Npc_RemoveInvItem(hero,ItWr_Fire_Letter_01);
			if(B_Plunder())
			{
				B_Say(self,other,"$GotLetterGotOre");
			}
			else
			{
				B_Say(self,other,"$GotLetterNoOre");
			};
			AI_SetWalkMode(self,NPC_RUN);
			self.guild = GIL_VLK;
			Npc_SetTrueGuild(self,GIL_VLK);
			AI_GotoWP(self,"OCC_CENTER_2");
			LETTER_TOLD = 3;
			CreateInvItems(self,ItMiNugget,120);
			if(PYROCAR_MESSENGER == LOG_RUNNING)
			{
				B_LogEntry(KDFLETTER,"У меня украли письмо! Не стоило болтать о нем кому попало...");
				Log_SetTopicStatus(KDFLETTER,LOG_FAILED);
				PYROCAR_MESSENGER = LOG_FAILED;
			};
			CreateInvItem(Kdf_402_Corristo,ItWr_Fire_Letter_02);
		}
		else if(Npc_HasItems(hero,ItWr_Fire_Letter_02))
		{
			PrintScreen("Отобрано письмо.",-1,40,"FONT_OLD_10_WHITE.TGA",3);
			Npc_RemoveInvItem(hero,ItWr_Fire_Letter_02);
			if(B_Plunder())
			{
				B_Say(self,other,"$GotLetterGotOre");
			}
			else
			{
				B_Say(self,other,"$GotLetterNoOre");
			};
			AI_SetWalkMode(self,NPC_RUN);
			self.guild = GIL_VLK;
			Npc_SetTrueGuild(self,GIL_VLK);
			AI_GotoWP(self,"OCC_CENTER_2");
			LETTER_TOLD = 3;
			CreateInvItems(self,ItMiNugget,30);
			if(PYROCAR_MESSENGER == LOG_RUNNING)
			{
				B_LogEntry(KDFLETTER,"У меня украли письмо! Не стоило болтать о нем кому попало...");
				Log_SetTopicStatus(KDFLETTER,LOG_FAILED);
				PYROCAR_MESSENGER = LOG_FAILED;
			};
			CreateInvItem(Kdf_402_Corristo,ItWr_Fire_Letter_02);
		}
		else if(B_Plunder())
		{
			B_Say(self,other,"$NoLetterGotOre");
		}
		else
		{
			B_Say(self,other,"$NoLetterNoOre");
		};
		other.aivar[AIV_PLUNDERED] = TRUE;
	}
	else if((Hlp_GetInstanceID(ORG_888_Erpresser) == Hlp_GetInstanceID(self)) || (Hlp_GetInstanceID(ORG_889_CoErpresser) == Hlp_GetInstanceID(self)))
	{
		if(Npc_HasItems(hero,ItMi_Amulet_Psi_01))
		{
			CreateInvItem(self,ItMi_Amulet_Psi_01);
			Npc_RemoveInvItem(other,ItMi_Amulet_Psi_01);
			PrintScreen("Отобран амулет Братства.",-1,40,"FONT_OLD_10_WHITE.TGA",3);
			if(Npc_KnowsInfo(other,quentin_dia2) && !Npc_KnowsInfo(other,quentin_dia3) && (QUENTIN_GANG_QUEST_STARTED == LOG_RUNNING) && !Npc_IsDead(other))
			{
				B_LogEntry(QUENTIN_GANG,"Отморозки около Нового лагеря отобрали у меня амулет Братства! Мне нужно вернуть его, если я хочу завершить задание Квентина.");
			};
		};
		GOPSTOPPED_BRIDGE = FALSE;
		b_sayplunder();
	}
	else if(Hlp_GetInstanceID(SLD_701_Orik) == Hlp_GetInstanceID(self))
	{
		b_checkitems_orik();
	}
	else if(Hlp_GetInstanceID(Bau_900_Ricelord) == Hlp_GetInstanceID(self))
	{
		b_checkitems_lord();
	}
	else if(Hlp_GetInstanceID(STT_336_Cavalorn) == Hlp_GetInstanceID(self))
	{
		b_checkitems_cavalorn();
	}
	else if(Hlp_GetInstanceID(Stt_309_Whistler) == Hlp_GetInstanceID(self))
	{
		b_checkitems_whistler();
	}
	else if(Hlp_GetInstanceID(GRD_262_Aaron) == Hlp_GetInstanceID(self))
	{
		b_checkitems_aaron();
	}
	else if(Hlp_GetInstanceID(GRD_271_Ulbert) == Hlp_GetInstanceID(self))
	{
		b_checkitems_ulbert();
	}
	else if(Hlp_GetInstanceID(ebr_598_bartholo) == Hlp_GetInstanceID(self))
	{
		b_checkitems_bartholo();
	}
	else if(Hlp_GetInstanceID(EBR_106_Bartholo) == Hlp_GetInstanceID(self))
	{
		b_checkitems_bartholo();
	}
	else if(Hlp_GetInstanceID(GRD_279_Gardist) == Hlp_GetInstanceID(self))
	{
		b_checkitems_grd279();
	}
	else if(Hlp_GetInstanceID(EBR_101_Scar) == Hlp_GetInstanceID(self))
	{
		b_checkitems_scar();
	}
	else if(Hlp_GetInstanceID(EBR_102_Arto) == Hlp_GetInstanceID(self))
	{
		b_checkitems_arto();
	}
	else if(Hlp_GetInstanceID(GRD_219_Stone) == Hlp_GetInstanceID(self))
	{
		b_checkitems_stone();
	}
	else if(Hlp_GetInstanceID(GUR_1201_CorKalom) == Hlp_GetInstanceID(self))
	{
		b_checkitems_kalom();
	}
	else if(Hlp_GetInstanceID(SLD_737_Torlof) == Hlp_GetInstanceID(self))
	{
		b_checkitems_torlof();
	}
	else if(Hlp_GetInstanceID(Sld_709_Cord) == Hlp_GetInstanceID(self))
	{
		b_checkitems_cord();
	}
	else if((self.fight_tactic != FAI_HUMAN_RANGED) && (self.npcType != npctype_friend) && C_NpcIsHuman(self))
	{
		PrintDebugNpc(PD_ZS_Check,"...kein purer Fernkдmpfer und kein NSC-Freund!");
		b_sayplunder();
	};
	AI_StartState(self,ZS_AssessBody_RecoverWeapon,1,"");
};

func void ZS_AssessBody_RecoverWeapon()
{
	PrintDebugNpc(PD_ZS_FRAME,"ZS_AssessBody_RecoverWeapon");
	B_SetPerception(self);
	Npc_PerceiveAll(self);
	if(Wld_DetectItem(self,ITEM_KAT_NF) || Wld_DetectItem(self,ITEM_KAT_FF))
	{
		if(Hlp_IsValidItem(item))
		{
			if(Npc_GetDistToItem(self,item) < 300)
			{
				PrintDebugNpc(PD_ZS_Check,"...Nah- oder Fernkampfwaffe gefunden!");
				if((self.id == 1422) || (self.id == 251) || (self.id == 729))
				{
					if(Npc_OwnedByNpc(item,self))
					{
						AI_TakeItem(self,item);
						AI_EquipBestMeleeWeapon(self);
					};
				}
				else
				{
					AI_TakeItem(self,item);
					AI_EquipBestMeleeWeapon(self);
					AI_EquipBestRangedWeapon(self);
					B_Say(self,other,"$ITakeYourWeapon");
				};
			};
		};
	};
	AI_StartState(self,ZS_HealSelf,1,"");
};

