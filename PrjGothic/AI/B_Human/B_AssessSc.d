
func void B_CheckStolenEquipment()
{
	var C_Item melee;
	var C_Item ranged;
	var C_Item armor;
	melee = Npc_GetEquippedMeleeWeapon(other);
	ranged = Npc_GetEquippedRangedWeapon(other);
	armor = Npc_GetEquippedArmor(other);
	if(Npc_OwnedByNpc(melee,self))
	{
		PrintDebugNpc(PD_ZS_Check,"...SC trägt Nahkampf-Waffe des NSCs offen!");
		self.aivar[AIV_WANTEDITEM] = Hlp_GetInstanceID(melee);
		if(!Npc_HasNews(self,NEWS_DEFEAT,other,self) && (self.aivar[AIV_PCISSTRONGER] == 0))
		{
			PrintDebugNpc(PD_ZS_Check,"...NSC ist nicht vom SC besiegt worden & hat noch nicht danach gefragt!");
			Npc_ClearAIQueue(self);
			C_LookAtNpc(self,other);
			AI_TurnToNPC(self,other);
			AI_PointAtNpc(self,other);
			B_Say(self,other,"$THATSMYWEAPON");
			AI_StartState(self,ZS_GetBackBelongings,1,"");
			return;
		};
	}
	else if(Npc_OwnedByNpc(ranged,self))
	{
		PrintDebugNpc(PD_ZS_Check,"...SC trägt Fernkampf-Waffe des NSCs offen!");
		self.aivar[AIV_WANTEDITEM] = Hlp_GetInstanceID(ranged);
		if(!Npc_HasNews(self,NEWS_DEFEAT,other,self) && (self.aivar[AIV_PCISSTRONGER] == 0))
		{
			Npc_ClearAIQueue(self);
			C_LookAtNpc(self,other);
			AI_TurnToNPC(self,other);
			AI_PointAtNpc(self,other);
			B_Say(self,other,"$THATSMYWEAPON");
			AI_StartState(self,ZS_GetBackBelongings,1,"");
			return;
		};
	};
};

var int meatCounter237;
var int meatCounter238;
var int isSpawnedOrcDog238;
var int PC_nearJosef;
var int josefNameCounter;
func void akh_test_AssAMemo()
{
	if(self.id == 237)
	{
		if(Hlp_IsValidNpc(other))
		{
			if(Npc_IsPlayer(other))
			{
				meatCounter237 +=1;
//				Print(ConcatStrings(
//					"GRD_237_Gardist meat you: ",
//					IntToString(meatCounter237)
//				));
			};
		};
	};
	if(self.id == 238)
	{
		if(Hlp_IsValidNpc(other))
		{
			if(Npc_IsPlayer(other))
			{
				if(Npc_GetDistToPlayer(self) < 400)
				{
					Print(IntToString(josefNameCounter));
					if(josefNameCounter < 21)
					{
						josefNameCounter +=1;
						if(josefNameCounter > 20)
						{
//							josefNameImportant = true;
						};
					};
				};
				if(!isSpawnedOrcDog238)
				{
					if(Npc_GetDistToPlayer(self) < 2000)
					{
						PC_nearJosef = true;
					};
					if(Npc_GetDistToPlayer(self) > 3500 && PC_nearJosef)
					{
						PC_nearJosef = false;
						isSpawnedOrcDog238 = true;
						Wld_InsertNpc(OrcDog,self.wp);
						Wld_InsertNpc(OrcDog,self.wp);
						Wld_InsertNpc(OrcDog,self.wp);
						meatCounter238 +=1;
						Print(ConcatStrings(
							"GRD_238_Gardist meat you: ",
							IntToString(meatCounter238)
						));
					};
				};
			};
		};
	};
};

func void akh_test_RespawnViaItems()
{
	CreateInvItem(hero,ItAmScavengerSoul);
	Npc_GetInvItem(hero,ItAmScavengerSoul);
	item.hp = getTimestamp();
	item.hp_max = self.spawnDelay;
	item.description = self.wp;
};
func void akh_test_RespawnViaItems_Loop()
{
	Npc_GetInvItem(hero,ItAmScavengerSoul);
	if(item.hp + item.hp_max < getTimestamp())
	{
		Npc_RemoveInvItem(hero,ItAmScavengerSoul);
		Wld_InsertNpc(Scavenger,item.description);
	};
};


func void B_AssessSC()
{
//	akh_test_AssAMemo();
//	akh_test_RespawnViaItems_Loop();
	var C_Npc her;
	var C_Npc rock;
	PrintDebugNpc(PD_ZS_FRAME,"B_AssessSc");
	if(
		(self.id == 888)
	)
	{
		if(GOPSTOPPED_BRIDGE == TRUE)
		{
			Npc_SetTempAttitude(self,ATT_HOSTILE);
			Npc_SetAttitude(self,ATT_HOSTILE);
		}
		else if(
			Npc_CanSeeNpcFreeLOS(self,hero) &&
			!(
				Npc_IsInState(self,ZS_ErpresserGoToGuard) ||
				Npc_IsInState(self,ZS_ErpresserGoToGuard_Loop)
			)
		)
		{
			msg("B_AssessSC: starting ZS_ErpresserGoToGuard",50,40);
			AI_StartState(self,ZS_ErpresserGoToGuard,0,"");
		};
	};
	if((self.id == 889) && (GOPSTOPPED_BRIDGE == TRUE))
	{
		Npc_SetTempAttitude(self,ATT_HOSTILE);
		Npc_SetAttitude(self,ATT_HOSTILE);
	};
	if(self.npcType == Npctype_ROGUE)
	{
		B_SetRoguesToHostile();
	};
	if(Npc_CanSeeNpcFreeLOS(self,other) && (Npc_GetDistToNpc(self,other) < PERC_DIST_DIALOG))
	{
		PrintDebugNpc(PD_ZS_Check,"...SC sichtbar und in Dialogreichweite!");
		her = Hlp_GetNpc(PC_Hero);
		rock = Hlp_GetNpc(PC_Rockefeller);
		if(
			(Hlp_GetInstanceID(her) != Hlp_GetInstanceID(hero)) &&
			(Hlp_GetInstanceID(rock) != Hlp_GetInstanceID(hero)) &&
			Npc_IsInState(self,ZS_GuardPassage))
		{
			if(
				(Wld_GetGuildAttitude(self.guild,other.guild) != ATT_FRIENDLY) &&
				(hero.guild != GIL_MEATBUG))
			{
				B_FullStop(self);
				B_Say(self,other,"$NOWWAIT");
				B_IntruderAlert(self,other);
				B_SetAttackReason(self,AIV_AR_INTRUDER);
				Npc_SetTarget(self,other);
				AI_StartState(self,ZS_Attack,1,"");
			};
		};
		B_CheckForImportantInfo(self,other);
		if(C_NpcIsInFightMode(other))
		{
			PrintDebugNpc(PD_ZS_Check,"...SC im Kampfmodus!");
			B_AssessFighter();
			return;
		};
		if(!C_BodyStateContains(other,BS_SNEAK))
		{
			PrintDebugNpc(PD_ZS_Check,"...SC schleicht NICHT!");
			if(Npc_GetDistToNpc(self,other) < HAI_DIST_OBSERVEINTRUDER)
			{
				PrintDebugNpc(PD_ZS_Check,"...SC in ObserveIntruder-Reichweite!");
				B_ObserveIntruder();
				return;
			}
			else
			{
				PrintDebugNpc(PD_ZS_Check,"...SC außerhalb ObserveIntruder-Reichweite!");
			};
		};
		B_CheckStolenEquipment();
	};
	if(
		(hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_FIRSTWARN) ||
		(hero.aivar[AIV_GUARDPASSAGE_STATUS] == AIV_GPS_LASTWARN))
	{
		PrintDebugNpc(PD_ZS_Check,"...SC wurde von Durchgangswachen verwarnt!");
		PrintDebugInt(PD_ZS_Check,"hero.aivar[AIV_GUARDPASSAGE_STATUS] = ",hero.aivar[AIV_GUARDPASSAGE_STATUS]);
		if(
			(
				Npc_IsInState(self,ZS_GuardPassage) ||
				Npc_IsInState(self,ZS_GuardPalisade)
			) &&
			(
				Npc_GetDistToNpc(self,hero) > HAI_DIST_GUARDPASSAGE_RESET
			)
		)
		{
			PrintDebugNpc(PD_ZS_Check,"...Status für Durchgangswachen zurücksetzen!");
			hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_BEGIN;
			self.aivar[AIV_MISSION1] = 0;
		};
	};
};

