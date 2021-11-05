func void B_SpecStateInit_Bleeding(var C_NPC slf,var C_NPC oth)
{
	if(slf.aivar[AIV_MM_REAL_ID] == ID_WOLF)
	{
		if(Hlp_Random(2))
		{
			PrintDebug("50%\50% Bleeding wound by Wolf");
			if(!isFlagsContainCategorie(oth.aivar[AIV_MM_VisualType],VT_BLOODY))
			{
				oth.aivar[AIV_MM_VisualType] += VT_BLOODY;
			};
		};
	};
};
func void B_SpecStateLoop_Bleeding(var C_NPC slf)
{
	if(slf.aivar[AIV_MM_VisualType] == VT_BLOODY)
	{
		//Здесь необходим очередной филд объекта с фрейм-каунтером или таймером
		//таймер есть в AI_StartState, но переводя объект в AI_StartState
		//необходимо тудаже наследовать и текущее состояние объекта..
		//т.е. если он файтит, то он должен продолжать файтить
		//если бегает, прыгает, бодрствует, то должен это продолжать делать
		//это пздц.
		//т.е. условно говоря нам нужны реализации:
		//ZS_Bleeding + Attack|StandAround|Run|Walk + _Loop
		//и когда объект получает рану, то переходит из одного из этих состояний в одноимённое с префиксом Bleeding
		//проблема в том, что помимо кровотечения у объекта могут быть дополнительные параллельные состояния
		//и таким образом кол-во дублирующегося кода неймоверно возрастает.. стрёмно.
		//хотя есть другой способ.. через кратность делимого (остаток от %)
		if(!Npc_GetStateTime(slf) % 5)
		{
			PrintDebug("One time in each 5 sec.");
			//Вот так, раз в 5 сек. будет отрабатывать.
			//И StateTime не надо сбрасывать.. таким образом не будет конфликтов с родительской функцией состояния
			//Надо тестить..akh working
			if(!Hlp_Random(100))
			{
				slf.attribute[ATR_HITPOINTS] -=1;
			};
			//Эта функция должна вызываться в цикле zs_.._loop
			//не учтено, то что эти лупы делают больше, чем одну итерацию за секунду..
			//таким образом.. данная реализация, весьма ограниченно работает. Но работает ;)
			//Угу.. можно с помощью рандома снизить вероятность урона в итерации
			//что приводит к выравниванию общего инъекц-урона. Таким образом можно считать вопрос решённым.
			//Хотя конечно, лучше решать данную проблему через доп филд объекта. Но они ограничены.
		};
	};
};
func void B_SpecStatesInit(var C_NPC slf, var C_NPC oth)
{
	PrintDebug("B_SpecStates..");
	PrintDebug("Should be invoked from any loop.");
	B_SpecStateInit_Bleeding(slf,oth);
};
func void B_SpecStatesLoop(var C_NPC slf)
{
	B_SpecStateLoop_Bleeding(slf);
};
