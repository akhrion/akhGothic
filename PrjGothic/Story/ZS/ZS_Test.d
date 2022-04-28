func void ZS_Test()
{
	PrintDebugNpc(PD_TA_FRAME,"ZS_Test");
	B_SetPerception(self);
	AI_SetWalkMode(self,NPC_WALK);
//	AI_GotoWP(self,self.wp);
	AI_GotoWP(self,Npc_GetNearestWP(self));
	AI_AlignToWP(self);
};
func int ZS_Test_Loop()
{
    var string wpBottom; wpBottom = "OW_PATH_196";
    var string wpUp; wpUp = "CASTLE_TOWER_TOP";
    const string towerClimbing[14] = {
        "CASTLE_08",
        "CASTLE_09",
		"CASTLE_02_MOVEMENT3",
		"CASTLE_MOVEMENT_STRAIGHT3",
        "OW_PATH_196",
        "CASTLE_TOWER_01",
        "CASTLE_TOWER_02",
        "CASTLE_TOWER_03",
        "CASTLE_TOWER_04",
        "CASTLE_TOWER_05",
        "CASTLE_TOWER_06",
        "CASTLE_TOWER_07",
        "CASTLE_TOWER_08",
        "CASTLE_TOWER_09"
    };
    if(Npc_IsInFightMode(hero,FMODE_FIST))
    {
		Print("111111111111");
        AI_GotoWP(self,wpUp);
		return LOOP_CONTINUE;
    }
    else
    {
		Print("22222222222");
//        AI_GotoWP(self,wpBottom);
		AI_GotoWP(self,towerClimbing[0]);
		AI_GotoWP(self,towerClimbing[1]);
		AI_GotoWP(self,towerClimbing[2]);
		AI_GotoWP(self,towerClimbing[3]);
		return LOOP_CONTINUE;
    };
	return LOOP_END;
};
func void ZS_Test_End()
{

};
