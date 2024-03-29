
prototype Mst_Default_DemonLord(C_Npc)
{
	name[0] = "Dämonenlord";
	guild = GIL_DEMON;
	aivar[AIV_IMPORTANT] = ID_DEMONLORD;
	level = 100;
	attribute[ATR_STRENGTH] = 250;
	attribute[ATR_DEXTERITY] = 250;
	attribute[ATR_HITPOINTS_MAX] = 502;
	attribute[ATR_HITPOINTS] = 502;
	attribute[ATR_MANA_MAX] = 110;
	attribute[ATR_MANA] = 110;
	protection[PROT_BLUNT] = 110;
	protection[PROT_EDGE] = 110;
	protection[PROT_POINT] = 110;
	protection[PROT_FIRE] = 60;
	protection[PROT_FLY] = 110;
	protection[PROT_MAGIC] = 60;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_Demon;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = 4000;
	aivar[AIV_FINDABLE] = HUNTER;
	aivar[AIV_PCISSTRONGER] = 4000;
	aivar[AIV_BEENATTACKED] = 4000;
	aivar[AIV_HIGHWAYMEN] = 3500;
	aivar[AIV_HAS_ERPRESSED] = 0;
	aivar[AIV_BEGGAR] = 10;
	aivar[AIV_OBSERVEINTRUDER] = TRUE;
	start_aistate = ZS_MM_AllScheduler;
};

func void Set_DemonLord_Visuals()
{
	Mdl_SetVisual(self,"Demon.mds");
	Mdl_SetVisualBody(self,"Dem2_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance DemonLord(Mst_Default_DemonLord)
{
	Set_DemonLord_Visuals();
	Npc_SetToFistMode(self);
};

