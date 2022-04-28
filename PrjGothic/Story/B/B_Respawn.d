func void makeMeStronger(var c_npc slf_)
{
	slf_.attribute[ATR_STRENGTH] +=4;
	slf_.attribute[ATR_DEXTERITY] +=4;
	slf_.attribute[ATR_HITPOINTS_MAX] +=28;
	slf_.attribute[ATR_HITPOINTS] = slf_.attribute[ATR_HITPOINTS_MAX];
};
func void B_Respawn()
{
	if(!C_NpcIsMonster(self)){return;};
	if(self.aivar[AIV_MM_REAL_ID] == ID_MEATBUG)
	{
		Wld_InsertNpc(Hlp_GetInstanceID(self),Npc_GetNearestWP(self));
		return;
	};
	AI_StartState(self,ZS_RespawnWait,0,"");
//	TA_Min(self,1,0,23,0,ZS_RespawnWait,"");
	//	insertNew(Hlp_GetInstanceID(self),self.spawnPoint,getTimestamp(),10);
//	Wld_InsertNpc(Hlp_GetInstanceID(self),"WP_INTRO01");
};
