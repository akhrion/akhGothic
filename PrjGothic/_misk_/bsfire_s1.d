
func void bsfire_s1()
{
	if(Npc_IsPlayer(self))
	{
		self.aivar[AIV_INVINCIBLE] = TRUE;
		AI_Wait(self,6);
		B_StopUseMob(self,"BSFIRE");
	};
};

func void bsfire_s0()
{
	if(Npc_IsPlayer(self))
	{
		self.aivar[AIV_INVINCIBLE] = FALSE;
	};
};

func int bsanvil_cf()
{
	var C_Item currentequippedweapon;
	var int currentequippedweaponinstance;
	if(Npc_IsPlayer(self))
	{
		if(Npc_HasItems(self,ItMw_1H_Sledgehammer_01))
		{
			currentequippedweapon = Npc_GetEquippedMeleeWeapon(hero);
			currentequippedweaponinstance = Hlp_GetInstanceID(currentequippedweapon);
			if(currentequippedweaponinstance == ItMw_1H_Sledgehammer_01)
			{
				AI_UnequipWeapons(hero);
			};
			return TRUE;
		}
		else
		{
			PrintScreen("Для этого мне нужен кузнечный молот.",-1,-1,"FONT_OLD_10_WHITE.TGA",3);
			if(!Npc_HasItems(self,ItMiSwordrawhot))
			{
				CreateInvItems(self,ItMiSwordrawhot,1);
			};
		};
	}
	else
	{
		if(!Npc_HasItems(self,ItMw_1H_Sledgehammer_01))
		{
			CreateInvItem(self,ItMw_1H_Sledgehammer_01);
		};
		return TRUE;
	};
	return FALSE;
};

func void bsanvil_s1()
{
	if(Npc_IsPlayer(self))
	{
		self.aivar[AIV_INVINCIBLE] = TRUE;
		AI_Wait(self,7.5);
		B_StopUseMob(self,"BSANVIL");
	};
};

func void bsanvil_s0()
{
	if(Npc_IsPlayer(self))
	{
		self.aivar[AIV_INVINCIBLE] = FALSE;
	};
};

func void bscool_s1()
{
	if(Npc_IsPlayer(self))
	{
		self.aivar[AIV_INVINCIBLE] = TRUE;
		AI_Wait(self,4);
		B_StopUseMob(self,"BSCOOL");
	};
};

func void bscool_s0()
{
	if(Npc_IsPlayer(self))
	{
		self.aivar[AIV_INVINCIBLE] = FALSE;
	};
};

func void bssharp_s1()
{
	if(Npc_IsPlayer(self))
	{
		self.aivar[AIV_INVINCIBLE] = TRUE;
		AI_Wait(self,7.8);
		B_StopUseMob(self,"BSSHARP");
	};
};

func void bssharp_s0()
{
	if(Npc_IsPlayer(self))
	{
		PrintScreen("Меч готов!",-1,-1,"FONT_OLD_10_WHITE.TGA",2);
		self.aivar[AIV_INVINCIBLE] = FALSE;
	};
};

