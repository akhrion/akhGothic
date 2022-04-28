func int isDmgOnlyPierce()
{
	return false;
	var c_ITEM itm;
	var int PrcDmg; var int OthDmg;
	if(Npc_HasReadiedWeapon(other))
	{
		itm = Npc_GetReadiedWeapon(other);
		PrcDmg = itm.damage[DAM_INDEX_POINT];
		OthDmg = itm.damageTotal - PrcDmg;
		if(OthDmg != 0)
		{
			
		};
		
		self.exp += itm.damage[DAM_INDEX_POINT] - self.protection[PROT_POINT];
		
	};
	return true;
};


func void SaveReceivedDamage_Monster_Old()
{
	var c_ITEM itm;
	var int PrcDmg; var int OthDmg;
	if(Npc_HasReadiedWeapon(other))
	{
		itm = Npc_GetReadiedWeapon(other);
		PrcDmg = tern(
			(itm.damage[DAM_INDEX_POINT] - self.protection[PROT_POINT]) < 0,
			0,
			(itm.damage[DAM_INDEX_POINT] - self.protection[PROT_POINT])
		);
		OthDmg = itm.damageTotal - PrcDmg;
		self.exp += PrcDmg;
		self.exp_next += OthDmg;
	};
};

func int C_PreyToPredator(var C_Npc prey,var C_Npc predator)
{
	PrintDebugNpc(PD_MST_FRAME,"C_PreyToPredator");
	if(prey.guild == GIL_SCAVENGER)
	{
		if(predator.guild == GIL_SNAPPER)
		{
			return 1;
		};
	};
	if(prey.guild == GIL_MOLERAT)
	{
		if(predator.guild == GIL_WOLF)
		{
			return 1;
		};
	};
	return 0;
};

func void B_MM_DeSynchronize()
{
	var int msec;
	PrintDebugNpc(PD_MST_FRAME,"B_MM_DeSynchronize");
	msec = Hlp_Random(1000);
	AI_Waitms(self,msec);
};

func void B_MM_ObserveIntruder()
{
	PrintDebugNpc(PD_MST_FRAME,"B_MM_ObserveIntruder");
	if(Npc_GetDistToNpc(self,other) <= self.aivar[AIV_HIGHWAYMEN])
	{
		Npc_SetTarget(self,other);
		Npc_ClearAIQueue(self);
		AI_StartState(self,ZS_MM_Attack,0,"");
	};
};

func void B_MM_AssessBody()
{
	PrintDebugNpc(PD_MST_FRAME,"B_MM_AssessBody");
	if(self.aivar[AIV_MM_TEMP_PRIO] == PRIO_PREY)
	{
		if(Npc_GetDistToNpc(self,other) < self.aivar[AIV_MM_PercRange])
		{
			if(C_PreyToPredator(other,self))
			{
				Npc_ClearAIQueue(self);
				AI_StartState(self,ZS_MM_EatBody,0,"");
			};
		};
	};
};

func void ZS_MM_EatBody()
{
	PrintDebugNpc(PD_MST_FRAME,"ZS_MM_EatBody");
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,B_MM_ReactToDamage);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,B_AssessMagic);
	Npc_PercEnable(self,PERC_OBSERVEINTRUDER,B_MM_ObserveIntruder);
	Npc_PercEnable(self,PERC_ASSESSENEMY,B_MM_ObserveIntruder);
	AI_GotoNpc(self,other);
	AI_TurnToNPC(self,other);
	AI_PlayAni(self,"T_STAND_2_EAT");
};

func int ZS_MM_EatBody_loop()
{
	PrintDebugNpc(PD_MST_LOOP,"ZS_MM_EatBody_loop");
	if(!Hlp_IsValidNpc(other))
	{
		return LOOP_END;
	};
	return LOOP_CONTINUE;
};

func void ZS_MM_EatBody_end()
{
	PrintDebugNpc(PD_MST_FRAME,"ZS_MM_EatBody_end");
	AI_PlayAni(self,"T_EAT_2_STAND");
};

func void MinecrawlerOM(var C_NPC slf,var C_NPC oth)
{
	if(
		Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(MineCrawler) &&
		Npc_IsPlayer(other) &&
		!isSCKillOMCrawler &&
		Npc_GetPermAttitude(slf,oth) == ATT_HOSTILE
	)
	{
		Npc_SetPermAttitude(MineCrawler,ATT_ANGRY);
	};
};
func void akh_DebugSenseSystem()
{
//when B_SensesSystem was complited then it func should be removed..
	if(self.senses_range < 50000)
	{
		C_Npc_SetAttentioned(self);
		if(C_PreyToPredator(other,self))
		{
			Npc_SetTarget(self,other);
			Npc_ClearAIQueue(self);
			AI_StartState(self,ZS_MM_Attack,0,"");
		}
		else if(C_PreyToPredator(self,other))
		{
			Npc_SetTarget(self,other);
			Npc_ClearAIQueue(self);
			AI_StartState(self,ZS_MM_Flee,0,"");
		}
		else if(
			Wld_GetGuildAttitude(self.guild,other.guild) != ATT_HOSTILE ||
			Npc_GetPermAttitude(self,other) != ATT_HOSTILE
		)
		{
			PrintDebug("B_MM_AssessEnemy: ... bug: Npc_SetPermAttitude work only on SC");
			PrintDebug("B_MM_AssessEnemy: ... bug: Npc_GetPermAttitude inherit att from GuildAttitude for NSC");
			return;
		}
		else
		{
			Npc_ClearAIQueue(self);
			AI_StartState(self,ZS_MM_AssessEnemy,0,"");
		};
	};
};
func void B_MM_AssessEnemy()
{
//	Print("B_MM_AssessEnemy");
	MinecrawlerOM(self,other);
	PrintDebugNpc(PD_MST_FRAME,"B_MM_AssessEnemy");
//	PrintI(Npc_GetRange_See(self));
	if(Npc_CanSeeNpc(self,other))
	{
		if(Npc_GetRange_See(self) > Npc_GetDistToNpc(self,other))
		{
	//		if((Npc_GetDistToNpc(self,other) < self.aivar[AIV_MM_PercRange]) && Npc_CanSeeNpcFreeLOS(self,other))
			if((Npc_GetDistToNpc(self,other) < self.aivar[AIV_MM_PercRange]))
			{
				C_Npc_SetAttentioned(self);
				if(C_PreyToPredator(other,self))
				{
					Npc_SetTarget(self,other);
					Npc_ClearAIQueue(self);
					AI_StartState(self,ZS_MM_Attack,0,"");
				}
				else if(C_PreyToPredator(self,other))
				{
					Npc_SetTarget(self,other);
					Npc_ClearAIQueue(self);
					AI_StartState(self,ZS_MM_Flee,0,"");
				}
				else if(
					Wld_GetGuildAttitude(self.guild,other.guild) != ATT_HOSTILE ||
					Npc_GetPermAttitude(self,other) != ATT_HOSTILE
				)
				{
					PrintDebug("B_MM_AssessEnemy: ... bug: Npc_SetPermAttitude work only on SC");
					PrintDebug("B_MM_AssessEnemy: ... bug: Npc_GetPermAttitude inherit att from GuildAttitude for NSC");
					return;
				}
				else
				{
					Npc_ClearAIQueue(self);
					AI_StartState(self,ZS_MM_AssessEnemy,0,"");
				};
			};
		};
	};
	if(Npc_GetRange_Hear(self) > Npc_GetDistToNpc(self,other))
	{
		C_Npc_SetAttentioned(self);
		AI_TurnToNpc(self,other);
	};
	akh_DebugSenseSystem();
};

func void ZS_MM_AssessEnemy()
{
	PrintDebugNpc(PD_MST_FRAME,"ZS_MM_AssessEnemy");
	Npc_SetPercTime(self,2);
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,B_MM_ReactToDamage);
	Npc_PercEnable(self,PERC_ASSESSOTHERSDAMAGE,B_MM_ReactToOthersDamage);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,B_AssessMagic);
	Npc_PercEnable(self,PERC_ASSESSBODY,B_MM_AssessBody);
	if(self.aivar[AIV_MM_Behaviour] == HUNTER)
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
		AI_PlayAni(self,"T_WARN");
		AI_SetWalkMode(self,NPC_WALK);
	};
	if(
		(self.aivar[AIV_MM_Behaviour] == PASSIVE)
	|| (self.aivar[AIV_MM_Behaviour] == PACKHUNTER)
	)
	{
		AI_Standup(self);
		AI_LookAtNpc(self,other);
	};
};

func int ZS_MM_AssessEnemy_loop()
{
	PrintDebugNpc(PD_MST_LOOP,"ZS_MM_AssessEnemy_loop");
	if(Npc_GetDistToNpc(self,other) > self.aivar[AIV_MM_PercRange])
	{
		return LOOP_END;
	};
	if(
		(Npc_GetDistToNpc(self,other) <= self.aivar[AIV_MM_PercRange])
	&& (Npc_GetDistToNpc(self,other) > self.aivar[AIV_MM_DrohRange])
	)
	{
		if(
			(self.aivar[AIV_MM_Behaviour] == PASSIVE)
		|| (self.aivar[AIV_MM_Behaviour] == PACKHUNTER)
		)
		{
			if(!Npc_CanSeeNpc(self,other))
			{
				AI_TurnToNPC(self,other);
			};
		};
		if(self.aivar[AIV_MM_Behaviour] == HUNTER)
		{
			AI_GotoNpc(self,other);
		};
	};
	if(
		(Npc_GetDistToNpc(self,other) <= self.aivar[AIV_MM_DrohRange])
	&& (Npc_GetDistToNpc(self,other) > self.aivar[AIV_MM_AttackRange])
	)
	{
		if(
			(self.aivar[AIV_MM_Behaviour] == PASSIVE)
		|| (self.aivar[AIV_MM_Behaviour] == PACKHUNTER)
		)
		{
			if(Npc_GetStateTime(self) > self.aivar[AIV_MM_DrohTime])
			{
				Npc_SetTarget(self,other);
				Npc_ClearAIQueue(self);
				AI_StartState(self,ZS_MM_Attack,0,"");
			}
			else
			{
				AI_TurnToNPC(self,other);
				AI_PlayAni(self,"T_WARN");
				Npc_SendPassivePerc(self,PERC_ASSESSWARN,other,self);
			};
		};
		if(self.aivar[AIV_MM_Behaviour] == HUNTER)
		{
			AI_GotoNpc(self,other);
		};
	}
	else
	{
		Npc_SetStateTime(self,0);
	};
	if(Npc_GetDistToNpc(self,other) <= self.aivar[AIV_MM_AttackRange])
	{
		Npc_SetTarget(self,other);
		Npc_ClearAIQueue(self);
		AI_Standup(self);
		AI_StartState(self,ZS_MM_Attack,0,"");
	};
	return 0;
};

func void ZS_MM_AssessEnemy_end()
{
	PrintDebugNpc(PD_MST_FRAME,"ZS_MM_AssessEnemy_end");
	AI_StopLookAt(self);
};

func void B_MM_ReactToDamage()
{
	PrintDebugNpc(PD_MST_FRAME,"B_MM_ReactToDamage");
	PrintGlobals(PD_MST_CHECK);
	SC_OneShot(other,self);
	SC_RescaleDamage();
	SaveReceivedDamage_Monster();
	SetVisualType(self);
	self.aivar[AIV_PLUNDERED] = PRIO_ATTACKER;
	if(C_PreyToPredator(self,other))
	{
		PrintDebugNpc(PD_MST_FRAME,"...Monster ist Beute");
		Npc_SetTarget(self,other);
		Npc_ClearAIQueue(self);
		Npc_PercDisable(self,PERC_ASSESSENEMY);
		AI_StartState(self,ZS_MM_Flee,0,"");
	}
	else if(C_NpcIsDangerousPerson(self,other))
	{
	}
	else
	{
		PrintDebugNpc(PD_MST_FRAME,"...Monster ist JР’пїЅger");
		Npc_SetTarget(self,other);
		Npc_ClearAIQueue(self);
		Npc_PercDisable(self,PERC_ASSESSENEMY);
		AI_StartState(self,ZS_MM_Attack,0,"");
	};
};

func void B_MM_ReactToOthersDamage()
{
	PrintDebugNpc(PD_MST_FRAME,"B_MM_ReactToOthersDamage");
	B_MM_DeSynchronize();
	IF(Npc_GetDistToNpc(self,victim) > 1000){return;};
	if(C_PreyToPredator(self,other))
	{
		Npc_SetTarget(self,other);
		Npc_ClearAIQueue(self);
		AI_StartState(self,ZS_MM_Flee,0,"");
	};
	if((Wld_GetGuildAttitude(self.guild,victim.guild) == ATT_FRIENDLY) && (Wld_GetGuildAttitude(self.guild,other.guild) != ATT_FRIENDLY))
	{
		Npc_SetTarget(self,other);
		Npc_ClearAIQueue(self);
		AI_StartState(self,ZS_MM_Attack,0,"");
	};
	if((Wld_GetGuildAttitude(self.guild,other.guild) == ATT_FRIENDLY) && (Wld_GetGuildAttitude(self.guild,victim.guild) != ATT_FRIENDLY))
	{
		Npc_SetTarget(self,victim);
		Npc_ClearAIQueue(self);
		AI_StartState(self,ZS_MM_Attack,0,"");
	};
};
var C_NPC B_NPC_LASTTARGET;
func void B_Npc_ChoiceTarget(var C_NPC npc)
{
	B_NPC_LASTTARGET = Hlp_GetNpc(self.aivar[AIV_LASTTARGET]);
	if(Npc_GetDistToNpc(self,B_NPC_LASTTARGET) > Npc_GetDistToNpc(self,other))
	{
		Npc_SetTarget(self,other);
		B_Npc_SetLastTargetByID(self,Hlp_GetInstanceID(other));
		Npc_ClearAIQueue(self);
		AI_Attack(self);
	};
};
func void B_MM_ReactToCombatDamage()
{
	PrintDebugNpc(PD_MST_FRAME,"B_MM_ReactToCombatDamage");
	SC_OneShot(other,self);
	SC_RescaleDamage();
	SaveReceivedDamage_Monster();
	SetVisualType(self);
	self.aivar[AIV_PLUNDERED] = PRIO_ATTACKER;
	if(C_PreyToPredator(self,other))
	{
		Npc_SetTarget(self,other);
		Npc_ClearAIQueue(self);
		AI_StartState(self,ZS_MM_Flee,0,"");
	}
	else
	{
		B_Npc_ChoiceTarget(self);
	};
	if(Josef_IsOrcDog(self))
	{
		if(Hlp_GetInstanceID(other) == Hlp_GetInstanceID(hero))
		{
			Josef_StartOrcDogsFight();
		};
	};
};

func void ZS_MM_Attack()
{
	PrintDebugNpc(PD_MST_FRAME,"ZS_MM_Attack");
	PrintGlobals(PD_MST_DETAIL);
	if(C_NpcIsMonsterMage(self))
	{
		B_FullStop(self);
		AI_StartState(self,ZS_MM_AttackMage,0,"");
		return;
	};
	if(other.aivar[AIV_INVINCIBLE])
	{
		AI_ContinueRoutine(self);
	};
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,B_MM_ReactToCombatDamage);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,B_AssessMagic);
	Npc_PercEnable(self,PERC_ASSESSBODY,B_MM_AssessBody);
	if(self.aivar[AIV_MOVINGMOB] == TRUE)
	{
		Npc_PercEnable(self,PERC_ASSESSFIGHTSOUND,B_MM_SummonedByPCAssessOthersDamage);
	};
	AI_Standup(self);
	AI_SetWalkMode(self,NPC_RUN);
	Npc_GetTarget(self);
//	PrintSS("2222222",other.name[0]);
	Npc_SendPassivePerc(self,PERC_ASSESSWARN,other,self);
};

func int ZS_MM_Attack_Loop()
{
	PrintDebugNpc(PD_MST_LOOP,"ZS_MM_Attack_Loop");
//	PrintSS("2222222",other.name[0]);
	B_SpecStatesHandler(self);
	if(self.aivar[AIV_IMPORTANT] == ID_FIREGOLEM)
	{
		if(getTimestamp() % 2)
		{
			if(!bFireGolem_Part_Spawned)
			{
				bFireGolem_Part_Spawned = true;
//				Wld_InsertNpc(FireGolem_Part,"");
				Print("2222");
			};
		}
		else
		{
			bFireGolem_Part_Spawned = false;
			Print("3333");
		};
	};
//	PrintSS("3333333333",other.name[0]);
	if(Npc_GetPermAttitude(self,other) != ATT_HOSTILE)
	{
		return LOOP_END;
	};
//	PrintSS("4444444444",other.name[0]);
	if(other.attribute[ATR_HITPOINTS] <= 0)
	{
		B_MM_AssessBody();
		return LOOP_END;
	};
	Npc_GetTarget(self);
	if(Hlp_IsValidNpc(other) && !C_NpcIsDown(other))
	{
		PrintDebugNpc(PD_MST_LOOP,"...Ziel vorhanden!");
		if(C_BodyStateContains(other,BS_RUN) || C_BodyStateContains(other,BS_JUMP))
		{
			PrintDebugNpc(PD_MST_LOOP,"...Ziel lР’пїЅuft oder springt!");
			if(Npc_GetStateTime(self) > self.aivar[AIV_BEGGAR])
			{
				PrintDebugNpc(PD_MST_CHECK,"...Ziel schon zu lange verfolgt!");
				return LOOP_END;
			};
		}
		else if(C_BodyStateContains(other,BS_SWIM) || C_BodyStateContains(other,BS_DIVE))
		{
			if(self.aivar[AIV_OBSERVEINTRUDER] == FALSE)
			{
				return LOOP_END;
			};
		}
		else
		{
			Npc_SetStateTime(self,0);
		};
		if(other.aivar[AIV_INVINCIBLE] == FALSE)
		{
			B_SpecStatesTriger(self,other);
			AI_Attack(self);
		};
	}
	else
	{
		PrintDebugNpc(PD_ZS_Check,"...Ziel ist ungР’пїЅltig oder kampf-unfР’пїЅhig!");
		if(self.aivar[AIV_FINDABLE] == HUNTER)
		{
			Npc_ClearAIQueue(self);
			AI_StartState(self,ZS_MM_EatBody,0,"");
		}
		else
		{
			Npc_PerceiveAll(self);
			Npc_GetNextTarget(self);
			PrintGlobals(PD_ZS_DETAIL);
			if(Hlp_IsValidNpc(other) && !C_NpcIsDown(other))
			{
				PrintDebugString(PD_MST_CHECK,"...neues Ziel gefunden: ",other.name);
			}
			else
			{
				PrintDebugNpc(PD_MST_CHECK,"...kein Neues Ziel vorhanden!");
				return LOOP_END;
			};
		};
	};
	return LOOP_CONTINUE;
};

func void ZS_MM_Attack_End()
{
	PrintDebugNpc(PD_MST_FRAME,"ZS_MM_Attack_End");
	self.aivar[AIV_PLUNDERED] = PRIO_PREY;
	Npc_ClearAIQueue(self);
	AI_Standup(self);
	AI_PlayAni(self,"T_WARN");
	AI_Wait(self,1);
};

func void ZS_MM_Flee()
{
	PrintDebugNpc(PD_MST_FRAME,"ZS_MM_Flee");
	Npc_PercEnable(self,PERC_ASSESSMAGIC,B_AssessMagic);
	AI_Standup(self);
	AI_SetWalkMode(self,NPC_RUN);
};

func int ZS_MM_Flee_Loop()
{
	PrintDebugNpc(PD_MST_LOOP,"ZS_MM_Flee_Loop");
	if(Npc_GetDistToNpc(self,other) < 2000)
	{
		AI_Flee(self);
		return 0;
	}
	else
	{
		self.wp = Npc_GetNearestWP(self);
	};
	return 1;
};

func void ZS_MM_Flee_End()
{
	PrintDebugNpc(PD_MST_FRAME,"ZS_MM_Flee_End");
};

func void B_MM_AssessWarn()
{
	PrintDebugNpc(PD_MST_FRAME,"B_MM_AssessWarn");
	if(C_PreyToPredator(self,other))
	{
		Npc_SetTarget(self,other);
		Npc_ClearAIQueue(self);
		AI_StartState(self,ZS_MM_Flee,0,"");
	};
	if((Wld_GetGuildAttitude(self.guild,other.guild) == ATT_FRIENDLY) && (self.aivar[AIV_FINDABLE] == PACKHUNTER))
	{
		if(Npc_IsInState(other,ZS_MM_Attack))
		{
			Npc_SetTarget(self,victim);
			Npc_ClearAIQueue(self);
			AI_Standup(self);
			AI_StartState(self,ZS_MM_Attack,0,"");
		}
		else
		{
			AI_SetWalkMode(self,NPC_RUN);
			AI_GotoNpc(self,other);
			if(Wld_DetectNpc(self,victim,NOFUNC,-1))
			{
				AI_StartState(self,ZS_MM_AssessEnemy,0,"");
			};
		};
	};
};
func void B_MM_Respawn()
{
	AI_StartState(self,ZS_RespawnWait,0,"");
};
func void ZS_MM_AllScheduler()
{
	if(Npc_GetDeadTime(self))
	{
		var int lastTargetID; lastTargetID = B_Npc_GetLastTargetID(self);
		var C_NPC asdqwe; asdqwe = Hlp_GetNpc(lastTargetID);
		Npc_SetTarget(self,asdqwe);
		Npc_GetTarget(self);
//		PrintSSS(other.name[0],"ZS_MM_AllScheduler",asdqwe.name[0]);
//		PrintSSS(self.name[0],"ZS_MM_AllScheduler",IntToString(B_Npc_GetLastTargetID(self)));
		self.aivar[AIV_MM_DEAD_Timestamp] = 0;
		AI_StartState(self,ZS_MM_Attack,0,"");
		return;
	};
	PrintDebugNpc(PD_MST_FRAME,"ZS_MM_AllScheduler");
//		Print("ZS_MM_AllScheduler22222222222222222");
	if(Wld_IsTime(self.aivar[AIV_WARNTARGET],0,self.aivar[AIV_LASTHITBYRANGEDWEAPON],0) || (self.aivar[AIV_WARNTARGET] == OnlyRoutine))
	{
//		Print("ZS_MM_AllScheduler33333333333333333");
		AI_StartState(self,ZS_MM_Rtn_Sleep,1,"");
	}
	else if(Wld_IsTime(self.aivar[AIV_HASBEENDEFEATEDINPORTALROOM],0,self.aivar[AIV_HangAroundStatus],0) || (self.aivar[AIV_HASBEENDEFEATEDINPORTALROOM] == OnlyRoutine))
	{
//		Print("ZS_MM_AllScheduler44444444444444444");
		AI_StartState(self,ZS_MM_Rtn_Rest,1,"");
	}
	else if(Wld_IsTime(self.aivar[AIV_Trigger3],0,self.aivar[AIV_GUARDMEMORY],0) || (self.aivar[AIV_Trigger3] == OnlyRoutine))
	{
//		Print("ZS_MM_AllScheduler55555555555555555");
		AI_StartState(self,ZS_MM_Rtn_Roam,1,"");
	}
	else if(Wld_IsTime(self.aivar[AIV_GUARDITERATOR],0,self.aivar[AIV_FIGHTSPEACHFLAG],0) || (self.aivar[AIV_GUARDITERATOR] == OnlyRoutine))
	{
//		Print("ZS_MM_AllScheduler66666666666666666");
		AI_StartState(self,ZS_MM_Rtn_EatGround,1,"");
	}
	else if(Wld_IsTime(self.aivar[AIV_ITEMSTATUS],0,self.aivar[AIV_ITEMFREQ],0) || (self.aivar[AIV_ITEMSTATUS] == OnlyRoutine))
	{
//		Print("ZS_MM_AllScheduler77777777777777777");
		AI_StartState(self,ZS_MM_Rtn_Wusel,1,"");
	}
	else
	{
//		Print("ZS_MM_AllScheduler88888888888888888");
		AI_StartState(self,ZS_MM_Rtn_Default,1,"");
	};
};

func void ZS_MM_Rtn_Default()
{
	PrintDebugNpc(PD_MST_FRAME,"ZS_MM_Rtn_Default");
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,B_MM_ReactToDamage);
	Npc_PercEnable(self,PERC_ASSESSOTHERSDAMAGE,B_MM_ReactToOthersDamage);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,B_AssessMagic);
	Npc_PercEnable(self,PERC_ASSESSENEMY,B_MM_AssessEnemy);
	Npc_PercEnable(self,PERC_ASSESSWARN,B_MM_AssessWarn);
	Npc_PercEnable(self,PERC_ASSESSBODY,B_MM_AssessBody);
	AI_AlignToWP(self);
};

func void ZS_MM_Rtn_Default_loop()
{
	PrintDebugNpc(PD_MST_LOOP,"ZS_MM_Rtn_Default_loop");
	B_SpecStatesHandler(self);
};

func void ZS_MM_Rtn_Default_end()
{
	PrintDebugNpc(PD_MST_FRAME,"ZS_MM_Rtn_Default_end");
};

func void B_MM_AssessEnemy_Sleep()
{
	PrintDebugNpc(PD_MST_FRAME,"B_MM_AssessEnemy_Sleep");
	if(C_BodyStateContains(self,BS_LIE))
	{
		if(Npc_GetDistToNpc(self,other) < 200)
		{
			B_MM_AssessEnemy();
		};
	}
	else
	{
		B_MM_AssessEnemy();
	};
};

func void B_MM_AssessQuietSound_Sleep()
{
	PrintDebugNpc(PD_MST_FRAME,"B_MM_AssessQuietSound_Sleep");
	if(Npc_GetDistToNpc(self,other) <= self.aivar[AIV_BEENATTACKED])
	{
		if(Wld_GetGuildAttitude(self.guild,other.guild) == ATT_HOSTILE)
		{
			B_MM_AssessEnemy();
		};
	};
};

func void ZS_MM_Rtn_Sleep()
{
	PrintDebugNpc(PD_MST_FRAME,"ZS_MM_Rtn_Sleep");
	Npc_SetPercTime(self,2);
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,B_MM_ReactToDamage);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,B_AssessMagic);
	Npc_PercEnable(self,PERC_ASSESSWARN,B_MM_AssessWarn);
	Npc_PercEnable(self,PERC_ASSESSOTHERSDAMAGE,B_MM_ReactToOthersDamage);
	Npc_PercEnable(self,PERC_ASSESSQUIETSOUND,B_MM_AssessQuietSound_Sleep);
	Npc_PercEnable(self,PERC_ASSESSENEMY,B_MM_AssessEnemy_Sleep);
	AI_SetWalkMode(self,NPC_WALK);
	B_MM_DeSynchronize();
	if(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == FALSE)
	{
		AI_GotoWP(self,self.wp);
	};
	if(Wld_IsFPAvailable(self,"FP_SLEEP"))
	{
		AI_GotoFP(self,"FP_SLEEP");
	};
	AI_PlayAni(self,"T_PERCEPTION");
	AI_PlayAniBS(self,"T_STAND_2_SLEEP",BS_LIE);
};

func void ZS_MM_Rtn_Sleep_loop()
{
	PrintDebugNpc(PD_MST_LOOP,"ZS_MM_Rtn_Sleep_loop");
	B_SpecStatesHandler(self);
	if(!Wld_IsTime(self.aivar[AIV_WARNTARGET],0,self.aivar[AIV_LASTHITBYRANGEDWEAPON],0) && (self.aivar[AIV_WARNTARGET] != OnlyRoutine))
	{
		AI_StartState(self,ZS_MM_AllScheduler,1,"");
	};
};

func void ZS_MM_Rtn_Sleep_end()
{
	PrintDebugNpc(PD_MST_FRAME,"ZS_MM_Rtn_Sleep_end");
	AI_PlayAniBS(self,"T_SLEEP_2_STAND",BS_STAND);
};

func void ZS_MM_Rtn_Roam()
{
	PrintDebugNpc(PD_MST_FRAME,"ZS_MM_Rtn_Roam");
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,B_MM_ReactToDamage);
	Npc_PercEnable(self,PERC_ASSESSOTHERSDAMAGE,B_MM_ReactToOthersDamage);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,B_AssessMagic);
	Npc_PercEnable(self,PERC_ASSESSENEMY,B_MM_AssessEnemy);
	Npc_PercEnable(self,PERC_ASSESSWARN,B_MM_AssessWarn);
	Npc_PercEnable(self,PERC_ASSESSBODY,B_MM_AssessBody);
	AI_SetWalkMode(self,NPC_WALK);
	B_MM_DeSynchronize();
	if(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == FALSE)
	{
		AI_GotoWP(self,self.wp);
	};
};

func int ZS_MM_Rtn_Roam_loop()
{
	var int randomMove;
	PrintDebugNpc(PD_MST_LOOP,"ZS_MM_Rtn_Roam_loop");
	B_SpecStatesHandler(self);
	if(!Wld_IsTime(self.aivar[AIV_Trigger3],0,self.aivar[AIV_GUARDMEMORY],0) && (self.aivar[AIV_Trigger3] != OnlyRoutine))
	{
		AI_StartState(self,ZS_MM_AllScheduler,1,"");
		return LOOP_END;
	};
	if(Hlp_Random(100) <= 20)
	{
		if(Wld_IsNextFPAvailable(self,"FP_ROAM"))
		{
			AI_GotoNextFP(self,"FP_ROAM");
		}
		else
		{
			AI_GotoWP(self,Npc_GetNearestWP(self));
		};
	}
	else
	{
		randomMove = Hlp_Random(2);
		if(randomMove == 0)
		{
			AI_PlayAni(self,"R_ROAM1");
		};
		if(randomMove == 1)
		{
			AI_PlayAni(self,"R_ROAM2");
		};
		if(randomMove == 2)
		{
			AI_PlayAni(self,"R_ROAM3");
		};
	};
	return LOOP_CONTINUE;
};

func void ZS_MM_Rtn_Roam_end()
{
	PrintDebugNpc(PD_MST_FRAME,"ZS_MM_Rtn_Roam_end");
};

func void ZS_MM_Rtn_Rest()
{
	PrintDebugNpc(PD_MST_FRAME,"ZS_MM_Rtn_Rest");
	Npc_SetPercTime(self,2);
	self.aivar[AIV_PLUNDERED] = PRIO_PREY;
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,B_MM_ReactToDamage);
	Npc_PercEnable(self,PERC_ASSESSOTHERSDAMAGE,B_MM_ReactToOthersDamage);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,B_AssessMagic);
	Npc_PercEnable(self,PERC_ASSESSENEMY,B_MM_AssessEnemy);
	Npc_PercEnable(self,PERC_ASSESSWARN,B_MM_AssessWarn);
	Npc_PercEnable(self,PERC_ASSESSBODY,B_MM_AssessBody);
	AI_SetWalkMode(self,NPC_WALK);
	B_MM_DeSynchronize();
	if(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == FALSE)
	{
		AI_GotoWP(self,self.wp);
	};
	if(Wld_IsFPAvailable(self,"FP_ROAM"))
	{
		AI_GotoFP(self,"FP_ROAM");
	};
};

func int ZS_MM_Rtn_Rest_Loop()
{
	var int randomMove;
	PrintDebugNpc(PD_MST_LOOP,"ZS_MM_Rtn_Rest_Loop");
	B_SpecStatesHandler(self);
	if(!Wld_IsTime(self.aivar[AIV_HASBEENDEFEATEDINPORTALROOM],0,self.aivar[AIV_HangAroundStatus],0) && (self.aivar[AIV_HASBEENDEFEATEDINPORTALROOM] != OnlyRoutine))
	{
		AI_StartState(self,ZS_MM_AllScheduler,1,"");
		return LOOP_END;
	};
	if(Hlp_Random(1000) <= 5)
	{
		randomMove = Hlp_Random(2);
		AI_Standup(self);
		if(randomMove == 0)
		{
			AI_PlayAni(self,"R_ROAM1");
		};
		if(randomMove == 1)
		{
			AI_PlayAni(self,"R_ROAM2");
		};
		if(randomMove == 2)
		{
			AI_PlayAni(self,"R_ROAM3");
		};
	};
	return LOOP_CONTINUE;
};

func void ZS_MM_Rtn_Rest_End()
{
	PrintDebugNpc(PD_MST_FRAME,"ZS_MM_Rtn_Rest_End");
	AI_PlayAni(self,"T_REST_2_STAND");
};

func void ZS_MM_Rtn_EatGround()
{
	PrintDebugNpc(PD_MST_FRAME,"ZS_MM_Rtn_EatGround");
	Npc_SetPercTime(self,2);
	self.aivar[AIV_PLUNDERED] = PRIO_PREY;
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,B_MM_ReactToDamage);
	Npc_PercEnable(self,PERC_ASSESSOTHERSDAMAGE,B_MM_ReactToOthersDamage);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,B_AssessMagic);
	Npc_PercEnable(self,PERC_ASSESSENEMY,B_MM_AssessEnemy);
	Npc_PercEnable(self,PERC_ASSESSWARN,B_MM_AssessWarn);
	Npc_PercEnable(self,PERC_ASSESSBODY,B_MM_AssessBody);
	AI_SetWalkMode(self,NPC_WALK);
	B_MM_DeSynchronize();
	if(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == FALSE)
	{
		AI_GotoWP(self,self.wp);
	};
	if(Wld_IsFPAvailable(self,"FP_ROAM"))
	{
		AI_GotoFP(self,"FP_ROAM");
	};
	AI_PlayAni(self,"T_STAND_2_EAT");
	Mdl_ApplyRandomAni(self,"S_EAT","R_ROAM1");
	Mdl_ApplyRandomAni(self,"S_EAT","R_ROAM2");
	Mdl_ApplyRandomAni(self,"S_EAT","R_ROAM3");
	Mdl_ApplyRandomAniFreq(self,"S_EAT",8);
};

func int ZS_MM_Rtn_EatGround_Loop()
{
	PrintDebugNpc(PD_MST_LOOP,"ZS_MM_Rtn_EatGround_Loop");
	B_SpecStatesHandler(self);
	if(!Wld_IsTime(self.aivar[AIV_GUARDITERATOR],0,self.aivar[AIV_FIGHTSPEACHFLAG],0) && (self.aivar[AIV_GUARDITERATOR] != OnlyRoutine))
	{
		AI_StartState(self,ZS_MM_AllScheduler,1,"");
		return LOOP_END;
	};
	return LOOP_CONTINUE;
};

func void ZS_MM_Rtn_EatGround_End()
{
	PrintDebugNpc(PD_MST_FRAME,"ZS_MM_Rtn_EatGround_End");
	AI_PlayAni(self,"T_EAT_2_STAND");
};

func void ZS_MM_Rtn_Wusel()
{
	PrintDebugNpc(PD_MST_FRAME,"ZS_MM_Rtn_Wusel");
//	Npc_PercEnable(self,PERC_ASSESSTALK,B_AssessTalk);
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,B_MM_ReactToDamage);
	Npc_PercEnable(self,PERC_ASSESSOTHERSDAMAGE,B_MM_ReactToOthersDamage);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,B_AssessMagic);
	Npc_PercEnable(self,PERC_ASSESSENEMY,B_MM_AssessEnemy);
	Npc_PercEnable(self,PERC_ASSESSWARN,B_MM_AssessWarn);
	Npc_PercEnable(self,PERC_ASSESSBODY,B_MM_AssessBody);
	AI_SetWalkMode(self,NPC_RUN);
	if(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == FALSE)
	{
		AI_GotoWP(self,self.wp);
	};
};

func int ZS_MM_Rtn_Wusel_loop()
{
	var int randomMove;
	PrintDebugNpc(PD_MST_LOOP,"ZS_MM_Rtn_Wusel_loop");
	B_SpecStatesHandler(self);
	if(
		!Wld_IsTime(self.aivar[AIV_MM_WuselStart],0,self.aivar[AIV_MM_WuselEnd],0) &&
		(self.aivar[AIV_MM_WuselStart] != OnlyRoutine)
	)
	{
		AI_StartState(self,ZS_MM_AllScheduler,1,"");
		return LOOP_END;
	};
	if(Hlp_Random(100) <= 20)
	{
		if(Wld_IsNextFPAvailable(self,"FP_ROAM"))
		{
			AI_GotoNextFP(self,"FP_ROAM");
		}
		else
		{
			AI_GotoWP(self,Npc_GetNearestWP(self));
		};
	}
	else
	{
		randomMove = Hlp_Random(2);
		if(randomMove == 0)
		{
			AI_PlayAni(self,"R_ROAM1");
		};
		if(randomMove == 1)
		{
			AI_PlayAni(self,"R_ROAM2");
		};
		if(randomMove == 2)
		{
			AI_PlayAni(self,"R_ROAM3");
		};
	};
	return LOOP_CONTINUE;
};

func void ZS_MM_Rtn_Wusel_end()
{
	PrintDebugNpc(PD_MST_FRAME,"ZS_MM_Rtn_Wusel_end");
};

func void ZS_MM_Summoned()
{
	PrintDebugNpc(PD_MST_FRAME,"ZS_MM_Summoned");
	Npc_SetPercTime(self,1);
	Npc_PercEnable(self,PERC_ASSESSENEMY,ZS_MM_Attack);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,B_AssessMagic);
	AI_Standup(self);
	Npc_SetTempAttitude(self,ATT_HOSTILE);
	Npc_SetAttitude(self,ATT_HOSTILE);
};

func int ZS_MM_Summoned_loop()
{
	PrintDebugNpc(PD_MST_LOOP,"ZS_MM_Summoned_loop");
	PrintGlobals(PD_MST_DETAIL);
	if(Npc_GetNextTarget(self))
	{
		PrintDebugNpc(PD_MST_CHECK,"...neuer Gegner gefunden");
		Npc_SetTarget(self,other);
		Npc_ClearAIQueue(self);
		AI_StartState(self,ZS_MM_Attack,0,"");
	}
	else if(Npc_GetStateTime(self) > 5)
	{
		return LOOP_END;
	}
	else
	{
		AI_TurnToNPC(self,other);
	};
	return LOOP_CONTINUE;
};

func void ZS_MM_Summoned_End()
{
	PrintDebugNpc(PD_MST_FRAME,"ZS_MM_Summoned_End");
	Npc_ChangeAttribute(self,ATR_HITPOINTS,-self.attribute);
};

func void zs_mm_minecrawler_omgate()
{
//	Wld_SetGuildAttitude(GIL_MINECRAWLER, ATT_ANGRY, GIL_None);
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,B_MM_ReactToDamage);
	Npc_PercEnable(self,PERC_ASSESSOTHERSDAMAGE,B_MM_ReactToOthersDamage);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,B_AssessMagic);
	Npc_PercEnable(self,PERC_ASSESSENEMY,B_MM_AssessEnemy);
	Npc_PercEnable(self,PERC_ASSESSWARN,B_MM_AssessWarn);
	Npc_PercEnable(self,PERC_ASSESSBODY,B_MM_AssessBody);
	self.wp = "OM_CAVE3_19";
	B_MM_DeSynchronize();
	AI_SetWalkMode(self,NPC_RUN);
	AI_GotoWP(self,self.wp);
	AI_StartState(self,ZS_MM_Rtn_Wusel,1,"");
};

