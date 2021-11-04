
func void On_OCC_GATE_Trigger()
{
	var C_Npc wache1;
	var C_Npc wache2;
	PrintDebugNpc(PD_TA_CHECK,"On_OCC_GATE_Trigger");
	wache1 = Hlp_GetNpc(Grd_213_Torwache);
	wache1.aivar[AIV_Trigger3] = 1;
	wache2 = Hlp_GetNpc(Grd_212_Torwache);
	wache2.aivar[AIV_Trigger3] = 1;
	if((wache1.aivar[AIV_PASSGATE] != TRUE) && (Kapitel < 4))
	{
		if(!Npc_IsDead(wache1))
		{
			B_FullStop(wache1);
			AI_StopProcessInfos(wache1);
			B_IntruderAlert(wache1,other);
			B_SetAttackReason(wache1,AIV_AR_INTRUDER);
			Npc_SetTarget(wache1,hero);
			AI_StartState(wache1,ZS_Attack,1,"");
		};
		if(!Npc_IsDead(wache2))
		{
			B_FullStop(wache2);
			AI_StopProcessInfos(wache2);
			B_IntruderAlert(wache2,other);
			B_SetAttackReason(wache2,AIV_AR_INTRUDER);
			Npc_SetTarget(wache2,hero);
			AI_StartState(wache2,ZS_Attack,1,"");
		};
	};
};

func void On_OCR_NORTHGATE_Trigger()
{
	var C_Npc wache;
	PrintDebugNpc(PD_TA_CHECK,"On_OCR_NORTHGATE_Trigger");
	wache = Hlp_GetNpc(GRD_216_Torwache);
	wache.aivar[AIV_Trigger3] = 1;
	wache = Hlp_GetNpc(GRD_217_Torwache);
	wache.aivar[AIV_Trigger3] = 1;
};

func void On_OCR_MAINGATE_Trigger()
{
	var C_Npc wache;
	PrintDebugNpc(PD_TA_CHECK,"On_OCR_MAINGATE_Trigger");
	wache = Hlp_GetNpc(GRD_215_Torwache);
	wache.aivar[AIV_Trigger3] = 1;
	wache = Hlp_GetNpc(GRD_214_Torwache);
	wache.aivar[AIV_Trigger3] = 1;
};

func void On_OCC_BARONSDOOR_Trigger()
{
	var C_Npc wache1;
	var C_Npc wache2;
	PrintDebugNpc(PD_TA_CHECK,"On_OCC_BARONSDOOR_Trigger");
	wache1 = Hlp_GetNpc(Grd_218_Gardist);
	wache1.aivar[AIV_Trigger3] = 1;
	wache2 = Hlp_GetNpc(GRD_245_Gardist);
	wache2.aivar[AIV_Trigger3] = 1;
	if((wache1.aivar[AIV_PASSGATE] != TRUE) && (Kapitel < 4))
	{
		if(!Npc_IsDead(wache1))
		{
			B_FullStop(wache1);
			AI_StopProcessInfos(wache1);
			B_IntruderAlert(wache1,other);
			B_SetAttackReason(wache1,AIV_AR_INTRUDER);
			Npc_SetTarget(wache1,hero);
			AI_StartState(wache1,ZS_Attack,1,"");
		};
		if(!Npc_IsDead(wache2))
		{
			B_FullStop(wache2);
			AI_StopProcessInfos(wache2);
			B_IntruderAlert(wache2,other);
			B_SetAttackReason(wache2,AIV_AR_INTRUDER);
			Npc_SetTarget(wache2,hero);
			AI_StartState(wache2,ZS_Attack,1,"");
		};
	};
};

func void on_psi_labdoor_trigger()
{
	var C_Npc wache;
	PrintDebugNpc(PD_TA_CHECK,"ON_PSI_LABDOOR_TRIGGER");
	wache = Hlp_GetNpc(TPL_1406_Templer);
	wache.aivar[AIV_Trigger3] = 1;
};

func void on_psi_temple_gate_trigger()
{
	var C_Npc wache;
	var C_Npc wache1;
	var C_Npc wache2;
	PrintDebugNpc(PD_TA_CHECK,"ON_PSI_TEMPLE_GATE_TRIGGER");
	wache = Hlp_GetNpc(TPL_1413_Templer);
	wache.aivar[AIV_Trigger3] = 1;
	wache = Hlp_GetNpc(TPL_1430_Templer);
	wache.aivar[AIV_Trigger3] = 1;
	wache = Hlp_GetNpc(TPL_1431_Templer);
	wache.aivar[AIV_Trigger3] = 1;
	wache = Hlp_GetNpc(TPL_1432_Templer);
	wache.aivar[AIV_Trigger3] = 1;
	wache1 = Hlp_GetNpc(TPL_1441_Templer);
	wache2 = Hlp_GetNpc(TPL_1442_Templer);
	if(Kapitel == 1)
	{
		if(!Npc_IsDead(wache1))
		{
			B_FullStop(wache1);
			AI_StopProcessInfos(wache1);
			B_IntruderAlert(wache1,other);
			B_SetAttackReason(wache1,AIV_AR_INTRUDER);
			Npc_SetTarget(wache1,hero);
			AI_StartState(wache1,ZS_Attack,1,"");
		};
		if(!Npc_IsDead(wache2))
		{
			B_FullStop(wache2);
			AI_StopProcessInfos(wache2);
			B_IntruderAlert(wache2,other);
			B_SetAttackReason(wache2,AIV_AR_INTRUDER);
			Npc_SetTarget(wache2,hero);
			AI_StartState(wache2,ZS_Attack,1,"");
		};
	};
};

func void on_nc_mageramp_trigger()
{
	var C_Npc wache;
	PrintDebugNpc(PD_TA_CHECK,"ON_NC_MAGERAMP_TRIGGER");
	wache = Hlp_GetNpc(SLD_702_Soeldner);
	wache.aivar[AIV_Trigger3] = 1;
	wache = Hlp_GetNpc(SLD_731_Soeldner);
	wache.aivar[AIV_Trigger3] = 1;
};

func void on_nc_mages_trigger()
{
	var C_Npc wache1;
	var C_Npc wache2;
	wache1 = Hlp_GetNpc(SLD_723_Soeldner);
	wache2 = Hlp_GetNpc(SLD_732_Soeldner);
	if(wache1.aivar[AIV_PASSGATE] != TRUE)
	{
		if(!Npc_IsDead(wache1))
		{
			B_FullStop(wache1);
			AI_StopProcessInfos(wache1);
			B_IntruderAlert(wache1,other);
			B_SetAttackReason(wache1,AIV_AR_INTRUDER);
			Npc_SetTarget(wache1,hero);
			AI_StartState(wache1,ZS_Attack,1,"");
		};
		if(!Npc_IsDead(wache2))
		{
			B_FullStop(wache2);
			AI_StopProcessInfos(wache2);
			B_IntruderAlert(wache2,other);
			B_SetAttackReason(wache2,AIV_AR_INTRUDER);
			Npc_SetTarget(wache2,hero);
			AI_StartState(wache2,ZS_Attack,1,"");
		};
	};
};

func void on_nc_bar_trigger()
{
	var C_Npc wache1;
	var C_Npc wache2;
	wache1 = Hlp_GetNpc(ORG_875_Tuersteher);
	wache2 = Hlp_GetNpc(ORG_876_Tuersteher);
	if(wache2.aivar[AIV_PASSGATE] != TRUE)
	{
		if(!Npc_IsDead(wache1))
		{
			B_FullStop(wache1);
			AI_StopProcessInfos(wache1);
			B_IntruderAlert(wache1,other);
			B_SetAttackReason(wache1,AIV_AR_INTRUDER);
			Npc_SetTarget(wache1,hero);
			AI_StartState(wache1,ZS_Attack,1,"");
		};
		if(!Npc_IsDead(wache2))
		{
			B_FullStop(wache2);
			AI_StopProcessInfos(wache2);
			B_IntruderAlert(wache2,other);
			B_SetAttackReason(wache2,AIV_AR_INTRUDER);
			Npc_SetTarget(wache2,hero);
			AI_StartState(wache2,ZS_Attack,1,"");
		};
	};
};

func void on_nc_magecave_trigger()
{
	var C_Npc wache;
	PrintDebugNpc(PD_TA_CHECK,"ON_NC_MAGECAVE_TRIGGER");
	wache = Hlp_GetNpc(SLD_725_Soeldner);
	wache.aivar[AIV_Trigger3] = 1;
	wache = Hlp_GetNpc(SLD_726_Soeldner);
	wache.aivar[AIV_Trigger3] = 1;
};

func void on_nc_gate_trigger()
{
	PrintDebugNpc(PD_TA_CHECK,"ON_NC_GATE_TRIGGER");
};

