
instance INFO_ORCWARRIOR1_EXIT(C_Info)
{
	npc = OrcWarrior1;
	nr = 999;
	condition = info_orc_exit_condition;
	information = info_orc_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int info_orc_exit_condition()
{
	return TRUE;
};

func void info_orc_exit_info()
{
	AI_StopProcessInfos(self);
};


instance INFO_ORCWARRIOR2_EXIT(C_Info)
{
	npc = OrcWarrior2;
	nr = 999;
	condition = info_orc_exit_condition;
	information = info_orc_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

instance INFO_ORCWARRIOR3_EXIT(C_Info)
{
	npc = OrcWarrior3;
	nr = 999;
	condition = info_orc_exit_condition;
	information = info_orc_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

instance INFO_ORCWARRIOR4_EXIT(C_Info)
{
	npc = OrcWarrior4;
	nr = 999;
	condition = info_orc_exit_condition;
	information = info_orc_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

instance INFO_ORCSCOUT_EXIT(C_Info)
{
	npc = OrcScout;
	nr = 999;
	condition = info_orc_exit_condition;
	information = info_orc_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

instance INFO_ORCPEASANTDRUM_EXIT(C_Info)
{
	npc = OrcPeasantDrum;
	nr = 999;
	condition = info_orc_exit_condition;
	information = info_orc_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

instance INFO_ORCPEASANTDANCE_EXIT(C_Info)
{
	npc = OrcPeasantDance;
	nr = 999;
	condition = info_orc_exit_condition;
	information = info_orc_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

instance INFO_ORCPEASANTEATANDDRINK_EXIT(C_Info)
{
	npc = OrcPeasantEatAndDrink;
	nr = 999;
	condition = info_orc_exit_condition;
	information = info_orc_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

instance INFO_ORCSCOUTGYD_EXIT(C_Info)
{
	npc = OrcScoutGYD;
	nr = 999;
	condition = info_orc_exit_condition;
	information = info_orc_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

instance INFO_ORCSHAMAN2_EXIT(C_Info)
{
	npc = OrcShaman;
	nr = 999;
	condition = info_orc_exit_condition;
	information = info_orc_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};

