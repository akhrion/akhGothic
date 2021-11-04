//MARVIN insert testakh_ItRw_Bow_Small_01 - item not found... WHY?
instance testakh_ItRw_Bow_Small_01(prot_akh_itemBow_ext)
{
	name = "Короткий лук";
	value = 50;
	visual = "ItRw_Bow_Small_01.mms";
	count[1] = 4;
	count[2] = 44;
};

instance testakh_bow1(prot_akh_itemBow)
{
	name = "Лук1";
	value = 50;
	range = 10;
	visual = "ItRw_Bow_Small_01.mms";
	count[1] = 4;
	count[2] = 44;
};
instance testakh_bow2(prot_akh_itemBow)
{
	name = "Лук2";
	value = 50;
	range = 100;
	visual = "ItRw_Bow_Small_01.mms";
	count[1] = 4;
	count[2] = 44;
};
instance testakh_bow3(prot_akh_itemBow)
{
	name = "Лук3";
	value = 50;
	range = 10000;
	visual = "ItRw_Bow_Small_01.mms";
	count[1] = 4;
	count[2] = 44;
};


instance testakhBow(C_item)
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
