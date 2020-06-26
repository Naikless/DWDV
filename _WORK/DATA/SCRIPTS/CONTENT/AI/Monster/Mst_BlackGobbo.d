
prototype Mst_Default_BlackGobbo(C_Npc)
{
	name[0] = "Schwarzer Goblin";
	guild = GIL_GOBBO;
	aivar[AIV_MM_REAL_ID] = ID_BLACKGOBBO;
	level = 10;
	attribute[ATR_STRENGTH] = 50;
	attribute[ATR_DEXTERITY] = 50;
	attribute[ATR_HITPOINTS_MAX] = 105;
	attribute[ATR_HITPOINTS] = 105;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 30;
	protection[PROT_EDGE] = 30;
	protection[PROT_POINT] = 30;
	protection[PROT_FIRE] = 0;
	protection[PROT_FLY] = 30;
	protection[PROT_MAGIC] = 0;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_GOBBO;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = 3000;
	aivar[AIV_FINDABLE] = PACKHUNTER;
	aivar[AIV_PCISSTRONGER] = 1500;
	aivar[AIV_BEENATTACKED] = 1200;
	aivar[AIV_HIGHWAYMEN] = 700;
	aivar[AIV_HAS_ERPRESSED] = 4;
	aivar[AIV_BEGGAR] = 10;
	aivar[AIV_OBSERVEINTRUDER] = FALSE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_HASBEENDEFEATEDINPORTALROOM] = OnlyRoutine;	
};


func void Set_BlackGobbo_Visuals()
{
	Mdl_SetVisual(self,"Gobbo.mds");
	Mdl_SetVisualBody(self,"Gob_Body",1,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance BlackGobboMace(Mst_Default_BlackGobbo)
{
	Set_BlackGobbo_Visuals();
	Npc_SetToFightMode(self,ItMw_1H_Nailmace_01);
	attribute[ATR_STRENGTH] = attribute[ATR_STRENGTH] + 35;
};

instance BlackGobboWarrior(Mst_Default_BlackGobbo)
{
	name[0] = "Goblinkrieger";
	level = 12;
	Set_BlackGobbo_Visuals();
	Npc_SetToFightMode(self,ItMw_1H_Mace_01);
	attribute[ATR_STRENGTH] = 60 + 30;
	attribute[ATR_HITPOINTS_MAX] = 115;
	attribute[ATR_HITPOINTS] = 115;
	protection[PROT_BLUNT] = 30;
	protection[PROT_EDGE] = 30;
};
