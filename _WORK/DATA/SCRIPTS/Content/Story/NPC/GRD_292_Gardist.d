
instance GRD_292_Gardist(Npc_Default)
{
	name[0] = NAME_Gardist;
	guild = GIL_GRD;
	npcType = npctype_guard;
	level = 40;
	voice = 6;
	id = 292;
	attribute[ATR_STRENGTH] = 110;
	attribute[ATR_DEXTERITY] = 90;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 310;
	attribute[ATR_HITPOINTS] = 310;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,0,"Hum_Head_Psionic",2,1,grd_armor_h);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_Strong;
	Npc_SetTalentSkill(self,NPC_TALENT_1H,2);
	Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
	Npc_SetTalentSkill(self,NPC_TALENT_CROSSBOW,1);
	EquipItem(self,ItMw_1H_Sword_03);
	CreateInvItem(self,ItFoMutton);
	CreateInvItems(self,ItMiNugget,20);
	CreateInvItem(self,ItFo_Potion_Health_01);
	CreateInvItem(self,ItLsTorch);
	daily_routine = Rtn_FMstart_292;
};


func void Rtn_FMstart_292()
{
	TA_Guard(0,0,13,0,"FM_03");
	TA_Guard(13,0,0,0,"FM_03");
};
