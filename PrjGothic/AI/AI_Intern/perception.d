
const int PERC_DIST_CLOSE = 100;
const int PERC_DIST_FLEE = 300;
const int PERC_DIST_DIALOG = 500;
const int PERC_DIST_WATCHFIGHT = 600;
const int PERC_DIST_INTERMEDIAT = 1000;
const int PERC_DIST_MAX = 2000;

func void b_setcutsceneperceptions()
{
	PrintDebugNpc(PD_ZS_Check,self.name);
	PrintDebugNpc(PD_ZS_Check,"CutscenePerceptions");
	Npc_PercEnable(self,PERC_ASSESSMAGIC,B_AssessMagic);
	Npc_PercEnable(self,PERC_ASSESSTHREAT,B_AssessFighter);
	Npc_PercEnable(self,PERC_ASSESSTHEFT,B_AssessTheft);
	Npc_PercEnable(self,PERC_DRAWWEAPON,B_AssessFighter);
	Npc_PercEnable(self,PERC_ASSESSTALK,B_AssessTalk);
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,ZS_ReactToDamage);
	Npc_PercEnable(self,PERC_CATCHTHIEF,ZS_CatchThief);
};

func void InitPerceptions()
{
	Perc_SetRange(PERC_ASSESSENEMY,4000);
	Perc_SetRange(PERC_ASSESSBODY,HAI_DIST_ASSESSBODY);
	Perc_SetRange(PERC_ASSESSMURDER,HAI_DIST_RANGED);
	Perc_SetRange(PERC_ASSESSPLAYER,4000);
	Perc_SetRange(PERC_ASSESSDEFEAT,HAI_DIST_RANGED);
	Perc_SetRange(PERC_ASSESSDAMAGE,PERC_DIST_FLEE);
	Perc_SetRange(PERC_ASSESSFIGHTER,HAI_DIST_ABORT_MELEE);
	Perc_SetRange(PERC_ASSESSOTHERSDAMAGE,4000);
	Perc_SetRange(PERC_ASSESSTHREAT,HAI_DIST_RANGED);
	Perc_SetRange(PERC_ASSESSREMOVEWEAPON,PERC_DIST_MAX);
	Perc_SetRange(PERC_OBSERVEINTRUDER,HAI_DIST_OBSERVEINTRUDER);
	Perc_SetRange(PERC_ASSESSFIGHTSOUND,HAI_DIST_HELPATTACKEDCHARGES);
	Perc_SetRange(PERC_ASSESSQUIETSOUND,PERC_DIST_INTERMEDIAT);
	Perc_SetRange(PERC_ASSESSWARN,3000);
	Perc_SetRange(PERC_CATCHTHIEF,HAI_DIST_CATCHTHIEF);
	Perc_SetRange(PERC_ASSESSTHEFT,HAI_DIST_ASSESSTHEFT);
	Perc_SetRange(PERC_ASSESSCALL,PERC_DIST_INTERMEDIAT);
	Perc_SetRange(PERC_ASSESSTALK,PERC_DIST_DIALOG);
	Perc_SetRange(PERC_ASSESSMAGIC,HAI_DIST_RANGED);
	Perc_SetRange(PERC_ASSESSSTOPMAGIC,HAI_DIST_RANGED);
	Perc_SetRange(PERC_MOVEMOB,PERC_DIST_DIALOG);
//	Perc_SetRange(PERC_MOVENPC,PERC_DIST_DIALOG);
	Perc_SetRange(PERC_MOVENPC,3000);
	Perc_SetRange(PERC_DRAWWEAPON,HAI_DIST_MELEE);
	Perc_SetRange(PERC_OBSERVESUSPECT,PERC_DIST_DIALOG);
	Perc_SetRange(PERC_NPCCOMMAND,PERC_DIST_DIALOG);
	Perc_SetRange(PERC_ASSESSCASTER,HAI_DIST_ASSESSCASTER);
	Perc_SetRange(PERC_ASSESSSURPRISE,PERC_DIST_DIALOG);
	Perc_SetRange(PERC_ASSESSENTERROOM,HAI_DIST_ACTIONRANGE);
	Perc_SetRange(PERC_ASSESSUSEMOB,HAI_DIST_DETECTUSEMOB);
};

func void GuardPerception()
{
	Npc_PercEnable(self,PERC_ASSESSBODY,B_AssessBody);
	Npc_PercEnable(self,PERC_ASSESSENEMY,B_AssessEnemy);
	Npc_PercEnable(self,PERC_ASSESSPLAYER,B_AssessSC);
	Npc_PercEnable(self,PERC_ASSESSFIGHTER,B_AssessFighter);
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,ZS_ReactToDamage);
	Npc_PercEnable(self,PERC_ASSESSOTHERSDAMAGE,B_AssessOthersDamage);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,B_AssessMagic);
	Npc_PercEnable(self,PERC_ASSESSCASTER,B_AssessCaster);
	Npc_PercEnable(self,PERC_ASSESSTHREAT,B_AssessFighter);
	Npc_PercEnable(self,PERC_DRAWWEAPON,B_AssessFighter);
	Npc_PercEnable(self,PERC_ASSESSWARN,B_AssessWarn);
	Npc_PercEnable(self,PERC_ASSESSMURDER,B_AssessMurder);
	Npc_PercEnable(self,PERC_ASSESSDEFEAT,ZS_AssessDefeat);
	Npc_PercEnable(self,PERC_ASSESSFIGHTSOUND,B_AssessFightSound);
	Npc_PercEnable(self,PERC_ASSESSQUIETSOUND,B_AssessQuietSound);
	Npc_PercEnable(self,PERC_CATCHTHIEF,ZS_CatchThief);
	Npc_PercEnable(self,PERC_ASSESSTHEFT,B_AssessTheft);
	Npc_PercEnable(self,PERC_ASSESSSURPRISE,ZS_AssessSurprise);
	Npc_PercEnable(self,PERC_OBSERVESUSPECT,B_ObserveSuspect);
	Npc_PercEnable(self,PERC_OBSERVEINTRUDER,B_ObserveIntruder);
	Npc_PercEnable(self,PERC_ASSESSTALK,B_AssessTalk);
	Npc_PercEnable(self,PERC_ASSESSCALL,ZS_ReactToCall);
	Npc_PercEnable(self,PERC_ASSESSUSEMOB,B_AssessUseMob);
	Npc_PercEnable(self,PERC_ASSESSENTERROOM,B_AssessEnterRoom);
	Npc_PercEnable(self,PERC_MOVEMOB,B_MoveMob);
	Npc_PercEnable(self,PERC_MOVENPC,B_MoveNpc);
	Npc_SetPercTime(self,0.5);
};

func void ObservingPerception()
{
	Npc_PercEnable(self,PERC_ASSESSENEMY,B_AssessEnemy);
	Npc_PercEnable(self,PERC_ASSESSFIGHTER,B_AssessFighter);
	Npc_PercEnable(self,PERC_ASSESSPLAYER,B_AssessSC);
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,ZS_ReactToDamage);
	Npc_PercEnable(self,PERC_ASSESSOTHERSDAMAGE,B_AssessOthersDamage);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,B_AssessMagic);
	Npc_PercEnable(self,PERC_ASSESSCASTER,B_AssessCaster);
	Npc_PercEnable(self,PERC_ASSESSTHREAT,B_AssessFighter);
	Npc_PercEnable(self,PERC_ASSESSWARN,B_AssessWarn);
	Npc_PercEnable(self,PERC_ASSESSMURDER,B_AssessMurder);
	Npc_PercEnable(self,PERC_ASSESSDEFEAT,ZS_AssessDefeat);
	Npc_PercEnable(self,PERC_DRAWWEAPON,B_AssessFighter);
	Npc_PercEnable(self,PERC_ASSESSFIGHTSOUND,B_AssessFightSound);
	Npc_PercEnable(self,PERC_ASSESSQUIETSOUND,B_AssessQuietSound);
	Npc_PercEnable(self,PERC_CATCHTHIEF,ZS_CatchThief);
	Npc_PercEnable(self,PERC_ASSESSTHEFT,B_AssessTheft);
	Npc_PercEnable(self,PERC_ASSESSSURPRISE,ZS_AssessSurprise);
	Npc_PercEnable(self,PERC_OBSERVESUSPECT,B_ObserveSuspect);
	Npc_PercEnable(self,PERC_OBSERVEINTRUDER,B_ObserveIntruder);
	Npc_PercEnable(self,PERC_ASSESSTALK,B_AssessTalk);
	Npc_PercEnable(self,PERC_ASSESSCALL,ZS_ReactToCall);
	Npc_PercEnable(self,PERC_ASSESSUSEMOB,B_AssessUseMob);
	Npc_PercEnable(self,PERC_ASSESSENTERROOM,B_AssessEnterRoom);
	Npc_PercEnable(self,PERC_MOVEMOB,B_MoveMob);
	Npc_PercEnable(self,PERC_MOVENPC,B_MoveNpc);
	Npc_SetPercTime(self,1);
};

func void OccupiedPerception()
{
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,ZS_ReactToDamage);
	Npc_PercEnable(self,PERC_ASSESSTHREAT,B_AssessFighter);
	Npc_PercEnable(self,PERC_DRAWWEAPON,B_AssessFighter);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,B_AssessMagic);
	Npc_PercEnable(self,PERC_ASSESSCASTER,B_AssessCaster);
	Npc_PercEnable(self,PERC_ASSESSWARN,B_AssessWarn);
	Npc_PercEnable(self,PERC_ASSESSMURDER,ZS_AssessMurder);
	Npc_PercEnable(self,PERC_ASSESSDEFEAT,ZS_AssessDefeat);
	Npc_PercEnable(self,PERC_ASSESSFIGHTSOUND,B_AssessFightSound);
	Npc_PercEnable(self,PERC_ASSESSTHEFT,B_AssessTheft);
	Npc_PercEnable(self,PERC_CATCHTHIEF,ZS_CatchThief);
	Npc_PercEnable(self,PERC_ASSESSSURPRISE,ZS_AssessSurprise);
	Npc_PercEnable(self,PERC_OBSERVESUSPECT,B_ObserveSuspect);
	Npc_PercEnable(self,PERC_ASSESSTALK,B_AssessTalk);
	Npc_PercEnable(self,PERC_ASSESSCALL,ZS_ReactToCall);
	Npc_PercEnable(self,PERC_ASSESSUSEMOB,B_AssessUseMob);
	Npc_PercEnable(self,PERC_ASSESSENTERROOM,B_AssessEnterRoom);
	Npc_PercEnable(self,PERC_MOVEMOB,B_MoveMob);
	Npc_PercEnable(self,PERC_MOVENPC,B_MoveNpc);
};

func void DeepSleepPerception()
{
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,ZS_ReactToDamage);
	Npc_PercEnable(self,PERC_OBSERVEINTRUDER,B_TossAndTurn);
	Npc_PercEnable(self,PERC_ASSESSFIGHTSOUND,B_TossAndTurn);
	Npc_PercEnable(self,PERC_ASSESSWARN,B_TossAndTurn);
	Npc_PercEnable(self,PERC_ASSESSTALK,B_TossAndTurn);
	Npc_PercEnable(self,PERC_ASSESSCALL,B_TossAndTurn);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,B_AssessMagic);
};

func void LightSleepPerception()
{
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,ZS_ReactToDamage);
	Npc_PercEnable(self,PERC_ASSESSWARN,ZS_WakeUp);
	Npc_PercEnable(self,PERC_ASSESSFIGHTSOUND,ZS_WakeUp);
	Npc_PercEnable(self,PERC_CATCHTHIEF,ZS_CatchThief);
	Npc_PercEnable(self,PERC_ASSESSQUIETSOUND,B_SleepQuietSound);
	Npc_PercEnable(self,PERC_ASSESSTALK,ZS_WakeUp);
	Npc_PercEnable(self,PERC_ASSESSCALL,ZS_WakeUp);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,B_AssessMagic);
};

func void wolfPerception()
{
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,B_MM_ReactToDamage);
	Npc_PercEnable(self,PERC_ASSESSOTHERSDAMAGE,B_MM_ReactToOthersDamage);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,B_AssessMagic);
	Npc_PercEnable(self,PERC_ASSESSENEMY,B_MM_AssessEnemy);
	Npc_PercEnable(self,PERC_ASSESSWARN,B_MM_AssessWarn);
	Npc_PercEnable(self,PERC_ASSESSBODY,B_MM_AssessBody);
};

func void B_SetPerception(var C_Npc self)
{
	ObservingPerception();
};



func void akh_testPerc_ASSESSBODY()
{
	msgSS("ASSESSBODY: ",other.name,30,30);
};
func void akh_testPerc_ASSESSCALL()
{
	msgSS("ASSESSCALL: ",other.name,30,34);
};
func void akh_testPerc_ASSESSDAMAGE()
{
	msgSS("ASSESSDAMAGE: ",other.name,40,34);
	Print("ASSESSDAMAGE");
};
func void akh_testPerc_ASSESSENEMY()
{
	msgSS("ASSESSENEMY: ",other.name,30,36);
};
func void akh_testPerc_ASSESSENTERROOM()
{
	msgSS("ASSESSENTERROOM: ",other.name,30,38);
};
func void akh_testPerc_ASSESSFAKEGUILD()
{
	msgSS("ASSESSFAKEGUILD: ",other.name,30,40);
};
func void akh_testPerc_ASSESSFIGHTER()
{
	msgSS("ASSESSFIGHTER: ",other.name,30,42);
};
func void akh_testPerc_ASSESSFIGHTSOUND()
{
	msgSS("ASSESSFIGHTSOUND: ",other.name,30,44);
	Print("ASSESSFIGHTSOUND");
};
func void akh_testPerc_ASSESSQUIETSOUND()
{
	msgSS("ASSESSQUIETSOUND: ",other.name,30,46);
};
func void akh_testPerc_ASSESSSURPRISE()
{
	msgSS("ASSESSSURPRISE: ",other.name,30,48);
};
func void akh_testPerc_ASSESSTALK()
{
	msgSS("ASSESSTALK: ",other.name,30,50);
};
func void akh_testPerc_ASSESSTHREAT()
{
	msgSS("ASSESSTHREAT: ",other.name,30,52);
};
func void akh_testPerc_MOVENPC()
{
	msgSS("MOVENPC: ",other.name,30,54);
};
func void akh_testPerc_NPCCOMMAND()
{
	msgSS("NPCCOMMAND: ",other.name,30,56);
};
func void akh_testPerc_OBSERVEINTRUDER()
{
	msgSS("OBSERVEINTRUDER: ",other.name,30,58);
};
func void akh_setTestPerc()
{
	Perc_SetRange(PERC_ASSESSBODY,			self.senses_range);
	Perc_SetRange(PERC_ASSESSCALL,			self.senses_range);
	Perc_SetRange(PERC_ASSESSDAMAGE,		self.senses_range);
	Perc_SetRange(PERC_ASSESSENEMY,			self.senses_range);
	Perc_SetRange(PERC_ASSESSENTERROOM,		self.senses_range);
	Perc_SetRange(PERC_ASSESSFAKEGUILD,		self.senses_range);
	Perc_SetRange(PERC_ASSESSFIGHTER,		self.senses_range);
	Perc_SetRange(PERC_ASSESSFIGHTSOUND,	self.senses_range);
	Perc_SetRange(PERC_ASSESSQUIETSOUND,	self.senses_range);
	Perc_SetRange(PERC_ASSESSSURPRISE,		self.senses_range);
	Perc_SetRange(PERC_ASSESSTALK,			self.senses_range);
	Perc_SetRange(PERC_ASSESSTHREAT,		self.senses_range);
	Perc_SetRange(PERC_MOVENPC,				self.senses_range);
	Perc_SetRange(PERC_NPCCOMMAND,			self.senses_range);
	Perc_SetRange(PERC_OBSERVEINTRUDER,		self.senses_range);
	Npc_PercEnable(self,PERC_ASSESSBODY,			akh_testPerc_ASSESSBODY);
	Npc_PercEnable(self,PERC_ASSESSCALL,			akh_testPerc_ASSESSCALL);
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,		akh_testPerc_ASSESSDAMAGE);
	Npc_PercEnable(self,PERC_ASSESSENEMY,		akh_testPerc_ASSESSENEMY);
	Npc_PercEnable(self,PERC_ASSESSENTERROOM,	akh_testPerc_ASSESSENTERROOM);
	Npc_PercEnable(self,PERC_ASSESSFAKEGUILD,	akh_testPerc_ASSESSFAKEGUILD);
	Npc_PercEnable(self,PERC_ASSESSFIGHTER,		akh_testPerc_ASSESSFIGHTER);
	Npc_PercEnable(self,PERC_ASSESSFIGHTSOUND,	akh_testPerc_ASSESSFIGHTSOUND);
	Npc_PercEnable(self,PERC_ASSESSQUIETSOUND,	akh_testPerc_ASSESSQUIETSOUND);
	Npc_PercEnable(self,PERC_ASSESSSURPRISE,	akh_testPerc_ASSESSSURPRISE);
	Npc_PercEnable(self,PERC_ASSESSTALK,			akh_testPerc_ASSESSTALK);
	Npc_PercEnable(self,PERC_ASSESSTHREAT,		akh_testPerc_ASSESSTHREAT);
	Npc_PercEnable(self,PERC_MOVENPC,			akh_testPerc_MOVENPC);
	Npc_PercEnable(self,PERC_NPCCOMMAND,			akh_testPerc_NPCCOMMAND);
	Npc_PercEnable(self,PERC_OBSERVEINTRUDER,	akh_testPerc_OBSERVEINTRUDER);
	Npc_SetPercTime(self,1);
};

