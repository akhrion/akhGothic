instance ItMi_Potion_Quicksilver_01(C_Item)
{
	name = "�����";
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = Value_Quecksilber;
	visual = "ItMi_Alchemy_Quicksilver_01.3DS";
	material = MAT_CLAY;
	change_atr = ATR_HITPOINTS;
	change_value = -40;
	description = name;
	text[0] = "������� � ������� �� ������, �� ����� ������";
	text[1] = " ���� ���������� ���� �� �����.";
	text[2] = "���� ����� ������..?";
	text[5] = NAME_Value;
	count[5] = value;
	scemeName = "POTION";
	on_state[0] = Drink_ItMi_Potion_Quicksilver_01;
};