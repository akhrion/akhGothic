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

func void B_MM_AssessEnemy()
{
	MinecrawlerOM(self,other);
	PrintDebugNpc(PD_MST_FRAME,"B_MM_AssessEnemy");
	if((Npc_GetDistToNpc(self,other) < self.aivar[AIV_MM_PercRange]) && Npc_CanSeeNpcFreeLOS(self,other))
	{
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

func void ZS_MM_AssessEnemy()
{
	PrintDebugNpc(PD_MST_FRAME,"ZS_MM_AssessEnemy");
	Npc_SetPercTime(self,2);
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,B_MM_ReactToDamage);
	Npc_PercEnable(self,PERC_ASSESSOTHERSDAMAGE,B_MM_ReactToOthersDamage);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,B_AssessMagic);
	Npc_PercEnable(self,PERC_ASSESSBODY,B_MM_AssessBody);
	if(self.aivar[AIV_FINDABLE] == HUNTER)
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
		AI_PlayAni(self,"T_WARN");
		AI_SetWalkMode(self,NPC_WALK);
	};
	if((self.aivar[AIV_FINDABLE] == PASSIVE) || (self.aivar[AIV_FINDABLE] == PACKHUNTER))
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
	if((Npc_GetDistToNpc(self,other) <= self.aivar[AIV_MM_PercRange]) && (Npc_GetDistToNpc(self,other) > self.aivar[AIV_MM_DrohRange]))
	{
		if((self.aivar[AIV_FINDABLE] == PASSIVE) || (self.aivar[AIV_FINDABLE] == PACKHUNTER))
		{
			if(!Npc_CanSeeNpc(self,other))
			{
				AI_TurnToNPC(self,other);
			};
		};
		if(self.aivar[AIV_FINDABLE] == HUNTER)
		{
			AI_GotoNpc(self,other);
		};
	};
	if((Npc_GetDistToNpc(self,other) <= self.aivar[AIV_MM_DrohRange]) && (Npc_GetDistToNpc(self,other) > self.aivar[AIV_MM_AttackRange]))
	{
		if((self.aivar[AIV_FINDABLE] == PASSIVE) || (self.aivar[AIV_FINDABLE] == PACKHUNTER))
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
		if(self.aivar[AIV_FINDABLE] == HUNTER)
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
		PrintDebugNpc(PD_MST_FRAME,"...Monster ist Jдger");
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

func void B_MM_ReactToCombatDamage()
{
	SaveReceivedDamage_Monster();
	SetVisualType(self);
	PrintDebugNpc(PD_MST_FRAME,"B_MM_ReactToCombatDamage");
	self.aivar[AIV_PLUNDERED] = PRIO_ATTACKER;
	if(C_PreyToPredator(self,other))
	{
		Npc_SetTarget(self,other);
		Npc_ClearAIQueue(self);
		AI_StartState(self,ZS_MM_Flee,0,"");
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
	Npc_SendPassivePerc(self,PERC_ASSESSWARN,other,self);
};

func int ZS_MM_Attack_Loop()
{
	if(Npc_GetPermAttitude(self,other) != ATT_HOSTILE)
	{
		return LOOP_END;
	};
	PrintDebugNpc(PD_MST_LOOP,"ZS_MM_Attack_Loop");
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
			PrintDebugNpc(PD_MST_LOOP,"...Ziel lдuft oder springt!");
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
		PrintDebugNpc(PD_ZS_Check,"...Ziel ist ungьltig oder kampf-unfдhig!");
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

func void ZS_MM_AllScheduler()
{
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
//	Npc_PercEnable(self,PERC_ASSESSDAMAGE,B_MM_ReactToDamage);
//	Npc_PercEnable(self,PERC_ASSESSOTHERSDAMAGE,B_MM_ReactToOthersDamage);
//	Npc_PercEnable(self,PERC_ASSESSMAGIC,B_AssessMagic);
	Npc_PercEnable(self,PERC_ASSESSENEMY,B_MM_AssessEnemy);
//	Npc_PercEnable(self,PERC_ASSESSWARN,B_MM_AssessWarn);
//	Npc_PercEnable(self,PERC_ASSESSBODY,B_MM_AssessBody);
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

