
const int Value_Z�hne = 10;
const int Value_Zuhne = 10;
const int Value_Krallen = 8;
const int Value_Wolfsfell = 10;
const int Value_Orkhundfell = 20;
const int Value_Panzerplatte = 20;
const int Value_Crawlerzangen = 10;
const int Value_Shadowbeastfell = 400;
const int Value_Lurkerklaue = 10;
const int Value_Lurkerhaut = 20;
const int Value_Sumpfhaihaut = 200;
const int Value_Trollfell = 300;
const int Value_Fl�gel = 8;
const int Value_Flugel = 8;
const int Value_Stachel = 10;
const int Value_Feuerzunge = 100;
const int Value_Sumpfhaiz�hne = 100;
const int Value_Sumpfhaizuhne = 100;
const int Value_Shadowbeasthorn = 100;
const int Value_Trollhauer = 100;
const int Value_Steinherz = 300;
const int Value_Feuerherz = 300;
const int Value_Eisherz = 300;
const int Value_Eistueck = 100;

instance ItAt_Teeth_01(C_Item)
{
	name = "�����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Zuhne;
	visual = "ItAt_Teeth_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};
instance ItAt_Wolf_Teeth_01(C_Item)
{
	name = "������ �����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Zuhne;
	visual = "ItAt_Teeth_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_Wolf_Teeth_Verkohlt_01(C_Item)
{
	name = "���������� ������ �����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Zuhne;
	visual = "ItAt_Teeth_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_Wolf_01(C_Item)
{
	name = "����� �����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Wolfsfell;
	visual = "ItAt_Wolf_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_Wolf_Fur_01(C_Item)
{
	name = "����� �����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Wolfsfell;
	visual = "ItAt_Wolf_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};
instance ItAt_Wolf_Fur_Good_01(C_Item)
{
	name = "�������� ����� �����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Wolfsfell * 2;
	visual = "ItAt_Wolf_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};
instance ItAt_Wolf_Fur_Dissected_01(C_Item)
{
	name = "���������� ����� �����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Wolfsfell / 5;
	visual = "ItAt_Wolf_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};
instance ItAt_Wolf_Fur_Torn_01(C_Item)
{
	name = "��������� ����� �����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Wolfsfell / 3;
	visual = "ItAt_Wolf_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_Wolf_Fur_Fired_01(C_Item)
{
	name = "����������� ����� �����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Wolfsfell / 2;
	visual = "ItAt_Wolf_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_Wolf_Fur_Burned_01(C_Item)
{
	name = "���������� ����� �����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Wolfsfell / 5;
	visual = "ItAt_Wolf_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};
instance ItAt_Wolf_Fur_BD_01(C_Item)
{
	name = "������ ����� �����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Wolfsfell / 10;
	visual = "ItAt_Wolf_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[0] = "���������� � ���������� ����� �����";
	text[1] = "���� �� ���� - ���� ����� ����� ������������..";
	text[5] = NAME_Value;
	count[5] = value;
};
instance ItAt_Wolf_Fur_BD_02(C_Item)
{
	name = "������ ����� �����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Wolfsfell / 5;
	visual = "ItAt_Wolf_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[0] = "����������� � ���������� ����� �����";
	text[1] = "���� �� ���� - ���� ����� ����� ������������..";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_Wolf_Fur_Verkohlt_01(C_Item)
{
	name = "��������� ����� �����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 0;
	visual = "ItAt_Wolf_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_OrcDog_Teeth_01(C_Item)
{
	name = "����� �����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Zuhne;
	visual = "ItAt_Teeth_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_OrcDog_Teeth_Verkohlt_01(C_Item)
{
	name = "���������� ����� �����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Zuhne;
	visual = "ItAt_Teeth_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};
instance ItAt_OrcDog_Fur_01(C_Item)
{
	name = "����� �����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Wolfsfell;
	visual = "ItAt_Wolf_02.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};
instance ItAt_OrcDog_Fur_Good_01(C_Item)
{
	name = "�������� ����� �����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Wolfsfell * 2;
	visual = "ItAt_Wolf_02.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};
instance ItAt_OrcDog_Fur_Dissected_01(C_Item)
{
	name = "���������� ����� �����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Wolfsfell / 5;
	visual = "ItAt_Wolf_02.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};
instance ItAt_OrcDog_Fur_Torn_01(C_Item)
{
	name = "��������� ����� �����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Wolfsfell / 3;
	visual = "ItAt_Wolf_02.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_OrcDog_Fur_Fired_01(C_Item)
{
	name = "����������� ����� �����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Wolfsfell / 2;
	visual = "ItAt_Wolf_02.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_OrcDog_Fur_Burned_01(C_Item)
{
	name = "���������� ����� �����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Wolfsfell / 5;
	visual = "ItAt_Wolf_02.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};
instance ItAt_OrcDog_Fur_BD_01(C_Item)
{
	name = "������ ����� �����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Wolfsfell / 10;
	visual = "ItAt_Wolf_02.3DS";
	material = MAT_LEATHER;
	description = name;
	text[0] = "���������� � ���������� ����� �����";
	text[1] = "���� �� ���� - ���� ����� ����� ������������..";
	text[5] = NAME_Value;
	count[5] = value;
};
instance ItAt_OrcDog_Fur_BD_02(C_Item)
{
	name = "������ ����� �����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Wolfsfell / 5;
	visual = "ItAt_Wolf_02.3DS";
	material = MAT_LEATHER;
	description = name;
	text[0] = "����������� � ���������� ����� �����";
	text[1] = "���� �� ���� - ���� ����� ����� ������������..";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_OrcDog_Fur_Verkohlt_01(C_Item)
{
	name = "��������� ����� �����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 0;
	visual = "ItAt_Wolf_02.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_ShadowBeast_Horn_01(C_Item)
{
	name = "������� ���� ���������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Shadowbeasthorn / 5;
	visual = "ItAt_Shadowbeast_02.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};
instance ItAt_ShadowBeast_Horn_02(C_Item)
{
	name = "��� ���������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Shadowbeasthorn;
	visual = "ItAt_Shadowbeast_02.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};
instance ItAt_ShadowBeast_Teeth_01(C_Item)
{
	name = "���� ���������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Zuhne;
	visual = "ItAt_Teeth_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};
instance ItAt_ShadowBeast_Teeth_Verkohlt_01(C_Item)
{
	name = "���������� ���� ���������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Zuhne;
	visual = "ItAt_Teeth_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};
instance ItAt_ShadowBeast_Fur_01(C_Item)
{
	name = "����� ���������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Wolfsfell;
	visual = "ItAt_Shadowbeast_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};
instance ItAt_ShadowBeast_Fur_Good_01(C_Item)
{
	name = "�������� ����� ���������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Wolfsfell * 2;
	visual = "ItAt_Shadowbeast_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};
instance ItAt_ShadowBeast_Fur_Dissected_01(C_Item)
{
	name = "���������� ����� ���������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Wolfsfell / 5;
	visual = "ItAt_Shadowbeast_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};
instance ItAt_ShadowBeast_Fur_Torn_01(C_Item)
{
	name = "��������� ����� ���������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Wolfsfell / 3;
	visual = "ItAt_Shadowbeast_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_ShadowBeast_Fur_Fired_01(C_Item)
{
	name = "����������� ����� ���������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Wolfsfell / 2;
	visual = "ItAt_Shadowbeast_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_ShadowBeast_Fur_Burned_01(C_Item)
{
	name = "���������� ����� ���������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Wolfsfell / 5;
	visual = "ItAt_Shadowbeast_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};
instance ItAt_ShadowBeast_Fur_BD_01(C_Item)
{
	name = "������ ����� ���������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Wolfsfell / 10;
	visual = "ItAt_Shadowbeast_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[0] = "���������� � ���������� ����� ���������";
	text[1] = "���� �� ���� - ���� ����� ����� ������������..";
	text[5] = NAME_Value;
	count[5] = value;
};
instance ItAt_ShadowBeast_Fur_BD_02(C_Item)
{
	name = "������ ����� ���������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Wolfsfell / 5;
	visual = "ItAt_Shadowbeast_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[0] = "����������� � ���������� ����� ���������";
	text[1] = "���� �� ���� - ���� ����� ����� ������������..";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_ShadowBeast_Fur_Verkohlt_01(C_Item)
{
	name = "��������� ����� ���������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 0;
	visual = "ItAt_Shadowbeast_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};
instance ItAt_Troll_Teeth_Broken_01(C_Item)
{
	name = "������� ���� ������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Trollhauer / 5;
	visual = "ItAt_Troll_02.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};
instance ItAt_Troll_Teeth_01(C_Item)
{
	name = "��� ������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Trollhauer;
	visual = "ItAt_Troll_02.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};
instance ItAt_Troll_Teeth_Verkohlt_Broken_01(C_Item)
{
	name = "���������� ������� ���� ������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Trollhauer / 5;
	visual = "ItAt_Troll_02.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};
instance ItAt_Troll_Teeth_Verkohlt_01(C_Item)
{
	name = "���������� ��� ������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Trollhauer;
	visual = "ItAt_Troll_02.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};
instance ItAt_Troll_Fur_01(C_Item)
{
	name = "����� ������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Trollfell;
	visual = "ItAt_Troll_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};
instance ItAt_Troll_Fur_Good_01(C_Item)
{
	name = "�������� ����� ������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Trollfell * 2;
	visual = "ItAt_Troll_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};
instance ItAt_Troll_Fur_Dissected_01(C_Item)
{
	name = "���������� ����� ������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Trollfell / 5;
	visual = "ItAt_Troll_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};
instance ItAt_Troll_Fur_Torn_01(C_Item)
{
	name = "��������� ����� ������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Trollfell / 3;
	visual = "ItAt_Troll_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_Troll_Fur_Fired_01(C_Item)
{
	name = "����������� ����� ������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Trollfell / 2;
	visual = "ItAt_Troll_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_Troll_Fur_Burned_01(C_Item)
{
	name = "���������� ����� ������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Trollfell / 5;
	visual = "ItAt_Troll_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};
instance ItAt_Troll_Fur_BD_01(C_Item)
{
	name = "������ ����� ������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Trollfell / 10;
	visual = "ItAt_Troll_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[0] = "���������� � ���������� ����� ������";
	text[1] = "���� �� ���� - ���� ����� ����� ������������..";
	text[5] = NAME_Value;
	count[5] = value;
};
instance ItAt_Troll_Fur_BD_02(C_Item)
{
	name = "������ ����� ������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Trollfell / 5;
	visual = "ItAt_Troll_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[0] = "����������� � ���������� ����� ������";
	text[1] = "���� �� ���� - ���� ����� ����� ������������..";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_Troll_Fur_Verkohlt_01(C_Item)
{
	name = "��������� ����� ������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 0;
	visual = "ItAt_Troll_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_Wolf_02(C_Item)
{
	name = "����� ������� ������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Orkhundfell;
	visual = "ItAt_Wolf_02.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_Waran_01(C_Item)
{
	name = "���� �������� �������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Feuerzunge;
	visual = "ItAt_Waran_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_Claws_01(C_Item)
{
	name = "�����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Krallen;
	visual = "ItAt_Claws_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_Crawler_02(C_Item)
{
	name = "��������� �������� �������-�����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_Panzerplatte;
	visual = "ItAt_Crawler_02.3DS";
	material = MAT_WOOD;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_Crawler_01(C_Item)
{
	name = "������� �������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Crawlerzangen;
	visual = "ItAt_Crawler_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_Shadow_01(C_Item)
{
	name = "����� ���������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 0;
	visual = "ItAt_Shadowbeast_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_Shadow_02(C_Item)
{
	name = "��� ���������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 0;
	visual = "ItAt_Shadowbeast_02.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_Lurker_01(C_Item)
{
	name = "������ �����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Lurkerklaue;
	visual = "ItAt_Lurker_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_Lurker_02(C_Item)
{
	name = "����� �����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Lurkerhaut;
	visual = "ItAt_Lurker_02.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_Troll_02(C_Item)
{
	name = "���� ������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Trollhauer;
	visual = "ItAt_Troll_02.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_Troll_01(C_Item)
{
	name = "����� ������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Trollfell;
	visual = "ItAt_Troll_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_Swampshark_01(C_Item)
{
	name = "����� ����������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Sumpfhaihaut;
	visual = "ItAt_Swampshark_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_Swampshark_02(C_Item)
{
	name = "���� ����������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Sumpfhaizuhne;
	visual = "ItAt_Swampshark_02.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_Bloodfly_01(C_Item)
{
	name = "������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Flugel;
	visual = "ItAt_Bloodfly_01.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_Bloodfly_02(C_Item)
{
	name = "���� ������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Stachel;
	visual = "ItAt_Bloodfly_02.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_StoneGolem_01(C_Item)
{
	name = "������ ��������� ������";
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	spell = SPL_WINDFIST;
	value = Value_Steinherz;
	visual = "ItAt_StoneGolem_01.3DS";
	material = MAT_STONE;
	description = name;
	text[0] = "��� ������ ������ �� ����";
	text[1] = "������� ��������� ������.";
	text[2] = "��� �������� ����� ����������� ����������";
	text[3] = "�� ������� ����������.";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_FireGolem_01(C_Item)
{
	name = "������ ��������� ������";
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	spell = SPL_FIREBALL;
	value = Value_Feuerherz;
	visual = "ItAt_FireGolem_01.3DS";
	material = MAT_STONE;
	description = name;
	text[0] = "��� ������ ������ �� ����";
	text[1] = "������� ��������� ������.";
	text[2] = "��� �������� ����� �������";
	text[3] = "���������� ������.";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_IceGolem_01(C_Item)
{
	name = "������ �������� ������";
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MISSION;
	spell = SPL_ICECUBE;
	value = Value_Eisherz;
	visual = "ItAt_IceGolem_01.3DS";
	material = MAT_STONE;
	description = name;
	text[0] = "��� ������ ������ �� ����";
	text[1] = "������� �������� ������.";
	text[2] = "��� �������� ����� ����������";
	text[3] = "���������� � ������� �����.";
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItAt_IceGolem_02(C_Item)
{
	name = "������� �������� ������";
	mainflag = ITEM_KAT_RUNE;
	flags = 0;
	spell = SPL_THUNDERBOLT;
	value = Value_Eistueck;
	visual = "ItAt_IceGolem_01.3DS";
	material = MAT_STONE;
	description = name;
	text[0] = "��� ������� �� ����";
	text[1] = "������� �������� ������.";
	text[5] = NAME_Value;
	count[5] = value;
};

