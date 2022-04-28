func void B_Revive(var C_NPC npc)
{
	if(B_Npc_GetID(npc) == ID_SKELETON)
	{
		Wld_InsertNpc(Skeleton_Revive,Npc_GetNearestWP(npc));
		B_Npc_SetLastTargetByID(self,B_Npc_GetLastTargetID(npc));
		B_Npc_SetMana(self,B_Npc_GetMana(npc));
		Npc_SetDeadTime(self);
	}
	else if(B_Npc_GetID(npc) == ID_TEST_SKELETON)
	{
		Wld_InsertNpc(Test_Skeleton_Revive,Npc_GetNearestWP(npc));
		B_Npc_SetLastTargetByID(self,B_Npc_GetLastTargetID(npc));
		B_Npc_SetMana(self,B_Npc_GetMana(npc));
		Npc_SetDeadTime(self);
	}
	else if(B_Npc_GetID(npc) == ID_ZOMBIE)
	{
		Wld_InsertNpc(Zombie_Revive,Npc_GetNearestWP(npc));
		B_Npc_SetLastTargetByID(self,B_Npc_GetLastTargetID(npc));
		B_Npc_SetMana(self,B_Npc_GetMana(npc));
		Npc_SetDeadTime(self);
	};
//	PrintSSS(self.name[0],"===============",IntToString(self.aivar[AIV_LASTTARGET]));
};


func void ZS_Revive()
{
	if(B_Npc_GetID(self) != ID_REVIVE)
	{
		if(B_Npc_GetID(self) == ID_SKELETON)
		{
			Wld_InsertNpc(Skeleton_Revive,self.wp);
			return;
		}
		else if(B_Npc_GetID(self) == ID_ZOMBIE)
		{
			Wld_InsertNpc(Zombie_Revive,self.wp);
			return;
		};
	};
};
func int ZS_Revive_Loop()
{
	if(B_Npc_IsTimeForRespawn(self))
	{
		return LOOP_END;
	};
	return LOOP_CONTINUE;
};
func void ZS_Revive_End()
{
	var C_NPC Egg;
	var C_NPC lastTarget;
	var int npcInstance;
	Egg = Hlp_GetNpc(self);
	Npc_SetHP(Egg,0);
	if(B_Npc_GetID(Skeleton_Revive) == B_Npc_GetID(Egg))
	{
		Wld_InsertNpc(Skeleton,Egg.wp);
	}
	else if(B_Npc_GetID(Test_Skeleton_Revive) == B_Npc_GetID(Egg))
	{
		Wld_InsertNpc(Test_Skeleton,Egg.wp);
	}
	else if(B_Npc_GetID(Zombie_Revive) == B_Npc_GetID(Egg))
	{
		Wld_InsertNpc(Zombie,Egg.wp);
	};
	if(B_Npc_GetID(self) == B_Npc_GetID(Egg)){return;};
	Npc_SetDeadTime(self);
	B_Npc_SetHP_AfterRevive(self,Egg);
	B_Npc_SetLastTargetByID(self,B_Npc_GetLastTargetID(Egg));
	npcInstance = B_Npc_GetLastTargetID(Egg);
	lastTarget = Hlp_GetNpc(npcInstance);
//	PrintSSS(self.name[0],"==ZS_Revive_End==",IntToString(B_Npc_GetLastTargetID(Egg)));
//	PrintSSS("","ZS_Revive_End",lastTarget.name[0]);
	Npc_SetTarget(self,lastTarget);
	AI_StartState(self,ZS_MM_Attack,0,"");
};
