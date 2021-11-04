
instance ItWrTemplemap(C_Item)
{
	name = "�����";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 30;
	visual = "ItWrTempleMap.3DS";
	material = MAT_LEATHER;
	scemeName = "MAP";
	on_state[0] = UseTemplemap;
	description = "����� �����";
	text[5] = NAME_Value;
	count[5] = value;
};


func void UseTemplemap()
{
	var int nDocID;
	nDocID = Doc_CreateMap();
	Doc_SetPages(nDocID,1);
	Doc_SetPage(nDocID,0,"Map_Temple.tga",1);
	Doc_Show(nDocID);
};


instance ItMiAlarmhorn(C_Item)
{
	name = "���";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 6;
	visual = "ItMi_Alarmhorn_01.3DS";
	material = MAT_WOOD;
	scemeName = "HORN";
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_Stuff_Idol_Sleeper_01(C_Item)
{
	name = "���������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItMi_Stuff_Idol_Sleeper_01.3DS";
	material = MAT_CLAY;
	description = name;
	text[0] = "��������� ������-�� ������������� ��������";
	text[1] = "� ����� � ������ �������� ������.";
};

instance Weltenspalter(C_Item)
{
	name = "������������� ����";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_CROSSBOW | ITEM_MISSION;
	material = MAT_METAL;
	value = 900;
	damageTotal = 50;
	damagetype = DAM_EDGE;
	range = 140;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 30;
	visual = "ItMi_SleeperKey_01.3DS";
	description = name;
	mag_circle = 7;
	text[0] = "��� ��� ������������";
	text[1] = "����-����� ������-������.";
	text[2] = "��� ��� �������� ��������";
	text[3] = "� ���� ����������!";
	text[4] = "���� �����, ��� ����� ������������";
	text[5] = "���-�� �����.";
};

instance Lichtbringer(C_Item)
{
	name = "������� ����";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_CROSSBOW | ITEM_MISSION;
	material = MAT_METAL;
	value = 900;
	damageTotal = 50;
	damagetype = DAM_EDGE;
	range = 140;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 30;
	visual = "ItMi_SleeperKey_01.3DS";
	description = name;
	mag_circle = 7;
	text[0] = "��� ��� ������������";
	text[1] = "����-����� ������-�������.";
	text[2] = "��� ��� �������� ��������";
	text[3] = "� ���� ����������!";
	text[4] = "���� �����, ��� ����� ������������";
	text[5] = "���-�� �����.";
};

instance Zeitenklinge(C_Item)
{
	name = "������ ������";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_CROSSBOW | ITEM_MISSION;
	material = MAT_METAL;
	value = 900;
	damageTotal = 50;
	damagetype = DAM_EDGE;
	range = 140;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 30;
	visual = "ItMi_SleeperKey_01.3DS";
	description = name;
	mag_circle = 7;
	text[0] = "��� ��� ������������";
	text[1] = "����-����� ������-���������.";
	text[2] = "��� ��� �������� ��������";
	text[3] = "� ���� ����������!";
	text[4] = "���� �����, ��� ����� ������������";
	text[5] = "���-�� �����.";
};

instance Daemonenstreich(C_Item)
{
	name = "���� ������";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_CROSSBOW | ITEM_MISSION;
	material = MAT_METAL;
	value = 900;
	damageTotal = 50;
	damagetype = DAM_EDGE;
	range = 140;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 30;
	visual = "ItMi_SleeperKey_01.3DS";
	description = name;
	mag_circle = 7;
	text[0] = "��� ��� ������������";
	text[1] = "����-����� ������-������.";
	text[2] = "��� ��� �������� ��������";
	text[3] = "� ���� ����������!";
	text[4] = "���� �����, ��� ����� ������������";
	text[5] = "���-�� �����.";
};

instance Bannklinge(C_Item)
{
	name = "������ ���������";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_CROSSBOW | ITEM_MISSION;
	material = MAT_METAL;
	value = 900;
	damageTotal = 50;
	damagetype = DAM_EDGE;
	range = 140;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 30;
	visual = "ItMi_SleeperKey_01.3DS";
	description = name;
	mag_circle = 7;
	text[0] = "��� ��� ������������";
	text[1] = "����-����� ����-������-�������.";
	text[2] = "��� ��� �������� ��������";
	text[3] = "� ���� ����������!";
	text[4] = "���� �����, ��� ����� ������������";
	text[5] = "���-�� �����.";
};

instance Mythrilklinge(C_Item)
{
	name = "��������� ���";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 900;
	damageTotal = 10;
	damagetype = DAM_EDGE;
	range = 160;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 30;
	visual = "ItMw_2H_Sword_Sleeper_01.3DS";
	description = name;
	text[0] = "����� �������� ���.";
	text[1] = "�� ������ ������������� ������� ����.";
	text[2] = "����� ����, ������� ������ �� ���������!";
	text[3] = "����� � ������� �����, ��� ��� �� ������,";
	text[4] = "� ���� ���� ������ ��� � �����.";
	text[5] = NAME_Value;
	count[5] = value;
};

instance Mythrilklinge01(C_Item)
{
	name = "�������";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 1000;
	damageTotal = 90;
	damagetype = DAM_EDGE;
	range = 180;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 120;
	visual = "ItMw_2H_Sword_Sleeper_01.3DS";
	description = name;
	text[0] = "���� ������� ��� ���������� �������.";
	text[1] = "������ �� ������� �������� �����,";
	text[2] = "�� ��� ���� �������.";
	text[3] = NAME_Damage;
	count[3] = damageTotal;
	text[4] = NAME_Str_needed;
	count[4] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
};

instance Mythrilklinge02(C_Item)
{
	name = "�������";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 10000;
	damagetype = DAM_EDGE | DAM_FIRE | DAM_MAGIC;
	damage[DAM_INDEX_EDGE] = 90;
	damage[DAM_INDEX_FIRE] = 30;
	damage[DAM_INDEX_MAGIC] = 120;
	range = 180;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 120;
	visual = "ItMw_2H_Sword_Sleeper_02.3DS";
	description = name;
	text[0] = "��� ��� �������, ���������� qeq wewqe qeqw eqe qweqw e";
	text[1] = "�������� ���������� ����.";
	text[2] = NAME_Dam_Magic;
	count[2] = damage[DAM_INDEX_MAGIC];
	text[3] = NAME_Dam_Fire;
	count[3] = damage[DAM_INDEX_FIRE];
	text[4] = NAME_Str_needed;
	count[4] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
};

instance Mythrilklinge03(C_Item)
{
	name = "�������";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 8000;
	damageTotal = 90;
	damagetype = DAM_EDGE;
	range = 180;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 120;
	visual = "ItMw_2H_Sword_Sleeper_01.3DS";
	description = name;
	text[0] = "���������� ����������� ������ ���";
	text[1] = "�����. ��� ��� ��� ����� �����,";
	text[2] = "�� ������ �� �������� ���������� �����.";
	text[3] = NAME_Damage;
	count[3] = damageTotal;
	text[4] = NAME_Str_needed;
	count[4] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
};

instance DEMOURIZEL(C_Item)
{
	name = "�������";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 1;
	damageTotal = 115;
	damagetype = DAM_EDGE;
	range = 0;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 1;
	visual = "ItMw_2H_Sword_Sleeper_01.3DS";
	description = name;
};

instance Scroll4Milten(C_Item)
{
	name = "������� �������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	description = name;
	text[0] = "���������� �������� ������� �� ���.";
	text[1] = "� �� ���� ��� ������������.";
};

instance ItKe_SunkenTower(C_Item)
{
	name = "���� ��������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItKe_Key_03.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "��������� �������";
	text[1] = "� ���������� �����.";
};

instance DungeonKey(C_Item)
{
	name = "���� �� ����������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItKe_Key_03.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "��������� �������� ������";
	text[1] = "� ������ ������.";
};

instance ITARRUNE_6_6_URIZIELRUNE(C_Item)
{
	name = NAME_Rune;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	value = 10000;
	visual = "ItAr_Rune_14.3ds";
	material = MAT_STONE;
	spell = SPL_MASSDEATH;
	mag_circle = 6;
	description = "����� ������ �������";
	text[0] = NAME_Mag_Circle;
	count[0] = mag_circle;
	text[1] = NAME_Manakosten;
	count[1] = SPL_SENDCAST_MASSDEATH;
	text[2] = NAME_Dam_Magic;
	count[2] = SPL_DAMAGE_MASSDEATH;
	text[3] = "��� ���������� ���� ��������";
	text[4] = "������� ���� ���� �������.";
	text[5] = NAME_Value;
	count[5] = value;
};

