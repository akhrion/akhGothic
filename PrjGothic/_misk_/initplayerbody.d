
const int ARMOR_VALUE_MULTIPLIER = 6;
const int ARMOR_VALUE_DECREASE = 5;
const int VALUE_TPL_ARMOR_L = 1350;
const int VALUE_TPL_ARMOR_M = 1650;
const int VALUE_TPL_ARMOR_H = 2100;
const int VALUE_STT_ARMOR_M = 750;
const int VALUE_STT_ARMOR_H = 1200;
const int VALUE_GRD_ARMOR_L = 1350;
const int VALUE_GRD_ARMOR_M = 1650;
const int VALUE_GRD_ARMOR_H = 3000;
const int VALUE_KDF_ARMOR_L = 1200;
const int VALUE_KDF_ARMOR_H = 1500;
const int VALUE_KDW_ARMOR_L = 1950;
const int VALUE_KDW_ARMOR_H = 2600;
const int VALUE_ORG_ARMOR_L = 750;
const int VALUE_ORG_ARMOR_M = 1050;
const int VALUE_ORG_ARMOR_H = 1200;
const int VALUE_SLD_ARMOR_L = 1350;
const int VALUE_SLD_ARMOR_M = 1650;
const int VALUE_SLD_ARMOR_H = 2600;
const int VALUE_NOV_ARMOR_L = 500;
const int VALUE_NOV_ARMOR_M = 750;
const int VALUE_NOV_ARMOR_H = 1200;
const int VALUE_VLK_ARMOR_L = 250;
const int VALUE_VLK_ARMOR_M = 500;
const int VALUE_SFB_ARMOR_L = 250;

func void initplayerbody(var int equipment)
{
	var C_Item armor;
	if(equipment == 0)
	{
		Mdl_SetVisualBody(self,"hum_body_Naked0",4,1,"Hum_Head_Pony",9,0,-1);
	}
	else if(equipment == 1)
	{
		Mdl_SetVisualBody(self,"hum_body_Naked0",0,1,"Hum_Head_Pony",9,0,-1);
	}
	else if(equipment == 3)
	{
		if((RUSSOBITMFIXV13 == FALSE) && Npc_KnowsInfo(hero,Info_Diego_Gamestart))
		{
			PrintScreen("����������� ���������� �� ��������������!",50,43,"font_old_10_white.tga",5);
			PrintScreen("����������, ������� ����� ����.",50,40,"font_old_10_white.tga",5);
			hero.attribute[ATR_HITPOINTS] = (hero.attribute[ATR_HITPOINTS] - hero.attribute[ATR_HITPOINTS]) + 10;
		}
		else if(Npc_HasEquippedArmor(hero))
		{
			armor = Npc_GetEquippedArmor(hero);
			if((Hlp_GetInstanceID(armor) == Hlp_GetInstanceID(nov_armor_l)) || (Hlp_GetInstanceID(armor) == Hlp_GetInstanceID(nov_armor_m)) || (Hlp_GetInstanceID(armor) == Hlp_GetInstanceID(nov_armor_h)))
			{
				Mdl_SetVisualBody(hero,"hum_body_Naked0",0,1,"Hum_Head_Pony",9,0,-1);
			}
			else if((Hlp_GetInstanceID(armor) == Hlp_GetInstanceID(tpl_armor_l)) || (Hlp_GetInstanceID(armor) == Hlp_GetInstanceID(tpl_armor_m)) || (Hlp_GetInstanceID(armor) == Hlp_GetInstanceID(tpl_armor_h)))
			{
				Mdl_SetVisualBody(hero,"hum_body_Naked0",0,1,"Hum_Head_Pony",9,0,-1);
			}
			else if((Hlp_GetInstanceID(armor) == Hlp_GetInstanceID(stt_armor_m)) || (Hlp_GetInstanceID(armor) == Hlp_GetInstanceID(stt_armor_h)) || (Hlp_GetInstanceID(armor) == Hlp_GetInstanceID(grd_armor_l)))
			{
				Mdl_SetVisualBody(hero,"hum_body_Naked0",0,1,"Hum_Head_Pony",9,0,-1);
			};
		};
	};
};

func void equip_psi_armor()
{
	if(self.id == 0)
	{
		AI_PlayAni(self,"T_PLUNDER");
		Snd_Play("BACKPACK_HANDLE");
		initplayerbody(1);
	};
};

func void equip_psi_armor2()
{
	if(self.id == 0)
	{
		AI_PlayAni(self,"T_PLUNDER");
		Snd_Play("BACKPACK_APPLY");
		initplayerbody(1);
	};
};

func void equip_sld_armor()
{
	if(self.id == 0)
	{
		AI_PlayAni(self,"T_PLUNDER");
		Snd_Play("BACKPACK_HANDLE");
		Mdl_SetVisualBody(self,"hum_body_Naked0",0,5,"Hum_Head_Pony",11,0,-1);
	};
};

func void testArmor3()
{
	if(self.id == 0)
	{
//		AI_PlayAni(self,"T_PLUNDER");
//		Snd_Play("BACKPACK_HANDLE");
		initplayerbody(3);
//		Mdl_SetVisualBody(self,"hum_body_Naked0",0,5,"Hum_Head_Pony",11,0,-1);
	};
};

func void unequip_psi_armor()
{
	if(self.id == 0)
	{
		initplayerbody(0);
	};
};

func void equip_simple_armor()
{
	if(self.id == 0)
	{
		AI_PlayAni(self,"T_PLUNDER");
		Snd_Play("BACKPACK_HANDLE");
	};
};

func void equip_metal_armor()
{
	if(self.id == 0)
	{
		AI_PlayAni(self,"T_PLUNDER");
		Snd_Play("BACKPACK_APPLY");
	};
};


instance VLK_ARMOR_L(C_Item)
{
	name = "������ ����� ��������";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 10;
	protection[PROT_BLUNT] = 20;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 5;
	protection[PROT_MAGIC] = 0;
	value = value_vlk_armor_l / ARMOR_VALUE_DECREASE;
	disguiseGuild = GIL_VLK;
	wear = WEAR_TORSO;
	visual = "vlkl.3ds";
	visual_change = "Hum_VLKL_ARMOR.asc";
	visual_skin = 0;
	on_equip = equip_simple_armor;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance VLK_ARMOR_M(C_Item)
{
	name = "����� ��������";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 5;
	protection[PROT_BLUNT] = 15;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 5;
	protection[PROT_MAGIC] = 0;
	protection[PROT_FALL] = 100;
	value = value_vlk_armor_m / ARMOR_VALUE_DECREASE;
	disguiseGuild = GIL_VLK;
	wear = WEAR_TORSO;
	visual = "vlkm.3ds";
	visual_change = "Hum_VLKM_ARMOR.asc";
	visual_skin = 0;
	on_equip = equip_simple_armor;
	material = MAT_LEATHER;
	description = name;
//	text[1] = NAME_Prot_Edge;
//	count[1] = protection[PROT_EDGE];
//	text[2] = NAME_Prot_Point;
//	count[2] = protection[PROT_POINT];
	text[3] = Text_GetWeaponProt(NAME_Prot_W,protection[PROT_BLUNT],protection[PROT_EDGE],protection[PROT_POINT]);
//	count[3] = protection[PROT_FIRE];
	text[4] = Text_GetMagicProt(NAME_Prot_M,protection[PROT_FIRE],protection[PROT_FLY],protection[PROT_MAGIC],protection[PROT_FALL]);
//	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance STT_ARMOR_M(C_Item)
{
	name = "������ ��������";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 30;
	protection[PROT_BLUNT] = 30;
	protection[PROT_POINT] = 5;
	protection[PROT_FIRE] = 15;
	protection[PROT_MAGIC] = 0;
	value = value_stt_armor_m / ARMOR_VALUE_DECREASE;
	disguiseGuild = GIL_STT;
	wear = WEAR_TORSO;
	visual = "sttm.3ds";
	visual_change = "Hum_STTM_ARMOR.asc";
	visual_skin = 0;
	on_equip = equip_psi_armor;
	on_unequip = unequip_psi_armor;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance STT_ARMOR_H(C_Item)
{
	name = "������ ��������";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 40;
	protection[PROT_BLUNT] = 40;
	protection[PROT_POINT] = 5;
	protection[PROT_FIRE] = 20;
	protection[PROT_MAGIC] = 0;
	value = value_stt_armor_h / ARMOR_VALUE_DECREASE;
	disguiseGuild = GIL_STT;
	wear = WEAR_TORSO;
	visual = "stth.3ds";
	visual_change = "Hum_STTS_ARMOR.asc";
	visual_skin = 0;
	on_equip = equip_psi_armor;
	on_unequip = unequip_psi_armor;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance GRD_ARMOR_L(C_Item)
{
	name = "������ ������ ���������";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 45;
	protection[PROT_BLUNT] = 45;
	protection[PROT_POINT] = 5;
	protection[PROT_FIRE] = 20;
	protection[PROT_MAGIC] = 0;
	value = value_grd_armor_l / ARMOR_VALUE_DECREASE;
	disguiseGuild = GIL_GRD;
	wear = WEAR_TORSO;
	visual = "grdl.3ds";
	visual_change = "Hum_GRDL_ARMOR.asc";
	visual_skin = 0;
	on_equip = equip_psi_armor;
	on_unequip = unequip_psi_armor;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance GRD_ARMOR_M(C_Item)
{
	name = "������� ������ ���������";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 55;
	protection[PROT_BLUNT] = 55;
	protection[PROT_POINT] = 10;
	protection[PROT_FIRE] = 25;
	protection[PROT_MAGIC] = 0;
	value = value_grd_armor_m / ARMOR_VALUE_DECREASE;
	disguiseGuild = GIL_GRD;
	wear = WEAR_TORSO;
	visual = "grdm.3ds";
	visual_change = "Hum_GRDM_ARMOR.asc";
	visual_skin = 0;
	on_equip = equip_simple_armor;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance GRD_ARMOR_H(C_Item)
{
	name = "������� ������ ���������";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 70;
	protection[PROT_BLUNT] = 70;
	protection[PROT_POINT] = 50;
	protection[PROT_FIRE] = 35;
	protection[PROT_MAGIC] = 0;
	value = value_grd_armor_h / ARMOR_VALUE_DECREASE;
	disguiseGuild = GIL_GRD;
	wear = WEAR_TORSO;
	visual = "grdh.3ds";
	visual_change = "Hum_GRDS_ARMOR.asc";
	visual_skin = 0;
	on_equip = equip_metal_armor;
	material = MAT_METAL;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance EBR_ARMOR_M(C_Item)
{
	name = "������� ������";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 20;
	protection[PROT_BLUNT] = 70;
	protection[PROT_POINT] = 7;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	value = protection[PROT_EDGE] * ARMOR_VALUE_MULTIPLIER;
	disguiseGuild = GIL_EBR;
	wear = WEAR_TORSO;
	ownerGuild = GIL_EBR;
	visual = "ebrm.3ds";
	visual_change = "Hum_EBRM_ARMOR.asc";
	visual_skin = 0;
	on_equip = equip_simple_armor;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance EBR_ARMOR_H(C_Item)
{
	name = "������ ������";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 120;
	protection[PROT_BLUNT] = 120;
	protection[PROT_POINT] = 50;
	protection[PROT_FIRE] = 10;
	protection[PROT_MAGIC] = 0;
	value = protection[PROT_EDGE] * ARMOR_VALUE_MULTIPLIER;
	disguiseGuild = GIL_EBR;
	wear = WEAR_TORSO;
	ownerGuild = GIL_EBR;
	owner = EBR_100_Gomez;
	visual = "ebrh.3ds";
	visual_change = "Hum_EBRS_ARMOR.asc";
	visual_skin = 0;
	on_equip = equip_metal_armor;
	material = MAT_METAL;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance EBR_ARMOR_H2(C_Item)
{
	name = "������� ������ ������";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 100;
	protection[PROT_BLUNT] = 100;
	protection[PROT_POINT] = 50;
	protection[PROT_FIRE] = 20;
	protection[PROT_MAGIC] = 0;
	value = protection[PROT_EDGE] * ARMOR_VALUE_MULTIPLIER;
	disguiseGuild = GIL_EBR;
	wear = WEAR_TORSO;
	visual = "ebrh2.3ds";
	visual_change = "Hum_EBRS_ARMOR2.asc";
	visual_skin = 0;
	on_equip = equip_metal_armor;
	material = MAT_METAL;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance SFB_ARMOR_L(C_Item)
{
	name = "������ ��������";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 10;
	protection[PROT_BLUNT] = 10;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 5;
	protection[PROT_MAGIC] = 0;
	value = value_sfb_armor_l / ARMOR_VALUE_DECREASE;
	disguiseGuild = GIL_SFB;
	wear = WEAR_TORSO;
	visual = "sfbl.3ds";
	visual_change = "Hum_SFBL_ARMOR.asc";
	visual_skin = 0;
	on_equip = equip_simple_armor;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ORG_ARMOR_L(C_Item)
{
	name = "������ ������ ����";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 30;
	protection[PROT_BLUNT] = 30;
	protection[PROT_POINT] = 5;
	protection[PROT_FIRE] = 15;
	protection[PROT_MAGIC] = 0;
	value = value_org_armor_l / ARMOR_VALUE_DECREASE;
	disguiseGuild = GIL_ORG;
	wear = WEAR_TORSO;
	visual = "orgl2.3ds";
	visual_change = "Hum_ORGL_ARMOR.asc";
	visual_skin = 0;
	on_equip = equip_simple_armor;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ORG_ARMOR_M(C_Item)
{
	name = "������� ������ ����";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 35;
	protection[PROT_BLUNT] = 35;
	protection[PROT_POINT] = 5;
	protection[PROT_FIRE] = 15;
	protection[PROT_MAGIC] = 0;
	value = value_org_armor_m / ARMOR_VALUE_DECREASE;
	disguiseGuild = GIL_ORG;
	wear = WEAR_TORSO;
	visual = "orgm.3ds";
	visual_change = "Hum_ORGM_ARMOR.asc";
	visual_skin = 0;
	on_equip = equip_simple_armor;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ORG_ARMOR_H(C_Item)
{
	name = "������� ������ ����";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 40;
	protection[PROT_BLUNT] = 40;
	protection[PROT_POINT] = 5;
	protection[PROT_FIRE] = 20;
	protection[PROT_MAGIC] = 0;
	value = value_org_armor_h / ARMOR_VALUE_DECREASE;
	disguiseGuild = GIL_ORG;
	wear = WEAR_TORSO;
	visual = "orgh.3ds";
	visual_change = "Hum_ORGS_ARMOR.asc";
	visual_skin = 0;
	on_equip = equip_metal_armor;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance SLD_ARMOR_L(C_Item)
{
	name = "������ ������ ��������";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 45;
	protection[PROT_BLUNT] = 45;
	protection[PROT_POINT] = 5;
	protection[PROT_FIRE] = 20;
	protection[PROT_MAGIC] = 0;
	value = value_sld_armor_l / ARMOR_VALUE_DECREASE;
	disguiseGuild = GIL_SLD;
	wear = WEAR_TORSO;
	visual = "sldl.3ds";
	visual_change = "Hum_SLDL_ARMOR.asc";
	visual_skin = 0;
	on_equip = equip_sld_armor;
	on_unequip = unequip_psi_armor;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance SLD_ARMOR_M(C_Item)
{
	name = "������� ������ ��������";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 55;
	protection[PROT_BLUNT] = 55;
	protection[PROT_POINT] = 10;
	protection[PROT_FIRE] = 25;
	protection[PROT_MAGIC] = 0;
	value = value_sld_armor_m / ARMOR_VALUE_DECREASE;
	disguiseGuild = GIL_SLD;
	wear = WEAR_TORSO;
	visual = "sldm.3ds";
	visual_change = "Hum_SLDM_ARMOR.asc";
	visual_skin = 0;
	on_equip = equip_simple_armor;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance SLD_ARMOR_H(C_Item)
{
	name = "������� ������ ��������";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 70;
	protection[PROT_BLUNT] = 70;
	protection[PROT_POINT] = 10;
	protection[PROT_FIRE] = 35;
	protection[PROT_MAGIC] = 0;
	value = value_sld_armor_h / ARMOR_VALUE_DECREASE;
	disguiseGuild = GIL_SLD;
	wear = WEAR_TORSO;
	visual = "sldh.3ds";
	visual_change = "Hum_SLDS_ARMOR.asc";
	visual_skin = 0;
	on_equip = equip_metal_armor;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance NOV_ARMOR_L(C_Item)
{
	name = "������� ����������";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 15;
	protection[PROT_BLUNT] = 15;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 10;
	protection[PROT_MAGIC] = 0;
	value = value_nov_armor_l / ARMOR_VALUE_DECREASE;
	disguiseGuild = GIL_NOV;
	wear = WEAR_TORSO;
	visual = "novl.3ds";
	visual_change = "Hum_NOVL_ARMOR.asc";
	visual_skin = 0;
	on_equip = equip_psi_armor;
	on_unequip = unequip_psi_armor;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance NOV_ARMOR_M(C_Item)
{
	name = "������ ����������";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 30;
	protection[PROT_BLUNT] = 30;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 15;
	protection[PROT_MAGIC] = 0;
	disguiseGuild = GIL_NOV;
	wear = WEAR_TORSO;
	value = value_nov_armor_m / ARMOR_VALUE_DECREASE;
	visual = "novm2.3ds";
	visual_change = "Hum_NOVM_ARMOR.asc";
	visual_skin = 1;
	on_equip = equip_psi_armor;
	on_unequip = unequip_psi_armor;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance NOV_ARMOR_H(C_Item)
{
	name = "������ ����������";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 40;
	protection[PROT_BLUNT] = 40;
	protection[PROT_POINT] = 5;
	protection[PROT_FIRE] = 20;
	protection[PROT_MAGIC] = 0;
	value = value_nov_armor_h / ARMOR_VALUE_DECREASE;
	disguiseGuild = GIL_NOV;
	wear = WEAR_TORSO;
	visual = "novh2.3ds";
	visual_change = "Hum_NOVS_ARMOR.asc";
	visual_skin = 0;
	on_equip = equip_psi_armor;
	on_unequip = unequip_psi_armor;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance TPL_ARMOR_L(C_Item)
{
	name = "������ ������ ������";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 45;
	protection[PROT_BLUNT] = 45;
	protection[PROT_POINT] = 5;
	protection[PROT_FIRE] = 20;
	protection[PROT_MAGIC] = 0;
	value = value_tpl_armor_l / ARMOR_VALUE_DECREASE;
	disguiseGuild = GIL_TPL;
	wear = WEAR_TORSO;
	visual = "tpll.3ds";
	visual_change = "Hum_TPLL_ARMOR.asc";
	visual_skin = 0;
	on_equip = equip_psi_armor;
	on_unequip = unequip_psi_armor;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance TPL_ARMOR_M(C_Item)
{
	name = "������� ������ ������";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 55;
	protection[PROT_BLUNT] = 55;
	protection[PROT_POINT] = 10;
	protection[PROT_FIRE] = 25;
	protection[PROT_MAGIC] = 0;
	value = value_tpl_armor_m / ARMOR_VALUE_DECREASE;
	disguiseGuild = GIL_TPL;
	wear = WEAR_TORSO;
	visual = "tplm.3ds";
	visual_change = "Hum_TPLM_ARMOR.asc";
	visual_skin = 0;
	on_equip = equip_psi_armor;
	on_unequip = unequip_psi_armor;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance TPL_ARMOR_H(C_Item)
{
	name = "������� ������ ������";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 70;
	protection[PROT_BLUNT] = 70;
	protection[PROT_POINT] = 10;
	protection[PROT_FIRE] = 35;
	protection[PROT_MAGIC] = 0;
	value = value_tpl_armor_h / ARMOR_VALUE_DECREASE;
	disguiseGuild = GIL_TPL;
	wear = WEAR_TORSO;
	visual = "tplh.3ds";
	visual_change = "Hum_TPLS_ARMOR.asc";
	visual_skin = 0;
	on_equip = equip_psi_armor2;
	on_unequip = unequip_psi_armor;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance GUR_ARMOR_M(C_Item)
{
	name = "������� ����";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 71;
	protection[PROT_BLUNT] = 71;
	protection[PROT_POINT] = 7;
	protection[PROT_FIRE] = 35;
	protection[PROT_MAGIC] = 3;
	value = protection[PROT_EDGE] * ARMOR_VALUE_MULTIPLIER;
	disguiseGuild = GIL_GUR;
	wear = WEAR_TORSO;
	ownerGuild = GIL_GUR;
	visual = "gurm.3ds";
	visual_change = "Hum_GURM_ARMOR.asc";
	visual_skin = 0;
	on_equip = equip_simple_armor;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance GUR_ARMOR_H(C_Item)
{
	name = "������� ���������� ����";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 82;
	protection[PROT_BLUNT] = 82;
	protection[PROT_POINT] = 8;
	protection[PROT_FIRE] = 41;
	protection[PROT_MAGIC] = 4;
	disguiseGuild = GIL_GUR;
	wear = WEAR_TORSO;
	value = protection[PROT_EDGE] * ARMOR_VALUE_MULTIPLIER;
	ownerGuild = GIL_GUR;
	visual = "gurh.3ds";
	visual_change = "Hum_GURS_ARMOR.asc";
	visual_skin = 0;
	on_equip = equip_simple_armor;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance KDF_ARMOR_L(C_Item)
{
	name = "������ ���� ����";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 40;
	protection[PROT_BLUNT] = 40;
	protection[PROT_POINT] = 5;
	protection[PROT_FIRE] = 25;
	protection[PROT_MAGIC] = 5;
	disguiseGuild = GIL_KDF;
	wear = WEAR_TORSO;
	value = value_kdf_armor_l / ARMOR_VALUE_DECREASE;
	visual = "kdfl.3ds";
	visual_change = "Hum_KDFL_ARMOR.asc";
	visual_skin = 0;
	on_equip = equip_simple_armor;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance KDF_ARMOR_H(C_Item)
{
	name = "������� ������ ���� ����";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 50;
	protection[PROT_BLUNT] = 50;
	protection[PROT_POINT] = 5;
	protection[PROT_FIRE] = 30;
	protection[PROT_MAGIC] = 10;
	disguiseGuild = GIL_KDF;
	wear = WEAR_TORSO;
	value = value_kdf_armor_h / ARMOR_VALUE_DECREASE;
	visual = "kdfh.3ds";
	visual_change = "Hum_KDFS_ARMOR.asc";
	visual_skin = 0;
	on_equip = equip_simple_armor;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance KDW_ARMOR_L(C_Item)
{
	name = "������ ���� ����";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 65;
	protection[PROT_BLUNT] = 65;
	protection[PROT_POINT] = 5;
	protection[PROT_FIRE] = 40;
	protection[PROT_MAGIC] = 15;
	value = value_kdw_armor_l / ARMOR_VALUE_DECREASE;
	disguiseGuild = GIL_KDW;
	wear = WEAR_TORSO;
	visual = "kdwl.3ds";
	visual_change = "Hum_KDWL_ARMOR.asc";
	visual_skin = 0;
	on_equip = equip_simple_armor;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance KDW_ARMOR_H(C_Item)
{
	name = "������� ������ ���� ����";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 70;
	protection[PROT_BLUNT] = 70;
	protection[PROT_POINT] = 10;
	protection[PROT_FIRE] = 45;
	protection[PROT_MAGIC] = 20;
	disguiseGuild = GIL_KDW;
	wear = WEAR_TORSO;
	value = value_kdw_armor_h / ARMOR_VALUE_DECREASE;
	visual = "kdwh.3ds";
	visual_change = "Hum_KDWS_ARMOR.asc";
	visual_skin = 0;
	on_equip = equip_simple_armor;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance DMB_ARMOR_M(C_Item)
{
	name = "������ ������� ���������";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 90;
	protection[PROT_BLUNT] = 90;
	protection[PROT_POINT] = 20;
	protection[PROT_FIRE] = 60;
	protection[PROT_MAGIC] = 30;
	disguiseGuild = GIL_DMB;
	wear = WEAR_TORSO;
	value = protection[PROT_EDGE] * ARMOR_VALUE_MULTIPLIER;
	ownerGuild = GIL_DMB;
	visual = "dmbm.3ds";
	visual_change = "Hum_DMBM_ARMOR.asc";
	visual_skin = 0;
	on_equip = equip_simple_armor;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance CRW_ARMOR_H(C_Item)
{
	name = "������ �� ��������� �������";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 80;
	protection[PROT_BLUNT] = 80;
	protection[PROT_POINT] = 15;
	protection[PROT_FIRE] = 30;
	protection[PROT_MAGIC] = 5;
	value = protection[PROT_EDGE] * ARMOR_VALUE_MULTIPLIER;
	disguiseGuild = GIL_None;
	wear = WEAR_TORSO;
	visual = "crws.3ds";
	visual_change = "Hum_CRAWLER_ARMOR.asc";
	visual_skin = 0;
	on_equip = equip_metal_armor;
	material = MAT_WOOD;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ORE_ARMOR_M(C_Item)
{
	name = "������� �������� ������";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 95;
	protection[PROT_BLUNT] = 95;
	protection[PROT_POINT] = 25;
	protection[PROT_FIRE] = 40;
	protection[PROT_MAGIC] = 10;
	value = protection[PROT_EDGE] * ARMOR_VALUE_MULTIPLIER * 2;
	disguiseGuild = GIL_None;
	wear = WEAR_TORSO;
	visual = "magie.3ds";
	visual_change = "Hum_MAGIE_ARMOR.asc";
	visual_skin = 0;
	on_equip = equip_metal_armor;
	material = MAT_WOOD;
	description = name;
	text[0] = "��������� ������� �� ���������� ����.";
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ORE_ARMOR_H(C_Item)
{
	name = "���������� �������� ������";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 100;
	protection[PROT_BLUNT] = 100;
	protection[PROT_POINT] = 30;
	protection[PROT_FIRE] = 45;
	protection[PROT_MAGIC] = 15;
	value = protection[PROT_EDGE] * ARMOR_VALUE_MULTIPLIER * 2;
	disguiseGuild = GIL_None;
	wear = WEAR_TORSO;
	visual = "magie.3ds";
	visual_change = "Hum_MAGIE_ARMOR.asc";
	visual_skin = 0;
	on_equip = equip_metal_armor;
	material = MAT_WOOD;
	description = name;
	text[0] = "������ ����� ���� �������� ���� ������� ������!";
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance LAW_ARMOR(C_Item)
{
	name = "������� �����";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 20;
	protection[PROT_BLUNT] = 20;
	protection[PROT_POINT] = 2;
	protection[PROT_FIRE] = 10;
	protection[PROT_MAGIC] = 0;
	value = protection[PROT_EDGE] * ARMOR_VALUE_MULTIPLIER;
	wear = WEAR_TORSO;
	ownerGuild = GIL_DMB;
	visual = "lawm.3ds";
	visual_change = "Hum_LAW_ARMOR.asc";
	visual_skin = 0;
	on_equip = equip_simple_armor;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance GRD_ARMOR_I(C_Item)
{
	name = "������ ���������";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 15;
	protection[PROT_BLUNT] = 15;
	protection[PROT_POINT] = 1;
	protection[PROT_FIRE] = 3;
	protection[PROT_MAGIC] = 0;
	value = 100;
	disguiseGuild = GIL_None;
	wear = WEAR_TORSO;
	visual = "grdi.3ds";
	visual_change = "Hum_GRDI_ARMOR.asc";
	visual_skin = 0;
	on_equip = equip_simple_armor;
	material = MAT_LEATHER;
	description = name;
	text[0] = "����� ������ � ����������.";
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance BAB_ARMOR_NUDE(C_Item)
{
	name = "���������� ������";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	value = 1;
	protection[PROT_EDGE] = 0;
	protection[PROT_BLUNT] = 0;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	wear = WEAR_TORSO;
	visual = "vobbox.3ds";
	visual_change = "Bab_ARMOR.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
};

instance BAB_ARMOR_BIKINI(C_Item)
{
	name = "������ � ������";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	value = 1;
	protection[PROT_EDGE] = 0;
	protection[PROT_BLUNT] = 0;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	wear = WEAR_TORSO;
	visual = "vobbox.3ds";
	visual_change = "Bab_ARMOR.asc";
	visual_skin = 1;
	material = MAT_LEATHER;
};

instance ZOM_ARMOR(C_Item)
{
	name = "������ �����";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 0;
	protection[PROT_BLUNT] = 0;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	value = 20;
	disguiseGuild = GIL_None;
	wear = WEAR_TORSO;
	visual = "ebrh.3ds";
	visual_change = "Hum_EBRS_ARMOR.asc";
	visual_skin = 2;
	material = MAT_LEATHER;
	description = name;
	text[1] = "����� ������ � ���������� ������.";
	text[2] = "�����-�� ��� ����� ���� �� �������.";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ORG2N(C_Item)
{
	name = "������ ������ ���������";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 18;
	protection[PROT_BLUNT] = 18;
	protection[PROT_POINT] = 3;
	protection[PROT_FIRE] = 10;
	protection[PROT_MAGIC] = 0;
	value = 100;
	disguiseGuild = GIL_None;
	wear = WEAR_TORSO;
	visual = "org2l.3ds";
	visual_change = "Hum_ORGL_ARMOR.asc";
	visual_skin = 1;
	on_equip = equip_simple_armor;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ORG2L(C_Item)
{
	name = "���������� ������ ���������";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 32;
	protection[PROT_BLUNT] = 32;
	protection[PROT_POINT] = 5;
	protection[PROT_FIRE] = 15;
	protection[PROT_MAGIC] = 0;
	value = 150;
	disguiseGuild = GIL_None;
	wear = WEAR_TORSO;
	visual = "org2l.3ds";
	visual_change = "Hum_ORGL_ARMOR.asc";
	visual_skin = 1;
	on_equip = equip_simple_armor;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ORG2M(C_Item)
{
	name = "������ ��������";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 40;
	protection[PROT_BLUNT] = 40;
	protection[PROT_POINT] = 5;
	protection[PROT_FIRE] = 20;
	protection[PROT_MAGIC] = 0;
	value = VALUE_ORG_ARMOR_M;
	disguiseGuild = GIL_None;
	wear = WEAR_TORSO;
	visual = "orgm.3ds";
	visual_change = "Hum_ORGM_ARMOR.asc";
	visual_skin = 1;
	on_equip = equip_simple_armor;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_Prot_Edge;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_Prot_Point;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_Prot_Fire;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_Prot_Magic;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_Value;
	count[5] = value;
};

