func void Npc_SetSpecStateTik(var C_NPC npc,var int state)
{
	if(!isFlagsContainCategorie(npc.aivar[AIV_SpecStatesTiks],state))
	{
		npc.aivar[AIV_SpecStatesTiks] += SST_BLEEDING;
	};
};
func void Npc_RemSpecStateTik(var C_NPC npc,var int state)
{
	if(isFlagsContainCategorie(npc.aivar[AIV_SpecStatesTiks],state))
	{
		npc.aivar[AIV_SpecStatesTiks] -= SST_BLEEDING;
	};
};
func int Npc_HasSpecStateTik(var C_NPC npc,var int state)
{
	if(isFlagsContainCategorie(npc.aivar[AIV_SpecStatesTiks],state))
	{
		return true;
	};
	return false;
};
func int Npc_HasBleeding(var C_NPC npc)
{
	if(isFlagsContainCategorie(npc.aivar[AIV_VisualType],VT_BLOODY))
	{
		return true;
	};
	return false;
};
func void Npc_HealBleading(var C_NPC npc)
{
	PrintDebug("Npc_HealBleading..");
	if(isFlagsContainCategorie(npc.aivar[AIV_VisualType],VT_BLOODY))
	{
		if(Npc_HasHealPotion(npc))
		{
			npc.aivar[AIV_MM_VisualType] -= VT_BLOODY;
			AI_StartState(npc,ZS_HealSelf,0,"");
		};
	};
};
func void Npc_ReactToSelfSpecStates(var C_NPC npc)
{
	PrintDebug("Npc_ReactToSelfSpecStates..");
	if(Npc_IsInState(npc,ZS_Flee))
	{
		return;
	};
	if(Npc_HasBleeding(npc))
	{
		if(C_NpcIsWorker(npc))
			{
				if(Npc_GetHPPcnt(npc) < 50)
				{
					if(Npc_InFight(npc))
					{
						AI_StartState(npc,ZS_Flee,0,"");
					}
					else
					{
						Npc_HealBleading(npc);
					};
				};
		}
		else
		{
			if(Npc_InFight(npc))
			{
				if(Npc_GetHPPcnt(npc) < 20)
				{
					AI_StartState(npc,ZS_Flee,0,"");
				};
			}
			else
			{
				Npc_HealBleading(npc);
			};
		};
	};
};
func void B_SpecStateTriger_Bleeding(var C_NPC slf,var C_NPC oth)
{
	if(slf.aivar[AIV_MM_REAL_ID] == ID_WOLF)
	{
		if(Hlp_Random(100) < NPC_BLEEDING_CHANCE_WOLF)
		{
			PrintDebug("70% get Bleeding wound by Wolf");
			if(!isFlagsContainCategorie(oth.aivar[AIV_MM_VisualType],VT_BLOODY))
			{
				oth.aivar[AIV_MM_VisualType] += VT_BLOODY;
			};
		};
	};
};

func void B_SpecStateHandler_Bleeding(var C_NPC npc)
{
	PrintDebug("akh_test_bleeding_perception");
	if(isFlagsContainCategorie(npc.aivar[AIV_MM_VisualType], VT_BLOODY))
	{
		if(!(getTimestamp() % (NPC_BLEEDING_TIK_PER_GAME_MINS * 2)))
		{
			PrintDebug("One time in each NPC_BLEEDING_TIK_PER_SECS sec.");
			if(!Npc_HasSpecStateTik(npc,SST_BLEEDING))
			{
				Npc_SetSpecStateTik(npc,SST_BLEEDING);
				npc.attribute[ATR_HITPOINTS] -=1;
			};
		}
		else
		{
			if(Npc_HasSpecStateTik(npc,SST_BLEEDING))
			{
				Npc_RemSpecStateTik(npc,SST_BLEEDING);
				npc.attribute[ATR_HITPOINTS] -=1;
			};
		};
	};
};
func void B_SpecStateHandler_Bleeding_Old(var C_NPC npc)
{
	if(isFlagsContainCategorie(npc.aivar[AIV_MM_VisualType], VT_BLOODY))
	{
		if(!Npc_GetStateTime(npc) % NPC_BLEEDING_TIK_PER_SECS)
		{
			PrintDebug("One time in each NPC_BLEEDING_TIK_PER_SECS sec.");
			if(!Npc_HasSpecStateTik(npc,SST_BLEEDING))
			{
				Npc_SetSpecStateTik(npc,SST_BLEEDING);
				npc.attribute[ATR_HITPOINTS] -=1;
			};
		}
		else
		{
			Npc_RemSpecStateTik(npc,SST_BLEEDING);
		};
	};
};
func void B_SpecStatesTriger(var C_NPC slf, var C_NPC oth)
{
	PrintDebug("B_SpecStates..");
	PrintDebug("Should be invoked from any loop.");
	B_SpecStateTriger_Bleeding(slf,oth);
};

func void B_SpecStatesHandler(var C_NPC npc)
{
//	B_SpecStateHandler_Bleeding_Old(npc);
	B_SpecStateHandler_Bleeding(npc);
	Npc_ReactToSelfSpecStates(npc);
};
