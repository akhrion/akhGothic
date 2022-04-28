//Для передачи глобалок: self, other; в функции используется специальное наименование: slf, oth; нельзя использовать иные: slf_,thr_, и т.д. - аффтор в шоке.. и хотел-бы сказать "ебаный рот", но ограничится, лишь написанием оного.
//Объявленные в классе константы, не отображаются в автокомплите, однако вродебы вызываются.. я забыл.

class NOT_AN_EXTENDED_CLASS
{
	var int not_a_new_field;
};
class C_ITEM_EXT
{
	var int id;
	var string name;
	var string nameID;
	var int hp;
	var int hp_max;
	var int mainflag;
	var int flags;
	var int weight;
	var int value;
	var int damagetype;
	var int damageTotal;
	var int damage[DAM_INDEX_MAX];
	var int wear;
	var int protection[PROT_INDEX_MAX];
	var int nutrition;
	var int cond_atr[3];
	var int cond_value[3];
	var int change_atr[3];
	var int change_value[3];
	var func magic;
	var func on_equip;
	var func on_unequip;
	var func on_state[4];
	var func owner;
	var int ownerGuild;
	var int disguiseGuild;
	var string visual;
	var string visual_change;
	var int visual_skin;
	var string scemeName;		// MAP, FOOD, FOODHUGE, MEAT, RICE, JOINT, POTION
	var int material;
	var int munition;
	var int spell;
	var int range;
	var int mag_circle;
	var string description;
	var string text[6];
	var int count[6];
	var string quality;
};

class RESPAWN
{
	var int isRespawnRequested;	//если массив приближается к концу, то функция ставит этот флаг,
									//чтобы другая функция произвела выгрузку старых спавнов..
									//т.е. что-бы респавны досрочно прошли и освободили место.
	var int lstInxNAStateBefoReset;	//последнее состояние в котором был inxNA перед сбросом до нуля;
	var int isArrEmpty;			//если в пуле нет существ, то необходимо переинициализировать некоторые переменные
	var int instanceID;			//ну как-бы.. это.. это указатель на вашего монстра: Hlp_GetInstanceID(Molerat);
	var int delay;					//delay between respawns in game minutes;1 game min. == 4 real sec.
	var int lastRespawnTime;		//last time respawn was; timestamp();
	const int arrSize = 200;		//
	var string spMemo[200];		//spawn points stored here; should be equal to the previous field;
	const int inxNA = 0;					//next inx for write; next where will be saved spawn point;
	const int inxNE = 0;					//next inx for extracted; next will be respawned spawn point;
	var int notRespawnedAmount;	//количество неотреспавленных мобов;
									//Здесь должны быть внутренние функции, но я не пойму как их подвязать.
	var func main;					//akh_Respawn();
	var func memoDeath;			//Вот тут прям. if someone die then trigger akh_memo_death(var C_NPC dead_);
	var func flush;					//И здеся. я хз. isRespawnRequested then trigger akh_Respawn_cb(instanceID,0);
};
class RESPAWNN
{
	//public
	var func insertNew;			//Func which allocate instanceID, SP and dTimestamp
	var func extractOne;			//Func which extract those, whos spawn time is reaches
	var func isTimeForSpawn;		//Функция проверки наступления времени спавна.
	//private
	var int instanceID[200];		//InstanceID's of a spawning monster
	var string SP[200];				//Spawn Points
	var int dTimestamp[200];		//Death timestamps
	var int spawnDelay[200];		//Delay of the monster.. может не совпадать со стандартным временем спавна монстра, что приведёт к увеличению или уменьшению времени спавна данной особи вида.
};
instance resp(RESPAWNN)
{
};
