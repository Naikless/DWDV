
func void smithweapon_s1()
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		self.aivar[AIV_INVINCIBLE] = TRUE;
		PLAYER_MOBSI_PRODUCTION = MOBSI_SMITHWEAPON;
		AI_ProcessInfos(her);
	};
};


instance PC_NOSMITH(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = pc_nosmith_condition;
	information = pc_nosmith_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int pc_nosmith_condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_SMITHWEAPON)
	{
		return TRUE;
	};
};

func void pc_nosmith_info()
{
	CreateInvItems(self,ItMiSwordblade,1);
	AI_StopProcessInfos(self);
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	self.aivar[AIV_INVINCIBLE] = FALSE;
};


instance PC_SMITH_ITMW_1H_SWORD_01(C_Info)
{
	npc = PC_Hero;
	condition = pc_smith_itmw_1h_sword_01_condition;
	information = pc_smith_itmw_1h_sword_01_info;
	important = 0;
	permanent = 1;
	description = "Grobes Schwert (Ben�tigte St�rke 25, Schaden 25)";
};


func int pc_smith_itmw_1h_sword_01_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SMITHWEAPON) && (KNOWS_GROBESSCHWERT == TRUE))
	{
		return TRUE;
	};
};

func void pc_smith_itmw_1h_sword_01_info()
{
	CreateInvItem(hero,itmw_1h_sword_01_smith);
	Npc_RemoveInvItem(hero,ItMiSwordblade);
	PrintScreen("Waffe hergestellt!",-1,-1,"font_old_20_white.tga",1);
	AI_StopProcessInfos(self);
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	self.aivar[AIV_INVINCIBLE] = FALSE;
};


instance PC_SMITH_ITMW_1H_LIGHTGUARDSSWORD_03(C_Info)
{
	npc = PC_Hero;
	condition = pc_smith_itmw_1h_lightguardssword_03_condition;
	information = pc_smith_itmw_1h_lightguardssword_03_info;
	important = 0;
	permanent = 1;
	description = "Leichtes Gardeschwert (Ben�tigte St�rke 30, Schaden 30)";
};


func int pc_smith_itmw_1h_lightguardssword_03_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SMITHWEAPON) && (KNOWS_LEICHTESGARDESCHWERT == TRUE))
	{
		return TRUE;
	};
};

func void pc_smith_itmw_1h_lightguardssword_03_info()
{
	CreateInvItem(hero,itmw_1h_lightguardssword_03_smith);
	Npc_RemoveInvItem(hero,ItMiSwordblade);
	PrintScreen("Waffe hergestellt!",-1,-1,"font_old_20_white.tga",1);
	AI_StopProcessInfos(self);
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	self.aivar[AIV_INVINCIBLE] = FALSE;
};


instance PC_SMITH_ITMW_1H_SWORD_03(C_Info)
{
	npc = PC_Hero;
	condition = pc_smith_itmw_1h_sword_03_condition;
	information = pc_smith_itmw_1h_sword_03_info;
	important = 0;
	permanent = 1;
	description = "Gardeschwert (Ben�tigte St�rke 40, Schaden 40)";
};


func int pc_smith_itmw_1h_sword_03_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SMITHWEAPON) && (KNOWS_GARDESCHWERT == TRUE))
	{
		return TRUE;
	};
};

func void pc_smith_itmw_1h_sword_03_info()
{
	CreateInvItem(hero,itmw_1h_sword_03_smith);
	Npc_RemoveInvItem(hero,ItMiSwordblade);
	PrintScreen("Waffe hergestellt!",-1,-1,"font_old_20_white.tga",1);
	AI_StopProcessInfos(self);
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	self.aivar[AIV_INVINCIBLE] = FALSE;
};


instance PC_SMITH_ITMW_1H_SWORD_BROAD_04(C_Info)
{
	npc = PC_Hero;
	condition = pc_smith_itmw_1h_sword_broad_04_condition;
	information = pc_smith_itmw_1h_sword_broad_04_info;
	important = 0;
	permanent = 1;
	description = "Gardistenhand (Ben�tigte St�rke 75, Schaden 80)";
};


func int pc_smith_itmw_1h_sword_broad_04_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SMITHWEAPON) && (KNOWS_GARDISTENHAND == TRUE))
	{
		return TRUE;
	};
};

func void pc_smith_itmw_1h_sword_broad_04_info()
{
	CreateInvItem(hero,itmw_1h_sword_broad_04_smith);
	Npc_RemoveInvItem(hero,ItMiSwordblade);
	PrintScreen("Waffe hergestellt!",-1,-1,"font_old_20_white.tga",1);
	AI_StopProcessInfos(self);
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	self.aivar[AIV_INVINCIBLE] = FALSE;
};


instance PC_SMITH_ITMW_1H_MACE_01(C_Info)
{
	npc = PC_Hero;
	condition = pc_smith_itmw_1h_mace_01_condition;
	information = pc_smith_itmw_1h_mace_01_info;
	important = 0;
	permanent = 1;
	description = "Streitkolben (Ben�tigte St�rke 25, Schaden 30)";
};


func int pc_smith_itmw_1h_mace_01_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SMITHWEAPON) && (KNOWS_STREITKOLBEN == TRUE))
	{
		return TRUE;
	};
};

func void pc_smith_itmw_1h_mace_01_info()
{
	CreateInvItem(hero,itmw_1h_mace_01_smith);
	Npc_RemoveInvItem(hero,ItMiSwordblade);
	PrintScreen("Waffe hergestellt!",-1,-1,"font_old_20_white.tga",1);
	AI_StopProcessInfos(self);
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	self.aivar[AIV_INVINCIBLE] = FALSE;
};


instance PC_SMITH_ITMW_1H_MACE_04(C_Info)
{
	npc = PC_Hero;
	condition = pc_smith_itmw_1h_mace_04_condition;
	information = pc_smith_itmw_1h_mace_04_info;
	important = 0;
	permanent = 1;
	description = "Stahlzunge (Ben�tigte St�rke 32, Schaden 38)";
};


func int pc_smith_itmw_1h_mace_04_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SMITHWEAPON) && (KNOWS_STAHLZUNGE == TRUE))
	{
		return TRUE;
	};
};

func void pc_smith_itmw_1h_mace_04_info()
{
	CreateInvItem(hero,itmw_1h_mace_04_smith);
	Npc_RemoveInvItem(hero,ItMiSwordblade);
	PrintScreen("Waffe hergestellt!",-1,-1,"font_old_20_white.tga",1);
	AI_StopProcessInfos(self);
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	self.aivar[AIV_INVINCIBLE] = FALSE;
};


instance PC_SMITH_ITMW_1H_SWORD_05(C_Info)
{
	npc = PC_Hero;
	condition = pc_smith_itmw_1h_sword_05_condition;
	information = pc_smith_itmw_1h_sword_05_info;
	important = 0;
	permanent = 1;
	description = "Kriegsschwert (Ben�tigte St�rke 42, Schaden 42)";
};


func int pc_smith_itmw_1h_sword_05_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SMITHWEAPON) && (KNOWS_KRIEGSSCHWERT == TRUE))
	{
		return TRUE;
	};
};

func void pc_smith_itmw_1h_sword_05_info()
{
	CreateInvItem(hero,itmw_1h_sword_05_smith);
	Npc_RemoveInvItem(hero,ItMiSwordblade);
	PrintScreen("Waffe hergestellt!",-1,-1,"font_old_20_white.tga",1);
	AI_StopProcessInfos(self);
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	self.aivar[AIV_INVINCIBLE] = FALSE;
};


instance PC_SMITH_ITMW_2H_SWORD_LIGHT_01(C_Info)
{
	npc = PC_Hero;
	condition = pc_smith_itmw_2h_sword_light_01_condition;
	information = pc_smith_itmw_2h_sword_light_01_info;
	important = 0;
	permanent = 1;
	description = "Leichter Zweih�nder (Ben�tigte St�rke 65, Schaden 65)";
};


func int pc_smith_itmw_2h_sword_light_01_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SMITHWEAPON) && (KNOWS_LEICHTER2H == TRUE))
	{
		return TRUE;
	};
};

func void pc_smith_itmw_2h_sword_light_01_info()
{
	CreateInvItem(hero,itmw_2h_sword_light_01_smith);
	Npc_RemoveInvItem(hero,ItMiSwordblade);
	PrintScreen("Waffe hergestellt!",-1,-1,"font_old_20_white.tga",1);
	AI_StopProcessInfos(self);
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	self.aivar[AIV_INVINCIBLE] = FALSE;
};


instance PC_SMITH_ITMW_2H_SWORD_LIGHT_02(C_Info)
{
	npc = PC_Hero;
	condition = pc_smith_itmw_2h_sword_light_02_condition;
	information = pc_smith_itmw_2h_sword_light_02_info;
	important = 0;
	permanent = 1;
	description = "H�terklinge (Ben�tigte St�rke 70, Schaden 70)";
};


func int pc_smith_itmw_2h_sword_light_02_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SMITHWEAPON) && (KNOWS_H�TERKLINGE == TRUE))
	{
		return TRUE;
	};
};

func void pc_smith_itmw_2h_sword_light_02_info()
{
	CreateInvItem(hero,itmw_2h_sword_light_02_smith);
	Npc_RemoveInvItem(hero,ItMiSwordblade);
	PrintScreen("Waffe hergestellt!",-1,-1,"font_old_20_white.tga",1);
	AI_StopProcessInfos(self);
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	self.aivar[AIV_INVINCIBLE] = FALSE;
};


instance PC_SMITH_ITMW_2H_SWORD_LIGHT_04(C_Info)
{
	npc = PC_Hero;
	condition = pc_smith_itmw_2h_sword_light_04_condition;
	information = pc_smith_itmw_2h_sword_light_04_info;
	important = 0;
	permanent = 1;
	description = "K�nigsklinge (Ben�tigte St�rke 75, Schaden 75)";
};


func int pc_smith_itmw_2h_sword_light_04_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SMITHWEAPON) && (KNOWS_K�NIGSKLINGE == TRUE))
	{
		return TRUE;
	};
};

func void pc_smith_itmw_2h_sword_light_04_info()
{
	CreateInvItem(hero,itmw_2h_sword_light_04_smith);
	Npc_RemoveInvItem(hero,ItMiSwordblade);
	PrintScreen("Waffe hergestellt!",-1,-1,"font_old_20_white.tga",1);
	AI_StopProcessInfos(self);
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	self.aivar[AIV_INVINCIBLE] = FALSE;
};


instance PC_SMITH_ROTER_WIND(C_Info)
{
	npc = PC_Hero;
	condition = pc_smith_roter_wind_condition;
	information = pc_smith_roter_wind_info;
	important = 0;
	permanent = 1;
	description = "Roter Wind (Ben�tigte St�rke 100, Schaden 105)";
};


func int pc_smith_roter_wind_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SMITHWEAPON) && (KNOWS_ROTER_WIND == TRUE))
	{
		return TRUE;
	};
};

func void pc_smith_roter_wind_info()
{
	CreateInvItem(hero,roter_wind_smith);
	Npc_RemoveInvItem(hero,ItMiSwordblade);
	PrintScreen("Waffe hergestellt!",-1,-1,"font_old_20_white.tga",1);
	AI_StopProcessInfos(self);
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	self.aivar[AIV_INVINCIBLE] = FALSE;
};


instance PC_SMITH_ITMW_1H_MACE_WAR_01(C_Info)
{
	npc = PC_Hero;
	condition = pc_smith_itmw_1h_mace_war_01_condition;
	information = pc_smith_itmw_1h_mace_war_01_info;
	important = 0;
	permanent = 1;
	description = "Morgenstern (Ben�tigte St�rke 35, Schaden 40)";
};


func int pc_smith_itmw_1h_mace_war_01_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SMITHWEAPON) && (KNOWS_AXT == TRUE))
	{
		return TRUE;
	};
};

func void pc_smith_itmw_1h_mace_war_01_info()
{
	CreateInvItem(hero,itmw_1h_mace_war_01_smith);
	Npc_RemoveInvItem(hero,ItMiSwordblade);
	PrintScreen("Waffe hergestellt!",-1,-1,"font_old_20_white.tga",1);
	AI_StopProcessInfos(self);
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	self.aivar[AIV_INVINCIBLE] = FALSE;
};


instance PC_SMITH_ITMW_1H_WAR_02(C_Info)
{
	npc = PC_Hero;
	condition = pc_smith_itmw_1h_war_02_condition;
	information = pc_smith_itmw_1h_war_02_info;
	important = 0;
	permanent = 1;
	description = "Stahlgeflecht (Ben�tigte St�rke 36, Schaden 41)";
};


func int pc_smith_itmw_1h_war_02_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SMITHWEAPON) && (KNOWS_STAHLGEFLECHT == TRUE))
	{
		return TRUE;
	};
};

func void pc_smith_itmw_1h_war_02_info()
{
	CreateInvItem(hero,itmw_1h_mace_war_02_smith);
	Npc_RemoveInvItem(hero,ItMiSwordblade);
	PrintScreen("Waffe hergestellt!",-1,-1,"font_old_20_white.tga",1);
	AI_StopProcessInfos(self);
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	self.aivar[AIV_INVINCIBLE] = FALSE;
};


instance PC_SMITH_ITMW_1H_WAR_03(C_Info)
{
	npc = PC_Hero;
	condition = pc_smith_itmw_1h_war_03_condition;
	information = pc_smith_itmw_1h_war_03_info;
	important = 0;
	permanent = 1;
	description = "Steinbrecher (Ben�tigte St�rke 37, Schaden 42)";
};


func int pc_smith_itmw_1h_war_03_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SMITHWEAPON) && (KNOWS_STEINBRECHER == TRUE))
	{
		return TRUE;
	};
};

func void pc_smith_itmw_1h_war_03_info()
{
	CreateInvItem(hero,itmw_1h_mace_war_03_smith);
	Npc_RemoveInvItem(hero,ItMiSwordblade);
	PrintScreen("Waffe hergestellt!",-1,-1,"font_old_20_white.tga",1);
	AI_StopProcessInfos(self);
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	self.aivar[AIV_INVINCIBLE] = FALSE;
};


instance PC_SMITH_ITMW_2H_SWORD_LIGHT_03(C_Info)
{
	npc = PC_Hero;
	condition = pc_smith_itmw_2h_sword_light_03_condition;
	information = pc_smith_itmw_2h_sword_light_03_info;
	important = 0;
	permanent = 1;
	description = "Leichte Streitaxt (Ben�tigte St�rke 70, Schaden 80)";
};


func int pc_smith_itmw_2h_sword_light_03_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SMITHWEAPON) && (KNOWS_S�LDNERKLINGE == TRUE))
	{
		return TRUE;
	};
};

func void pc_smith_itmw_2h_sword_light_03_info()
{
	CreateInvItem(hero,itmw_2h_axe_light_01_smith);
	Npc_RemoveInvItem(hero,ItMiSwordblade);
	PrintScreen("Waffe hergestellt!",-1,-1,"font_old_20_white.tga",1);
	AI_StopProcessInfos(self);
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	self.aivar[AIV_INVINCIBLE] = FALSE;
};


instance PC_SMITH_ITMW_2H_SWORD_01(C_Info)
{
	npc = PC_Hero;
	condition = pc_smith_itmw_2h_sword_01_condition;
	information = pc_smith_itmw_2h_sword_01_info;
	important = 0;
	permanent = 1;
	description = "Streitaxt (Ben�tigte St�rke 80, Schaden 90)";
};


func int pc_smith_itmw_2h_sword_01_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SMITHWEAPON) && (KNOWS_ZWEIH�NDER == TRUE))
	{
		return TRUE;
	};
};

func void pc_smith_itmw_2h_sword_01_info()
{
	CreateInvItem(hero,itmw_2h_axe_heavy_01_smith);
	Npc_RemoveInvItem(hero,ItMiSwordblade);
	PrintScreen("Waffe hergestellt!",-1,-1,"font_old_20_white.tga",1);
	AI_StopProcessInfos(self);
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	self.aivar[AIV_INVINCIBLE] = FALSE;
};


instance PC_SMITH_ITMW_2H_SWORD_HEAVY_02(C_Info)
{
	npc = PC_Hero;
	condition = pc_smith_itmw_2h_sword_heavy_02_condition;
	information = pc_smith_itmw_2h_sword_heavy_02_info;
	important = 0;
	permanent = 1;
	description = "Kriegerstimme (Ben�tigte St�rke 90, Schaden 100)";
};


func int pc_smith_itmw_2h_sword_heavy_02_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SMITHWEAPON) && (KNOWS_ZORNSTAHL == TRUE))
	{
		return TRUE;
	};
};

func void pc_smith_itmw_2h_sword_heavy_02_info()
{
	CreateInvItem(hero,itmw_2h_axe_heavy_02_smith);
	Npc_RemoveInvItem(hero,ItMiSwordblade);
	PrintScreen("Waffe hergestellt!",-1,-1,"font_old_20_white.tga",1);
	AI_StopProcessInfos(self);
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	self.aivar[AIV_INVINCIBLE] = FALSE;
};

