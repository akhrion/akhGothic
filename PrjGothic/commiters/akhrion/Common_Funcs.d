func int B_Day_IsOdd()
{
	return Wld_GetDay() % 2;
};
//Возвращает строку обьединённую с интом.
func string getConcatSI(var string s1, var int i)
{
	return ConcatStrings(
		s1,
		IntToString(i)
	);
};
//Возвращает строку обьединённую с интом и второй строкой.
func string getConcatSIS(var string s1, var int i, var string s2)
{
	return ConcatStrings(
		getConcatSI(
			s1,
			i
		),
		s2
	);
};

func void msg(var string str, var int x, var int y){
	PrintScreen(str,x,y,FONT_SCREEN,5);
};
func void msgI(var int i_, var int x_, var int y_){
	PrintScreen(IntToString(i_),x_,y_,FONT_SCREEN,5);
};
func void msgISI(var int i_, var string s_, var int ii_, var int x_, var int y_){
	PrintScreen(ConcatStrings(ConcatStrings(IntToString(i_),s_),IntToString(ii_)),x_,y_,FONT_SCREEN,5);
};
func void msgSS(var string str_, var string strr_, var int x_, var int y_){
	PrintScreen(ConcatStrings(str_, strr_),x_,y_,FONT_SCREEN,5);
};
func void msgSI(var string str_, var int i_, var int x_, var int y_){
	PrintScreen(ConcatStrings(str_,IntToString(i_)),x_,y_,FONT_SCREEN,5);
};
func void PrintI(var int i_){
	Print(IntToString(i_));
};
func void PrintSI(var string str_, var int i_){
	Print(
		ConcatStrings(
			str_,
			IntToString(i_)
		)
	);
};
func void PrintSS(var string str_, var string str2_){
	Print(
		ConcatStrings(
			str_,
			str2_
		)
	);
};
func void PrintSSS(var string str_,var string str2_, var string str3_){
	Print(
		ConcatStrings(
			ConcatStrings(
				str_,
				str2_
			),
			str3_
		)
	);
};
func void PrintSIS(var string str_, var int i_,var string str2_){
	Print(
		ConcatStrings(
			ConcatStrings(
				str_,
				IntToString(i_)
			),
		str2_
		)
	);
};

//Проверяет является-ли h текущим часом 0-23
func int isCurHour(var int h)
{
	if(Wld_IsTime(h,0,h+1,1))
	{
		return true;
	};
	return false;
};
//Колбек инициализируется нулём, возвращает часы текущего дня.
func int getCurDayHours_cb(var int i){
	if(isCurHour(i))
	{
		return i;
	};
	return getCurDayHours_cb(i + 1);
};
//Возвращает часы текущего дня
func int getCurDayHours_a()
{
	return getCurDayHours_cb(0);
};

//Работа функции не очевидна. Использовать с осторожностью. akhrion
//При инициализации инкрементом в цикле, возвращает true когда increment
//достигает значения равного количеству минут от начала дня.
func int isCurMinute_private(var int increment)
{
	if(Wld_IsTime(0,increment,0,increment+2))
	{
		return true;
	};
	return false;
};
//Колбек инициализируется нулём, возвращает количество минут от начала дня.
func int getCurDayMinutes_cb(var int i){
	if(!isCurMinute_private(i))
	{
		return getCurDayMinutes_cb(i + 1);
	};
	return i;
};
//Возвращает количество минут от начала дня.
func int getCurDayMinutes()
{
	return getCurDayMinutes_cb(0);
};
//Возвращает количество часов текущего дня.
func int getCurDayHours()
{
	return getCurDayMinutes() / 60;
};
//Возвращает количество минут текущего часа.
func int getCurHourMinutes()
{
	return getCurDayMinutes() - 60 * getCurDayHours();
};
//Возвращает количество минут прошедших с начала игры.
func int getTimestamp()
{
	return Wld_GetDay() * 1440 + getCurDayMinutes();
};

func int Npc_GetHP(var C_NPC npc)
{
	return npc.attribute[ATR_HITPOINTS];
};
func int Npc_GetHPMax(var C_NPC npc)
{
	return npc.attribute[ATR_HITPOINTS_MAX];
};
func int Npc_GetHPPcnt(var C_NPC npc)
{
	return npc.attribute[ATR_HITPOINTS] * 100 / npc.attribute[ATR_HITPOINTS_MAX];
};
func void Npc_SetHP(var C_NPC npc, var int hp)
{
	npc.attribute[ATR_HITPOINTS] = hp;
};
func void Npc_SetHPPcnt(var C_NPC npc,var int hp)
{
	npc.attribute[ATR_HITPOINTS] = hp * npc.attribute[ATR_HITPOINTS_MAX] / 100;
};
func void Npc_DecreaseHP(var C_NPC npc,var int hp)
{
	npc.attribute[ATR_HITPOINTS] -= hp;
};
func void Npc_IncreaseHP(var C_NPC npc,var int hp)
{
	IF(npc.attribute[ATR_HITPOINTS] == npc.attribute[ATR_HITPOINTS_MAX]){return;};
	IF(npc.attribute[ATR_HITPOINTS] > npc.attribute[ATR_HITPOINTS_MAX]){Npc_SetHP(npc,npc.attribute[ATR_HITPOINTS_MAX]);return;};
	npc.attribute[ATR_HITPOINTS] += hp;
};

func int Npc_InFight(var C_NPC npc)
{
	if(Npc_IsInFightMode(npc,FMODE_NONE))
	{
		return false;
	};
	return true;
};
func int Npc_HasHealPotion(var C_NPC npc)
{
	if(
		Npc_HasItems(npc,ItFo_Potion_Health_01)
	||	Npc_HasItems(npc,ItFo_Potion_Health_02)
	||	Npc_HasItems(npc,ItFo_Potion_Health_03)
	)
	{
		return true;
	};
	return false;
};
func void Npc_UseHealPotion(var C_NPC npc)
{
	if(Npc_HasItems(self,ItFo_Potion_Health_04))
	{
		AI_UseItemToState(self,ItFo_Potion_Health_04,0);
		AI_PlayAni(self,"T_POTIONFAST_S0_2_STAND");
		Npc_RemoveInvItem(self,ItFo_Potion_Health_04);
		Npc_SetHPPcnt(self,100);
	};
	if(Npc_HasItems(self,ItFo_Potion_Health_03))
	{
		AI_UseItemToState(self,ItFo_Potion_Health_03,0);
		AI_PlayAni(self,"T_POTIONFAST_S0_2_STAND");
		Npc_RemoveInvItem(self,ItFo_Potion_Health_03);
		Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Elixier);
	};
	if(Npc_HasItems(self,ItFo_Potion_Health_02))
	{
		AI_UseItemToState(self,ItFo_Potion_Health_02,0);
		AI_PlayAni(self,"T_POTIONFAST_S0_2_STAND");
		Npc_RemoveInvItem(self,ItFo_Potion_Health_02);
		Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Extrakt);
	};
	if(Npc_HasItems(self,ItFo_Potion_Health_01))
	{
		AI_UseItemToState(self,ItFo_Potion_Health_01,0);
		AI_PlayAni(self,"T_POTIONFAST_S0_2_STAND");
		Npc_RemoveInvItem(self,ItFo_Potion_Health_01);
		Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_Essenz);
	};
};
func int Item_HasEdge(var C_ITEM itm)
{
	if(isFlagsContainCategorie(itm.damagetype, DAM_EDGE))
	{
		return true;
	};
	return false;
};
func int Item_HasBlunt(var C_ITEM itm)
{
	if(isFlagsContainCategorie(itm.damagetype, DAM_BLUNT))
	{
		return true;
	};
	return false;
};
func int Item_IsSword(var C_ITEM itm)
{
	if(
		isFlagsContainCategorie(itm.flags, ITEM_SWD)
	||	isFlagsContainCategorie(itm.flags, ITEM_2HD_SWD)
	)
	{
		return true;
	};
	return false;
};
func int Item_IsAxe(var C_ITEM itm)
{
	if(
		isFlagsContainCategorie(itm.flags, ITEM_AXE)
	||	isFlagsContainCategorie(itm.flags, ITEM_2HD_AXE)
	)
	{
		return true;
	};
	return false;
};
func int Item_IsClub(var C_ITEM itm)
{
	if(
		isFlagsContainCategorie(itm.damagetype, DAM_BLUNT)
	&&	(
			isFlagsContainCategorie(itm.flags, ITEM_AXE)
		||	isFlagsContainCategorie(itm.flags, ITEM_2HD_AXE)
		)
	)
	{
		return true;
	};
	return false;
};
func int Item_IsPickaxe(var C_ITEM itm)
{
	if(Hlp_GetInstanceID(itm) == ItMwPickaxe){return true;};
	return false;
};
func int Item_IsBow(var C_ITEM itm)
{
	if(isFlagsContainCategorie(itm.flags, ITEM_BOW))
	{
		return true;
	};
	return false;
};
func int Item_IsCrossbow(var C_ITEM itm)
{
	if(isFlagsContainCategorie(itm.flags, ITEM_Crossbow))
	{
		return true;
	};
	return false;
};
func int SC_GetState()
{
	if(SC_Satiety >= Satiety_Overeat){return Satiety_Overeat;};
	if(SC_Satiety >= Satiety_Good){return Satiety_Good;};
	if(SC_Satiety >= Satiety_Normal){return Satiety_Normal;};
	if(SC_Satiety >= Satiety_Hunger){return Satiety_Hunger;};
	if(SC_Satiety >= Satiety_Starvation){return Satiety_Starvation;};
	if(SC_Satiety >= Satiety_Deadly){return Satiety_Deadly;};
	return Satiety_Deadly;
	if(SC_State_IsOvereat){return Satiety_Overeat;};
	if(SC_State_IsGood){return Satiety_Good;};
	if(SC_State_IsNormal){return Satiety_Normal;};
	if(SC_State_IsHunger){return Satiety_Hunger;};
	if(SC_State_IsStarvation){return Satiety_Starvation;};
	if(SC_State_IsDeadly){return Satiety_Deadly;};
	return Satiety_Deadly;
};
func void SC_SetPrevState()
{
	SC_State_Prev = SC_GetState();
};
func void SC_SetState(var int state)
{
	if(state == Satiety_Overeat)
	{
		SC_State_IsOvereat = true;
		SC_State_IsGood = false;
		SC_State_IsNormal = false;
		SC_State_IsHunger = false;
		SC_State_IsStarvation = false;
		SC_State_IsDeadly = false;
	}
	else if(state == Satiety_Good)
	{
		SC_State_IsOvereat = false;
		SC_State_IsGood = true;
		SC_State_IsNormal = false;
		SC_State_IsHunger = false;
		SC_State_IsStarvation = false;
		SC_State_IsDeadly = false;
	}
	else if(state == Satiety_Normal)
	{
		SC_State_IsOvereat = false;
		SC_State_IsGood = false;
		SC_State_IsNormal = true;
		SC_State_IsHunger = false;
		SC_State_IsStarvation = false;
		SC_State_IsDeadly = false;
	}
	else if(state == Satiety_Hunger)
	{
		SC_State_IsOvereat = false;
		SC_State_IsGood = false;
		SC_State_IsNormal = false;
		SC_State_IsHunger = true;
		SC_State_IsStarvation = false;
		SC_State_IsDeadly = false;
	}
	else if(state == Satiety_Starvation)
	{
		SC_State_IsOvereat = false;
		SC_State_IsGood = false;
		SC_State_IsNormal = false;
		SC_State_IsHunger = false;
		SC_State_IsStarvation = true;
		SC_State_IsDeadly = false;
	}
	else if(state == Satiety_Deadly)
	{
		SC_State_IsOvereat = false;
		SC_State_IsGood = false;
		SC_State_IsNormal = false;
		SC_State_IsHunger = false;
		SC_State_IsStarvation = false;
		SC_State_IsDeadly = true;
	};
	SC_SetPrevState();
};
func void SC_SetState_Cur()
{
	if(SC_GetState() == Satiety_Overeat)
	{
		SC_State_IsOvereat = true;
		SC_State_IsGood = false;
		SC_State_IsNormal = false;
		SC_State_IsHunger = false;
		SC_State_IsStarvation = false;
		SC_State_IsDeadly = false;
	}
	else if(SC_GetState() == Satiety_Good)
	{
		SC_State_IsOvereat = false;
		SC_State_IsGood = true;
		SC_State_IsNormal = false;
		SC_State_IsHunger = false;
		SC_State_IsStarvation = false;
		SC_State_IsDeadly = false;
	}
	else if(SC_GetState() == Satiety_Normal)
	{
		SC_State_IsOvereat = false;
		SC_State_IsGood = false;
		SC_State_IsNormal = true;
		SC_State_IsHunger = false;
		SC_State_IsStarvation = false;
		SC_State_IsDeadly = false;
	}
	else if(SC_GetState() == Satiety_Hunger)
	{
		SC_State_IsOvereat = false;
		SC_State_IsGood = false;
		SC_State_IsNormal = false;
		SC_State_IsHunger = true;
		SC_State_IsStarvation = false;
		SC_State_IsDeadly = false;
	}
	else if(SC_GetState() == Satiety_Starvation)
	{
		SC_State_IsOvereat = false;
		SC_State_IsGood = false;
		SC_State_IsNormal = false;
		SC_State_IsHunger = false;
		SC_State_IsStarvation = true;
		SC_State_IsDeadly = false;
	}
	else if(SC_GetState() == Satiety_Deadly)
	{
		SC_State_IsOvereat = false;
		SC_State_IsGood = false;
		SC_State_IsNormal = false;
		SC_State_IsHunger = false;
		SC_State_IsStarvation = false;
		SC_State_IsDeadly = true;
	};
	SC_SetPrevState();
};
func int SC_GetPrevState()
{
	return SC_State_Prev;
};
func int SC_Satiety_State_isChange()
{
	if(SC_GetState() == SC_GetPrevState())
	{
		return false;
	};
	return true;
};
func void SC_MultiplicateDmg(var int multiplicator_)
{
	Npc_SetTalentValue(hero,NPC_TALENT_1H,MultiplicateIntOnFloat(
		Npc_GetTalentValue(hero,NPC_TALENT_1H), multiplicator_
	));
};
func void SC_DivideDmg(var int div_)
{
	Npc_SetTalentValue(hero,NPC_TALENT_1H,DivideIntOnFloat(
		Npc_GetTalentValue(hero,NPC_TALENT_1H), div_
	));
};
func void SC_SetDefDmg()
{
	Npc_SetTalentValue(hero,NPC_TALENT_1H,SC_DefTalentValue_1H);
	Npc_SetTalentValue(hero,NPC_TALENT_2H,SC_DefTalentValue_2H);
	Npc_SetTalentValue(hero,NPC_TALENT_BOW,SC_DefTalentValue_Bow);
	Npc_SetTalentValue(hero,NPC_TALENT_CROSSBOW,SC_DefTalentValue_Crossbow);
};
func void SC_ChangeDmg____OLD()
{
	Print("SC_ChangeDmg");
	if(SC_GetState() == SC_State_IsNormal)
	{
		if(SC_GetPrevState() == SC_State_IsHunger)
		{
//			increase dmg on 130
		}
		else if(SC_GetPrevState() == SC_State_IsOvereat){};
			//урон будет дробиться 70 * .01 = 0.700000001
		//нужна функция которая будет флоаты обрабатывать и следить за ними
	};
};
func void SC_ChangeDmg()
{
	Print("SC_ChangeDmg");
	if(SC_GetState() == SC_State_IsHunger)
	{
		if(SC_GetPrevState() == SC_State_IsStarvation){SC_SetDefDmg();SC_MultiplicateDmg(130);};
		if(SC_GetPrevState() == SC_State_IsStarvation){SC_SetDefDmg();SC_MultiplicateDmg(130);};
		if(SC_GetPrevState() == SC_State_IsNormal){SC_MultiplicateDmg(130);};
		if(SC_GetPrevState() == SC_State_IsGood){SC_MultiplicateDmg(130);};
		if(SC_GetPrevState() == SC_State_IsOvereat){SC_SetDefDmg();SC_MultiplicateDmg(130);};
//		Npc_SetTalentValue(hero,NPC_TALENT_1H,SC_DefTalentValue_1H);
	}
	else if(SC_GetState() == SC_State_IsNormal)
	{
		SC_SetDefDmg();
//		Npc_SetTalentValue(hero,NPC_TALENT_1H,SC_DefTalentValue_1H);
	};
};
func void Npc_RegenHP(var C_NPC npc_,var int hp_)
{
	if(npc_.attribute[ATR_HITPOINTS] == npc_.attribute[ATR_HITPOINTS_MAX]){return;};
	if(npc_.attribute[ATR_HITPOINTS] + hp_ > npc_.attribute[ATR_HITPOINTS_MAX]){npc_.attribute[ATR_HITPOINTS] = npc_.attribute[ATR_HITPOINTS_MAX];};
	npc_.attribute[ATR_HITPOINTS] += hp_;
};
func int SC_Jumped()
{
	if(Npc_GetBodyState(hero) == BS_JUMP){return true;};
	return false;
};
func void SC_Satiety_Increase(var int i_){SC_Satiety_Counter += i_;};
func void SC_Satiety_Decrease(var int i_){SC_Satiety_Counter -= i_;};
func void SC_Satiety_Count()
{
	if(
		SC_Satiety > 0
	&&	SC_Satiety_Counter >= Satiety_Decreasing_Per_Time
	)
	{
		SC_Satiety -= SC_Satiety_Counter / Satiety_Decreasing_Per_Time;
		SC_Satiety_Counter = SC_Satiety_Counter % Satiety_Decreasing_Per_Time;
	}
	else if(SC_Satiety_Counter <= (Satiety_Decreasing_Per_Time * -1))
	{
		SC_Satiety += abs(SC_Satiety_Counter) / Satiety_Decreasing_Per_Time;
		SC_Satiety_Counter = abs(SC_Satiety_Counter) % Satiety_Decreasing_Per_Time;		
	};
	if(SC_Satiety < 0){SC_Satiety = 0;};
	return;
	if(
		SC_Satiety > 0
	&&	SC_Satiety_Counter % Satiety_Decreasing_Per_Time == FALSE
	)
	{
		SC_Satiety_Counter =0;
		SC_Satiety -=1;
	};
	if(SC_Satiety < 0){SC_Satiety = 0;};
};
func void SC_DmgManager_SetOvereat()
{
	Npc_SetTalentValue(hero,NPC_TALENT_1H,MultiplicateIntOnFloat(SC_DefTalentValue_1H,Satiety_Mult_Overeat));
};
func void SC_DmgManager_SetHunger()
{
	Npc_SetTalentValue(hero,NPC_TALENT_1H,MultiplicateIntOnFloat(SC_DefTalentValue_1H,Satiety_Mult_Hunger));
};
func void SC_DmgManager_SetGood()
{
	Npc_SetTalentValue(hero,NPC_TALENT_1H,MultiplicateIntOnFloat(SC_DefTalentValue_1H,Satiety_Mult_Good));
};
func void SC_DmgManager_SetNormal()
{
	Npc_SetTalentValue(hero,NPC_TALENT_1H,MultiplicateIntOnFloat(SC_DefTalentValue_1H,Satiety_Mult_Normal));
};
func void SC_DmgManager_SetStarvation()
{
	Npc_SetTalentValue(hero,NPC_TALENT_1H,MultiplicateIntOnFloat(SC_DefTalentValue_1H,Satiety_Mult_Starvation));
};
func void SC_DmgManager_SetDeadly()
{
	Npc_SetTalentValue(hero,NPC_TALENT_1H,MultiplicateIntOnFloat(SC_DefTalentValue_1H,Satiety_Mult_Deadly));
};
func int Npc_HasEquippedSword(var C_NPC npc_)
{
	if(Npc_HasEquippedMeleeWeapon(npc_))
	{
		var C_ITEM itm;itm = Npc_GetEquippedMeleeWeapon(npc_);
		if(Item_IsSword(itm))
		{
			return true;
		};
	};
	return false;
};
func int Npc_HasEquippedPickAxe(var C_NPC npc_)
{
	if(!Npc_HasEquippedMeleeWeapon(npc_)){return false;};
	var C_ITEM itm;itm = Npc_GetEquippedMeleeWeapon(npc_);
	if(!Item_IsPickaxe(itm)){return false;};
	return true;
};
func int Game_GetChapter()
{
	return Kapitel;
};
func void Npc_RemoveInvItem_(var C_NPC npc_, var C_ITEM itm_)
{
	Npc_RemoveInvItem(npc_,Hlp_GetInstanceID(itm_));
};
func void Npc_SetStr_Mult(var C_NPC npc_,var int mult_)
{
	npc_.attribute[ATR_STRENGTH] = MultiplicateIntOnFloat(npc_.attribute[ATR_STRENGTH],mult_);
};
func void Npc_SetDex_Mult(var C_NPC npc_,var int mult_)
{
	npc_.attribute[ATR_DEXTERITY] = MultiplicateIntOnFloat(npc_.attribute[ATR_DEXTERITY],mult_);
};
func void Npc_SetHp_Mult(var C_NPC npc_,var int mult_)
{
	npc_.attribute[ATR_HITPOINTS] = MultiplicateIntOnFloat(npc_.attribute[ATR_HITPOINTS],mult_);
};
func void Npc_SetHpMax_Mult(var C_NPC npc_,var int mult_)
{
	npc_.attribute[ATR_HITPOINTS_MAX] = MultiplicateIntOnFloat(npc_.attribute[ATR_HITPOINTS_MAX],mult_);
};
func void Npc_SetProt_Blunt_Mult(var C_NPC npc_,var int mult_)
{
	npc_.protection[PROT_BLUNT] = MultiplicateIntOnFloat(npc_.protection[PROT_BLUNT],mult_);
};
func void Npc_SetProt_Edge_Mult(var C_NPC npc_,var int mult_)
{
	npc_.protection[PROT_EDGE] = MultiplicateIntOnFloat(npc_.protection[PROT_EDGE],mult_);
};
func void Npc_SetProt_Fire_Mult(var C_NPC npc_,var int mult_)
{
	npc_.protection[PROT_FIRE] = MultiplicateIntOnFloat(npc_.protection[PROT_FIRE],mult_);
};
func void Npc_SetProt_Magic_Mult(var C_NPC npc_,var int mult_)
{
	npc_.protection[PROT_MAGIC] = MultiplicateIntOnFloat(npc_.protection[PROT_MAGIC],mult_);
};
func void Npc_SetProt_Point_Mult(var C_NPC npc_,var int mult_)
{
	npc_.protection[PROT_POINT] = MultiplicateIntOnFloat(npc_.protection[PROT_POINT],mult_);
};
func int Npc_GetStr(var C_Npc npc_)
{
	return npc_.attribute[ATR_STRENGTH];
};
func int Npc_GetDex(var C_Npc npc_)
{
	return npc_.attribute[ATR_DEXTERITY];
};
func int Npc_GetProt_Edge(var C_Npc npc_)
{
	return npc_.protection[PROT_EDGE];
};
func int Npc_GetProt_Point(var C_Npc npc_)
{
	return npc_.protection[PROT_POINT];
};
func int SC_IsAlive()
{
	return hero.attribute[ATR_HITPOINTS] > 0;
};
func int Npc_IsAnimal(var C_Npc npc_)
{
	if(
		npc_.guild > GIL_SEPERATOR_HUM
	&&	npc_.guild < GIL_SEPERATOR_ORC
	&&	npc_.guild != GIL_SLF
	&&	npc_.guild != GIL_GOBBO
	&&	npc_.guild != GIL_TROLL
	&&	npc_.guild != GIL_DEMON
	&&	npc_.guild != GIL_ZOMBIE
	&&	npc_.guild != GIL_UNDEADORC
	&&	npc_.guild != GIL_SKELETON
	)
	{
		return true;
	};
	return false;
};
func int Npc_IsDissected(var C_NPC npc)
{
	if(isFlagsContainCategorie(npc.aivar[AIV_MM_VisualType], VT_DISSECTED))
	{
		return true;
	};
	return false;
};
func int Npc_IsFired(var C_NPC npc)
{
	if(isFlagsContainCategorie(npc.aivar[AIV_MM_VisualType], VT_FIRED))
	{
		return true;
	};
	return false;
};
func int Npc_IsBurned(var C_NPC npc)
{
	if(isFlagsContainCategorie(npc.aivar[AIV_MM_VisualType], VT_BURNED))
	{
		return true;
	};
	return false;
};
func int Npc_IsVerkohlt(var C_NPC npc)
{
	if(isFlagsContainCategorie(npc.aivar[AIV_MM_VisualType], VT_VERKOHLT))
	{
		return true;
	};
	return false;
};
func int Npc_IsAsh(var C_NPC npc)
{
	if(isFlagsContainCategorie(npc.aivar[AIV_MM_VisualType], VT_ASH))
	{
		return true;
	};
	return false;
};
//Одноимённые функции ниже, запоминают и возвращают
//количество полученного целью урона, в процентах от макс. хп
//Хранимые значения: от 0% до 99%
//Т.е. мы можем узнать сколько урона и какого типа, ~получил таргет.
//Используется в функции выдачи трофеев.
func int C_Npc_GetDamageRecieved(var C_NPC npc, var int dmgInxType)
{
	if(Hlp_IsValidNpc(npc))
	{
		if(dmgInxType == DAM_INDEX_EDGE)
		{
			return npc.aivar[AIV_MM_DamageRecieved_Hash] / expon(10,6) % expon(10,2);
		}
		else if(dmgInxType == DAM_INDEX_FIRE)
		{
			return npc.aivar[AIV_MM_DamageRecieved_Hash] / 10000 % 100;
//			return npc.aivar[AIV_MM_DamageRecieved_Hash] / expon(10,4) % expon(10,2);
		}
		else if(dmgInxType == DAM_INDEX_MAGIC)
		{
			return npc.aivar[AIV_MM_DamageRecieved_Hash] / expon(10,2) % expon(10,2);
		}
		else if(dmgInxType == DAM_INDEX_POINT)
		{
			return npc.aivar[AIV_MM_DamageRecieved_Hash] % expon(10,2);
		}
		else
		{
			return 100;
		};
	};
	return 101;
};
func int C_Npc_GetDamageRecieved_War(var C_NPC npc)
{
	return (npc.aivar[AIV_MM_DamageRecieved_Hash] / expon(10,6)) % expon(10,2);
};
func int C_Npc_GetDamageRecieved_Fire(var C_NPC npc)
{
	return (npc.aivar[AIV_MM_DamageRecieved_Hash] / expon(10,4)) % expon(10,2);
};
func int C_Npc_GetDamageRecieved_Magic(var C_NPC npc)
{
	return (npc.aivar[AIV_MM_DamageRecieved_Hash] / expon(10,2)) % expon(10,2);
};
func int C_Npc_GetDamageRecieved_Hunt(var C_NPC npc)
{
	return npc.aivar[AIV_MM_DamageRecieved_Hash] % expon(10,2);
};
func int C_Npc_GDR_AvailablePrcnt(var C_NPC npc)
{
	return 99
	- (
		  C_Npc_GetDamageRecieved(npc,DAM_INDEX_EDGE)
		+ C_Npc_GetDamageRecieved(npc,DAM_INDEX_FIRE)
		+ C_Npc_GetDamageRecieved(npc,DAM_INDEX_MAGIC)
		+ C_Npc_GetDamageRecieved(npc,DAM_INDEX_POINT)
	);
};
func void C_Npc_SetDamageRecieved(var C_NPC npc,var int dmg,var int dmgInxType)
{
	if(dmg)
	{
		var int prcnt; var int curDmg; var int aPP; var int aPC;
		prcnt = dmg * 100 / npc.attribute[ATR_HITPOINTS_MAX];
		aPP = C_Npc_GDR_AvailablePrcnt(npc);
		aPC = 99 - C_Npc_GetDamageRecieved(npc,dmgInxType);
		curDmg =	tern(prcnt > aPP, aPP,
					tern(prcnt > aPC, aPC,prcnt)
		);
		if(dmgInxType == DAM_INDEX_EDGE)
		{
			npc.aivar[AIV_MM_DamageRecieved_Hash] += curDmg * expon(10,6);
		}
		else if(dmgInxType == DAM_INDEX_FIRE)
		{
			npc.aivar[AIV_MM_DamageRecieved_Hash] += curDmg * expon(10,4);
		}
		else if(dmgInxType == DAM_INDEX_MAGIC)
		{
			npc.aivar[AIV_MM_DamageRecieved_Hash] += curDmg * expon(10,2);
		}
		else if(dmgInxType == DAM_INDEX_POINT)
		{
			npc.aivar[AIV_MM_DamageRecieved_Hash] += curDmg;
		};
	};
};
func void C_Npc_SetDamageRecieved_War(var C_NPC npc,var int dmg)
{
	if(dmg)
	{
		var int prcnt; var int curDmg;
		prcnt = dmg * 100 / npc.attribute[ATR_HITPOINTS_MAX];
		curDmg = C_Npc_GetDamageRecieved_War(npc);
		curDmg = tern(curDmg + prcnt > 99, 99, curDmg + prcnt);
		npc.aivar[AIV_MM_DamageRecieved_Hash] = curDmg * expon(10,6);
	};
};
func void C_Npc_SetDamageRecieved_Fire(var C_NPC npc,var int dmg)
{
	if(dmg)
	{
		var int prcnt; var int curDmg;
		prcnt = dmg * 100 / npc.attribute[ATR_HITPOINTS_MAX];
		curDmg = C_Npc_GetDamageRecieved_Fire(npc);
		curDmg = tern(curDmg + prcnt > 99, 99, curDmg + prcnt);
		npc.aivar[AIV_MM_DamageRecieved_Hash] = curDmg * expon(10,4);
	};
};
func void C_Npc_SetDamageRecieved_Magic(var C_NPC npc,var int dmg)
{
	if(dmg)
	{
		var int prcnt; var int curDmg;
		prcnt = dmg * 100 / npc.attribute[ATR_HITPOINTS_MAX];
		curDmg = C_Npc_GetDamageRecieved_Magic(npc);
		curDmg = tern(curDmg + prcnt > 99, 99, curDmg + prcnt);
		npc.aivar[AIV_MM_DamageRecieved_Hash] = curDmg * expon(10,2);
	};
};
func void C_Npc_SetDamageRecieved_Hunt(var C_NPC npc,var int dmg)
{
	if(dmg)
	{
		var int prcnt; var int curDmg;
		prcnt = dmg * 100 / npc.attribute[ATR_HITPOINTS_MAX];
		curDmg = C_Npc_GetDamageRecieved_Hunt(npc);
		curDmg = tern(curDmg + prcnt > 99, 99, curDmg + prcnt);
		npc.aivar[AIV_MM_DamageRecieved_Hash] = curDmg;
	};
};
func int Spell_HasFireDamage(var int splInx)
{
	if(
		splInx == SPL_FIREBALL
	||	splInx == SPL_FIREBOLT
	||	splInx == SPL_FIRESTORM
	||	splInx == SPL_FIRERAIN
	||	splInx == SPL_PYROKINESIS
	)
	{
		return true;
	};
	return false;
};
func int Spell_HasMagicDamage(var int splInx)
{
	if(
		splInx == SPL_CHAINLIGHTNING
	||	splInx == SPL_ICECUBE
	||	splInx == SPL_ICEWAVE
	||	splInx == SPL_THUNDERBALL
	||	splInx == SPL_THUNDERBOLT
	||	splInx == SPL_STORMFIST
	||	splInx == SPL_WINDFIST
	||	splInx == SPL_BREATHOFDEATH
	||	splInx == SPL_MASSDEATH
	||	splInx == SPL_DESTROYUNDEAD
	)
	{
		return true;
	};
	return false;
};

func int Spell_GetDamage(var int spellInx)
{
	var int dmg;
	if(spellInx == SPL_FIREBOLT){dmg = SPL_DAMAGE_FIREBOLT;};
	if(spellInx == SPL_FIREBALL){dmg = SPL_DAMAGE_FIREBALL;};
	if(spellInx == SPL_FIRESTORM){dmg = SPL_DAMAGE_FIRESTORM;};
	if(spellInx == SPL_FIRERAIN){dmg = SPL_DAMAGE_FIRERAIN;};
	if(spellInx == SPL_THUNDERBOLT){dmg = SPL_DAMAGE_THUNDERBOLT;};
	if(spellInx == SPL_THUNDERBALL){dmg = SPL_DAMAGE_THUNDERBALL;};
	if(spellInx == SPL_MASSDEATH){dmg = SPL_DAMAGE_MASSDEATH;};
	if(spellInx == SPL_BREATHOFDEATH){dmg = SPL_DAMAGE_BREATHOFDEATH;};
	if(spellInx == SPL_DESTROYUNDEAD){dmg = SPL_DAMAGE_DESTROYUNDEAD;};
	if(spellInx == SPL_WINDFIST){dmg = SPL_DAMAGE_WINDFIST;};
	if(spellInx == SPL_STORMFIST){dmg = SPL_DAMAGE_STORMFIST;};
	if(spellInx == SPL_ICECUBE){dmg = SPL_FREEZE_DAMAGE;};
	if(spellInx == SPL_ICEWAVE){dmg = SPL_FREEZE_DAMAGE;};
	if(spellInx == SPL_CHAINLIGHTNING){dmg = SPL_ZAPPED_DAMAGE_PER_SEC;};
	if(spellInx == SPL_PYROKINESIS){dmg = SPL_PYRO_DAMAGE_PER_SEC;};
	return dmg;
};

func int Npc_GetLastHitSpellLevel(var C_NPC npc)
{
	return npc.aivar[AIV_MM_DamageRecieved_Hash] / 100000000 % 100;
};
func void Npc_SetLastHitSpellLevel(var C_NPC npc, var int spellLevel)
{
	npc.aivar[AIV_MM_DamageRecieved_Hash] = spellLevel * 100000000;
};
func void C_Npc_RemoveVisualTypeFlag(var C_NPC npc, var int VT)
{
	if(isFlagsContainCategorie(npc.aivar[AIV_MM_VisualType], VT))
	{
		npc.aivar[AIV_MM_VisualType] -= VT;
	};
};
func void C_Npc_SetVisualTypeFlag(var C_NPC npc, var int VT)
{
	npc.aivar[AIV_MM_VisualType] += VT;
};
func void SetVisualType(var C_NPC npc)
{
	//akh working
	//refact
	var int fireDmg;
	fireDmg = C_Npc_GetDamageRecieved(npc,DAM_INDEX_FIRE);
	if(
		fireDmg > 80
	&&	!Npc_IsAsh(npc)
	)
	{
		C_Npc_SetVisualTypeFlag(npc,VT_ASH);
	}
	else if(
		fireDmg > 60
	&&	!Npc_IsVerkohlt(npc)
	)
	{
		C_Npc_SetVisualTypeFlag(npc,VT_VERKOHLT);
	}
	else if(
		fireDmg > 40
	&&	!Npc_IsBurned(npc)
	)
	{
		C_Npc_SetVisualTypeFlag(npc,VT_BURNED);
	}
	else if(
		fireDmg > 20
	&&	!Npc_IsFired(npc)
	)
	{
		C_Npc_SetVisualTypeFlag(npc,VT_FIRED);
	};
	var int warDmg;
	warDmg = C_Npc_GetDamageRecieved(npc,DAM_INDEX_EDGE);
	if(
		warDmg > 20
	&&	!Npc_IsDissected(npc)
	)
	{
		C_Npc_SetVisualTypeFlag(npc,VT_DISSECTED);
	};
};
func int SRD_EffectiveDamageTypes_Count(var int wd_,var int fd_, var int md_,var int hd_)
{
	var int c; c = 0;
	if(wd_){c +=1;};
	if(fd_){c +=1;};
	if(md_){c +=1;};
	if(hd_){c +=1;};
	return c;
};
func void SaveReceivedDamage_Monster()
{
	//Нужно имплиментировать детекцию крита
	//
	var c_ITEM itm;
	var int WarDmg; var int FireDmg; var int HuntDmg;  var int MgcDmg;
	var int OthStr;
	WarDmg = 0; FireDmg = 0; HuntDmg = 0; MgcDmg = 0; OthStr = 0;
	if(SC_bOneShot)
	{
		SC_bOneShot = false;
		itm = Npc_GetReadiedWeapon(other);
		HuntDmg += tern(
			(itm.damage[DAM_INDEX_POINT] - self.protection[PROT_POINT]) < 0,
			0,
			(itm.damage[DAM_INDEX_POINT] - self.protection[PROT_POINT])
		);
		C_Npc_SetDamageRecieved(self,Npc_GetHP(self)+HuntDmg,DAM_INDEX_POINT);
		Npc_SetHP(self,0);
		return;
	};
	if(Npc_IsInFightMode(other,FMODE_MAGIC))
	{
		if(Spell_HasFireDamage(Npc_GetActiveSpell(other)))
		{
			FireDmg += self.aivar[AIV_MM_LASTHPSTATE] - self.attribute[ATR_HITPOINTS];
		};
		if(Spell_HasMagicDamage(Npc_GetActiveSpell(other)))
		{
			MgcDmg += Spell_GetDamage(Npc_GetActiveSpell(other)) * Npc_GetLastHitSpellLevel(self) - self.protection[PROT_MAGIC];
		};
	}
	else if(Npc_HasReadiedWeapon(other))
	{
		itm = Npc_GetReadiedWeapon(other);
		MgcDmg += tern(
			(itm.damage[DAM_INDEX_BARRIER] - self.protection[PROT_BARRIER]) < 0,
			0,
			(itm.damage[DAM_INDEX_BARRIER] - self.protection[PROT_BARRIER])
		);
		if(Npc_IsInFightMode(other,FMODE_MELEE))
		{
			if(
				isFlagsContainCategorie(itm.damagetype,DAM_BLUNT)
			)
			{
				if(
					isFlagsContainCategorie(itm.damagetype,DAM_EDGE)
				)
				{
					othStr = other.attribute[ATR_STRENGTH] / 2;
					WarDmg += tern(
						((itm.damage[DAM_INDEX_BLUNT] + othStr) - self.protection[PROT_BLUNT]) < 0,
						0,
						((itm.damage[DAM_INDEX_BLUNT] + othStr) - self.protection[PROT_BLUNT])
					);
					WarDmg += tern(
						((itm.damage[DAM_INDEX_EDGE] + othStr) - self.protection[PROT_EDGE]) < 0,
						0,
						((itm.damage[DAM_INDEX_EDGE] + othStr) - self.protection[PROT_EDGE])
					);
				}
				else
				{
					othStr = other.attribute[ATR_STRENGTH];
					WarDmg += tern(
						((itm.damage[DAM_INDEX_BLUNT] + othStr) - self.protection[PROT_BLUNT]) < 0,
						0,
						((itm.damage[DAM_INDEX_BLUNT] + othStr) - self.protection[PROT_BLUNT])
					);
				};
			}
			else if(isFlagsContainCategorie(itm.damagetype,DAM_EDGE))
			{
				othStr  = other.attribute[ATR_STRENGTH];
				WarDmg += tern(
					((itm.damage[DAM_INDEX_EDGE] + othStr) - self.protection[PROT_EDGE]) < 0,
					0,
					((itm.damage[DAM_INDEX_EDGE] + othStr) - self.protection[PROT_EDGE])
				);
			};
		};
		FireDmg += tern(
			(itm.damage[DAM_INDEX_FIRE] - self.protection[PROT_FIRE]) < 0,
			0,
			(itm.damage[DAM_INDEX_FIRE] - self.protection[PROT_FIRE])
		);
		WarDmg += tern(
			(itm.damage[DAM_INDEX_FLY] - self.protection[PROT_FLY]) < 0,
			0,
			(itm.damage[DAM_INDEX_FLY] - self.protection[PROT_FLY])
		);
		MgcDmg += tern(
			(itm.damage[DAM_INDEX_MAGIC] - self.protection[PROT_MAGIC]) < 0,
			0,
			(itm.damage[DAM_INDEX_MAGIC] - self.protection[PROT_MAGIC])
		);
		HuntDmg += tern(
			(itm.damage[DAM_INDEX_POINT] - self.protection[PROT_POINT]) < 0,
			0,
			(itm.damage[DAM_INDEX_POINT] - self.protection[PROT_POINT])
		);
		HuntDmg += tern(
			(itm.damage[DAM_INDEX_FALL] - self.protection[PROT_FALL]) < 0,
			0,
			(itm.damage[DAM_INDEX_FALL] - self.protection[PROT_FALL])
		);
	}
	else if(Npc_IsInFightMode(other,FMODE_FIST))
	{
		WarDmg += tern(
			(other.attribute[ATR_STRENGTH] - self.protection[PROT_BLUNT]) < 0,
			0,
			(other.attribute[ATR_STRENGTH] - self.protection[PROT_BLUNT])
		);
	};
	C_Npc_SetDamageRecieved(self,WarDmg,DAM_INDEX_EDGE);
	C_Npc_SetDamageRecieved(self,FireDmg,DAM_INDEX_FIRE);
	C_Npc_SetDamageRecieved(self,MgcDmg,DAM_INDEX_MAGIC);
	C_Npc_SetDamageRecieved(self,HuntDmg,DAM_INDEX_POINT);
	self.aivar[AIV_MM_LASTHPSTATE] = self.attribute[ATR_HITPOINTS];
};
func int Npc_HasReadiedTwoHandedAxe(var C_Npc npc_)
{
	var C_Item itm;
	itm = Npc_GetReadiedWeapon(npc_);
	if(isFlagsContainCategorie(itm.flags,ITEM_2HD_AXE))
	{return true;};
	return false;
};
func int Npc_HasReadiedTwoHandedSwd(var C_Npc npc_)
{
	var C_Item itm;
	itm = Npc_GetReadiedWeapon(npc_);
	if(isFlagsContainCategorie(itm.flags,ITEM_2HD_SWD))
	{return true;};
	return false;
};
func int Npc_HasReadiedTwoHandedMeleeWeapon(var C_Npc npc_)
{
	var C_Item itm;
	itm = Npc_GetReadiedWeapon(npc_);
	if(
		isFlagsContainCategorie(itm.flags,ITEM_2HD_SWD)
	||	isFlagsContainCategorie(itm.flags,ITEM_2HD_AXE)
	)
	{return true;};
	return false;
};
func void SC_RescaleDamage_RestoreVictimHP(var C_Item itm_,var C_Npc agressor_, var C_Npc vict_)
{
	if((itm_.damageTotal + Npc_GetStr(agressor_)) > Npc_GetProt_Edge(vict_))
	{
		Npc_SetHP(vict_,Npc_GetHP(vict_)+(itm_.damageTotal + Npc_GetStr(agressor_) - Npc_GetProt_Edge(vict_)));
	};
};
func void SC_RescaleDamage_Melee(var C_Npc npc_)
{
	if(!Npc_HasReadiedTwoHandedMeleeWeapon(npc_)){return;};
	if(Npc_IsPlayer(npc_)){
		SC_Stamina -=10;
		if(SC_Stamina < 0){return;};
	};
	var C_Item itm;
	itm = Npc_GetReadiedWeapon(npc_);
	SC_RescaleDamage_RestoreVictimHP(itm,npc_,self);
	var int TwoHandedWeaponDamage;TwoHandedWeaponDamage = (MultiplicateIntOnFloat(itm.damageTotal, Damage_StaminaMultiplicator) + Npc_GetStr(npc_));
	var int actualDmg;
	if(TwoHandedWeaponDamage > Npc_GetProt_Edge(self))
	{
		if(TwoHandedWeaponDamage - Npc_GetProt_Edge(self) > MinDamage_TwoHanded)
		{
			actualDmg = TwoHandedWeaponDamage - Npc_GetProt_Edge(self);
			Npc_SetHP(self,Npc_GetHP(self) - actualDmg);
		}
		else
		{
			actualDmg = MinDamage_TwoHanded;
			Npc_SetHP(self,Npc_GetHP(self) - actualDmg);
		};
	};
};
//Функция меняет урон получаемый таргетом от ГГ
func void SC_RescaleDamage()
{
//	if(!Npc_IsPlayer(other)){return;};
	SC_RescaleDamage_Melee(other);
	if(!Npc_HasReadiedRangedWeapon(other)){return;};
	var C_Item itm;
	itm = Npc_GetReadiedWeapon(other);
	if(itm.damageTotal > Npc_GetProt_Point(self))
	{
		Npc_SetHP(self,Npc_GetHP(self)+(itm.damageTotal - Npc_GetProt_Point(self)));
	};
	var int ProtBuffer;ProtBuffer = Npc_GetProt_Point(self) - Npc_GetDex(other);
	var int actualDmg;
	if(ProtBuffer > 0)
	{
		actualDmg = itm.damageTotal - ProtBuffer;
		if(actualDmg > 0)
		{
			Npc_SetHP(self,Npc_GetHP(self) - actualDmg);
		};
	}
	else
	{
		actualDmg = itm.damageTotal;
		Npc_SetHP(self,Npc_GetHP(self) - actualDmg);
	};
};
func void Npc_ChangeModelFatness(var C_Npc npc_)
{
	if(npc_.attribute[ATR_STRENGTH] > 170)
	{
		Mdl_SetModelFatness(npc_,2.5);
	}
	else if(npc_.attribute[ATR_STRENGTH] > 150)
	{
		Mdl_SetModelFatness(npc_,2.3);
	}
	else if(npc_.attribute[ATR_STRENGTH] > 130)
	{
		Mdl_SetModelFatness(npc_,2.1);
	}
	else if(npc_.attribute[ATR_STRENGTH] > 110)
	{
		Mdl_SetModelFatness(npc_,1.9);
	}
	else if(npc_.attribute[ATR_STRENGTH] > 90)
	{
		Mdl_SetModelFatness(npc_,1.7);
	}
	else if(npc_.attribute[ATR_STRENGTH] > 70)
	{
		Mdl_SetModelFatness(npc_,1.5);
	}
	else if(npc_.attribute[ATR_STRENGTH] > 50)
	{
		Mdl_SetModelFatness(npc_,1.3);
	}
	else if(npc_.attribute[ATR_STRENGTH] > 30)
	{
		Mdl_SetModelFatness(npc_,1.1);
	};
};
func void Npc_SetDeadTime(var C_Npc npc_)
{
	npc_.aivar[AIV_MM_DEAD_Timestamp] = getTimestamp();
};
func int Npc_GetDeadTime(var C_Npc npc_)
{
	return npc_.aivar[AIV_MM_DEAD_Timestamp];
};
func int Npc_IsRevived(var C_Npc npc_)
{
	return npc_.aivar[AIV_MM_DEAD_Timestamp];
};
func int B_Npc_IsTimeForRespawn(var C_NPC npc)
{
	if(Npc_GetDeadTime(npc) + npc.spawnDelay < getTimestamp())
	{
		return true;
	};
	return false;
};
func int B_Npc_GetID(var C_NPC npc)
{
	return npc.aivar[AIV_MM_REAL_ID];
};
func void B_Npc_SetMana(var C_NPC npc,var int mana)
{
	npc.attribute[ATR_MANA] = mana;
};
func int B_Npc_GetMana(var C_NPC npc)
{
	return npc.attribute[ATR_MANA];
};
//Восполняет отсутствующее ХП за счёт маны в соотношении 1:1
func void B_Npc_ManaToHp(var C_NPC npc)
{
	if(npc.attribute[ATR_MANA] < 1){return;};
	if(npc.attribute[ATR_HITPOINTS] >= npc.attribute[ATR_HITPOINTS_MAX]){return;};
	if(npc.attribute[ATR_MANA] > npc.attribute[ATR_HITPOINTS_MAX] - npc.attribute[ATR_HITPOINTS])
	{
		npc.attribute[ATR_MANA] -= npc.attribute[ATR_HITPOINTS_MAX] - npc.attribute[ATR_HITPOINTS];
		npc.attribute[ATR_HITPOINTS] = npc.attribute[ATR_HITPOINTS_MAX];
	}
	else
	{
		npc.attribute[ATR_HITPOINTS] += npc.attribute[ATR_MANA];
		npc.attribute[ATR_MANA] = 0;
	};
};
//Аналогично предыдущей функции, но кратность 1:X
func void B_Npc_ManaToHpX(var C_NPC npc,var int multiplicity)
{
	if(npc.attribute[ATR_MANA] < 1){return;};
	if(npc.attribute[ATR_HITPOINTS] >= npc.attribute[ATR_HITPOINTS_MAX]){return;};
	if(npc.attribute[ATR_MANA] * multiplicity > npc.attribute[ATR_HITPOINTS_MAX] - npc.attribute[ATR_HITPOINTS])
	{
		npc.attribute[ATR_MANA] = ((
			npc.attribute[ATR_MANA] * multiplicity
		) - (
			npc.attribute[ATR_HITPOINTS_MAX] - npc.attribute[ATR_HITPOINTS]
		)) / multiplicity;
		npc.attribute[ATR_HITPOINTS] = npc.attribute[ATR_HITPOINTS_MAX];
	}
	else
	{
		npc.attribute[ATR_HITPOINTS] += npc.attribute[ATR_MANA] * multiplicity;
		npc.attribute[ATR_MANA] = 0;
	};
};
func void B_Npc_SetHP_AfterRevive(var C_NPC npc,var C_NPC prevInstance)
{
	B_Npc_SetMana(npc,B_Npc_GetMana(prevInstance));
	Npc_SetHP(npc,1);
	B_Npc_ManaToHpX(npc,10);
};
//Вызывается в функции Info_Vlk_GiveMeOre_Condition
//Возвращает true если НПС заплатил руду сегодня.
func int B_Npc_PayDayOre_IsPayed(var C_NPC npc)
{
	if(
		(
		B_Day_IsOdd()
	&&	isFlagsContainCategorie(npc.aivar[AIV_BOOLPOOL47],BP47_PAYDAY)
		)
	||
		(
		!B_Day_IsOdd()
	&&	!isFlagsContainCategorie(npc.aivar[AIV_BOOLPOOL47],BP47_PAYDAY)
		)
	)
	{
		return true;
	};
	return false;
};
func void B_Npc_PayDayOre_FlipPayedFlag(var C_NPC npc)
{
	if(isFlagsContainCategorie(npc.aivar[AIV_BOOLPOOL47],BP47_PAYDAY)){
		npc.aivar[AIV_BOOLPOOL47] -= BP47_PAYDAY;
	}
	else
	{
		npc.aivar[AIV_BOOLPOOL47] += BP47_PAYDAY;		
	};
};
