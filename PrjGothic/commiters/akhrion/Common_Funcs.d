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
	PrintScreen(str,x,y,"FONT_OLD_10_WHITE.TGA",5);
};
func void msgI(var int i_, var int x_, var int y_){
	PrintScreen(IntToString(i_),x_,y_,"FONT_OLD_10_WHITE.TGA",5);
};
func void msgISI(var int i_, var string s_, var int ii_, var int x_, var int y_){
	PrintScreen(ConcatStrings(ConcatStrings(IntToString(i_),s_),IntToString(ii_)),x_,y_,"FONT_OLD_10_WHITE.TGA",5);
};
func void msgSS(var string str_, var string strr_, var int x_, var int y_){
	PrintScreen(ConcatStrings(str_, strr_),x_,y_,"FONT_OLD_10_WHITE.TGA",5);
};
func void msgSI(var string str_, var int i_, var int x_, var int y_){
	PrintScreen(ConcatStrings(str_,IntToString(i_)),x_,y_,"FONT_OLD_10_WHITE.TGA",5);
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
func int Npc_InFight(var C_NPC npc)
{
	if(Npc_IsInFightMode(npc,FMODE_NONE))
	{
		return false;
	};
	return true;
};