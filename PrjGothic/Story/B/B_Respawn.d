func void ZS_WaitRespawn()
{
	Print("ZS_WaitRespawn");
	B_SetImmortal(self);
};
func int ZS_WaitRespawn_Loop()
{
	Print("ZS_WaitRespawn_Loop");
	if(self.aivar[AIV_MM_DEAD_Timestamp] + self.spawnDelay > getTimestamp())
	{
		return LOOP_CONTINUE;
	};
	return LOOP_END;
};
func void ZS_WaitRespawn_End()
{
	Print("ZS_WaitRespawn_End");
//	var C_NPC npc;
//	npc = Hlp_GetNpc(self);
//	Wld_RemoveNpc(Hlp_GetInstanceID(Scavenger));
//	Wld_InsertNpc(Hlp_GetInstanceID(self),self.wp);	//work..
//	npc.spawnPoint = npc.wp;
//	AI_Teleport(npc,npc.wp);
//	B_ClearImmortal(npc);
//	npc.start_aistate = ZS_MM_AllScheduler;
};
func void spawn()
{
	if(self.spawnDelay)
	{
//		SpawnDoll();
//		Wld_InsertNpc(7081,SPAWN_POINT_DEF);							//won't work..
		var C_NPC npc;
		npc = Hlp_GetNpc(self);
		Print(npc.wp);
		Wld_InsertNpc(Hlp_GetInstanceID(self),SPAWN_POINT_DEF);	//work..
		self.aivar[AIV_MM_DEAD_Timestamp] = getTimestamp();
		self.wp = npc.wp;
		ZS_WaitRespawn();
//		self.start_aistate = ZS_WaitRespawn;
	};
};
func void makeMeStronger(var c_npc slf_)
{
	slf_.attribute[ATR_STRENGTH] +=4;
	slf_.attribute[ATR_DEXTERITY] +=4;
	slf_.attribute[ATR_HITPOINTS_MAX] +=28;
	slf_.attribute[ATR_HITPOINTS] = slf_.attribute[ATR_HITPOINTS_MAX];
};
func void B_Respawn()
{
	if(self.aivar[AIV_MM_REAL_ID] == ID_MEATBUG)
	{
		Wld_InsertNpc(Hlp_GetInstanceID(self),self.wp);
	};
//	insertNew(Hlp_GetInstanceID(self),self.spawnPoint,getTimestamp(),10);
//	Wld_InsertNpc(Hlp_GetInstanceID(self),"WP_INTRO01");
};
