func void akh_RespawnInit()
{
	msgI(RP_Scavenger.lastRespawnTime,0,44);
	if(RP_Scavenger.lastRespawnTime == 0)
	{
//		RP_Scavenger.delay = 5;
		RP_Scavenger.lastRespawnTime = getTimestamp();
		msgI(RP_Scavenger.lastRespawnTime,0,46);
	};
};
func void akh_Respawn_cb(var int instanceID_, var int i)
{
	if(i < 12)
	{
		if(RP_Scavenger.notRespawnedAmount)
		{
			if(
				RP_Scavenger.inxNE == RP_Scavenger.arrSize ||
				RP_Scavenger.inxNE == RP_Scavenger.lstInxNAStateBefoReset
			)
			{
				RP_Scavenger.inxNE = 0;
			};
			Wld_InsertNpc(instanceID_,RP_Scavenger.spMemo[RP_Scavenger.inxNE]);
			RP_Scavenger.spMemo[RP_Scavenger.inxNE] = "";
			RP_Scavenger.inxNE +=1;
			RP_Scavenger.notRespawnedAmount -=1;
			akh_Respawn_cb(instanceID_,i+1);
		}
		else
		{
			return;
		};
	};
};

func void akh_RespawnRequested()
{
	RP_Scavenger.isRespawnRequested = false;
	RP_Scavenger.lstInxNAStateBefoReset = RP_Scavenger.inxNA;
	RP_Scavenger.inxNA = 0;
	if(RP_Scavenger.inxNE - 10 < RP_Scavenger.inxNA)
	{
		akh_Respawn_cb(RP_Scavenger.instanceID,0);
		RP_Scavenger.lastRespawnTime = getTimestamp();
	};

};
//AKH WORKING
//Тест
//Потрясающе.. это работает..
//Уже нет.. это допиливается..
//Это не самостоятельная функция.. она работает в тандеме с функцией из akh_memo_death.d
//Данная функция вызывается в регулярном цикле.
//Без понятия как это реализовать через класс.. есть куча ограничений.. или я просто не разобрался.
//Без класса это реализуемо - в соответствии с тем-же алгоритмом, но скалируется хуже..
//хотя и с классом оно скалировалось-бы тоже не айс.
//Есть ещё реализация через манекен: при смерти моба создаётся его аналог под землёй или водой
//на него вешается рутина, распорядок и по прошествии Н-минут он запускает
// ремув себя и респавн по сохранённому в себе спавнпоинту.
var RESPAWN asd;
func void akh_Respawn()
{
	msg("111111111111111111111",0,40);
//	if(!RP_Scavenger.isArrEmpty)
	resp.instanceID = 22;
	msgI(resp.instanceID, 10,40);
	if(asd.isArrEmpty)
	{
		akh_RespawnInit();
		msg("22222222222222222",0,42);
		msgI(RP_Scavenger.isRespawnRequested,0,48);
		if(RP_Scavenger.isRespawnRequested)
		{
			akh_RespawnRequested();
		};
		//Сделали выгрузку, всё у нас хорошо.. работаем штатно. перед нами ещё 12 свободных слотов минимум..
		//Мы на нуле, а некст слот на 13
		msgSI("Delay:	 				", RP_Scavenger.delay,-1,60);
		msgSI("Timestamp: 				", getTimestamp(),-1,62);
		msgSI("RP_Scavenger.lastRespawnTime: ", RP_Scavenger.lastRespawnTime,-1,64);
		if(
			getTimestamp() - RP_Scavenger.delay > RP_Scavenger.lastRespawnTime
		)
		{
			//Если пришло время спавна..
			if(RP_Scavenger.notRespawnedAmount)
			{
				//Если есть кого спавнить..
				msgSS("RP_Scavenger.spMemo: ", RP_Scavenger.spMemo,0,64);
				msgSS("RP_Scavenger.spMemo[0]: ", RP_Scavenger.spMemo[0],0,66);
				msgSI("RP_Scavenger.inxNA: ", RP_Scavenger.inxNA,0,68);
				msgSI("RP_Scavenger.inxNE: ", RP_Scavenger.inxNE,0,70);
				RP_Scavenger.lastRespawnTime = getTimestamp();
				if(
					RP_Scavenger.inxNE == RP_Scavenger.arrSize ||
					RP_Scavenger.inxNE == RP_Scavenger.lstInxNAStateBefoReset
				)
				{
					RP_Scavenger.inxNE = 0;
				};
				Wld_InsertNpc(RP_Scavenger.instanceID,RP_Scavenger.spMemo[RP_Scavenger.inxNE]);
				RP_Scavenger.notRespawnedAmount -=1;
				RP_Scavenger.inxNE +=1;
			};
		};
	};
};

//Вызывать данную функцию следует из ZS_Dead() расположенной в файле AI\ZS_Human\ZS_Dead.d
//Не работает
func void akh_memo_death(var c_npc dead_)
{
//	if(Npc_IsDead(dead_) && Hlp_GetInstanceID(dead_) == Hlp_GetInstanceID(Scavenger))
	if(Npc_IsDead(dead_) && Hlp_GetInstanceID(dead_) == RP_Scavenger.instanceID)
	{
		if(
//			Spawn_scavengersInxNA > Spawn_MaxInx-10 ||
			RP_Scavenger.inxNA > RP_Scavenger.arrSize - 10 ||
			(
			RP_Scavenger.inxNA < RP_Scavenger.inxNE &&
			RP_Scavenger.inxNA > RP_Scavenger.inxNE - 10
//			Spawn_scavengersInxNA < Spawn_scavengersInxNE &&
//			Spawn_scavengersInxNA > Spawn_scavengersInxNE - 10
			)
		)
		{
			//кустарная защита от переполнения массива - в случае, когда
			//несколько мобов умирают одновременно.
			RP_Scavenger.isRespawnRequested = true;
			RP_Scavenger.notRespawnedAmount +=1;
			RP_Scavenger.spMemo[RP_Scavenger.inxNA] = dead_.spawnPoint;
			RP_Scavenger.isArrEmpty = false;
			RP_Scavenger.inxNA +=1;
//			isAkhRespawnNeed = true;
//			Spawn_scavengersAmountNotRespawned +=1;
//			Spawn_scavengers[Spawn_scavengersInxNA] = dead_.spawnPoint;
//			Spawn_scavengersInxNA +=1;
			
		}
		else
		{
			RP_Scavenger.notRespawnedAmount +=1;
			RP_Scavenger.spMemo[RP_Scavenger.inxNA] = dead_.spawnPoint;
			RP_Scavenger.isArrEmpty = false;
			RP_Scavenger.inxNA +=1;
//			Spawn_scavengersAmountNotRespawned +=1;
//			Spawn_scavengers[Spawn_scavengersInxNA] = dead_.spawnPoint;
//			Spawn_scavengersInxNA +=1;
		};
	};
};


const int iInx = 0,getFreeInx_cb_increment = 0;
var int akhResp_iID[200],akhResp_dT[200],akhResp_delay[200];
var string akhResp_SP[200];
func int getFreeInx_cb()
{
	if(akhResp_iID[getFreeInx_cb_increment] && getFreeInx_cb_increment < 200){
		getFreeInx_cb_increment +=1;
		return getFreeInx_cb();
	}
	else if(getFreeInx_cb_increment > 199)
	{
		return -1;
	};
	return getFreeInx_cb_increment;
};
func int getFreeInx()
{
	if(akhResp_iID[0])
	{
		return getFreeInx_cb();
	};
	return 0;
};
func int isValidInx(var int i)
{
	if(i+1)
	{
		return true;
	};
	return false;
};
func void insertNew(var int iID,var string SP,var int dT,var int delay)
{
	iInx = getFreeInx();
	if(!isValidInx(iInx))
	{
		msg("ERROR: Sorry, but respawn system doesn't work.",50,50);
		msg("ERROR: Spawn limit is reached.",50,52);
		return;
	};
	akhResp_iID[iInx] = iID;
	akhResp_SP[iInx] = SP;
	akhResp_dT[iInx] = dT;
	akhResp_delay[iInx] = delay;
	//done..
	//below can be deleted..
	msg("HELLO",0,30);
	msgSI("iID: ",iID,0,32);
	msgSS("SP: ",SP,0,34);
	msgSI("dT: ",dT,0,36);
	msgSI("delay: ",delay,0,38);
	akhResp_iID[0] = iID;
	msgSI("resp.instanceID[0]: ",akhResp_iID[0],10,32);
	msgSI("resp.instanceID[1]: ",akhResp_iID[1],10,34);
};