
prototype Mst_Default_OrcWarrior(C_Npc)
{
	name[0] = "Ork-Krieger";
	guild = GIL_ORCWARRIOR;
	npcType = npctype_guard;
	voice = 17;
	level = 25;
	attribute[ATR_STRENGTH] = 70;
	attribute[ATR_DEXTERITY] = 70;
	attribute[ATR_HITPOINTS_MAX] = 230;
	attribute[ATR_HITPOINTS] = 230;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 70;
	protection[PROT_EDGE] = 70;
	protection[PROT_POINT] = 70;
	protection[PROT_FIRE] = 0;
	protection[PROT_FLY] = 70;
	protection[PROT_MAGIC] = 0;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_HUMAN_MASTER;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = 2000;
	aivar[AIV_FINDABLE] = HUNTER;
	aivar[AIV_PCISSTRONGER] = 1200;
	aivar[AIV_BEENATTACKED] = 1000;
	aivar[AIV_HIGHWAYMEN] = 700;
	aivar[AIV_HAS_ERPRESSED] = 5;
	aivar[AIV_BEGGAR] = 10;
	aivar[AIV_OBSERVEINTRUDER] = FALSE;
	start_aistate = ZS_Guard;
};

func void Set_OrcWarrior_Visuals()
{
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyWarrior",DEFAULT,DEFAULT,"Orc_HeadWarrior",DEFAULT,DEFAULT,-1);
};


instance OrcWarrior1(Mst_Default_OrcWarrior)
{
	name[0] = "Ork-Kämpfer";
	level = 25;
	Set_OrcWarrior_Visuals();
	EquipItem(self,ItMw2hOrcAxe01);
};


instance OrcWarrior2(Mst_Default_OrcWarrior)
{
	name[0] = "Ork-Krieger";
	level = 25;
	Set_OrcWarrior_Visuals();
	EquipItem(self,ItMw2hOrcAxe02);

};


instance OrcWarrior3(Mst_Default_OrcWarrior)
{
	name[0] = "Ork-Klankrieger";
	level = 35;
	Set_OrcWarrior_Visuals();
	attribute[ATR_STRENGTH] = 110;
	attribute[ATR_DEXTERITY] = 110;
	attribute[ATR_HITPOINTS_MAX] = 330;
	attribute[ATR_HITPOINTS] = 330;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 90;
	protection[PROT_EDGE] = 90;
	protection[PROT_POINT] = 90;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 90;
	protection[PROT_MAGIC] = 50;
	EquipItem(self,ItMw2hOrcAxe03);
};


instance OrcWarrior4(Mst_Default_OrcWarrior)
{
	name[0] = "Ork-Tempelkrieger";
	level = 35;
	Set_OrcWarrior_Visuals();
	attribute[ATR_STRENGTH] = 110;
	attribute[ATR_DEXTERITY] = 110;
	attribute[ATR_HITPOINTS_MAX] = 330;
	attribute[ATR_HITPOINTS] = 330;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 90;
	protection[PROT_EDGE] = 90;
	protection[PROT_POINT] = 90;
	protection[PROT_FIRE] = 50;
	protection[PROT_FLY] = 90;
	protection[PROT_MAGIC] = 50;
	EquipItem(self,ItMw2hOrcAxe04);
};
