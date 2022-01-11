
instance ItRw_Bow_Small_01(C_item)
{
	name = "Короткий лук";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW;
	material = MAT_WOOD;
	value = 50;
	damageTotal = 15;
	damagetype = DAM_POINT;
	munition = ItAmArrow;
	cond_atr[1] = ATR_STRENGTH;
	cond_value[1] = 10;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 10;
	visual = "ItRw_Bow_Small_01.mms";
	description = name;
//	text[2] = NAME_Damage;
//	count[2] = damageTotal;
	count[1] = 22;
	text[1] = "Тугость тетивы:";
	count[2] = 20;
	text[2] = getConcatSIS("Процент ловкости идущей в урон: ",count[2], "%");
	count[3] = cond_value[2];
	text[3] = NAME_Dex_needed;
	count[5] = value;
	text[5] = NAME_Value;
};

instance ItRw_Bow_Small_02(C_Item)
{
	name = "Лук всадника";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW;
	material = MAT_WOOD;
	value = 65;
	damageTotal = 20;
	damagetype = DAM_POINT;
	munition = ItAmArrow;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 12;
	visual = "ItRw_Bow_Small_02.mms";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRw_Bow_Small_03(C_Item)
{
	name = "Полевой лук";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW;
	material = MAT_WOOD;
	value = 85;
	damageTotal = 28;
	damagetype = DAM_POINT;
	munition = ItAmArrow;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 16;
	visual = "ItRw_Bow_Small_03.mms";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRw_Bow_Small_04(C_Item)
{
	name = "Охотничий лук";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW;
	material = MAT_WOOD;
	value = 100;
	damageTotal = 30;
	damagetype = DAM_POINT;
	munition = ItAmArrow;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 18;
	visual = "ItRw_Bow_Small_04.mms";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRw_Bow_Small_05(C_Item)
{
	name = "Костяной лук";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW;
	material = MAT_WOOD;
	value = 120;
	damageTotal = 35;
	damagetype = DAM_POINT;
	munition = ItAmArrow;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 20;
	visual = "ItRw_Bow_Small_05.mms";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRw_Bow_Long_01(C_Item)
{
	name = "Длинный лук";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW;
	material = MAT_WOOD;
	value = 140;
	damageTotal = 40;
	damagetype = DAM_POINT;
	munition = ItAmArrow;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 22;
	visual = "ItRw_Bow_Long_01.mms";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRw_Bow_Long_02(C_Item)
{
	name = "Осиновый лук";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW;
	material = MAT_WOOD;
	value = 150;
	damageTotal = 44;
	damagetype = DAM_POINT;
	munition = ItAmArrow;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 24;
	visual = "ItRw_Bow_Long_02.mms";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRw_Bow_Long_03(C_Item)
{
	name = "Ивовый лук";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW;
	material = MAT_WOOD;
	value = 170;
	damageTotal = 46;
	damagetype = DAM_POINT;
	munition = ItAmArrow;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 26;
	visual = "ItRw_Bow_Long_03.mms";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRw_Bow_Long_04(C_Item)
{
	name = "Дубовый лук";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW;
	material = MAT_WOOD;
	value = 200;
	damageTotal = 48;
	damagetype = DAM_POINT;
	munition = ItAmArrow;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 28;
	visual = "ItRw_Bow_Long_04.mms";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRw_Bow_Long_05(C_Item)
{
	name = "Убийца волков";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW;
	material = MAT_WOOD;
	value = 220;
	damageTotal = 50;
	damagetype = DAM_POINT;
	munition = ItAmArrow;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 30;
	visual = "ItRw_Bow_Long_05.mms";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRw_Bow_Long_06(C_Item)
{
	name = "Пронзающий ветер";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW;
	material = MAT_WOOD;
	value = 240;
	damageTotal = 55;
	damagetype = DAM_POINT;
	munition = ItAmArrow;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 32;
	visual = "ItRw_Bow_Long_06.mms";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRw_Bow_Long_07(C_Item)
{
	name = "Армейский лук";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW;
	material = MAT_WOOD;
	value = 250;
	damageTotal = 60;
	damagetype = DAM_POINT;
	munition = ItAmArrow;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 34;
	visual = "ItRw_Bow_Long_07.mms";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRw_Bow_Long_08(C_Item)
{
	name = "Роговой лук";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW;
	material = MAT_WOOD;
	value = 270;
	damageTotal = 68;
	damagetype = DAM_POINT;
	munition = ItAmArrow;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 36;
	visual = "ItRw_Bow_Long_08.mms";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRw_Bow_Long_09(C_Item)
{
	name = "Нимрод";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW;
	material = MAT_WOOD;
	value = 290;
	damageTotal = 72;
	damagetype = DAM_POINT;
	munition = ItAmArrow;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 37;
	visual = "ItRw_Bow_Long_09.mms";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRw_Bow_War_01(C_Item)
{
	name = "Военный лук";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW;
	material = MAT_WOOD;
	value = 310;
	damageTotal = 74;
	damagetype = DAM_POINT;
	munition = ItAmArrow;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 38;
	visual = "ItRw_Bow_War_01.mms";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRw_Bow_War_02(C_Item)
{
	name = "Убийца орков";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW;
	material = MAT_WOOD;
	value = 320;
	damageTotal = 79;
	damagetype = DAM_POINT;
	munition = ItAmArrow;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 40;
	visual = "ItRw_Bow_War_02.mms";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRw_Bow_War_03(C_Item)
{
	name = "Штурмовой лук";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW;
	material = MAT_WOOD;
	value = 340;
	damageTotal = 82;
	damagetype = DAM_POINT;
	munition = ItAmArrow;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 41;
	visual = "ItRw_Bow_War_03.mms";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRw_Bow_War_04(C_Item)
{
	name = "Лук демона";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW;
	material = MAT_WOOD;
	value = 360;
	damageTotal = 85;
	damagetype = DAM_POINT;
	munition = ItAmArrow;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 42;
	visual = "ItRw_Bow_War_04.mms";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRw_Bow_War_05(C_Item)
{
	name = "Несущий смерть";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW;
	material = MAT_WOOD;
	value = 380;
	damageTotal = 88;
	damagetype = DAM_POINT;
	munition = ItAmArrow;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 45;
	visual = "ItRw_Bow_War_05.mms";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRw_Bow_Urizel(C_ITEM)
{
	name = "Магический лук";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW;
	material = MAT_WOOD;
	value = 3800;
	damageTotal = 150;
	damagetype = DAM_BARRIER;
	munition = ItAmMagicArrow;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 120;
	visual = "ItRw_Bow_War_05.mms";
	on_equip = oe_Bow_Magic;
	on_unequip = ou_Bow_Magic;
	description = name;
	text[0] = "Касаясь камня пальцами, за рукой тянется";
	text[1] = "сгусток магической энергии - кажется ему";
	text[2] = "не нужны стрелы.";
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;	
};

instance ItAmMagicArrow(C_Item)
{
	name = "Магическая стрела";
	mainflag = ITEM_KAT_MUN;
	flags = ITEM_BOW | ITEM_MULTI;
	value = 0;
	visual = "ItAm_Arrow_01.3ds";
	material = MAT_WOOD;
	description = name;
};

func void oe_Bow_Magic()
{
	CreateInvItems(self,ItAmMagicArrow,100 - Npc_HasItems(self,ItAmMagicArrow));
};
func void ou_Bow_Magic()
{
	Npc_RemoveInvItems(self,ItAmMagicArrow,Npc_HasItems(self,ItAmMagicArrow));
};

instance ItRw_Bow_Mystic(C_ITEM)
{
	name = "???";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW;
	material = MAT_WOOD;
	value = 380;
	damageTotal = 88;
	damagetype = DAM_POINT;
	munition = ItAmBloodArrow;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 45;
	visual = "ItRw_Bow_War_05.mms";
	on_equip = oe_Bow_Mystic;
	on_unequip = ou_Bow_Mystic;
	description = name;
	text[0] = "Странный лук, от него веет холодом";
	text[1] = "и.. чем-то мерзким.";
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;	
};

instance ItAmBloodArrow(C_Item)
{
	name = "";
	mainflag = ITEM_KAT_MUN;
	flags = ITEM_BOW | ITEM_MULTI;
	value = 0;
	visual = "ItAm_Arrow_01.3ds";
	material = MAT_WOOD;
	description = name;
};

func void oe_Bow_Mystic()
{
		CreateInvItems(self,ItAmBloodArrow,100 - Npc_HasItems(self,ItAmBloodArrow));
};
func void ou_Bow_Mystic()
{
		Npc_RemoveInvItems(self,ItAmBloodArrow,Npc_HasItems(self,ItAmBloodArrow));
};

instance ItRw_Crossbow_01(C_Item)
{
	name = "Легкий арбалет";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_CROSSBOW;
	material = MAT_WOOD;
	value = 180;
	damageTotal = 45;
	damagetype = DAM_POINT;
	munition = ItAmBolt;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 25;
	visual = "ItRwCrossbow1.mms";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRw_Crossbow_02(C_Item)
{
	name = "Охотничий арбалет";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_CROSSBOW;
	material = MAT_WOOD;
	value = 370;
	damageTotal = 85;
	damagetype = DAM_POINT;
	munition = ItAmBolt;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 42;
	visual = "ItRwCrossbow2.mms";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRw_Crossbow_03(C_Item)
{
	name = "Тяжелый арбалет";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_CROSSBOW;
	material = MAT_WOOD;
	value = 400;
	damageTotal = 90;
	damagetype = DAM_POINT;
	munition = ItAmBolt;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 50;
	visual = "ItRwCrossbow3.mms";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItRw_Crossbow_04(C_Item)
{
	name = "Военный арбалет";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_CROSSBOW;
	material = MAT_WOOD;
	value = 430;
	damageTotal = 100;
	damagetype = DAM_POINT;
	munition = ItAmBolt;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 60;
	visual = "ItRwCrossbow4.mms";
	description = name;
	text[2] = NAME_Damage;
	count[2] = damageTotal;
	text[3] = NAME_Dex_needed;
	count[3] = cond_value[2];
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAmArrow_01(C_Item)
{
	name = "Кривая стрела";
	mainflag = ITEM_KAT_MUN;
	flags = ITEM_BOW | ITEM_MULTI;
	value = 2;
	visual = "ItAm_Arrow_01.3ds";
	material = MAT_WOOD;
	description = name;
	text[2] = "Выглядит сомнительно. Интересно она полетит дальше моих носков?";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAmArrow_02(C_Item)
{
	name = "Кустарная стрела";
	mainflag = ITEM_KAT_MUN;
	flags = ITEM_BOW | ITEM_MULTI;
	value = 6;
	visual = "ItAm_Arrow_01.3ds";
	material = MAT_WOOD;
	description = name;
	text[2] = "Кажется эти стрелы делают все кому не лень.";
	text[5] = NAME_Value;
	count[5] = value;
};


instance ItAmArrow(C_Item)
{
	name = "Стрела";
	mainflag = ITEM_KAT_MUN;
	flags = ITEM_BOW | ITEM_MULTI;
	value = 10;
	visual = "ItAm_Arrow_01.3ds";
	material = MAT_WOOD;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAmBolt_01(C_Item)
{
	name = "Щепка";
	mainflag = ITEM_KAT_MUN;
	flags = ITEM_CROSSBOW | ITEM_MULTI;
	value = 2;
	visual = "ItAm_Arrow_01.3ds";
	material = MAT_WOOD;
	description = name;
	text[2] = "Это что вообще такое?";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAmBolt(C_Item)
{
	name = "Арбалетный болт";
	mainflag = ITEM_KAT_MUN;
	flags = ITEM_CROSSBOW | ITEM_MULTI;
	value = 10;
	visual = "ItAm_Bolt_01.3ds";
	material = MAT_WOOD;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

