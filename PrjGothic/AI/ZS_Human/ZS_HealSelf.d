
func void ZS_HealSelf()
{
	Npc_PercEnable(self,PERC_ASSESSENEMY,B_AssessEnemy);
	Npc_PercEnable(self,PERC_ASSESSFIGHTER,B_AssessFighter);
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,ZS_ReactToDamage);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,B_AssessMagic);
	Npc_PercEnable(self,PERC_ASSESSCASTER,B_AssessCaster);
	Npc_PercEnable(self,PERC_ASSESSTHREAT,B_AssessFighter);
	Npc_PercEnable(self,PERC_DRAWWEAPON,B_AssessFighter);
	Npc_PercEnable(self,PERC_ASSESSWARN,B_AssessWarn);
	Npc_PercEnable(self,PERC_ASSESSMURDER,ZS_AssessMurder);
	Npc_PercEnable(self,PERC_ASSESSDEFEAT,ZS_AssessDefeat);
	Npc_PercEnable(self,PERC_ASSESSFIGHTSOUND,B_AssessFightSound);
	Npc_PercEnable(self,PERC_CATCHTHIEF,ZS_CatchThief);
	Npc_PercEnable(self,PERC_ASSESSTHEFT,B_AssessTheft);
	AI_StopLookAt(self);
	AI_RemoveWeapon(self);
	self.aivar[AIV_ITEMSTATUS] = 0;
};

func int ZS_HealSelf_Loop()
{
	if((self.attribute[ATR_HITPOINTS] == self.attribute[ATR_HITPOINTS_MAX]) || (self.flags == NPC_FLAG_IMMORTAL))
	{
		return LOOP_END;
	}
	else if(!C_BodyStateContains(self,BS_ITEMINTERACT))
	{
		if(!self.aivar[AIV_ITEMSTATUS])
		{
			if(Npc_HasItems(self,ItFo_Potion_Health_03))
			{
				AI_UseItemToState(self,ItFo_Potion_Health_03,0);
				AI_PlayAni(self,"T_POTIONFAST_S0_2_STAND");
				self.aivar[AIV_ITEMSTATUS] = 1;
			}
			else if(Npc_HasItems(self,ItFo_Potion_Health_02))
			{
				AI_UseItemToState(self,ItFo_Potion_Health_02,0);
				AI_PlayAni(self,"T_POTIONFAST_S0_2_STAND");
				self.aivar[AIV_ITEMSTATUS] = 2;
			}
			else if(Npc_HasItems(self,ItFo_Potion_Health_01))
			{
				AI_UseItemToState(self,ItFo_Potion_Health_01,0);
				AI_PlayAni(self,"T_POTIONFAST_S0_2_STAND");
				self.aivar[AIV_ITEMSTATUS] = 3;
			}
			else if(Npc_HasItems(self,ItFo_mutton_01))
			{
				AI_UseItemToState(self,ItFo_mutton_01,0);
				AI_PlayAni(self,"T_FOODHUGE_S0_2_STAND");
				self.aivar[AIV_ITEMSTATUS] = 4;
			}
			else if(Npc_HasItems(self,ItFoMutton))
			{
				AI_UseItemToState(self,ItFoMutton,0);
				AI_PlayAni(self,"T_MEAT_S0_2_STAND");
				self.aivar[AIV_ITEMSTATUS] = 5;
			}
			else if(Npc_HasItems(self,ItFoRice))
			{
				AI_UseItemToState(self,ItFoRice,0);
				AI_PlayAni(self,"T_RICE_S0_2_STAND");
				self.aivar[AIV_ITEMSTATUS] = 6;
			}
			else if(Npc_HasItems(self,ItFoSoup))
			{
				AI_UseItemToState(self,ItFoSoup,0);
				AI_PlayAni(self,"T_RICE_S0_2_STAND");
				self.aivar[AIV_ITEMSTATUS] = 7;
			}
			else if(Npc_HasItems(self,ItFoMeatbugragout))
			{
				AI_UseItemToState(self,ItFoMeatbugragout,0);
				AI_PlayAni(self,"T_RICE_S0_2_STAND");
				self.aivar[AIV_ITEMSTATUS] = 8;
			}
			else if(Npc_HasItems(self,ItFoCrawlersoup))
			{
				AI_UseItemToState(self,ItFoCrawlersoup,0);
				AI_PlayAni(self,"T_RICE_S0_2_STAND");
				self.aivar[AIV_ITEMSTATUS] = 9;
			}
			else if(Npc_HasItems(self,ItFoCheese))
			{
				AI_UseItemToState(self,ItFoCheese,0);
				AI_PlayAni(self,"T_FOODHUGE_S0_2_STAND");
				self.aivar[AIV_ITEMSTATUS] = 10;
			}
			else if(Npc_HasItems(self,ItFoLoaf))
			{
				AI_UseItemToState(self,ItFoLoaf,0);
				AI_PlayAni(self,"T_FOODHUGE_S0_2_STAND");
				self.aivar[AIV_ITEMSTATUS] = 11;
			}
			else if(Npc_HasItems(self,ItFoApple))
			{
				AI_UseItemToState(self,ItFoApple,0);
				AI_PlayAni(self,"T_FOOD_S0_2_STAND");
				self.aivar[AIV_ITEMSTATUS] = 12;
			}
			else
			{
				return LOOP_END;
			};
			AI_StandupQuick(self);
		}
		else
		{
			if(self.aivar[AIV_ITEMSTATUS] == 1)
			{
				Npc_RemoveInvItem(self,ItFo_Potion_Health_03);
				Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Elixier);
			}
			else if(self.aivar[AIV_ITEMSTATUS] == 2)
			{
				Npc_RemoveInvItem(self,ItFo_Potion_Health_02);
				Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Extrakt);
			}
			else if(self.aivar[AIV_ITEMSTATUS] == 3)
			{
				Npc_RemoveInvItem(self,ItFo_Potion_Health_01);
				Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Essenz);
			}
			else if(self.aivar[AIV_ITEMSTATUS] == 4)
			{
				Npc_RemoveInvItem(self,ItFo_mutton_01);
				Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Schinken);
			}
			else if(self.aivar[AIV_ITEMSTATUS] == 5)
			{
				Npc_RemoveInvItem(self,ItFoMutton);
				Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Fleisch);
			}
			else if(self.aivar[AIV_ITEMSTATUS] == 6)
			{
				Npc_RemoveInvItem(self,ItFoRice);
				Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Reis);
			}
			else if(self.aivar[AIV_ITEMSTATUS] == 7)
			{
				Npc_RemoveInvItem(self,ItFoSoup);
				Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Wurzelsuppe);
			}
			else if(self.aivar[AIV_ITEMSTATUS] == 8)
			{
				Npc_RemoveInvItem(self,ItFoMeatbugragout);
				Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Ragout);
			}
			else if(self.aivar[AIV_ITEMSTATUS] == 9)
			{
				Npc_RemoveInvItem(self,ItFoCrawlersoup);
				Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_CrawlerSuppe);
			}
			else if(self.aivar[AIV_ITEMSTATUS] == 10)
			{
				Npc_RemoveInvItem(self,ItFoCheese);
				Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Käse);
			}
			else if(self.aivar[AIV_ITEMSTATUS] == 11)
			{
				Npc_RemoveInvItem(self,ItFoLoaf);
				Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Brot);
			}
			else if(self.aivar[AIV_ITEMSTATUS] == 12)
			{
				Npc_RemoveInvItem(self,ItFoApple);
				Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Apfel);
			};
			self.aivar[AIV_ITEMSTATUS] = 0;
			AI_Wait(self,0.3);
		};
	}
	else
	{
		AI_Wait(self,0.5);
	};
	return LOOP_CONTINUE;
};

func void ZS_HealSelf_End()
{
	self.aivar[AIV_ITEMSTATUS] = 0;
	AI_StartState(self,ZS_HealSelfMana,1,"");
};

func void ZS_HealSelfMana()
{
	Npc_PercEnable(self,PERC_ASSESSENEMY,B_AssessEnemy);
	Npc_PercEnable(self,PERC_ASSESSFIGHTER,B_AssessFighter);
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,ZS_ReactToDamage);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,B_AssessMagic);
	Npc_PercEnable(self,PERC_ASSESSCASTER,B_AssessCaster);
	Npc_PercEnable(self,PERC_ASSESSTHREAT,B_AssessFighter);
	Npc_PercEnable(self,PERC_DRAWWEAPON,B_AssessFighter);
	Npc_PercEnable(self,PERC_ASSESSWARN,B_AssessWarn);
	Npc_PercEnable(self,PERC_ASSESSMURDER,ZS_AssessMurder);
	Npc_PercEnable(self,PERC_ASSESSDEFEAT,ZS_AssessDefeat);
	Npc_PercEnable(self,PERC_ASSESSFIGHTSOUND,B_AssessFightSound);
	Npc_PercEnable(self,PERC_CATCHTHIEF,ZS_CatchThief);
	Npc_PercEnable(self,PERC_ASSESSTHEFT,B_AssessTheft);
	AI_StopLookAt(self);
	AI_RemoveWeapon(self);
	self.aivar[AIV_ITEMSTATUS] = 0;
};

func int ZS_HealSelfMana_Loop()
{
	if(self.attribute[ATR_MANA] == self.attribute[ATR_MANA_MAX])
	{
		return LOOP_END;
	}
	else if(!C_BodyStateContains(self,BS_ITEMINTERACT))
	{
		if(!self.aivar[AIV_ITEMSTATUS])
		{
			if(Npc_HasItems(self,ItFo_Potion_Mana_03))
			{
				AI_UseItemToState(self,ItFo_Potion_Mana_03,0);
				AI_PlayAni(self,"T_POTIONFAST_S0_2_STAND");
				self.aivar[AIV_ITEMSTATUS] = 1;
			}
			else if(Npc_HasItems(self,ItFo_Potion_Mana_02))
			{
				AI_UseItemToState(self,ItFo_Potion_Mana_02,0);
				AI_PlayAni(self,"T_POTIONFAST_S0_2_STAND");
				self.aivar[AIV_ITEMSTATUS] = 2;
			}
			else if(Npc_HasItems(self,ItFo_Potion_Mana_01))
			{
				AI_UseItemToState(self,ItFo_Potion_Mana_01,0);
				AI_PlayAni(self,"T_POTIONFAST_S0_2_STAND");
				self.aivar[AIV_ITEMSTATUS] = 3;
			}
			else
			{
				return LOOP_END;
			};
			AI_StandupQuick(self);
		}
		else
		{
			if(self.aivar[AIV_ITEMSTATUS] == 1)
			{
				Npc_RemoveInvItem(self,ItFo_Potion_Mana_03);
				Npc_ChangeAttribute(self,ATR_MANA,Mana_Elixier);
			}
			else if(self.aivar[AIV_ITEMSTATUS] == 2)
			{
				Npc_RemoveInvItem(self,ItFo_Potion_Mana_02);
				Npc_ChangeAttribute(self,ATR_MANA,Mana_Extrakt);
			}
			else if(self.aivar[AIV_ITEMSTATUS] == 3)
			{
				Npc_RemoveInvItem(self,ItFo_Potion_Mana_01);
				Npc_ChangeAttribute(self,ATR_MANA,Mana_Essenz);
			};
			self.aivar[AIV_ITEMSTATUS] = 0;
			AI_Wait(self,0.3);
		};
	}
	else
	{
		AI_Wait(self,0.5);
	};
	return LOOP_CONTINUE;
};

func void ZS_HealSelfMana_End()
{
	self.aivar[AIV_ITEMSTATUS] = 0;
};

