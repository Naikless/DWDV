
prototype Mst_Default_Golem(C_Npc)
{
	name[0] = "Golem";
	guild = GIL_GOLEM;
	level = 18;
	attribute[ATR_STRENGTH] = 130;
	attribute[ATR_DEXTERITY] = 130;
	attribute[ATR_HITPOINTS_MAX] = 286;
	attribute[ATR_HITPOINTS] = 286;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 75;
	protection[PROT_EDGE] = 145;
	protection[PROT_POINT] = 9999;
	protection[PROT_FIRE] = 9999;
	protection[PROT_FLY] = 9999;
	protection[PROT_MAGIC] = 9999;
	damagetype = DAM_FLY;
	fight_tactic = FAI_GOLEM;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = 2000;
	aivar[AIV_FINDABLE] = PASSIVE;
	aivar[AIV_PCISSTRONGER] = 1500;
	aivar[AIV_BEENATTACKED] = 1500;
	aivar[AIV_HIGHWAYMEN] = 1500;
	aivar[AIV_HAS_ERPRESSED] = 0;
	aivar[AIV_BEGGAR] = 5;
	aivar[AIV_OBSERVEINTRUDER] = TRUE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_HASBEENDEFEATEDINPORTALROOM] = OnlyRoutine;
};

func void Set_StoneGolem_Visuals()
{
	Mdl_SetVisual(self,"Golem.mds");
	Mdl_SetVisualBody(self,"Gol_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

func void Set_FireGolem_Visuals()
{
	Mdl_SetVisual(self,"Golem.mds");
	Mdl_ApplyOverlayMds(self,"Golem_Firegolem.mds");
	Mdl_SetVisualBody(self,"Gol_Fire_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

func void Set_IceGolem_Visuals()
{
	Mdl_SetVisual(self,"Golem.mds");
	Mdl_ApplyOverlayMds(self,"Golem_Icegolem.mds");
	Mdl_SetVisualBody(self,"Gol_Ice_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance StoneGolem(Mst_Default_Golem)
{
	name[0] = "Steingolem";
	aivar[AIV_IMPORTANT] = id_stonegolem;
	protection[PROT_BLUNT] = 75;
	Set_StoneGolem_Visuals();
	CreateInvItem(self,ItAt_StoneGolem_01);
	Npc_SetToFistMode(self);
};

instance SummonedByPC_StoneGolem(Mst_Default_Golem)
{
	name[0] = "Golem";
	aivar[AIV_IMPORTANT] = ID_STONEGOLEM;
	Set_StoneGolem_Visuals();
	Npc_SetToFistMode(self);
	level = 0;
	protection[PROT_EDGE] = 100;
	protection[PROT_BLUNT] = 75;
	senses = SENSE_HEAR | SENSE_SEE;
	start_aistate = ZS_MM_SummonedByPC;
	aivar[AIV_HASDEFEATEDSC] = 400;
	aivar[AIV_ISLOOKING] = 2;
	aivar[AIV_MOVINGMOB] = TRUE;
};

instance SummonedByNPC_StoneGolem(Mst_Default_Golem)
{
	name[0] = "Stein Golem";
	aivar[AIV_IMPORTANT] = ID_STONEGOLEM;
	Set_StoneGolem_Visuals();
	Npc_SetToFistMode(self);
	protection[PROT_BLUNT] = 75;
	start_aistate = ZS_MM_Summoned;
};

instance FireGolem(Mst_Default_Golem)
{
	name[0] = "Feuer Golem";
	aivar[AIV_IMPORTANT] = id_firegolem;
	Set_FireGolem_Visuals();
	Npc_SetToFistMode(self);
	attribute[ATR_STRENGTH] = 110;
	protection[PROT_BLUNT] = 75;
	protection[PROT_EDGE] = 145;
	protection[PROT_POINT] = 9999;
	protection[PROT_FIRE] = 9999;
	protection[PROT_FLY] = 9999;
	protection[PROT_MAGIC] = 0;
	attribute[ATR_HITPOINTS_MAX] = 150;
	attribute[ATR_HITPOINTS] = 150;
	damagetype = DAM_FIRE;
	level = 30;
	CreateInvItem(self,ItAt_FireGolem_01);
};

instance IceGolem(Mst_Default_Golem)
{
	name[0] = "Eis Golem";
	aivar[AIV_IMPORTANT] = id_icegolem;
	Set_IceGolem_Visuals();
	attribute[ATR_MANA_MAX] = 500;
	attribute[ATR_MANA] = 500;
	attribute[ATR_HITPOINTS_MAX] = 150;
	attribute[ATR_HITPOINTS] = 150;
	protection[PROT_BLUNT] = 75;
	protection[PROT_EDGE] = 145;
	protection[PROT_POINT] = 9999;
	protection[PROT_FIRE] = 0;
	protection[PROT_FLY] = 9999;
	protection[PROT_MAGIC] = 9999;
	damagetype = DAM_BLUNT;
	level = 24;
	CreateInvItem(self,ItAt_IceGolem_01);
	fight_tactic = FAI_HUMAN_MAGE;
};

instance Bridgegolem(Mst_Default_Golem)
{
	name[0] = "Br�cken Golem";
	level = 50;
	Set_StoneGolem_Visuals();
	Npc_SetToFistMode(self);
	attribute[ATR_STRENGTH] = 100;
	attribute[ATR_DEXTERITY] = 100;
	attribute[ATR_HITPOINTS_MAX] = 250;
	attribute[ATR_HITPOINTS] = 250;
	protection[PROT_BLUNT] = 50;
	protection[PROT_EDGE] = 145;
	protection[PROT_POINT] = 9999;
	protection[PROT_FIRE] = 9999;
	protection[PROT_FLY] = 9999;
	protection[PROT_MAGIC] = 9999;
};

