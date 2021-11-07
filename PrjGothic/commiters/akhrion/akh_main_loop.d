var int josefFightWaitPlayerCounter;
func void josefFight()
{
	var C_NPC josef;
	josef = Hlp_GetNpc(GRD_238_Gardist);
	if(!Npc_IsDead(josef))
	{
		if(!isJosefFightHappen)
		{
//			Print(IntToString(Hlp_Random(3)));
			if(!isSpawnedJosefsMonsters)
			{
				if(Npc_GetDistToPlayer(josef) < 2000)
				{
					isPlayerMeetJosef  = true;
				}
				else if(isPlayerMeetJosef && Npc_GetDistToPlayer(josef) > 5000)
				{
					isSpawnedJosefsMonsters = true;
					isJosefFightWaitPlayer = true;
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
				if(isJosefFightWaitPlayer)
				{
					if(Npc_GetDistToPlayer(josef) < 3000)
					{
						if(josefFightWaitPlayerCounter < 7)
						{
							josefFightWaitPlayerCounter +=1;
						}
						else
						{
							isJosefFightWaitPlayer = false;
							isJosefFightHappen = true;
							B_ClearImmortal(OrcDogAgressive1);
							B_ClearImmortal(OrcDogAgressive2);
							B_ClearImmortal(OrcDogAgressive3);
 							B_ClearImmortal(josef);
							B_ClearImmortal(GRD_237_Gardist);
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
func void akhrion_Loop(){
	josefFight();
	RingOfTemporalisPower_Handler();
//	return;
//	Print("MAIN LOOP");
//	akh_RescaleDamage(hero);

	if(Npc_HasReadiedWeapon(hero))
	{
		var C_ITEM itm;
		itm = Npc_GetReadiedWeapon(hero);
		if(itm.damagetype == DAM_BLUNT)
		{
			msgSI("DAM_BLUNT: ",itm.damagetype,-1,-1);
		};
		if(itm.damagetype == DAM_EDGE)
		{
			msgSI("DAM_EDGE: ",itm.damagetype,-1,52);
		};
		if(itm.damagetype == DAM_EDGE + DAM_BLUNT)
		{
			msgSI("DAM_EDGE + DAM_BLUNT: ",itm.damagetype,-1,54);
		};
		if(itm.damagetype == (DAM_EDGE | DAM_BLUNT))
		{
			msgSI("DAM_EDGE | DAM_BLUNT: ",itm.damagetype,-1,56);
		};
		if(itm.damagetype == (DAM_EDGE || DAM_BLUNT))
		{
			msgSI("DAM_EDGE || DAM_BLUNT: ",itm.damagetype,-1,58);
		};
		if(isFlagsContainCategorie(itm.damagetype,DAM_BLUNT))
		{
			msgSI("damagetype contain DAM_BLUNT: ",itm.damagetype,-1,60);			
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