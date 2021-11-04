instance ItMi_Potion_Quicksilver_01(C_Item)
{
	name = "Ртуть";
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = Value_Quecksilber;
	visual = "ItMi_Alchemy_Quicksilver_01.3DS";
	material = MAT_CLAY;
	change_atr = ATR_HITPOINTS;
	change_value = -40;
	description = name;
	text[0] = "Однажды я решился ее выпить, но некая тайная";
	text[1] = " сила отворотила меня от этого.";
	text[2] = "Быть может теперь..?";
	text[5] = NAME_Value;
	count[5] = value;
	scemeName = "POTION";
	on_state[0] = Drink_ItMi_Potion_Quicksilver_01;
};