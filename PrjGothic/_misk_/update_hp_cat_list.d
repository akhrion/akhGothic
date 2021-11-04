
func void update_hp_cat_list()
{
	Info_ClearChoices(pc_alchemy_cat_hp);
	Info_AddChoice(pc_alchemy_cat_hp,DIALOG_BACK,pc_alchemy_cat_hp_back);
	if(HP3RECIPE == TRUE)
	{
		if(Npc_HasItems(hero,ItFo_Plants_Herb_03) >= 1)
		{
			Info_AddChoice(pc_alchemy_cat_hp,"Зелье исцеления.",pc_potionalchemy_hp3_info);
		}
		else
		{
			Info_AddChoice(pc_alchemy_cat_hp,"Зелье исцеления (недостаточно ингредиентов).",pc_potionalchemy_nocomp_hp);
		};
	};
	if(HP2RECIPE == TRUE)
	{
		if(Npc_HasItems(hero,ItFo_Plants_Herb_02) >= 1)
		{
			Info_AddChoice(pc_alchemy_cat_hp,"Экстракт исцеления.",pc_potionalchemy_hp2_info);
		}
		else
		{
			Info_AddChoice(pc_alchemy_cat_hp,"Экстракт исцеления (недостаточно ингредиентов).",pc_potionalchemy_nocomp_hp);
		};
	};
	if(HP1RECIPE == TRUE)
	{
		if(Npc_HasItems(hero,ItFo_Plants_Herb_01) >= 1)
		{
			Info_AddChoice(pc_alchemy_cat_hp,"Эссенция исцеления.",pc_potionalchemy_hp1_info);
		}
		else
		{
			Info_AddChoice(pc_alchemy_cat_hp,"Эссенция исцеления (недостаточно ингредиентов).",pc_potionalchemy_nocomp_hp);
		};
	};
	if(HP0RECIPE == TRUE)
	{
		if(Npc_HasItems(hero,ItFo_Plants_Nightshadow_01) >= 1)
		{
			Info_AddChoice(pc_alchemy_cat_hp,"Зелье быстрого лечения.",pc_potionalchemy_hp0_info);
		}
		else
		{
			Info_AddChoice(pc_alchemy_cat_hp,"Зелье быстрого лечения (недостаточно ингредиентов).",pc_potionalchemy_nocomp_hp);
		};
	};
};

func void update_mp_cat_list()
{
	Info_ClearChoices(pc_alchemy_cat_mp);
	Info_AddChoice(pc_alchemy_cat_mp,DIALOG_BACK,pc_alchemy_cat_mp_back);
	if(MP3RECIPE == TRUE)
	{
		if(Npc_HasItems(hero,ItFo_Plants_Stoneroot_01) >= 1)
		{
			Info_AddChoice(pc_alchemy_cat_mp,"Зелье магической энергии.",pc_potionalchemy_mp3_info);
		}
		else
		{
			Info_AddChoice(pc_alchemy_cat_mp,"Зелье магической энергии (недостаточно ингредиентов).",pc_potionalchemy_nocomp_mp);
		};
	};
	if(MP2RECIPE == TRUE)
	{
		if(Npc_HasItems(hero,ItFo_Plants_RavenHerb_01) >= 1)
		{
			Info_AddChoice(pc_alchemy_cat_mp,"Экстракт магической энергии.",pc_potionalchemy_mp2_info);
		}
		else
		{
			Info_AddChoice(pc_alchemy_cat_mp,"Экстракт магической энергии (недостаточно ингредиентов).",pc_potionalchemy_nocomp_mp);
		};
	};
	if(MP1RECIPE == TRUE)
	{
		if(Npc_HasItems(hero,ItFo_Plants_Seraphis_01) >= 1)
		{
			Info_AddChoice(pc_alchemy_cat_mp,"Эссенция магической энергии.",pc_potionalchemy_mp1_info);
		}
		else
		{
			Info_AddChoice(pc_alchemy_cat_mp,"Эссенция магической энергии (недостаточно ингредиентов).",pc_potionalchemy_nocomp_mp);
		};
	};
};

func void update_perm_cat_list()
{
	Info_ClearChoices(pc_alchemy_cat_perm);
	Info_AddChoice(pc_alchemy_cat_perm,DIALOG_BACK,pc_alchemy_cat_perm_back);
	if(MASTERRECIPE == TRUE)
	{
		if((Npc_HasItems(hero,ItFo_Potion_Dex_01) >= 1) && (Npc_HasItems(hero,ItFo_Potion_Strength_01) >= 1))
		{
			Info_AddChoice(pc_alchemy_cat_perm,"Зелье мощи.",pc_potionalchemy_master_info);
		}
		else
		{
			Info_AddChoice(pc_alchemy_cat_perm,"Зелье мощи (недостаточно ингредиентов).",pc_potionalchemy_nocomp_perm);
		};
	};
	if(STRRECIPE == TRUE)
	{
		if((Npc_HasItems(hero,ItFo_Plants_mountainmoos_02) >= 1) && (Npc_HasItems(hero,ItFo_Plants_Stoneroot_02) >= 1) && (Npc_HasItems(hero,ItFo_Plants_Flameberry_01) >= 1))
		{
			Info_AddChoice(pc_alchemy_cat_perm,"Эссенция силы.",pc_potionalchemy_str_info);
		}
		else
		{
			Info_AddChoice(pc_alchemy_cat_perm,"Эссенция силы (недостаточно ингредиентов).",pc_potionalchemy_nocomp_perm);
		};
	};
	if(DEXRECIPE == TRUE)
	{
		if((Npc_HasItems(hero,ItFo_Plants_mountainmoos_02) >= 1) && (Npc_HasItems(hero,ItFo_Plants_Trollberrys_01) >= 1) && (Npc_HasItems(hero,ItFo_Plants_RavenHerb_02) >= 1))
		{
			Info_AddChoice(pc_alchemy_cat_perm,"Эссенция ловкости.",pc_potionalchemy_dex_info);
		}
		else
		{
			Info_AddChoice(pc_alchemy_cat_perm,"Эссенция ловкости (недостаточно ингредиентов).",pc_potionalchemy_nocomp_perm);
		};
	};
	if(MPMAXRECIPE == TRUE)
	{
		if((Npc_HasItems(hero,ItFo_Plants_mountainmoos_01) >= 1) && (Npc_HasItems(hero,ItFo_Plants_Nightshadow_02) >= 1))
		{
			Info_AddChoice(pc_alchemy_cat_perm,"Эссенция силы духа.",pc_potionalchemy_mpmax_info);
		}
		else
		{
			Info_AddChoice(pc_alchemy_cat_perm,"Эссенция силы духа (недостаточно ингредиентов).",pc_potionalchemy_nocomp_perm);
		};
	};
	if(HPMAXRECIPE == TRUE)
	{
		if((Npc_HasItems(hero,ItFo_Plants_mountainmoos_01) >= 1) && (Npc_HasItems(hero,ItFo_Plants_OrcHerb_02) >= 1))
		{
			Info_AddChoice(pc_alchemy_cat_perm,"Эссенция жизни.",pc_potionalchemy_hpmax_info);
		}
		else
		{
			Info_AddChoice(pc_alchemy_cat_perm,"Эссенция жизни (недостаточно ингредиентов).",pc_potionalchemy_nocomp_perm);
		};
	};
};

func void update_special_cat_list()
{
	Info_ClearChoices(pc_alchemy_cat_special);
	Info_AddChoice(pc_alchemy_cat_special,DIALOG_BACK,pc_alchemy_cat_special_back);
	if(FORTUNORECIPE == TRUE)
	{
		if((Npc_HasItems(hero,itfo_plants_deadleaf) >= 1) && ((Npc_HasItems(hero,SpecialWater) >= 1) || ((Npc_HasItems(hero,ItFo_Plants_Bloodwood_01) >= 1) && (Npc_HasItems(hero,ItMi_Alchemy_Alcohol_01) >= 1))))
		{
			Info_AddChoice(pc_alchemy_cat_special,"Лечебное зелье Фортуно.",pc_potionalchemy_yberion_info);
		}
		else
		{
			Info_AddChoice(pc_alchemy_cat_special,"Лечебное зелье Фортуно (недостаточно ингредиентов).",pc_potionalchemy_nocomp_special);
		};
	};
	if(EGGRECIPE == TRUE)
	{
		if((Npc_HasItems(hero,ItAt_Crawlerqueen) >= 3) && (Npc_HasItems(hero,ItMi_Plants_Swampherb_01) >= 6))
		{
			Info_AddChoice(pc_alchemy_cat_special,"Зелье из яиц Королевы ползунов.",pc_potionalchemy_egg_info);
		}
		else
		{
			Info_AddChoice(pc_alchemy_cat_special,"Зелье из яиц Королевы ползунов (недостаточно ингредиентов).",pc_potionalchemy_nocomp_special);
		};
	};
};

func void update_alco_cat_list()
{
	Info_ClearChoices(pc_alchemy_cat_alco);
	Info_AddChoice(pc_alchemy_cat_alco,DIALOG_BACK,pc_alchemy_cat_alco_back);
	if(Npc_HasItems(hero,ItFo_Potion_Water_01))
	{
		if(Npc_HasItems(hero,ItFo_wineberrys_01))
		{
			Info_AddChoice(pc_alchemy_cat_alco,"Вино",pc_potionalchemy_wine_info);
		};
		if(Npc_HasItems(hero,ItFoRice))
		{
			Info_AddChoice(pc_alchemy_cat_alco,"Рисовый шнапс",pc_potionalchemy_booze_info);
		};
	};
};

func void potionalchemy_s1()
{
	if(Npc_IsPlayer(self))
	{
		self.aivar[AIV_INVINCIBLE] = TRUE;
		PLAYER_MOBSI_PRODUCTION = MOBSI_POTIONALCHEMY;
		AI_ProcessInfos(hero);
	};
};


instance PC_ALCHEMY_CANCEL(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = pc_alchemy_cancel_condition;
	information = pc_alchemy_cancel_info;
	important = 0;
	permanent = 1;
	description = STR_INFO_TRADE_EXIT;
};


func int pc_alchemy_cancel_condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONALCHEMY)
	{
		return TRUE;
	};
};

func void pc_alchemy_cancel_info()
{
	AI_StopProcessInfos(self);
	CreateInvItem(self,ItMiFlask);
	self.aivar[AIV_INVINCIBLE] = FALSE;
};


instance PC_ALCHEMY_CAT_HP(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = pc_alchemy_cat_hp_condition;
	information = pc_alchemy_cat_hp_info;
	important = 0;
	permanent = 1;
	description = "Лечебные зелья";
};


func int pc_alchemy_cat_hp_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONALCHEMY) && ((HP0RECIPE == TRUE) || (HP1RECIPE == TRUE) || (HP2RECIPE == TRUE) || (HP3RECIPE == TRUE)))
	{
		return TRUE;
	};
};

func void pc_alchemy_cat_hp_info()
{
	update_hp_cat_list();
};

func void pc_alchemy_cat_hp_back()
{
	Info_ClearChoices(pc_alchemy_cat_hp);
};

func void pc_potionalchemy_nocomp_hp()
{
	PrintScreen("Недостаточно ингредиентов.",-1,45,"font_old_10_white.tga",2);
	update_hp_cat_list();
};


instance PC_ALCHEMY_CAT_MP(C_Info)
{
	npc = PC_Hero;
	nr = 2;
	condition = pc_alchemy_cat_mp_condition;
	information = pc_alchemy_cat_mp_info;
	important = 0;
	permanent = 1;
	description = "Магические зелья";
};


func int pc_alchemy_cat_mp_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONALCHEMY) && ((MP1RECIPE == TRUE) || (MP2RECIPE == TRUE) || (MP3RECIPE == TRUE)))
	{
		return TRUE;
	};
};

func void pc_alchemy_cat_mp_info()
{
	update_mp_cat_list();
};

func void pc_alchemy_cat_mp_back()
{
	Info_ClearChoices(pc_alchemy_cat_mp);
};

func void pc_potionalchemy_nocomp_mp()
{
	PrintScreen("Недостаточно ингредиентов.",-1,45,"font_old_10_white.tga",2);
	update_mp_cat_list();
};


instance PC_ALCHEMY_CAT_PERM(C_Info)
{
	npc = PC_Hero;
	nr = 3;
	condition = pc_alchemy_cat_perm_condition;
	information = pc_alchemy_cat_perm_info;
	important = 0;
	permanent = 1;
	description = "Перманентные зелья";
};


func int pc_alchemy_cat_perm_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONALCHEMY) && ((HPMAXRECIPE == TRUE) || (MPMAXRECIPE == TRUE) || (DEXRECIPE == TRUE) || (STRRECIPE == TRUE) || (MASTERRECIPE == TRUE)))
	{
		return TRUE;
	};
};

func void pc_alchemy_cat_perm_info()
{
	update_perm_cat_list();
};

func void pc_alchemy_cat_perm_back()
{
	Info_ClearChoices(pc_alchemy_cat_perm);
};

func void pc_potionalchemy_nocomp_perm()
{
	PrintScreen("Недостаточно ингредиентов.",-1,45,"font_old_10_white.tga",2);
	update_perm_cat_list();
};


instance PC_ALCHEMY_CAT_SPECIAL(C_Info)
{
	npc = PC_Hero;
	nr = 4;
	condition = pc_alchemy_cat_special_condition;
	information = pc_alchemy_cat_special_info;
	important = 0;
	permanent = 1;
	description = "Особые зелья";
};


func int pc_alchemy_cat_special_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONALCHEMY) && ((FORTUNORECIPE == TRUE) || (EGGRECIPE == TRUE)))
	{
		return TRUE;
	};
};

func void pc_alchemy_cat_special_info()
{
	update_special_cat_list();
};

func void pc_alchemy_cat_special_back()
{
	Info_ClearChoices(pc_alchemy_cat_special);
};

func void pc_potionalchemy_nocomp_special()
{
	PrintScreen("Недостаточно ингредиентов.",-1,45,"font_old_10_white.tga",2);
	update_special_cat_list();
};


instance PC_ALCHEMY_CAT_ALCO(C_Info)
{
	npc = PC_Hero;
	nr = 5;
	condition = pc_alchemy_cat_alco_condition;
	information = pc_alchemy_cat_alco_info;
	important = 0;
	permanent = 1;
	description = "Перегнать алкоголь";
};


func int pc_alchemy_cat_alco_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONALCHEMY) && (Npc_HasItems(hero,ItFo_Potion_Water_01) && (Npc_HasItems(hero,ItFo_wineberrys_01) || Npc_HasItems(hero,ItFoRice))))
	{
		return TRUE;
	};
};

func void pc_alchemy_cat_alco_info()
{
	update_alco_cat_list();
};

func void pc_alchemy_cat_alco_back()
{
	Info_ClearChoices(pc_alchemy_cat_alco);
};

func void pc_potionalchemy_hp0_info()
{
	if(Npc_HasItems(hero,ItMiFlask))
	{
		Npc_RemoveInvItems(self,ItMiFlask,1);
	}
	else
	{
		PrintScreen("Закончились чистые флаконы.",-1,45,"font_old_10_white.tga",5);
		AI_StopProcessInfos(self);
	};
	Npc_RemoveInvItems(self,ItFo_Plants_Nightshadow_01,1);
	CreateInvItem(self,Heiltrank);
	AI_Wait(self,2);
	PrintScreen("Получено зелье быстрого лечения.",-1,-1,"font_old_10_white.tga",2);
	Snd_Play("PSILAB_GETRESULT");
	update_hp_cat_list();
};

func void pc_potionalchemy_hp1_info()
{
	if(Npc_HasItems(hero,ItMiFlask))
	{
		Npc_RemoveInvItems(self,ItMiFlask,1);
	}
	else
	{
		PrintScreen("Закончились чистые флаконы.",-1,45,"font_old_10_white.tga",5);
		AI_StopProcessInfos(self);
	};
	Npc_RemoveInvItems(self,ItFo_Plants_Herb_01,1);
	CreateInvItem(self,ItFo_Potion_Health_01);
	AI_Wait(self,2);
	PrintScreen("Получена эссенция исцеления.",-1,-1,"font_old_10_white.tga",2);
	Snd_Play("PSILAB_GETRESULT");
	update_hp_cat_list();
};

func void pc_potionalchemy_hp2_info()
{
	if(Npc_HasItems(hero,ItMiFlask))
	{
		Npc_RemoveInvItems(self,ItMiFlask,1);
	}
	else
	{
		PrintScreen("Закончились чистые флаконы.",-1,45,"font_old_10_white.tga",5);
		AI_StopProcessInfos(self);
	};
	Npc_RemoveInvItems(self,ItFo_Plants_Herb_02,1);
	CreateInvItem(self,ItFo_Potion_Health_02);
	AI_Wait(self,2);
	PrintScreen("Получен экстракт исцеления.",-1,-1,"font_old_10_white.tga",2);
	Snd_Play("PSILAB_GETRESULT");
	update_hp_cat_list();
};

func void pc_potionalchemy_hp3_info()
{
	if(Npc_HasItems(hero,ItMiFlask))
	{
		Npc_RemoveInvItems(self,ItMiFlask,1);
	}
	else
	{
		PrintScreen("Закончились чистые флаконы.",-1,45,"font_old_10_white.tga",5);
		AI_StopProcessInfos(self);
	};
	Npc_RemoveInvItems(self,ItFo_Plants_Herb_03,1);
	CreateInvItem(self,ItFo_Potion_Health_03);
	AI_Wait(self,2);
	PrintScreen("Получено зелье исцеления.",-1,-1,"font_old_10_white.tga",2);
	Snd_Play("PSILAB_GETRESULT");
	update_hp_cat_list();
};

func void pc_potionalchemy_mp1_info()
{
	if(Npc_HasItems(hero,ItMiFlask))
	{
		Npc_RemoveInvItems(self,ItMiFlask,1);
	}
	else
	{
		PrintScreen("Закончились чистые флаконы.",-1,45,"font_old_10_white.tga",5);
		AI_StopProcessInfos(self);
	};
	Npc_RemoveInvItems(self,ItFo_Plants_Seraphis_01,1);
	CreateInvItem(self,ItFo_Potion_Mana_01);
	AI_Wait(self,2);
	PrintScreen("Получена эссенция магической энергии.",-1,-1,"font_old_10_white.tga",2);
	Snd_Play("PSILAB_GETRESULT");
	update_mp_cat_list();
};

func void pc_potionalchemy_mp2_info()
{
	if(Npc_HasItems(hero,ItMiFlask))
	{
		Npc_RemoveInvItems(self,ItMiFlask,1);
	}
	else
	{
		PrintScreen("Закончились чистые флаконы.",-1,45,"font_old_10_white.tga",5);
		AI_StopProcessInfos(self);
	};
	Npc_RemoveInvItems(self,ItFo_Plants_RavenHerb_01,1);
	CreateInvItem(self,ItFo_Potion_Mana_02);
	AI_Wait(self,2);
	PrintScreen("Получен экстракт магической энергии.",-1,-1,"font_old_10_white.tga",2);
	Snd_Play("PSILAB_GETRESULT");
	update_mp_cat_list();
};

func void pc_potionalchemy_mp3_info()
{
	if(Npc_HasItems(hero,ItMiFlask))
	{
		Npc_RemoveInvItems(self,ItMiFlask,1);
	}
	else
	{
		PrintScreen("Закончились чистые флаконы.",-1,45,"font_old_10_white.tga",5);
		AI_StopProcessInfos(self);
	};
	Npc_RemoveInvItems(self,ItFo_Plants_Stoneroot_01,1);
	CreateInvItem(self,ItFo_Potion_Mana_03);
	AI_Wait(self,2);
	PrintScreen("Получено зелье магической энергии.",-1,-1,"font_old_10_white.tga",2);
	Snd_Play("PSILAB_GETRESULT");
	update_mp_cat_list();
};

func void pc_potionalchemy_mpmax_info()
{
	if(Npc_HasItems(hero,ItMiFlask))
	{
		Npc_RemoveInvItems(self,ItMiFlask,1);
	}
	else
	{
		PrintScreen("Закончились чистые флаконы.",-1,45,"font_old_10_white.tga",5);
		AI_StopProcessInfos(self);
	};
	Npc_RemoveInvItems(self,ItFo_Plants_mountainmoos_01,1);
	Npc_RemoveInvItems(self,ItFo_Plants_Nightshadow_02,1);
	CreateInvItem(self,ItFo_Potion_Mana_Perma_01);
	AI_Wait(self,2);
	PrintScreen("Получена эссенция силы духа.",-1,-1,"font_old_10_white.tga",2);
	Snd_Play("PSILAB_GETRESULT");
	update_perm_cat_list();
};

func void pc_potionalchemy_hpmax_info()
{
	if(Npc_HasItems(hero,ItMiFlask))
	{
		Npc_RemoveInvItems(self,ItMiFlask,1);
	}
	else
	{
		PrintScreen("Закончились чистые флаконы.",-1,45,"font_old_10_white.tga",5);
		AI_StopProcessInfos(self);
	};
	Npc_RemoveInvItems(self,ItFo_Plants_mountainmoos_01,1);
	Npc_RemoveInvItems(self,ItFo_Plants_OrcHerb_02,1);
	CreateInvItem(self,ItFo_Potion_Health_Perma_01);
	AI_Wait(self,2);
	PrintScreen("Получена эссенция жизни.",-1,-1,"font_old_10_white.tga",2);
	Snd_Play("PSILAB_GETRESULT");
	update_perm_cat_list();
};

func void pc_potionalchemy_dex_info()
{
	if(Npc_HasItems(hero,ItMiFlask))
	{
		Npc_RemoveInvItems(self,ItMiFlask,1);
	}
	else
	{
		PrintScreen("Закончились чистые флаконы.",-1,45,"font_old_10_white.tga",5);
		AI_StopProcessInfos(self);
	};
	Npc_RemoveInvItems(self,ItFo_Plants_mountainmoos_02,1);
	Npc_RemoveInvItems(self,ItFo_Plants_Trollberrys_01,1);
	Npc_RemoveInvItems(self,ItFo_Plants_RavenHerb_02,1);
	CreateInvItem(self,ItFo_Potion_Dex_01);
	AI_Wait(self,2);
	PrintScreen("Получена эссенция ловкости.",-1,-1,"font_old_10_white.tga",2);
	Snd_Play("PSILAB_GETRESULT");
	update_perm_cat_list();
};

func void pc_potionalchemy_str_info()
{
	if(Npc_HasItems(hero,ItMiFlask))
	{
		Npc_RemoveInvItems(self,ItMiFlask,1);
	}
	else
	{
		PrintScreen("Закончились чистые флаконы.",-1,45,"font_old_10_white.tga",5);
		AI_StopProcessInfos(self);
	};
	Npc_RemoveInvItems(self,ItFo_Plants_mountainmoos_02,1);
	Npc_RemoveInvItems(self,ItFo_Plants_Stoneroot_02,1);
	Npc_RemoveInvItems(self,ItFo_Plants_Flameberry_01,1);
	CreateInvItem(self,ItFo_Potion_Strength_01);
	AI_Wait(self,2);
	PrintScreen("Получена эссенция силы.",-1,-1,"font_old_10_white.tga",2);
	Snd_Play("PSILAB_GETRESULT");
	update_perm_cat_list();
};

func void pc_potionalchemy_master_info()
{
	if(Npc_HasItems(hero,ItMiFlask))
	{
		Npc_RemoveInvItems(self,ItMiFlask,1);
	}
	else
	{
		PrintScreen("Закончились чистые флаконы.",-1,45,"font_old_10_white.tga",5);
		AI_StopProcessInfos(self);
	};
	Npc_RemoveInvItems(self,ItFo_Potion_Strength_01,1);
	Npc_RemoveInvItems(self,ItFo_Potion_Dex_01,1);
	CreateInvItem(self,ItFo_Potion_Master_01);
	AI_Wait(self,2);
	PrintScreen("Получено зелье мощи.",-1,-1,"font_old_10_white.tga",2);
	Snd_Play("PSILAB_GETRESULT");
	update_perm_cat_list();
};

func void pc_potionalchemy_egg_info()
{
	if(CorKalom_BringMCQBalls == LOG_SUCCESS)
	{
		if(Npc_HasItems(hero,ItMiFlask))
		{
			Npc_RemoveInvItems(self,ItMiFlask,1);
		}
		else
		{
			PrintScreen("Закончились чистые флаконы.",-1,45,"font_old_10_white.tga",5);
			AI_StopProcessInfos(self);
		};
		Npc_RemoveInvItems(self,ItAt_Crawlerqueen,3);
		Npc_RemoveInvItems(self,ItMi_Plants_Swampherb_01,6);
		CreateInvItem(self,ItFo_Potion_Elixier_Egg);
		AI_Wait(self,2);
		PrintScreen("Получено зелье из яиц Королевы ползунов.",-1,-1,"font_old_10_white.tga",2);
		Snd_Play("PSILAB_GETRESULT");
	}
	else
	{
		PrintScreen("Думаю, это мне еще пригодится...",-1,45,"font_old_10_white.tga",3);
		AI_OutputSVM_Overlay(hero,NULL,"INFO_HIGHPRIEST4_15_03");
		AI_Wait(self,3);
	};
	update_special_cat_list();
};

func void pc_potionalchemy_wine_info()
{
	if(Npc_HasItems(hero,ItMiFlask))
	{
		Npc_RemoveInvItems(self,ItMiFlask,1);
	}
	else
	{
		PrintScreen("Закончились чистые флаконы.",-1,45,"font_old_10_white.tga",5);
		AI_StopProcessInfos(self);
	};
	Npc_RemoveInvItems(self,ItFo_Potion_Water_01,1);
	Npc_RemoveInvItems(self,ItFo_wineberrys_01,1);
	CreateInvItem(self,ItFoWine);
	AI_Wait(self,2);
	PrintScreen("Получено вино.",-1,-1,"font_old_10_white.tga",2);
	Snd_Play("PSILAB_GETRESULT");
	update_alco_cat_list();
};

func void pc_potionalchemy_booze_info()
{
	if(Npc_HasItems(hero,ItMiFlask))
	{
		Npc_RemoveInvItems(self,ItMiFlask,1);
	}
	else
	{
		PrintScreen("Закончились чистые флаконы.",-1,45,"font_old_10_white.tga",5);
		AI_StopProcessInfos(self);
	};
	Npc_RemoveInvItems(self,ItFo_Potion_Water_01,1);
	Npc_RemoveInvItems(self,ItFoRice,1);
	CreateInvItem(self,ItFoBooze);
	AI_Wait(self,2);
	PrintScreen("Получен рисовый шнапс.",-1,-1,"font_old_10_white.tga",2);
	Snd_Play("PSILAB_GETRESULT");
	update_alco_cat_list();
};

func void pc_potionalchemy_yberion_info()
{
	Npc_RemoveInvItems(self,itfo_plants_deadleaf,1);
	if(Npc_HasItems(hero,SpecialWater))
	{
		Npc_RemoveInvItems(self,SpecialWater,1);
	}
	else
	{
		if(Npc_HasItems(hero,ItMiFlask))
		{
			Npc_RemoveInvItems(self,ItMiFlask,1);
		}
		else
		{
			PrintScreen("Закончились чистые флаконы.",-1,45,"font_old_10_white.tga",5);
			AI_StopProcessInfos(self);
		};
		Npc_RemoveInvItems(self,ItMi_Alchemy_Alcohol_01,1);
		Npc_RemoveInvItems(self,ItFo_Plants_Bloodwood_01,1);
	};
	CreateInvItem(self,HealthWater);
	AI_Wait(self,2);
	PrintScreen("Получено лечебное зелье Фортуно.",-1,-1,"font_old_10_white.tga",2);
	Snd_Play("PSILAB_GETRESULT");
	update_special_cat_list();
};

func void update_stomp_list()
{
	Info_ClearChoices(pc_stomp_cat1);
	Info_AddChoice(pc_stomp_cat1,DIALOG_BACK,pc_stomp_cat1_back);
	if(Npc_HasItems(hero,ItMi_Plants_Swampherb_01))
	{
		if(JOINT3RECIPE == TRUE)
		{
			Info_AddChoice(pc_stomp_cat1,"'Зов мечты'",pc_stomp_cat1_3);
		};
		if(JOINT2RECIPE == TRUE)
		{
			Info_AddChoice(pc_stomp_cat1,"'Северный темный'",pc_stomp_cat1_2);
		};
		Info_AddChoice(pc_stomp_cat1,"'Новичок'",pc_stomp_cat1_1);
	};
};

func void stomp_s1()
{
	if(Npc_IsPlayer(self))
	{
		self.aivar[AIV_INVINCIBLE] = TRUE;
		PLAYER_MOBSI_PRODUCTION = MOBSI_STOMP;
		AI_ProcessInfos(hero);
	};
};


instance PC_STOMP_CANCEL(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = pc_stomp_cancel_condition;
	information = pc_stomp_cancel_info;
	important = 0;
	permanent = 1;
	description = STR_INFO_TRADE_EXIT;
};


func int pc_stomp_cancel_condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_STOMP)
	{
		return TRUE;
	};
};

func void pc_stomp_cancel_info()
{
	AI_StopProcessInfos(self);
	self.aivar[AIV_INVINCIBLE] = FALSE;
};


instance PC_STOMP_CAT1(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = pc_stomp_cat1_condition;
	information = pc_stomp_cat1_info;
	important = 0;
	permanent = 1;
	description = "Обработать болотник";
};


func int pc_stomp_cat1_condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_STOMP)
	{
		return TRUE;
	};
};

func void pc_stomp_cat1_info()
{
	update_stomp_list();
};

func void pc_stomp_cat1_back()
{
	Info_ClearChoices(pc_stomp_cat1);
};

func void pc_stomp_cat1_1()
{
	Npc_RemoveInvItems(self,ItMi_Plants_Swampherb_01,1);
	CreateInvItem(self,ItMiJoint_1);
	AI_Wait(self,2);
	PrintScreen("Получен 'Новичок'.",-1,-1,"font_old_10_white.tga",2);
	update_stomp_list();
};

func void pc_stomp_cat1_2()
{
	if(!Npc_HasItems(hero,ItFo_Plants_Berrys_01))
	{
		PrintScreen("Недостаточно ингредиентов.",-1,45,"font_old_10_white.tga",2);
	}
	else
	{
		Npc_RemoveInvItems(self,ItMi_Plants_Swampherb_01,1);
		Npc_RemoveInvItems(self,ItFo_Plants_Berrys_01,1);
		CreateInvItem(self,ItMiJoint_2);
		AI_Wait(self,2);
		PrintScreen("Получен 'Северный темный'.",-1,-1,"font_old_10_white.tga",2);
	};
	update_stomp_list();
};

func void pc_stomp_cat1_3()
{
	if(!Npc_HasItems(hero,ItFo_Plants_mushroom_01))
	{
		PrintScreen("Недостаточно ингредиентов.",-1,45,"font_old_10_white.tga",2);
	}
	else
	{
		Npc_RemoveInvItems(self,ItMi_Plants_Swampherb_01,1);
		Npc_RemoveInvItems(self,ItFo_Plants_mushroom_01,1);
		CreateInvItem(self,ItMiJoint_3);
		AI_Wait(self,2);
		PrintScreen("Получен 'Зов мечты'.",-1,-1,"font_old_10_white.tga",2);
	};
	update_stomp_list();
};

