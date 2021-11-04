
const int Value_MobsiItem = 2;
const int Value_SwordBlade = 60;
const int Value_SwordBladeHot = 50;
const int Value_SwordRawHot = 15;
const int Value_SwordRaw = 10;
const int Value_Dietrich = 10;
const int Value_Schl�ssel = 2;
const int Value_Joint1 = 8;
const int Value_Joint2 = 10;
const int Value_Joint3 = 16;
const int Value_Laute = 10;
const int Value_Erzbrocken = 1;
const int Value_Fackel = 5;
const int Value_Sumpfkraut = 4;
const int Value_Pfeife = 4;
const int Value_Rasiermesser = 2;
const int Value_M�nze = 0;
const int Value_Sch�ssel = 2;
const int Value_Kerzenst�nder = 2;
const int Value_Becher = 2;
const int Value_Pokal = 10;
const int Value_Besteck = 6;
const int Value_Pfanne = 2;
const int Value_Krug = 2;
const int Value_Amphore = 2;
const int Value_Statue = 4;
const int Value_Schwefel = 6;
const int Value_Quecksilber = 8;
const int Value_Salz = 10;
const int Value_�l = 8;
const int Value_Moleratfett = 5;
const int Value_Alcohol = 18;

instance ItKeLockpick(C_Item)
{
	name = "�������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Dietrich;
	visual = "ItKe_Lockpick_01.3ds";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = Value_Dietrich;
};

instance ItKeKey1(C_Item)
{
	name = "����";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = Value_Schl�ssel;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
};

instance ItKeKey2(C_Item)
{
	name = "����";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = Value_Schl�ssel;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
};

instance ItKeKey3(C_Item)
{
	name = "����";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = Value_Schl�ssel;
	visual = "ItKe_Key_03.3ds";
	material = MAT_METAL;
	description = name;
};

instance ItKeKey4(C_Item)
{
	name = "����";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = Value_Schl�ssel;
	visual = "ItKe_Key_04.3ds";
	material = MAT_METAL;
	description = name;
};

instance ItKeCavalorn01(C_Item)
{
	name = "���� ���������";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 0;
	visual = "ItKe_Key_04.3ds";
	material = MAT_METAL;
	description = name;
};

instance ItMiStomper(C_Item)
{
	name = "����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_MobsiItem;
	visual = "ItMi_Stomper_01.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = Value_MobsiItem;
};

instance ItMiHammer(C_Item)
{
	name = "�������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_MobsiItem;
	visual = "ItMi_Hammer_01.3DS";
	material = MAT_WOOD;
	description = name;
	text[5] = NAME_Value;
	count[5] = Value_MobsiItem;
};

instance ItMiScoop(C_Item)
{
	name = "������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_MobsiItem;
	visual = "ItMi_Scoop_01.3DS";
	material = MAT_WOOD;
	description = name;
	text[5] = NAME_Value;
	count[5] = Value_MobsiItem;
};

instance ItMiFlask(C_Item)
{
	name = "������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 5;
	visual = "ItMiFlask.3ds";
	material = MAT_GLAS;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMiSwordraw(C_Item)
{
	name = "����� �����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_SwordRaw;
	visual = "ItMi_SmithSword_Raw_01.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMiSwordrawhot(C_Item)
{
	name = "����������� �����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_SwordRawHot;
	visual = "ItMi_SmithSword_Rawhot_01.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMiSwordbladehot(C_Item)
{
	name = "����������� ������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_SwordBladeHot;
	visual = "ItMi_SmithSword_Bladehot_01.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMiSwordblade(C_Item)
{
	name = "������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_SwordBlade;
	visual = "ItMi_SmithSword_Blade_01.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItLsTorchFirespit(C_Item)
{
	name = "�����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_BURN | ITEM_TORCH;
	value = Value_MobsiItem;
	visual = "ITLSTORCHBURNING.ZEN";
	material = MAT_WOOD;
	scemeName = "FIRESPIT";
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMiLute(C_Item)
{
	name = "�����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Laute;
	visual = "ItMi_Lute_01.3DS";
	material = MAT_WOOD;
	scemeName = "LUTE";
	on_state[0] = UseLute;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};


func void UseLute()
{
	if((Play_Lute == FALSE) && Npc_IsPlayer(self))
	{
		B_GiveXP(10);
		Play_Lute = TRUE;
	};
};


instance ItMiWedel(C_Item)
{
	name = "��������� ����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_MobsiItem;
	visual = "ItMi_Wedel_01.3ds";
	material = MAT_LEATHER;
	scemeName = "COOLAIR";
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMiBrush(C_Item)
{
	name = "�����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_MobsiItem;
	visual = "ItMi_Brush_01.3ds";
	material = MAT_GLAS;
	scemeName = "BRUSH";
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMiJoint_1(C_Item)
{
	name = "�������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Joint1;
	visual = "ItMi_Joint_01.3ds";
	material = MAT_LEATHER;
	scemeName = "JOINT";
	on_state[0] = UseItMiJoint_1;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};


func void UseItMiJoint_1()
{
	if((Firstjoint == FALSE) && Npc_IsPlayer(self))
	{
		B_GiveXP(5);
		Firstjoint = TRUE;
	};
};


instance ItMiJoint_2(C_Item)
{
	name = "�������� ������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Joint2;
	visual = "ItMi_Joint_01.3ds";
	material = MAT_LEATHER;
	scemeName = "JOINT";
	on_state[0] = UseItMiJoint_2;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};


func void UseItMiJoint_2()
{
	if((Secondjoint == FALSE) && Npc_IsPlayer(self))
	{
		B_GiveXP(10);
		Secondjoint = TRUE;
	};
};


instance ItMiJoint_3(C_Item)
{
	name = "��� �����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Joint3;
	visual = "ItMi_Joint_01.3ds";
	material = MAT_LEATHER;
	scemeName = "JOINT";
	on_state[0] = UseItMiJoint_3;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

func void changeAttributesjoint3()
{
	//����� ��� ��������� ������: ��������� ������� �������� �������� � �� ��������� ��� ���� ������ �������.. ������ ����� �������. ��� ���������..
	//� ������.. � ����� �������� ����� ����� ������ ��������..
	//������ ���� �� �������� ����������� ;) ��, ��� ��������� ���� - ������� ��� ;)
	//������ �� �� ������������ � ���, ��� ���������� LP ����� ���� ����� � 50 �� �������..
	//�� �� ������������ � ���, ��� �� �� ������ ����� ���� � ������� ������.. ����� ��� � ��������� ��������
	//�� ���� ���� ����� ���������� �������������� � ��� �� ��� ���..���-����.. ������� �������� ����������� ����.
	//�� � ������ �����.. ���-�� ��� ������ ����� ��������, �� �� �����, ��� �������� ��� ��������.
	//� ����� � ��������.
	B_RaiseAttribute(ATR_MANA_MAX,2);
	Npc_ChangeAttribute(self,ATR_MANA,2);
	Npc_ChangeAttribute(self,ATR_STRENGTH,2);
	Npc_ChangeAttribute(self,ATR_DEXTERITY,2);
	Npc_ChangeAttribute(self,ATR_HITPOINTS_MAX,-6);
	Npc_ChangeAttribute(self,ATR_HITPOINTS,-6);
};
var int night; var int morning; var int middle; var int evening;
func void changeAttributesjoint3_Condition(){
	var int today; today = Wld_GetDay();
	if(Wld_IsTime(0,0,6,0))
	{
		if(night < today)
		{
			night = today;
			changeAttributesjoint3();
		};
	} else if(Wld_IsTime(6,0,12,0))
	{
		if(morning < today)
		{
			morning = today;
			changeAttributesjoint3();
		};
	} else if(Wld_IsTime(12,0,18,0))
	{
		if(middle < today)
		{
			middle = today;
			changeAttributesjoint3();
		};
	} else {
		if(evening < today)
		{
			evening = today;
			changeAttributesjoint3();
		};
	};
};

func void UseItMiJoint_3()
{
	if(
		Npc_IsPlayer(self) &&
		self.guild == GIL_NOV ||
		self.guild == GIL_TPL ||
		self.guild == GIL_GUR
	){
		changeAttributesjoint3_Condition();
	};

};


instance ItMiNugget(C_Item)
{
	name = "����� ����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Erzbrocken;
	visual = "ItMi_Nugget_01.3ds";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItLsTorch(C_Item)
{
	name = "�����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_BURN | ITEM_TORCH | ITEM_MULTI;
	value = Value_Fackel;
	visual = "ItLs_Torch_01.3ds";
	material = MAT_WOOD;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItLsTorchburning(C_Item)
{
	name = "������� �����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_BURN | ITEM_TORCH;
	value = 0;
	visual = "ITLSTORCHBURNING.ZEN";
	material = MAT_WOOD;
	description = name;
};

instance ItLsTorchburned(C_Item)
{
	name = "��������� �����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 0;
	visual = "ItLs_Torchburned_01.3ds";
	material = MAT_WOOD;
	description = name;
};

instance ItMi_Plants_Swampherb_01(C_Item)
{
	name = "��������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Sumpfkraut;
	visual = "ItMi_Plants_Swampherb_01.3ds";
	material = MAT_WOOD;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_Stuff_Pipe_01(C_Item)
{
	name = "������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Pfeife;
	visual = "ItMi_Stuff_Pipe_01.3DS";
	material = MAT_WOOD;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_Stuff_Barbknife_01(C_Item)
{
	name = "���������� ���";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Rasiermesser;
	visual = "ItMi_Stuff_Barbknife_01.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_Stuff_OldCoin_01(C_Item)
{
	name = "������ ������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = Value_M�nze;
	visual = "ItMi_Stuff_OldCoin_01.3DS";
	material = MAT_METAL;
	description = name;
};

instance ItMi_Stuff_Plate_01(C_Item)
{
	name = "�������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Sch�ssel;
	visual = "ItMi_Stuff_Plate_01.3DS";
	material = MAT_CLAY;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_Stuff_Candel_01(C_Item)
{
	name = "�����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Kerzenst�nder;
	visual = "ItMi_Stuff_Candel_01.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_Stuff_Cup_01(C_Item)
{
	name = "�����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Becher;
	visual = "ItMi_Stuff_Cup_01.3DS";
	material = MAT_CLAY;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_Stuff_Cup_02(C_Item)
{
	name = "�����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Pokal;
	visual = "ItMi_Stuff_Cup_02.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_Stuff_Silverware_01(C_Item)
{
	name = "�������� �����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Besteck;
	visual = "ItMi_Stuff_Silverware_01.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_Stuff_Pan_01(C_Item)
{
	name = "���������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Pfanne;
	visual = "ItMi_Stuff_Pan_01.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_Stuff_Mug_01(C_Item)
{
	name = "������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Krug;
	visual = "ItMi_Stuff_Mug_01.3DS";
	material = MAT_CLAY;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_Stuff_Amphore_01(C_Item)
{
	name = "������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Amphore;
	visual = "ItMi_Stuff_Amphore_01.3DS";
	material = MAT_CLAY;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_Stuff_Idol_Ogront_01(C_Item)
{
	name = "�������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Statue;
	visual = "ItMi_Stuff_Idol_Ogront_01.3DS";
	material = MAT_CLAY;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_Alchemy_Sulphur_01(C_Item)
{
	name = "����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Schwefel;
	visual = "ItMi_Alchemy_Sulphur_01.3DS";
	material = MAT_CLAY;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_Alchemy_Quicksilver_01(C_Item)
{
	name = "�����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Quecksilber;
	visual = "ItMi_Alchemy_Quicksilver_01.3DS";
	material = MAT_CLAY;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
	scemeName = "MAP";
	on_state[0] = Use_ItMi_Alchemy_Quicksilver_01;
};

instance ItMi_Alchemy_Ash_01(C_Item)
{
	name = "�����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Pfeife;
	visual = "ItMi_Alchemy_Salt_01.3DS";
//	visual = "ItMi_Alchemy_Ash_01.3DS";
	material = MAT_CLAY;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_Alchemy_Salt_01(C_Item)
{
	name = "����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Salz;
	visual = "ItMi_Alchemy_Salt_01.3DS";
	material = MAT_CLAY;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_Alchemy_Syrianoil_01(C_Item)
{
	name = "�����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_�l;
	visual = "ItMi_Alchemy_Syrianoil_01.3DS";
	material = MAT_CLAY;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_Alchemy_Moleratlubric_01(C_Item)
{
	name = "��� ����������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Moleratfett;
	visual = "ItMi_Alchemy_Moleratlubric_01.3DS";
	material = MAT_CLAY;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ItMi_Alchemy_Alcohol_01(C_Item)
{
	name = "������ �����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = Value_Alcohol;
	visual = "ItMi_Alchemy_Alcohol_01.3DS";
	material = MAT_CLAY;
	description = name;
	text[5] = NAME_Value;
	count[5] = value;
};

instance ITKE_QUENTIN(C_Item)
{
	name = "���� ��������";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 0;
	visual = "ItKe_Key_04.3ds";
	material = MAT_METAL;
	description = name;
};

instance ITKE_GILBERT(C_Item)
{
	name = "�������� �����";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 0;
	visual = "ItKe_Key_03.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "��� ��� ��� �������";
};

instance ORIK_KEY(C_Item)
{
	name = "���� �����";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 0;
	visual = "ItKe_Key_03.3ds";
	material = MAT_METAL;
	description = name;
};

instance ITKE_TOWER_01(C_Item)
{
	name = "����";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 0;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
//	text = "111111111 222222 33333 44444 5555  66666 77  77 77 788 88 88 88 899 9 9";
	text[0] = "� ����� ��� �� ����� ������";
	text[1] = "�� ���������� ������ ������� ������";
	
};

instance ITKE_YBERION(C_Item)
{
	name = "���� ��������";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 0;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
};

instance ALEXSTUFF(C_Item)
{
	name = "����������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "grdl.3ds";
	material = MAT_LEATHER;
	description = name;
	text[1] = "����, ������ ��� ������ ������:";
	text[2] = "������ ��������� � �������� ���.";
};

instance WEEDPACK(C_Item)
{
	name = "����� � ������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 100;
	visual = "ItMi_Packet.3ds";
	material = MAT_LEATHER;
	on_state[0] = UseWEEDPACK;
	scemeName = "MAP";
	description = name;
	text[1] = "������ ��������� ���������.";
	text[2] = "������ ������ �� ���� ��������.";
	text[3] = "���-�� ���-���� ������� ��� ������..";
	text[5] = NAME_Value;
	count[5] = value;
};

func void UseWEEDPACK()
{
	if(Npc_IsPlayer(self))
	{
		Npc_RemoveInvItem(self,weedpack);
		CreateInvItems(self,ItMi_Plants_Swampherb_01,50);
	};
};


instance FAKEITEM(C_Item)
{
	name = " ";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 0;
	visual = "fakeitem.3ds";
	material = MAT_LEATHER;
	scemeName = "USEFAKEITEM";
	on_state[0] = usefakeitem;
	description = name;
};


func void usefakeitem()
{
	PrintScreen(SCREENMESSAGE,-1,37,"FONT_OLD_10_WHITE.TGA",3);
};


instance FAKEITEM2(C_Item)
{
	name = " ";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 0;
	visual = "fakeitem.3ds";
	material = MAT_LEATHER;
	scemeName = "USEFAKEITEM";
	on_state[0] = usefakeitem2;
	description = name;
};


func void usefakeitem2()
{
	PrintScreen(SCREENMESSAGE2,-1,40,"FONT_OLD_10_WHITE.TGA",3);
};

instance ItAmScavengerSoul(C_ITEM)
{
};
instance ItAmD0(C_ITEM)
{
	name = "��������0 ���";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_WOOD;
	value = 0;
	damageTotal = 0;
//	damagetype = DAM_BLUNT;
	range = 300;
//	cond_atr[2] = ATR_STRENGTH;
//	cond_value[2] = 5;
	visual = "ItMi_Stuff_Amphore_01.3DS";
	
};
instance ItAmD1(C_ITEM)
{
	name = "��������1 ������";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_BURN;
	material = MAT_WOOD;
	value = 0;
	damageTotal = 0;
//	damagetype = DAM_BLUNT;
	range = 100;
//	cond_atr[2] = ATR_STRENGTH;
//	cond_value[2] = 5;
	visual = "ItMi_Stuff_Amphore_01.3DS";
	
};
instance ItAmD2(C_ITEM)
{
	name = "��������2 ������";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_THROW;
	material = MAT_WOOD;
	value = 0;
	damageTotal = 0;
//	damagetype = DAM_BLUNT;
	range = 100;
//	cond_atr[2] = ATR_STRENGTH;
//	cond_value[2] = 5;
	visual = "ItMi_Stuff_Amphore_01.3DS";
	
};
instance ItAmD3(C_ITEM)
{
	name = "��������3 ������";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_MISSION;
	material = MAT_WOOD;
	value = 0;
	damageTotal = 0;
//	damagetype = DAM_BLUNT;
	range = 100;
//	cond_atr[2] = ATR_STRENGTH;
//	cond_value[2] = 5;
	visual = "ItMi_Stuff_Amphore_01.3DS";
	
};
instance ItAmD4(C_ITEM)
{
	name = "��������4 ������";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_MULTI;
	material = MAT_WOOD;
	value = 0;
	damageTotal = 0;
//	damagetype = DAM_BLUNT;
	range = 100;
//	cond_atr[2] = ATR_STRENGTH;
//	cond_value[2] = 5;
	visual = "ItMi_Stuff_Amphore_01.3DS";
	
};
instance ItAmD5(C_ITEM)
{
	name = "��������5 ������";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_RING;
	material = MAT_WOOD;
	value = 0;
	damageTotal = 0;
//	damagetype = DAM_BLUNT;
	range = 100;
//	cond_atr[2] = ATR_STRENGTH;
//	cond_value[2] = 5;
	visual = "ItMi_Stuff_Amphore_01.3DS";
	
};
