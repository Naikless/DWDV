
instance ORG_842_Shrike(Npc_Default)
{
	name[0] = "Shrike";
	npcType = npctype_main;
	guild = GIL_ORG;
	level = 6;
	voice = 7;
	id = 842;
	attribute[ATR_STRENGTH] = 40;
	attribute[ATR_DEXTERITY] = 40;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 166;
	attribute[ATR_HITPOINTS] = 166;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"hum_body_Naked0",0,2,"Hum_Head_Thief",9,1,org_armor_l);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_Strong;
	Npc_SetTalentSkill(self,NPC_TALENT_BOW,1);
	Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
	CreateInvItems(self,ItKeLockpick,2);
	CreateInvItems(self,ItMiNugget,15);
	CreateInvItems(self,ItFoRice,7);
	CreateInvItems(self,ItFoBooze,3);
	CreateInvItems(self,ItLsTorch,2);
	CreateInvItems(self,ItFo_Potion_Health_01,2);
	CreateInvItem(self,ItMi_Stuff_Barbknife_01);
	CreateInvItem(self,ItMi_Stuff_Cup_01);
	CreateInvItem(self,ItFoMutton);
	CreateInvItem(self,ItFoLoaf);
	CreateInvItem(self,ItAt_Teeth_01);
	EquipItem(self,ItMw_1H_Mace_02);
	EquipItem(self,ItRw_Bow_Small_02);
	CreateInvItems(self,ItAmArrow,20);
	daily_routine = Rtn_PreStart_842;
};


func void Rtn_PreStart_842()
{
	TA_StandAround(21,0,1,0,"NC_TAVERN_MORDRAG_SHRIKE");
	TA_Sleep(1,0,8,0,"NC_HUT01_IN");
	TA_RepairHut(8,0,21,0,"NC_HUT01_OUT");
};

func void Rtn_Start_842()
{
	TA_StandAround(21,0,1,0,"NC_TAVERN_MORDRAG_SHRIKE");
	TA_Sleep(1,0,8,0,"NC_HUT18_IN");
	TA_Smoke(8,0,21,0,"NC_PATH09");
};

