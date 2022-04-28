var C_ITEM itm;
func void akh_OverlayTest()
{
	if(Npc_HasReadiedWeapon(hero))
	{
		itm = Npc_GetReadiedWeapon(hero);
		if(itm.damagetype == DAM_BLUNT)
		{
			msgSI("DAM_BLUNT: ",itm.damagetype,80,-1);
		};
		if(itm.damagetype == DAM_EDGE)
		{
			msgSI("DAM_EDGE: ",itm.damagetype,80,52);
		};
		if(itm.damagetype == DAM_EDGE + DAM_BLUNT)
		{
			msgSI("DAM_EDGE + DAM_BLUNT: ",itm.damagetype,80,54);
		};
		if(itm.damagetype == (DAM_EDGE | DAM_BLUNT))
		{
			msgSI("DAM_EDGE | DAM_BLUNT: ",itm.damagetype,80,56);
		};
		if(itm.damagetype == (DAM_EDGE || DAM_BLUNT))
		{
			msgSI("DAM_EDGE || DAM_BLUNT: ",itm.damagetype,80,58);
		};
		if(isFlagsContainCategorie(itm.damagetype,DAM_BLUNT))
		{
			msgSI("damagetype contain DAM_BLUNT: ",itm.damagetype,80,60);			
		};
	};
	msgSI("last dist: ",hero.aivar[AIV_LASTDISTTOWP],0,50);
	msgSI("OCC_GATE: ",Npc_GetDistToWP(hero,"OCC_GATE"),0,52);
	msgSI("OCC_GATE_INSIDE: ",Npc_GetDistToWP(hero,"OCC_GATE_INSIDE"),0,54);
	
	msgSI("FIREMASTER Skill0058: ",Npc_GetTalentSkill(hero,NPC_TALENT_FIREMASTER),0,58);
	msgSI("FIREMASTER Value0060: ",Npc_GetTalentValue(hero,NPC_TALENT_FIREMASTER),0,60);
	msgI(Npc_GetBodyState(hero),0,62);

	msgSS("MOB: ",Npc_GetDetectedMob(hero),0,68);
	if(Npc_GetTarget(hero))
	{
//msgSI("WarDmg: ", 	C_Npc_GetDamageRecieved(other,DAM_INDEX_EDGE),		80,40);
//msgSI("Fire: ", 	C_Npc_GetDamageRecieved(other,DAM_INDEX_FIRE),		80,42);
//msgSI("Magic: ", 	C_Npc_GetDamageRecieved(other,DAM_INDEX_MAGIC),	80,44);
//msgSI("HuntDmg: ", 	C_Npc_GetDamageRecieved(other,DAM_INDEX_POINT),	80,46);
		msgSI("ID: ",other.id,0,70);
		msgSS("SP: ",other.spawnPoint,0,72);
		msgSS("WP: ",other.wp,0,74);
	}
	else
	{
		msg("ID: target isn't exist",0,70);
		msg("SP: target isn't exist",0,72);
		msg("WP: target isn't exist",0,74);
	};
	msgSS("Self: ",self.name,0,76);	msgSI("sense_range: ",other.senses_range,17,76);
	msgSS("Other: ",other.name,0,78);	msgSI("Dist: ",Npc_GetDistToNpc(hero,other),17,78);
										msgSI("PCISSTRONGER: ",other.aivar[AIV_PCISSTRONGER],17,80);
										msgSI("BEENATTACKED: ",other.aivar[AIV_BEENATTACKED],17,82);
										
	msgSS("Victim: ",victim.name,0,80);
	msgSI("ScavengerInstID: ",Hlp_GetInstanceID(Scavenger),0,82);
	msgSI("MoleratInstID: ",Hlp_GetInstanceID(Molerat),0,84);
};

func void josefFight()
{
	var C_NPC josef;
	josef = Hlp_GetNpc(GRD_238_Gardist);
	if(!Npc_IsDead(josef))
	{
		if(!Josef_bOrcDogsFightHappen)
		{
//			Print(IntToString(Hlp_Random(3)));
			if(!Josef_bSpawnedOrcDogs)
			{
				if(Npc_GetDistToPlayer(josef) < 2000)
				{
					Josef_bMeetPlayer  = true;
				}
				else if(Josef_bMeetPlayer && Npc_GetDistToPlayer(josef) > 5000)
				{
					Josef_bSpawnedOrcDogs = true;
					Josef_bOrcDogs_WaitPlayer = true;
					Wld_InsertNpc(OrcDogAgressive1,josef.wp);
					Wld_InsertNpc(OrcDogAgressive2,josef.wp);
					Wld_InsertNpc(OrcDogAgressive3,josef.wp);
					B_SetImmortal(josef);
					if(!Npc_IsDead(GRD_237_Gardist))
					{
						B_SetImmortal(GRD_237_Gardist);
					};
				};
			}
			else
			{
				if(Josef_bOrcDogs_WaitPlayer)
				{
					if(
						Npc_IsAiming(hero,OrcDogAgressive1)
					||	Npc_IsAiming(hero,OrcDogAgressive2)
					||	Npc_IsAiming(hero,OrcDogAgressive3)
					)
					{
						Josef_StartOrcDogsFight();
						return;
					};
					if(Npc_GetDistToPlayer(josef) < 1000)
					{
						Josef_StartOrcDogsFight();
						return;
					};
					if(Npc_GetDistToPlayer(josef) < 3000)
					{
						if(Josef_iOrcDogs_WaitPlayer_Counter < 15)
						{
							Josef_iOrcDogs_WaitPlayer_Counter +=1;
						}
						else
						{
							Josef_StartOrcDogsFight();
							return;
						};
					};
				}
				else
				{
					
				};
			};
		};
	};
};



class rsp
{
	var int arr[20];
	const int inx = 0;
};
instance rspn(rsp)
{
};
var int arr[20];
const int inx = 0;
func void check()
{
	if(inx > 9)
	{
		msgI(rspn.arr[0],50,50);
		msgI(rspn.arr[1],50,52);
		msgI(rspn.arr[2],50,54);
		msgI(rspn.arr[3],50,56);
		msgI(rspn.arr[4],50,58);
		msgI(rspn.arr[5],50,60);
		msgI(rspn.arr[6],50,62);
		rspn.inx -=1;
		msgI(rspn.arr[rspn.inx],50,64);
		rspn.inx +=1;
		return;
	};
	rspn.arr[inx] = rspn.inx;
	Print(IntToString(rspn.arr[inx]));
	inx +=1;
	rspn.inx = inx;
	check();
};
func void AssessPerson()
{
	if(
		Hlp_GetInstanceID(other) == Hlp_GetInstanceID(SLD_753_Baloro) &&
		SLD_753_Baloro_SC_besorgt_den_Kram == LOG_RUNNING &&
		Npc_IsDead(other)
	)
	{
		B_LogEntry(Baloros_Waffe,"Балоро не пережил нападение на Свободную шахту. Теперь я не узнаю, какое оружие он обещал мне.");
//		Log_SetTopicStatus(Baloros_Waffe,LOG_FAILED);
//		SLD_753_Baloro_SC_besorgt_den_Kram = LOG_FAILED;

	};
};
var int noone;
func void RingOfTemporalisPower_Handler()
{
	if(!RingOfTemporalisPowerEquiped)
	{
		return;
	};
	RingOfTemporalisPower.hp -=1;
	if(RingOfTemporalisPower.hp < 1)
	{
		UnEquip_RingOfTemporalisPower_Script(hero);
	};
};
func void akh_Regeneration()
{
//	PrintSI("aaaa",SC_GetState());
//	PrintSI("bbbb",Satiety_State_Normal);
	if(SC_GetState() == Satiety_State_Overeat)
	{
		//А как ты себя чувствуешь, когда обожрёшься? Тебе хочется что-то делать?
		//Я лично, повевеситься готов в такие моменты.. омг..
		Npc_DecreaseHP(hero,1);
		return;
	}
	else if(SC_GetState() == Satiety_State_Good)
	{
		Npc_RegenHP(hero,2);
		return;
	}
	else if(SC_GetState() == Satiety_State_Normal)
	{
//		Print("regen+1");
		Npc_RegenHP(hero,1);
		return;
	};
};
func void akh_Buff_Hydration()
{
	if(getTimestamp() > SC_Buff_GTSEnd_Hydration)
	{
		SC_Buff_bHydration = false;
	};
};
func void akh_Buff_Exp()
{
	if(
		Achieve_bHoneycombLover
	&&	Achieve_timeHoneycombLover + HoneycombLover_ExpPeriod < getTimestamp()
	)
	{
		Achieve_timeHoneycombLover = getTimestamp();
		B_GiveXP(100);
	};
};
func void akh_Buff()
{
	if(Npc_GetHPMax(hero) > Npc_GetHP(hero))
	{
		if(Buff_Heal1_counter)
		{
			Buff_Heal1_counter -=1;
			Npc_IncreaseHP(hero,Buff_Heal1_Val);
		};
		if(Buff_Heal2_counter)
		{
			Buff_Heal2_counter -=1;
			Npc_IncreaseHP(hero,Buff_Heal2_Val);
		};
		if(Buff_Heal3_counter)
		{
			Buff_Heal3_counter -=1;
			Npc_IncreaseHP(hero,Buff_Heal3_Val);
		};
	};
	akh_Buff_Hydration();
	akh_Buff_Exp();
};

// //////////////////////
// //////////////////////
// //////////////////////
const int Surprise_ActionPoints_Size = 3;
const string Surprise_strArrActionPoints[Surprise_ActionPoints_Size] =
{
	//spisok ActionPoints
	"SPAWN_OW_SCAVNEGER_04_PSI3",
	"MOVEMENT_OW_PATH_SCAVENGER01_SPAWN01",
	"OC1"
};
//array s sostojanijami each ActionPoint (locked|unlocked)
var int Surprise_bArrLockedActionPoints[Surprise_ActionPoints_Size];
func void Surprise_ActionPoint_SetLock(var string ActionPoint_,var int bMode_)
{
	//blokiruet ili razblokiruet ActionPoint_
	//ActionPoint_ blokiruetsja esli na nej est' sobytie v kotorom SC esche ne uchastvoval
	if(Hlp_StrCmp(ActionPoint_,Surprise_strArrActionPoints[0]))
	{
		Surprise_bArrLockedActionPoints[0] = bMode_;
	};
	if(Hlp_StrCmp(ActionPoint_,Surprise_strArrActionPoints[1]))
	{
		Surprise_bArrLockedActionPoints[1] = bMode_;
	};
	if(Hlp_StrCmp(ActionPoint_,Surprise_strArrActionPoints[2]))
	{
		Surprise_bArrLockedActionPoints[2] = bMode_;
	};
};
func int Surprise_ActionPoint_IsLocked(var string ActionPoint_)
{
	//proverjaet zablokirovana-li ActionPoint
	if(
		Hlp_StrCmp(
			ActionPoint_,
			Surprise_strArrActionPoints[0]
		)
	)
	{
		return Surprise_bArrLockedActionPoints[0];
	};
	if(
		Hlp_StrCmp(
			ActionPoint_,
			Surprise_strArrActionPoints[1]
		)
	)
	{
		return Surprise_bArrLockedActionPoints[1];
	};
	if(
		Hlp_StrCmp(
			ActionPoint_,
			Surprise_strArrActionPoints[2]
		)
	)
	{
		return Surprise_bArrLockedActionPoints[2];
	};
	return true;
};
func int Surprise_IsGoodPlaceForSpawn(var string ActionPoint_)
{
	//proverjaet mozhno-li spawn na ActionPoint
	if(Surprise_ActionPoint_IsLocked(ActionPoint_))
	{
		PrintDebug("Find someelse place for Surprise.. cause it's already using..");
		return false;
	};
	if(
		Npc_GetDistToWP(hero,ActionPoint_) > 3000
	&&	Npc_GetDistToWP(hero,ActionPoint_) < 5000
	)
	{
		return true;
	};
	return false;
};
func void Surprise_Spawn(var string ActionPoint_)
{
	//spawnet mertvogo volka i blokiruet ActionPoint
	Print(ActionPoint_);
	Surprise_ActionPoint_SetLock(ActionPoint_,TRUE);
	Wld_InsertNpc(Dead_Wolf,ActionPoint_);
};
func void akh_SpawnSurprise()
{
//zadacha funkcii - spawn on spec WP or FP vnezapnye sobytija..
//ybityh monstrov, ludej, grabitelej, spasauchihsja ot napadenija NPC
//eto nyzhno dlja napolnenija mira zhivost'u.. dlja pridanija miru dvizhenija..
	if(Surprise_IsGoodPlaceForSpawn(Surprise_strArrActionPoints[0]))
	{
		Surprise_Spawn(Surprise_strArrActionPoints[0]);
	};
	if(Surprise_IsGoodPlaceForSpawn(Surprise_strArrActionPoints[1]))
	{
		Surprise_Spawn(Surprise_strArrActionPoints[1]);
	};
	if(Surprise_IsGoodPlaceForSpawn(Surprise_strArrActionPoints[2]))
	{
		Surprise_Spawn(Surprise_strArrActionPoints[2]);
	};
};
func void Surprise_Refresh()
{
	//razblokiruet ActionPoint if SC podojdjet blizko k nej
	if(
		Npc_GetDistToWP(hero,Surprise_strArrActionPoints[0]) < 3000
	&&	Surprise_ActionPoint_IsLocked(Surprise_strArrActionPoints[0])
	)
	{
		Surprise_ActionPoint_SetLock(Surprise_strArrActionPoints[0],false);
	};
	if(
		Npc_GetDistToWP(hero,Surprise_strArrActionPoints[1]) < 3000
	&&	Surprise_ActionPoint_IsLocked(Surprise_strArrActionPoints[1])
	)
	{
		Surprise_ActionPoint_SetLock(Surprise_strArrActionPoints[1],false);
	};
	if(
		Npc_GetDistToWP(hero,Surprise_strArrActionPoints[2]) < 3000
	&&	Surprise_ActionPoint_IsLocked(Surprise_strArrActionPoints[2])
	)
	{
		Surprise_ActionPoint_SetLock(Surprise_strArrActionPoints[2],false);
	};
};
func void akh_SurpriseSystem()
{
	if(!Hlp_Random(10))
	{
		Print("Spawn");
//		Wld_SpawnNpcRange(hero,Dead_Wolf,1,100.0);
		akh_SpawnSurprise();
	};
	Surprise_Refresh();
};
func void akh_ShowHeroProtection()
{
	msgSI("Защита от кулаков: ", hero.protection[1],0,20);
	msgSI("Защита от режущего: ", hero.protection[2],0,22);
	msgSI("Защита от стрел: ", hero.protection[6],0,24);
	msgSI("Защита от огня: ", hero.protection[3],0,26);
	msgSI("Защита от магии: ", hero.protection[5],0,28);
	msgSI("Защита от падения: ", hero.protection[7] / 3,0,30);
};
func void akh_ShowHeroParameters()
{
	msgSI("Выносливость: ", SC_Stamina,0,36);
};
func void SC_Stamina_Regeneration()
{
	if(SC_Stamina_Max > SC_Stamina){SC_Stamina +=1;};
};
func void akh_Satiety()
{
	//Периодически уменьшает сытость ГГ
	//Каждые Satiety_Decreasing_Per_Time секунд
	if(
		Npc_GetBodyState(hero) == BS_STAND
	|| Npc_GetBodyState(hero) == BS_DEAD
	|| SC_State_IsDeadly
	){return;};
//	if(Npc_HasBodyFlag(hero,BS_STAND)){return;};
	if(SC_Buff_bHydration){return;};
	if(SC_Jumped()){SC_Satiety_Increase(1);};
//	if(SC_Jumped()){SC_Satiety_Counter +=1;};
	SC_Satiety_Increase(1);
//	SC_Satiety_Counter +=1;
	msgSI("SC_Satiety_Counter: ", SC_Satiety_Counter,0,34);
	SC_Satiety_Count();
};
func void akh_SatietyState()
{
	if(!SC_Satiety_State_isChange()){return;};
	SC_SetState_Cur();
	if(SC_GetState() == Satiety_State_Overeat)
	{
		Mdl_RemoveOverlayMDS(hero,"HUMANS_DRUNKEN.MDS");
	}
	else if(SC_GetState() == Satiety_State_Good)
	{
		Mdl_RemoveOverlayMDS(hero,"HUMANS_DRUNKEN.MDS");
	}
	else if(SC_GetState() == Satiety_State_Normal)
	{
		Mdl_RemoveOverlayMDS(hero,"HUMANS_DRUNKEN.MDS");
	}
	else if(SC_GetState() == Satiety_State_Hunger)
	{
		Mdl_RemoveOverlayMDS(hero,"HUMANS_DRUNKEN.MDS");
	}
	else if(SC_GetState() == Satiety_State_Starvation)
	{
		Mdl_ApplyOverlayMds(hero,"HUMANS_DRUNKEN.MDS");
	}
	else if(SC_GetState() == Satiety_State_Deadly)
	{
		Mdl_ApplyOverlayMds(hero,"HUMANS_DRUNKEN.MDS");
		Npc_SetHP(hero,1);
	};
	return;
	if(SC_Satiety > Satiety_Overeat)
	{
		SC_SetState(Satiety_Overeat);
		Mdl_RemoveOverlayMDS(hero,"HUMANS_DRUNKEN.MDS");
	}
	else if(SC_Satiety > Satiety_Good)
	{
		SC_SetState(Satiety_Good);
		Mdl_RemoveOverlayMDS(hero,"HUMANS_DRUNKEN.MDS");
	}
	else if(SC_Satiety > Satiety_Normal)
	{
		SC_SetState(Satiety_Normal);
		Mdl_RemoveOverlayMDS(hero,"HUMANS_DRUNKEN.MDS");
	}
	else if(SC_Satiety > Satiety_Hunger)
	{
		SC_SetState(Satiety_Hunger);
		Mdl_RemoveOverlayMDS(hero,"HUMANS_DRUNKEN.MDS");
	}
	else if(SC_Satiety > Satiety_Starvation)
	{
		PrintI(2);
		SC_SetState(Satiety_Starvation);
		Mdl_ApplyOverlayMds(hero,"HUMANS_DRUNKEN.MDS");
	}
	else if(SC_Satiety == Satiety_Deadly)
	{
		PrintI(3);
		SC_SetState(Satiety_Deadly);
		Mdl_ApplyOverlayMds(hero,"HUMANS_DRUNKEN.MDS");
		Npc_SetHP(hero,1);
	};
};
// //////////////////////
// //////////////////////
// //////////////////////
func void akh_ShowSatietyState()
{
	if(SC_GetState() == Satiety_State_Overeat){msgSS(NAME_SC_PARAM_SATIETY, NAME_SC_PARAM_SATIETY_V[0],0,32);}
	else if(SC_GetState() == Satiety_State_Good){msgSS(NAME_SC_PARAM_SATIETY, NAME_SC_PARAM_SATIETY_V[1],0,32);}
	else if(SC_GetState() == Satiety_State_Normal){msgSS(NAME_SC_PARAM_SATIETY, NAME_SC_PARAM_SATIETY_V[2],0,32);}
	else if(SC_GetState() == Satiety_State_Hunger){msgSS(NAME_SC_PARAM_SATIETY, NAME_SC_PARAM_SATIETY_V[3],0,32);}
	else if(SC_GetState() == Satiety_State_Starvation){msgSS(NAME_SC_PARAM_SATIETY, NAME_SC_PARAM_SATIETY_V[4],0,32);}
	else if(SC_GetState() == Satiety_State_Deadly){msgSS(NAME_SC_PARAM_SATIETY, NAME_SC_PARAM_SATIETY_V[5],0,32);};
};
func void akh_SC_DmgManager()
{
	if(SC_GetState() == Satiety_State_Overeat)
	{
		SC_DmgManager_SetOvereat();
	}
	else if(SC_GetState() == Satiety_State_Good)
	{
		SC_DmgManager_SetGood();
	}
	else if(SC_GetState() == Satiety_State_Normal)
	{
		SC_DmgManager_SetNormal();
	}
	else if(SC_GetState() == Satiety_State_Hunger)
	{
		SC_DmgManager_SetHunger();
	}
	else if(SC_GetState() == Satiety_State_Starvation)
	{
		SC_DmgManager_SetStarvation();
	}
	else if(SC_GetState() == Satiety_State_Deadly)
	{
		SC_DmgManager_SetDeadly();
	};
};
func void akh_Overlay()
{
	akh_ShowHeroProtection();
	akh_ShowSatietyState();
	akh_ShowHeroParameters();
};
func void akh_Achieve()
{
	Achieve_Jumper();
	Achieve_Forsage();
};
var int tone;
var int one;
func void akh_maintest()
{
	akh_OverlayTest();
	return;
	if(Npc_IsInFightMode(hero,FMODE_FIST))
	{
		if(!one)
		{
			one = true;
			if(Npc_IsDead(Non_1640_Killer))
			{
				Wld_InsertNpc(Non_1640_Killer,Npc_GetNearestWP(hero));
			};
		};
	}
	else
	{
		if(!Npc_IsDead(Non_1640_Killer))
		{
			AI_Teleport(Non_1640_Killer,Npc_GetNearestWP(hero));
		};
		if(one)
		{
			one = false;
		};
	};
	return;
	if(Npc_GetTarget(hero))
	{
		if(tone){return;};
		tone = true;
		one +=1;	
		if(!Npc_HasBleeding(other))
		{
//			PrintSS("set BLEEDING: ", other.name);
//			other.aivar[AIV_MM_VisualType] += VT_BLOODY;
		};
	}
	else
	{
		tone = false;
	};
};
//Функция проверяет позицию ГГ в мире
func void akh_SC_Position()
{
	if(!SC_WasInOldCamp)
	{
		if(
			Npc_GetDistToWP(hero,"OCR_MAINGATE_SQUARE") < 1000
		||	Npc_GetDistToWP(hero,"OCR_NORTHGATE_RAMP_ATOP") < 300
		){SC_WasInOldCamp = true;};
	};
	if(!SC_WasInNewCamp)
	{
		if(Npc_GetDistToWP(hero,"NC_DAM") < 4000){SC_WasInNewCamp = true;};
	};
	if(!SC_WasInPsiCamp)
	{
		if(Npc_GetDistToWP(hero,"PSI_PLACE_1") < 4000){SC_WasInPsiCamp = true;};
	};
};

func void akhrion_Loop(){
	EVENT_Killers();
	
	akh_maintest();
	if(!SC_IsAlive()){return;};
	akh_SC_Position();
	josefFight();
	RingOfTemporalisPower_Handler();
	akh_Buff();
	akh_Satiety();
	akh_SatietyState();
//	akh_SC_DmgManager();
	akh_Regeneration();
	SC_Stamina_Regeneration();
	akh_Overlay();
	akh_Achieve();
//	akh_SurpriseSystem();
//	return;
//	Print("MAIN LOOP");
//	akh_RescaleDamage(hero);
};


//TODO
//задание на преданность от Диего только после выполнения пары поручений по лагерю.
//добавить больших кротокрысов
//экспа за собирательство
//рескейл експы в зависимости от плейстайла
//попрыгунчик
