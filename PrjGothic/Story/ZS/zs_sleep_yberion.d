
func void zs_sleep_yberion()
{
	self.flags = NPC_FLAG_IMMORTAL;
	self.voice = 0;
	AI_UnequipWeapons(self);
	Npc_RemoveInvItem(self,itarrune_5_7_pyrokinesis);
	Npc_RemoveInvItem(self,Stab_des_Lichts);
	Npc_RemoveInvItem(self,ItMi_Amulet_Psi_01);
	Npc_RemoveInvItem(self,itke_yberion);
	AI_AlignToWP(self);
	Mdl_StartFaceAni(self,"S_EYESCLOSED",1,-1);
	AI_PlayAni(self,"S_DEADB");
};

