func void ZS_RespawnWait()
{
	if(B_Npc_GetID(self) != ID_EGG)
	{
		if(self.aivar[AIV_MM_REAL_ID] == ID_MOLERAT)
		{
			Wld_InsertNpc(Molerat_Egg,self.wp);
			self.aivar[AIV_MM_DEAD_Timestamp] = getTimestamp();
			return;
		}
		else if(self.aivar[AIV_MM_REAL_ID] == ID_MOLERAT_BIG)
		{
			Wld_InsertNpc(Molerat_Egg_Big,self.wp);
			self.aivar[AIV_MM_DEAD_Timestamp] = getTimestamp();
			return;
		}
		else if(self.aivar[AIV_MM_REAL_ID] == ID_MOLERAT_YANG)
		{
			Wld_InsertNpc(Molerat_Egg_Yang,self.wp);
			self.aivar[AIV_MM_DEAD_Timestamp] = getTimestamp();
			return;
		}
		else if(self.aivar[AIV_MM_REAL_ID] == ID_SCAVENGER)
		{
			Wld_InsertNpc(Scavenger_Egg,self.wp);
			self.aivar[AIV_MM_DEAD_Timestamp] = getTimestamp();
			return;
		}
		else if(self.aivar[AIV_MM_REAL_ID] == ID_SCAVENGER_YANG)
		{
			Wld_InsertNpc(Scavenger_Egg_Yang,self.wp);
			self.aivar[AIV_MM_DEAD_Timestamp] = getTimestamp();
			return;
		}
		else if(self.aivar[AIV_MM_REAL_ID] == ID_WOLF)
		{
			Print("WOLF WAS RESPAWNED");
			Wld_InsertNpc(Wolf_Egg,self.wp);
			self.aivar[AIV_MM_DEAD_Timestamp] = getTimestamp();
			return;
		}
		else if(self.aivar[AIV_MM_REAL_ID] == ID_BLOODFLY)
		{
			Wld_InsertNpc(Bloodfly_Egg,self.wp);
			self.aivar[AIV_MM_DEAD_Timestamp] = getTimestamp();
			return;
		}
		else if(self.aivar[AIV_MM_REAL_ID] == ID_WARAN)
		{
			Wld_InsertNpc(Waran_Egg,self.wp);
			self.aivar[AIV_MM_DEAD_Timestamp] = getTimestamp();
			return;
		}
		else if(self.aivar[AIV_MM_REAL_ID] == ID_LURKER)
		{
			Wld_InsertNpc(Lurker_Egg,self.wp);
			self.aivar[AIV_MM_DEAD_Timestamp] = getTimestamp();
			return;
		}
		else if(self.aivar[AIV_MM_REAL_ID] == ID_SNAPPER)
		{
			Wld_InsertNpc(Snapper_Egg,self.wp);
			self.aivar[AIV_MM_DEAD_Timestamp] = getTimestamp();
			return;
		}
		else if(self.aivar[AIV_MM_REAL_ID] == ID_RAZOR)
		{
			Wld_InsertNpc(Razor_Egg,self.wp);
			self.aivar[AIV_MM_DEAD_Timestamp] = getTimestamp();
			return;
		}
		else if(self.aivar[AIV_MM_REAL_ID] == ID_BLOODHOUND)
		{
			Wld_InsertNpc(Bloodhound_Egg,self.wp);
			self.aivar[AIV_MM_DEAD_Timestamp] = getTimestamp();
			return;
		}
		else if(self.aivar[AIV_MM_REAL_ID] == ID_ORCBITER)
		{
			Wld_InsertNpc(OrcBiter_Egg,self.wp);
			self.aivar[AIV_MM_DEAD_Timestamp] = getTimestamp();
			return;
		}
		else if(self.aivar[AIV_MM_REAL_ID] == ID_ORCDOG)
		{
			Wld_InsertNpc(OrcDog_Egg,self.wp);
			self.aivar[AIV_MM_DEAD_Timestamp] = getTimestamp();
			return;
		};
	};
};
func int ZS_RespawnWait_Loop()
{
	if(Npc_GetDeadTime(self) + self.spawnDelay < getTimestamp())
	{
		return LOOP_END;
	};
	return LOOP_CONTINUE;
};
func void ZS_RespawnWait_End()
{
	Npc_SetHP(self,0);
	if(Hlp_GetInstanceID(Scavenger_Egg) == Hlp_GetInstanceID(self))
	{
		Wld_InsertNpc(Scavenger,self.wp);
	}
	else if(Hlp_GetInstanceID(Scavenger_Egg_Yang) == Hlp_GetInstanceID(self))
	{
		Wld_InsertNpc(YScavenger,self.wp);
	}
	else if(Hlp_GetInstanceID(Molerat_Egg) == Hlp_GetInstanceID(self))
	{
		Wld_InsertNpc(Molerat,self.wp);
	}
	else if(Hlp_GetInstanceID(Molerat_Egg_Yang) == Hlp_GetInstanceID(self))
	{
		Wld_InsertNpc(YMolerat,self.wp);
	}
	else if(Hlp_GetInstanceID(Molerat_Egg_Big) == Hlp_GetInstanceID(self))
	{
		Wld_InsertNpc(Molerat_Big,self.wp);
	}
	else if(Hlp_GetInstanceID(Wolf_Egg) == Hlp_GetInstanceID(self))
	{
		Wld_InsertNpc(Wolf,self.wp);
	};
};
