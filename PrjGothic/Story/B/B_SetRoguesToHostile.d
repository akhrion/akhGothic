
func void B_SetRoguesToHostile()
{
	var C_Npc Renyu;
	var C_Npc Killian;
	var C_Npc Jacko;
	var C_Npc weg1501;
	var C_Npc weg1502;
	var C_Npc weg1503;
	var C_Npc weg1504;
	weg1501 = Hlp_GetNpc(Non_1501_Wegelagerer);
	Npc_SetTempAttitude(weg1501,ATT_HOSTILE);
	Npc_SetAttitude(weg1501,ATT_HOSTILE);
	weg1502 = Hlp_GetNpc(Non_1502_Wegelagerer);
	Npc_SetTempAttitude(weg1502,ATT_HOSTILE);
	Npc_SetAttitude(weg1502,ATT_HOSTILE);
	weg1503 = Hlp_GetNpc(Non_1503_Wegelagerer);
	Npc_SetTempAttitude(weg1503,ATT_HOSTILE);
	Npc_SetAttitude(weg1503,ATT_HOSTILE);
	weg1504 = Hlp_GetNpc(Non_1504_Wegelagerer);
	Npc_SetTempAttitude(weg1504,ATT_HOSTILE);
	Npc_SetAttitude(weg1504,ATT_HOSTILE);
};

