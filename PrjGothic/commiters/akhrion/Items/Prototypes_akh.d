prototype prot_akh_itemBow_ext(C_ITEM_EXT)
{
	name = "";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW;
	material = MAT_WOOD;
	damagetype = DAM_POINT;
	munition = ItAmArrow;
	quality = "1.2";
	description = name;
	text[1] = "������� ������:";
	text[2] = getConcatSIS("������� �������� ������ � ����: ",count[2], "%");
	text[5] = getConcatSIS(NAME_Value, value, " ����");
};

//AKH WORKING
prototype prot_akh_itemBow(C_ITEM)
{
	//��-�� ����������� ��������� ������� �������� ����������.
	//���� ����� �������� �� �������� �����.
	//���� ����� ���� ������ 100 - �� 100 ������� ����� ������� ����� ���������� � ������ ���� ����������� ����������
	//			�� ����� 100 ���� ���������� ������ � �������������� ��������.
	//�������� ������ ������ �� ���������� ��������. �� �� �� ��� ����� �� ��� ��������� -ATR_DEXTERITY..
	name = "";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW;
	material = MAT_WOOD;
	damagetype = DAM_POINT;
	damageTotal = 100;
	munition = ItAmArrow;
	description = name;
	text[1] = "������� ������:";
	text[2] = getConcatSIS("������� �������� ������ � ����: ",count[2], "%");// ������������� ����� ���������
	text[5] = getConcatSIS(NAME_Value, value, " ����");	//value and ��������� ����� ���������.. ��� �� ������
															//�������� ����� �������, �� ��� �����?
};