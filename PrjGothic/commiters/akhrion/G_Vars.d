var int modificator;
var int isWorking;
var int Used_ItMi_Alchemy_Quicksilver_01;
var int NPC_TALENT_FIREMASTER_value;//��� �������� ���� � ������ ����� - ������ \ �� ������ - ��� ������� ����
var int isAkhRespawnNeed;
const int Spawn_MaxInx = 20;//������ 20 �� �������
const int Spawn_scavengersDelay = 2;
const int Spawn_scavengersLastTime = 0;
var string Spawn_scavengers[Spawn_MaxInx];
const int Spawn_scavengersInxNA = 0;//last added
const int Spawn_scavengersInxNE = 0;//last extracted
var int Spawn_scavengersAmountNotRespawned;
var int Spawn_scavengersLastInxStateOfNABefoReturn;
var int isSomeoneCrawlerKilledByPC;
