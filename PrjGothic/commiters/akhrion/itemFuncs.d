func void Use_ItMi_Alchemy_Quicksilver_01()
{
	Used_ItMi_Alchemy_Quicksilver_01 = true;
	AI_ProcessInfos(self);
};
func void Drink_ItMi_Potion_Quicksilver_01()
{
	if(ItMi_Potion_Quicksilver_01.change_value < 0)
	{
	B_ReduceAttribute(	ItMi_Potion_Quicksilver_01.change_atr,
						ItMi_Potion_Quicksilver_01.change_value * -1);
		//����� ������-�� �� �����������.. ���� ���..
		ItMi_Alchemy_Quicksilver_01.text[0] = "������ � ���� ��� ��� ���������,";
		ItMi_Alchemy_Quicksilver_01.text[1] = "�� ������� ���� �� ��� ��������.";
		ItMi_Alchemy_Quicksilver_01.text[2] = "��������";
		ItMi_Alchemy_Quicksilver_01.count[2] = ItMi_Potion_Quicksilver_01.change_value * -1;
		ItMi_Alchemy_Quicksilver_01.text[3] = "���������, � ��� ����� � ����������?";
	}
	else
	{
	B_RaiseAttribute(	ItMi_Potion_Quicksilver_01.change_atr,
						ItMi_Potion_Quicksilver_01.change_value);
	};
};