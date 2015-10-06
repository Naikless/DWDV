
instance SFB_1035_Schuerfer(Npc_Default)
{
	name[0] = NAME_Schuerfer;
	npcType = npctype_ambient;
	guild = GIL_SFB;
	level = 6;
	flags = 0;
	voice = 5;
	id = 1035;
	attribute[ATR_STRENGTH] = 25;
	attribute[ATR_DEXTERITY] = 20;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 106;
	attribute[ATR_HITPOINTS] = 106;
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	Mdl_SetVisualBody(self,"hum_body_Naked0",13,0,"Hum_Head_FatBald",11,1,sfb_armor_l);
	B_Scale(self);
	Mdl_SetModelFatness(self,0);
	fight_tactic = FAI_HUMAN_COWARD;
	CreateInvItems(self,ItFoRice,3);
	CreateInvItems(self,ItMiNugget,9);
	CreateInvItem(self,ItMi_Stuff_Cup_01);
	EquipItem(self,ItMwPickaxe);
	CreateInvItem(self,ItMw_1H_Hatchet_01);
	daily_routine = Rtn_FMCstart_1035;
};


func void Rtn_FMCstart_1035()
{
	TA_PickOre(1,0,13,0,"FMC_ORE_07");
	TA_PickOre(13,0,1,0,"FMC_ORE_07");
};

