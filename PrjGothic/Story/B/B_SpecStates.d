func void B_SpecStates_Bleeding(var C_NPC slf,var C_NPC oth)
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
	if(oth.aivar[AIV_MM_VisualType] == VT_BLOODY)
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
			//Вот так, раз в 5 сек. будет отрабатывать.
			//И StateTime не надо сбрасывать.. таким образом не будет конфликтов с родительской функцией состояния
			//Надо тестить..akh working
		};
	};
};
func void B_SpecStates(var C_NPC slf, var C_NPC oth)
{
	PrintDebug("B_SpecStates..");
	PrintDebug("Should be invoked from any loop.");
	B_SpecStates_Bleeding(slf,oth);
};