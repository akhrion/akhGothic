
func int B_GiveSkill(var C_Npc typ,var int tal,var int NEW_Wert,var int LP_Cost)
{
	var int TAL_Wert;
	if(tal == NPC_TALENT_1H)
	{
		TAL_Wert = Npc_GetTalentSkill(typ,NPC_TALENT_1H);
	}
	else if(tal == NPC_TALENT_2H)
	{
		TAL_Wert = Npc_GetTalentSkill(typ,NPC_TALENT_2H);
	}
	else if(tal == NPC_TALENT_BOW)
	{
		TAL_Wert = Npc_GetTalentSkill(typ,NPC_TALENT_BOW);
	}
	else if(tal == NPC_TALENT_CROSSBOW)
	{
		TAL_Wert = Npc_GetTalentSkill(typ,NPC_TALENT_CROSSBOW);
	}
	else if(tal == NPC_TALENT_PICKLOCK)
	{
		TAL_Wert = Npc_GetTalentSkill(typ,NPC_TALENT_PICKLOCK);
	}
	else if(tal == NPC_TALENT_PICKPOCKET)
	{
		TAL_Wert = Npc_GetTalentSkill(typ,NPC_TALENT_PICKPOCKET);
	}
	else if(tal == NPC_TALENT_MAGE)
	{
		TAL_Wert = Npc_GetTalentSkill(typ,NPC_TALENT_MAGE);
	}
	else if(tal == NPC_TALENT_SNEAK)
	{
		TAL_Wert = Npc_GetTalentSkill(typ,NPC_TALENT_SNEAK);
	}
	else if(tal == NPC_TALENT_REGENERATE)
	{
		TAL_Wert = Npc_GetTalentSkill(typ,NPC_TALENT_REGENERATE);
	}
	else if(tal == NPC_TALENT_FIREMASTER)
	{
		TAL_Wert = Npc_GetTalentSkill(typ,NPC_TALENT_FIREMASTER);
	}
	else if(tal == NPC_TALENT_ACROBAT)
	{
		TAL_Wert = Npc_GetTalentSkill(typ,NPC_TALENT_ACROBAT);
	};
	if((TAL_Wert + 1) == NEW_Wert)
	{
		if(typ.lp >= LP_Cost)
		{
			typ.lp = typ.lp - LP_Cost;
			if(tal == NPC_TALENT_1H)
			{
				Npc_SetTalentSkill(typ,NPC_TALENT_1H,NEW_Wert);
				Npc_SetTalentValue(typ,NPC_TALENT_1H,Npc_GetTalentValue(typ,NPC_TALENT_1H) + 5);
				PrintScreen("Навык: владение одноручным мечом",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
				return 1;
			}
			else if(tal == NPC_TALENT_2H)
			{
				Npc_SetTalentSkill(typ,NPC_TALENT_2H,NEW_Wert);
				Npc_SetTalentValue(typ,NPC_TALENT_2H,Npc_GetTalentValue(typ,NPC_TALENT_2H) + 5);
				PrintScreen("Навык: владение двуручным мечом",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
				return 1;
			}
			else if(tal == NPC_TALENT_BOW)
			{
				Npc_SetTalentSkill(typ,NPC_TALENT_BOW,NEW_Wert);
				Npc_SetTalentValue(typ,NPC_TALENT_BOW,Npc_GetTalentValue(typ,NPC_TALENT_BOW) + 15);
				PrintScreen("Навык: стрельба из лука",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
				return 1;
			}
			else if(tal == NPC_TALENT_CROSSBOW)
			{
				Npc_SetTalentSkill(typ,NPC_TALENT_CROSSBOW,NEW_Wert);
				Npc_SetTalentValue(typ,NPC_TALENT_CROSSBOW,Npc_GetTalentValue(typ,NPC_TALENT_CROSSBOW) + 20);
				PrintScreen("Навык: стрельба из арбалета",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
				return 1;
			}
			else if(tal == NPC_TALENT_PICKLOCK)
			{
				Npc_SetTalentSkill(typ,NPC_TALENT_PICKLOCK,NEW_Wert);
				if(Npc_GetTalentSkill(typ,NPC_TALENT_PICKLOCK) == 1)
				{
					Npc_SetTalentValue(typ,NPC_TALENT_PICKLOCK,Npc_GetTalentValue(typ,NPC_TALENT_PICKLOCK) - 20);
				}
				else if(Npc_GetTalentSkill(typ,NPC_TALENT_PICKLOCK) == 2)
				{
					Npc_SetTalentValue(typ,NPC_TALENT_PICKLOCK,Npc_GetTalentValue(typ,NPC_TALENT_PICKLOCK) - 70);
				};
				PrintScreen("Навык: взлом замков",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
				return 1;
			}
			else if(tal == NPC_TALENT_PICKPOCKET)
			{
				Npc_SetTalentSkill(typ,NPC_TALENT_PICKPOCKET,NEW_Wert);
				if(Npc_GetTalentSkill(typ,NPC_TALENT_PICKPOCKET) == 1)
				{
					Npc_SetTalentValue(typ,NPC_TALENT_PICKPOCKET,Npc_GetTalentValue(typ,NPC_TALENT_PICKPOCKET) - 50);
				}
				else if(Npc_GetTalentSkill(typ,NPC_TALENT_PICKPOCKET) == 2)
				{
					Npc_SetTalentValue(typ,NPC_TALENT_PICKPOCKET,Npc_GetTalentValue(typ,NPC_TALENT_PICKPOCKET) - 40);
				};
				PrintScreen("Навык: воровство",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
				return 1;
			}
			else if(tal == NPC_TALENT_MAGE)
			{
				Npc_SetTalentSkill(typ,NPC_TALENT_MAGE,NEW_Wert);
				if(Npc_GetTalentSkill(typ,NPC_TALENT_MAGE) == 1)
				{
					PrintScreen("Навык: первый Круг магии",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
				}
				else if(Npc_GetTalentSkill(typ,NPC_TALENT_MAGE) == 2)
				{
					PrintScreen("Навык: второй Круг магии",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
				}
				else if(Npc_GetTalentSkill(typ,NPC_TALENT_MAGE) == 3)
				{
					PrintScreen("Навык: третий Круг магии",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
				}
				else if(Npc_GetTalentSkill(typ,NPC_TALENT_MAGE) == 4)
				{
					PrintScreen("Навык: четвертый Круг магии",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
				}
				else if(Npc_GetTalentSkill(typ,NPC_TALENT_MAGE) == 5)
				{
					PrintScreen("Навык: пятый Круг магии",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
				}
				else
				{
					PrintScreen("Навык: шестой Круг магии",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
				};
				return 1;
			}
			else if(tal == NPC_TALENT_SNEAK)
			{
				Npc_SetTalentSkill(typ,NPC_TALENT_SNEAK,NEW_Wert);
				PrintScreen("Навык: подкрадывание",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
				return 1;
			}
			else if(tal == NPC_TALENT_REGENERATE)
			{
				Npc_SetTalentSkill(typ,NPC_TALENT_REGENERATE,NEW_Wert);
				PrintScreen("Повышение уровня регенерации",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
				return 1;
			}
			else if(tal == NPC_TALENT_FIREMASTER)
			{
				Npc_SetTalentSkill(typ,NPC_TALENT_FIREMASTER,NEW_Wert);
				PrintScreen("Навык: Мастер Круга Огня",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
				return 1;
			}
			else if(tal == NPC_TALENT_ACROBAT)
			{
				Npc_SetTalentSkill(typ,NPC_TALENT_ACROBAT,NEW_Wert);
				PrintScreen("Навык: акробатика",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
				return 1;
			}
			else
			{
				return 0;
			};
		}
		else
		{
			PrintScreen("Недостаточно очков обучения!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
			B_Say(self,other,"$NOLEARNNOPOINTS");
			return 0;
		};
	}
	else if(TAL_Wert >= NEW_Wert)
	{
		B_Say(self,other,"$NOLEARNYOUREBETTER");
	}
	else if((TAL_Wert + 1) < NEW_Wert)
	{
		B_Say(self,other,"$NOLEARNYOUALREADYKNOW");
	};
	return 0;
};

