const int TROPH_WAR = 2;
const int TROPH_FIRED = 3;
const int TROPH_HUNT = 6;
var int Troph_isGifted_Claws;
var int Troph_isGifted_Fur;
var int Troph_isGifted_Hide;
var int Troph_isGifted_Teeth;
var int Troph_isGifted_Meat;
func int B_GiveDeathInv_GetVT(var C_NPC npc)
{
	var int vt;vt = 0;
	if(Npc_IsAsh(npc))
	{
		vt += VT_ASH;
	}
	else if(Npc_IsVerkohlt(npc))
	{
		vt += VT_VERKOHLT;
	}
	else if(Npc_IsBurned(npc))
	{
		vt += VT_BURNED;
	}
	else if (Npc_IsFired(npc))
	{
		vt += VT_FIRED;
	};
	if(Npc_IsDissected(npc))
	{
		vt += VT_DISSECTED;
	};
	return vt;
};





func void B_GiveDeathInv_Wolf_Spec()
{
	var int vt;
	vt = B_GiveDeathInv_GetVT(self);
	if(Npc_IsAsh(self))
	{
		Troph_isGifted_Claws = true;
		Troph_isGifted_Fur = true;
		Troph_isGifted_Hide = true;
		Troph_isGifted_Teeth = true;
		Troph_isGifted_Meat = true;
		CreateInvItems(self,ItMi_Alchemy_Ash_01,3);
		return;
	}
	else if(Npc_IsVerkohlt(self))
	{
		Troph_isGifted_Fur = true;
		Troph_isGifted_Teeth = true;
		Troph_isGifted_Meat = true;
		CreateInvItems(self,ItFoMutton,1);
		if(Knows_GetTeeth == TRUE)
		{
			CreateInvItems(self,ItAt_Wolf_Teeth_Verkohlt_01,2);
			return;
		};
	}
	else if(Npc_IsBurned(self))
	{
		Troph_isGifted_Fur = true;
		Troph_isGifted_Meat = true;
		CreateInvItems(self,ItFoMutton,4);
		if(Npc_IsDissected(self))
		{
			PrintDebug("IsBurned and Dissected");
			if(Knows_GetFur == true)
			{
				CreateInvItems(self,ItAt_Wolf_Fur_BD_01,1);
			};
		}
		else
		{
			PrintDebug("IsBurned");
			if(Knows_GetFur == true)
			{
				CreateInvItems(self,ItAt_Wolf_Fur_Burned_01,1);
			};
		};
	}
	else if (Npc_IsFired(self))
	{
		Troph_isGifted_Fur = true;
		if(Npc_IsDissected(self))
		{
			PrintDebug("IsFired and Dissected");
			if(Knows_GetFur == true)
			{
				CreateInvItems(self,ItAt_Wolf_Fur_BD_02,1);
			};
		}
		else if(Knows_GetFur == true)
		{
			PrintDebug("IsFired");
			CreateInvItems(self,ItAt_Wolf_Fur_Fired_01,1);
		};
	};
	if(Npc_IsDissected(self))
	{
		PrintDebug("IsDissected");
		Troph_isGifted_Fur = true;
		if(Knows_GetFur == true)
		{
			CreateInvItems(self,ItAt_Wolf_Fur_Dissected_01,1);
		};
	};
};
func void B_GiveDeathInv_OrcDog_Spec()
{
	if(Npc_IsAsh(self))
	{
		Troph_isGifted_Claws = true;
		Troph_isGifted_Fur = true;
		Troph_isGifted_Hide = true;
		Troph_isGifted_Teeth = true;
		Troph_isGifted_Meat = true;
		CreateInvItems(self,ItMi_Alchemy_Ash_01,3);
		return;
	}
	else if(Npc_IsVerkohlt(self))
	{
		Troph_isGifted_Fur = true;
		Troph_isGifted_Teeth = true;
		Troph_isGifted_Meat = true;
		CreateInvItems(self,ItFoMutton,2);
		if(Knows_GetTeeth == TRUE)
		{
			CreateInvItems(self,ItAt_OrcDog_Teeth_Verkohlt_01,2);
			return;
		};
	}
	else if(Npc_IsBurned(self))
	{
		Troph_isGifted_Fur = true;
		Troph_isGifted_Meat = true;
		CreateInvItems(self,ItFoMutton,6);
		if(Npc_IsDissected(self))
		{
			PrintDebug("IsBurned and Dissected");
			if(Knows_GetFur == true)
			{
				CreateInvItems(self,ItAt_OrcDog_Fur_BD_01,1);
			};
		}
		else
		{
			PrintDebug("IsBurned");
			if(Knows_GetFur == true)
			{
				CreateInvItems(self,ItAt_OrcDog_Fur_Burned_01,1);
			};
		};
	}
	else if (Npc_IsFired(self))
	{
		Troph_isGifted_Fur = true;
		if(Npc_IsDissected(self))
		{
			PrintDebug("IsFired and Dissected");
			if(Knows_GetFur == true)
			{
				CreateInvItems(self,ItAt_OrcDog_Fur_BD_02,1);
			};
		}
		else if(Knows_GetFur == true)
		{
			PrintDebug("IsFired");
			CreateInvItems(self,ItAt_OrcDog_Fur_Fired_01,1);
		};
	};
	if(Npc_IsDissected(self))
	{
		PrintDebug("IsDissected");
		Troph_isGifted_Fur = true;
		if(Knows_GetFur == true)
		{
			CreateInvItems(self,ItAt_OrcDog_Fur_Dissected_01,1);
		};
	};
};
func void B_GiveDeathInv_Wolf_Def()
{
	PrintDebug("Default items..");
	PrintDebug("Will be gifted if won't gifted in Spec..");
	if(!Troph_isGifted_Meat)
	{
		CreateInvItems(self,ItFoMuttonRaw,4);
	};
	if(!Troph_isGifted_Fur)
	{
		if(Knows_GetFur == true)
		{
			CreateInvItems(self,ItAt_Wolf_Fur_01,1);
		};
	};
	if(!Troph_isGifted_Teeth)
	{
		if(Knows_GetTeeth == TRUE)
		{
			CreateInvItems(self,ItAt_Wolf_Teeth_01,4);
		}
		else
		{
			CreateInvItems(self,ItAt_Wolf_Teeth_01,1);
		};
	};
};
func void B_GiveDeathInv_OrcDog_Def()
{
	PrintDebug("Default items..");
	PrintDebug("Will be gifted if won't gifted in Spec..");
	if(!Troph_isGifted_Meat)
	{
		CreateInvItems(self,ItFoMuttonRaw,6);
	};
	if(!Troph_isGifted_Fur)
	{
		if(Knows_GetFur == true)
		{
			CreateInvItems(self,ItAt_OrcDog_Fur_01,1);
		};
	};
	if(!Troph_isGifted_Teeth)
	{
		if(Knows_GetTeeth == TRUE)
		{
			CreateInvItems(self,ItAt_OrcDog_Teeth_01,4);
		}
		else
		{
			CreateInvItems(self,ItAt_OrcDog_Teeth_01,1);
		};
	};
};
func void B_GiveDeathInv_Wolf()
{
	B_GiveDeathInv_Wolf_Spec();
	B_GiveDeathInv_Wolf_Def();
};
func void B_GiveDeathInv_OrcDog()
{
	B_GiveDeathInv_OrcDog_Spec();
	B_GiveDeathInv_OrcDog_Def();
};
func void B_GiveDeathInv_ShadowBeast_Spec()
{
	if(Npc_IsAsh(self))
	{
		Troph_isGifted_Claws = true;
		Troph_isGifted_Fur = true;
		Troph_isGifted_Hide = true;
		Troph_isGifted_Teeth = true;
		Troph_isGifted_Meat = true;
		CreateInvItems(self,ItMi_Alchemy_Ash_01,10);
		return;
	}
	else if(Npc_IsVerkohlt(self))
	{
		Troph_isGifted_Fur = true;
		Troph_isGifted_Teeth = true;
		Troph_isGifted_Meat = true;
		CreateInvItems(self,ItFoMutton,4);
		if(Knows_GetTeeth == TRUE)
		{
			CreateInvItems(self,ItAt_ShadowBeast_Teeth_Verkohlt_01,2);
			return;
		};
	}
	else if(Npc_IsBurned(self))
	{
		Troph_isGifted_Fur = true;
		Troph_isGifted_Meat = true;
		CreateInvItems(self,ItFoMutton,12);
		if(Npc_IsDissected(self))
		{
			PrintDebug("IsBurned and Dissected");
			if(Knows_GetFur == true)
			{
				CreateInvItems(self,ItAt_ShadowBeast_Fur_BD_01,1);
			};
		}
		else
		{
			PrintDebug("IsBurned");
			if(Knows_GetFur == true)
			{
				CreateInvItems(self,ItAt_ShadowBeast_Fur_Burned_01,1);
			};
		};
	}
	else if (Npc_IsFired(self))
	{
		Troph_isGifted_Fur = true;
		if(Npc_IsDissected(self))
		{
			PrintDebug("IsFired and Dissected");
			if(Knows_GetFur == true)
			{
				CreateInvItems(self,ItAt_ShadowBeast_Fur_BD_02,1);
			};
		}
		else if(Knows_GetFur == true)
		{
			PrintDebug("IsFired");
			CreateInvItems(self,ItAt_ShadowBeast_Fur_Fired_01,1);
		};
	};
	if(Npc_IsDissected(self))
	{
		PrintDebug("IsDissected");
		Troph_isGifted_Fur = true;
		if(Knows_GetFur == true)
		{
			CreateInvItems(self,ItAt_ShadowBeast_Fur_Dissected_01,1);
		};
	};
};
func void B_GiveDeathInv_ShadowBeast_Def()
{
	PrintDebug("Default items..");
	PrintDebug("Will be gifted if won't gifted in Spec..");
	if(!Troph_isGifted_Meat)
	{
		CreateInvItems(self,ItFoMuttonRaw,12);
	};
	if(!Troph_isGifted_Fur)
	{
		if(Knows_GetFur == true)
		{
			CreateInvItems(self,ItAt_ShadowBeast_Fur_01,1);
		};
	};
	if(!Troph_isGifted_Teeth)
	{
		if(Knows_GetTeeth == TRUE)
		{
			CreateInvItems(self,ItAt_ShadowBeast_Teeth_01,4);
		}
		else
		{
			CreateInvItems(self,ItAt_ShadowBeast_Teeth_01,1);
		};
	};
};
func void B_GiveDeathInv_ShadowBeast()
{
	B_GiveDeathInv_ShadowBeast_Spec();
	B_GiveDeathInv_ShadowBeast_Def();
};
func void B_GiveDeathInv_Troll_Spec()
{
	if(Npc_IsAsh(self))
	{
		Troph_isGifted_Claws = true;
		Troph_isGifted_Fur = true;
		Troph_isGifted_Hide = true;
		Troph_isGifted_Teeth = true;
		Troph_isGifted_Meat = true;
		CreateInvItems(self,ItMi_Alchemy_Ash_01,30);
		return;
	}
	else if(Npc_IsVerkohlt(self))
	{
		Troph_isGifted_Fur = true;
		Troph_isGifted_Teeth = true;
		Troph_isGifted_Meat = true;
		CreateInvItems(self,ItFoMutton,12);
		if(Knows_GetUluMulu == true)
		{
			CreateInvItems(self,ItAt_Troll_Teeth_Verkohlt_01,1);
		}
		else if(Knows_GetTeeth == TRUE)
		{
			CreateInvItems(self,ItAt_Troll_Teeth_Verkohlt_Broken_01,1);
		};
		return;
	}
	else if(Npc_IsBurned(self))
	{
		Troph_isGifted_Fur = true;
		Troph_isGifted_Meat = true;
		CreateInvItems(self,ItFoMutton,36);
		if(Npc_IsDissected(self))
		{
			PrintDebug("IsBurned and Dissected");
			if(Knows_GetFur == true)
			{
				CreateInvItems(self,ItAt_Troll_Fur_BD_01,1);
			};
		}
		else
		{
			PrintDebug("IsBurned");
			if(Knows_GetFur == true)
			{
				CreateInvItems(self,ItAt_Troll_Fur_Burned_01,1);
			};
		};
	}
	else if (Npc_IsFired(self))
	{
		Troph_isGifted_Fur = true;
		if(Npc_IsDissected(self))
		{
			PrintDebug("IsFired and Dissected");
			if(Knows_GetFur == true)
			{
				CreateInvItems(self,ItAt_Troll_Fur_BD_02,1);
			};
		}
		else if(Knows_GetFur == true)
		{
			PrintDebug("IsFired");
			CreateInvItems(self,ItAt_Troll_Fur_Fired_01,1);
		};
	};
	if(Npc_IsDissected(self))
	{
		PrintDebug("IsDissected");
		Troph_isGifted_Fur = true;
		if(Knows_GetFur == true)
		{
			CreateInvItems(self,ItAt_Troll_Fur_Dissected_01,1);
		};
	};
};
func void B_GiveDeathInv_Troll_Def()
{
	PrintDebug("Default items..");
	PrintDebug("Will be gifted if won't gifted in Spec..");
	if(!Troph_isGifted_Meat)
	{
		CreateInvItems(self,ItFoMuttonRaw,36);
	};
	if(!Troph_isGifted_Fur)
	{
		if(Knows_GetFur == true)
		{
			CreateInvItems(self,ItAt_Troll_Fur_01,1);
		};
	};
	if(!Troph_isGifted_Teeth)
	{
		if(Knows_GetUluMulu == true)
		{
			CreateInvItems(self,ItAt_Troll_02,2);
			CreateInvItems(self,ItAt_Troll_Teeth_01,2);
		}
		else if(Knows_GetTeeth == TRUE)
		{
			CreateInvItems(self,ItAt_Troll_Teeth_Broken_01,2);
		}
		else
		{
			CreateInvItems(self,ItAt_Troll_Teeth_Broken_01,1);
		};
	};
};
func void B_GiveDeathInv_Troll()
{
	B_GiveDeathInv_Troll_Spec();
	B_GiveDeathInv_Troll_Def();
};
func void B_GiveDeathInv_Meatbug()
{
	if(isTasteMeatBug)
	{
		CreateInvItems(self,ItAt_Meatbug_02,1);
	}
	else
	{
		CreateInvItems(self,ItAt_Meatbug_01,1);
	};
};
func void B_GiveDeathInv_test2()
{
	Troph_isGifted_Claws = false;
	Troph_isGifted_Fur = false;
	Troph_isGifted_Hide = false;
	Troph_isGifted_Teeth = false;
	Troph_isGifted_Meat = false;
	if(self.aivar[AIV_MM_REAL_ID] == ID_WOLF)
	{
		B_GiveDeathInv_Wolf();
	}
	else if(self.aivar[AIV_MM_REAL_ID] == ID_BLACKWOLF)
	{
		B_GiveDeathInv_OrcDog();
	}
	else if(self.aivar[AIV_MM_REAL_ID] == ID_SHADOWBEAST)
	{
		B_GiveDeathInv_ShadowBeast();
	}
	else if(self.aivar[AIV_MM_REAL_ID] == ID_TROLL)
	{
		B_GiveDeathInv_Troll();
	}
	else if(self.aivar[AIV_MM_REAL_ID] == ID_MEATBUG)
	{
		B_GiveDeathInv_Meatbug();
	};
};
func void B_GiveDeathInv()
{
//AKH WORKING
//Для более хорошей реализации необходимо расширить класс C_NPC дополнительным массивом.
	if(self.aivar[AIV_MM_DEATHINVGIVEN])
	{
		return;
	};
	if(self.aivar[AIV_IMPORTANT] == ID_SKELETONMAGE)
	{
		Npc_RemoveInvItem(self,itarrune_3_1_thunderbolt);
		Npc_RemoveInvItems(self,ItArScrollSummonSkeletons,Npc_HasItems(self,ItArScrollSummonSkeletons));
	};
	B_GiveDeathInv_test2();
	if(Knows_GetTeeth == TRUE)
	{
//		if(self.aivar[AIV_IMPORTANT] == ID_WOLF)
//		{
//			CreateInvItems(self,ItAt_Teeth_01,2);
//		};
//		if(self.aivar[AIV_IMPORTANT] == ID_BLACKWOLF)
//		{
//			CreateInvItems(self,ItAt_Teeth_01,2);
//		};
		if(self.aivar[AIV_IMPORTANT] == ID_SNAPPER)
		{
			CreateInvItems(self,ItAt_Teeth_01,4);
		};
		if(self.aivar[AIV_IMPORTANT] == ID_ORCBITER)
		{
			CreateInvItems(self,ItAt_Teeth_01,2);
		};
//		if(self.aivar[AIV_IMPORTANT] == ID_SHADOWBEAST)
//		{
//			CreateInvItems(self,ItAt_Teeth_01,4);
//		};
		if(self.aivar[AIV_IMPORTANT] == ID_BLOODHOUND)
		{
			CreateInvItems(self,ItAt_Teeth_01,4);
		};
	};
	if(Knows_GetClaws == TRUE)
	{
		if(self.aivar[AIV_IMPORTANT] == ID_WARAN)
		{
			CreateInvItems(self,ItAt_Claws_01,4);
		};
		if(self.aivar[AIV_IMPORTANT] == ID_FIREWARAN)
		{
			CreateInvItems(self,ItAt_Claws_01,4);
		};
		if(self.aivar[AIV_IMPORTANT] == ID_SNAPPER)
		{
			CreateInvItems(self,ItAt_Claws_01,1);
		};
		if(self.aivar[AIV_IMPORTANT] == ID_RAZOR)
		{
			CreateInvItems(self,ItAt_Claws_01,3);
		};
		if(self.aivar[AIV_IMPORTANT] == ID_ORCBITER)
		{
			CreateInvItems(self,ItAt_Claws_01,2);
		};
		if((self.aivar[AIV_IMPORTANT] == ID_LURKER) && (self.level == 17))
		{
			CreateInvItems(self,ItAt_Lurker_01,2);
		};
	};
	if(Knows_GetFur == TRUE)
	{
//		if(self.aivar[AIV_IMPORTANT] == ID_WOLF)
//		{
//			CreateInvItems(self,ItAt_Wolf_01,1);
//		};
//		if(self.aivar[AIV_IMPORTANT] == ID_BLACKWOLF)
//		{
//			CreateInvItems(self,ItAt_Wolf_02,1);
//		};
//		if(self.aivar[AIV_IMPORTANT] == ID_SHADOWBEAST)
//		{
//			CreateInvItems(self,ItAt_Shadow_01,1);
//		};
//		if(self.aivar[AIV_IMPORTANT] == ID_TROLL)
//		{
//			CreateInvItems(self,ItAt_Troll_01,1);
//		};
	};
	if(Knows_GetHide == TRUE)
	{
		if(self.aivar[AIV_IMPORTANT] == ID_LURKER)
		{
			CreateInvItems(self,ItAt_Lurker_02,1);
		};
		if(self.aivar[AIV_IMPORTANT] == ID_SWAMPSHARK)
		{
			CreateInvItems(self,ItAt_Swampshark_01,1);
		};
	};
	if(Knows_GetMCMandibles == TRUE)
	{
		if(self.aivar[AIV_IMPORTANT] == ID_MINECRAWLER)
		{
			CreateInvItems(self,ItAt_Crawler_01,1);
		};
		if(self.aivar[AIV_IMPORTANT] == ID_MINECRAWLERWARRIOR)
		{
			CreateInvItems(self,ItAt_Crawler_01,1);
		};
	};
	if(Knows_GetMCPlates == TRUE)
	{
		if(self.aivar[AIV_IMPORTANT] == ID_MINECRAWLERWARRIOR)
		{
			CreateInvItems(self,ItAt_Crawler_02,2);
		};
	};
	if(Knows_GetBFSting == TRUE)
	{
		if(self.aivar[AIV_IMPORTANT] == ID_BLOODFLY)
		{
			CreateInvItems(self,ItAt_Bloodfly_02,1);
		};
	};
	if(Knows_GetUluMulu == TRUE)
	{
		if(self.aivar[AIV_IMPORTANT] == ID_FIREWARAN)
		{
			CreateInvItems(self,ItAt_Waran_01,1);
		};
		if(self.aivar[AIV_IMPORTANT] == ID_SHADOWBEAST)
		{
			CreateInvItems(self,ItAt_Shadow_02,1);
		};
		if(self.aivar[AIV_IMPORTANT] == ID_SWAMPSHARK)
		{
			CreateInvItems(self,ItAt_Swampshark_02,3);
		};
		if(self.aivar[AIV_IMPORTANT] == ID_TROLL)
		{
			CreateInvItems(self,ItAt_Troll_02,2);
		};
	};
	self.aivar[AIV_MM_DEATHINVGIVEN] = TRUE;
};

func void B_DeathCounter()
{
	if(self.aivar[AIV_MM_REAL_ID] == ID_WOLF)
	{
		Knows_Wolf_prcnt +=10;
	};
};