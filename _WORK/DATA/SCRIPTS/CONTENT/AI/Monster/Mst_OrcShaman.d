
prototype Mst_Default_OrcShaman(C_Npc)
{
	name[0] = "Ork-Schamane";
	guild = GIL_ORCSHAMAN;
	npcType = npctype_guard;
	level = 30;
	attribute[ATR_STRENGTH] = 70;
	attribute[ATR_DEXTERITY] = 70;
	attribute[ATR_HITPOINTS_MAX] = 230;
	attribute[ATR_HITPOINTS] = 230;
	attribute[ATR_MANA_MAX] = 110;
	attribute[ATR_MANA] = 110;
	protection[PROT_BLUNT] = 40;
	protection[PROT_EDGE] = 40;
	protection[PROT_POINT] = 40;
	protection[PROT_FIRE] = 40;
	protection[PROT_FLY] = 40;
	protection[PROT_MAGIC] = 40;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_HUMAN_MAGE;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = 3000;
	aivar[AIV_FINDABLE] = PASSIVE;
	aivar[AIV_PCISSTRONGER] = 1200;
	aivar[AIV_BEENATTACKED] = 1000;
	aivar[AIV_HIGHWAYMEN] = 700;
	aivar[AIV_HAS_ERPRESSED] = 5;
	aivar[AIV_BEGGAR] = 10;
	aivar[AIV_OBSERVEINTRUDER] = FALSE;
	start_aistate = ZS_Orc_Pray;
	aivar[AIV_HASBEENDEFEATEDINPORTALROOM] = OnlyRoutine;
};

func void Set_OrcShaman_Visuals()
{
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_ApplyOverlayMds(self,"Orc_Shaman.mds");
	Mdl_SetVisualBody(self,"Orc_BodyShaman",DEFAULT,DEFAULT,"Orc_HeadShaman",DEFAULT,DEFAULT,-1);
};


instance OrcShaman(Mst_Default_OrcShaman)
{
	Set_OrcShaman_Visuals();
	CreateInvItem(self,ItArRuneFireball);
	EquipItem(self,ItRwOrcstaff);
};

