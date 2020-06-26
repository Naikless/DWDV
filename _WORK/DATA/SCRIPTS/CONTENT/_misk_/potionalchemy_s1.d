
func void potionalchemy_s1()
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		self.aivar[AIV_INVINCIBLE] = TRUE;
		PLAYER_MOBSI_PRODUCTION = MOBSI_POTIONALCHEMY;
		AI_ProcessInfos(her);
	};
};


instance PC_NOALCHEMY(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = pc_noalchemy_condition;
	information = pc_noalchemy_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int pc_noalchemy_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONALCHEMY) && (MANASTART == FALSE) && (HEALTHSTART == FALSE) && (BOOZESTART == FALSE) && (SPECIALSTART == FALSE))
	{
		return TRUE;
	};
};

func void pc_noalchemy_info()
{
	AI_StopProcessInfos(self);
	self.aivar[AIV_INVINCIBLE] = FALSE;
	CreateInvItems(hero,ItMiFlask,1);
	HEALTHSTART = FALSE;
	MANASTART = FALSE;
	SPECIALSTART = FALSE;
	BOOZESTART = FALSE;
};


instance PC_HEALTH_START(C_Info)
{
	npc = PC_Hero;
	nr = 6;
	condition = pc_health_start_condition;
	information = pc_health_start_info;
	permanent = TRUE;
	description = "Heiltränke brauen";
};


func int pc_health_start_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONALCHEMY) && (MANASTART == FALSE) && (HEALTHSTART == FALSE) && (BOOZESTART == FALSE) && (SPECIALSTART == FALSE))
	{
		return TRUE;
	};
};

func void pc_health_start_info()
{
	HEALTHSTART = TRUE;
};


instance PC_HEALTH_STOP(C_Info)
{
	npc = PC_Hero;
	nr = 99;
	condition = pc_health_stop_condition;
	information = pc_health_stop_info;
	permanent = TRUE;
	description = DIALOG_BACK;
};


func int pc_health_stop_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONALCHEMY) && (HEALTHSTART == TRUE))
	{
		return TRUE;
	};
};

func void pc_health_stop_info()
{
	HEALTHSTART = FALSE;
};


instance PC_HEAL1(C_Info)
{
	npc = PC_Hero;
	condition = pc_heal1_condition;
	information = pc_heal1_info;
	permanent = 1;
	description = "Essenz heilender Kraft";
};


func int pc_heal1_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONALCHEMY) && (HEALTHSTART == TRUE) && (KNOWS_HEILESSENZ == TRUE))
	{
		return TRUE;
	};
};

func void pc_heal1_info()
{
	if((Npc_HasItems(hero,ItFo_Potion_Water_01) >= 1) && (Npc_HasItems(hero,ItFo_Plants_Herb_01) >= 1))
	{
		Npc_RemoveInvItems(hero,ItFo_Potion_Water_01,1);
		Npc_RemoveInvItems(hero,ItFo_Plants_Herb_01,1);
		CreateInvItems(hero,ItFo_Potion_Health_01,1);
		PrintScreen("Essenz heilender Kraft hergestellt!",-1,-1,"font_old_20_white.tga",1);
	}
	else
	{
		PrintScreen("Nicht genügend Zutaten!",-1,-1,"font_old_20_white.tga",1);
		AI_StopProcessInfos(self);
		PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
		self.aivar[AIV_INVINCIBLE] = FALSE;
	};
};


instance PC_HEAL2(C_Info)
{
	npc = PC_Hero;
	condition = pc_heal2_condition;
	information = pc_heal2_info;
	permanent = 1;
	description = "Extrakt heilender Kraft";
};


func int pc_heal2_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONALCHEMY) && (HEALTHSTART == TRUE) && (KNOWS_HEILEXTRAKT == TRUE))
	{
		return TRUE;
	};
};

func void pc_heal2_info()
{
	if((Npc_HasItems(hero,ItFo_Potion_Water_01) >= 1) && (Npc_HasItems(hero,ItFo_Plants_Herb_01) >= 2) && (Npc_HasItems(hero,ItFo_Plants_Herb_02) >= 1))
	{
		Npc_RemoveInvItems(hero,ItFo_Potion_Water_01,1);
		Npc_RemoveInvItems(hero,ItFo_Plants_Herb_01,2);
		Npc_RemoveInvItems(hero,ItFo_Plants_Herb_02,1);
		CreateInvItems(hero,ItFo_Potion_Health_02,1);
		PrintScreen("Extrakt heilender Kraft hergestellt!",-1,-1,"font_old_20_white.tga",1);
	}
	else
	{
		PrintScreen("Nicht genügend Zutaten!",-1,-1,"font_old_20_white.tga",1);
		AI_StopProcessInfos(self);
		PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
		self.aivar[AIV_INVINCIBLE] = FALSE;
	};
};


instance PC_HEAL3(C_Info)
{
	npc = PC_Hero;
	condition = pc_heal3_condition;
	information = pc_heal3_info;
	permanent = 1;
	description = "Elixier heilender Kraft";
};


func int pc_heal3_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONALCHEMY) && (HEALTHSTART == TRUE) && (KNOWS_HEILELIXIER == TRUE))
	{
		return TRUE;
	};
};

func void pc_heal3_info()
{
	if((Npc_HasItems(hero,ItFo_Potion_Water_01) >= 1) && (Npc_HasItems(hero,ItFo_Plants_Herb_02) >= 2) && (Npc_HasItems(hero,ItFo_Plants_Herb_03) >= 1))
	{
		Npc_RemoveInvItems(hero,ItFo_Potion_Water_01,1);
		Npc_RemoveInvItems(hero,ItFo_Plants_Herb_02,2);
		Npc_RemoveInvItems(hero,ItFo_Plants_Herb_03,1);
		CreateInvItems(hero,ItFo_Potion_Health_02,1);
		PrintScreen("Elixier heilender Kraft hergestellt!",-1,-1,"font_old_20_white.tga",1);
	}
	else
	{
		PrintScreen("Nicht genügend Zutaten!",-1,-1,"font_old_20_white.tga",1);
		AI_StopProcessInfos(self);
		PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
		self.aivar[AIV_INVINCIBLE] = FALSE;
	};
};


instance PC_MANA_START(C_Info)
{
	npc = PC_Hero;
	nr = 6;
	condition = pc_mana_start_condition;
	information = pc_mana_start_info;
	permanent = TRUE;
	description = "Manatränke brauen";
};


func int pc_mana_start_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONALCHEMY) && (MANASTART == FALSE) && (HEALTHSTART == FALSE) && (BOOZESTART == FALSE) && (SPECIALSTART == FALSE))
	{
		return TRUE;
	};
};

func void pc_mana_start_info()
{
	MANASTART = TRUE;
};


instance PC_MANA_STOP(C_Info)
{
	npc = PC_Hero;
	nr = 99;
	condition = pc_mana_stop_condition;
	information = pc_mana_stop_info;
	permanent = TRUE;
	description = DIALOG_BACK;
};


func int pc_mana_stop_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONALCHEMY) && (MANASTART == TRUE))
	{
		return TRUE;
	};
};

func void pc_mana_stop_info()
{
	MANASTART = FALSE;
};


instance PC_MANA1(C_Info)
{
	npc = PC_Hero;
	condition = pc_mana1_condition;
	information = pc_mana1_info;
	permanent = 1;
	description = "Essenz magischer Energie";
};


func int pc_mana1_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONALCHEMY) && (MANASTART == TRUE) && (KNOWS_MANAESSENZ == TRUE))
	{
		return TRUE;
	};
};

func void pc_mana1_info()
{
	if((Npc_HasItems(hero,ItMi_Alchemy_Alcohol_01) >= 1) && (Npc_HasItems(hero,ItFo_Plants_RavenHerb_01) >= 1))
	{
		Npc_RemoveInvItems(hero,ItMi_Alchemy_Alcohol_01,1);
		Npc_RemoveInvItems(hero,ItFo_Plants_RavenHerb_01,1);
		CreateInvItems(hero,ItFo_Potion_Mana_01,1);
		PrintScreen("Essenz magischer Energie hergestellt!",-1,-1,"font_old_20_white.tga",1);
	}
	else
	{
		PrintScreen("Nicht genügend Zutaten!",-1,-1,"font_old_20_white.tga",1);
		AI_StopProcessInfos(self);
		PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
		self.aivar[AIV_INVINCIBLE] = FALSE;
	};
};


instance PC_MANA2(C_Info)
{
	npc = PC_Hero;
	condition = pc_mana2_condition;
	information = pc_mana2_info;
	permanent = 1;
	description = "Extrakt magischer Energie";
};


func int pc_mana2_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONALCHEMY) && (MANASTART == TRUE) && (KNOWS_MANAEXTRAKT == TRUE))
	{
		return TRUE;
	};
};

func void pc_mana2_info()
{
	if((Npc_HasItems(hero,ItMi_Alchemy_Alcohol_01) >= 1) && (Npc_HasItems(hero,ItFo_Plants_RavenHerb_01) >= 2) && (Npc_HasItems(hero,ItFo_Plants_RavenHerb_02) >= 1))
	{
		Npc_RemoveInvItems(hero,ItMi_Alchemy_Alcohol_01,1);
		Npc_RemoveInvItems(hero,ItFo_Plants_RavenHerb_01,2);
		Npc_RemoveInvItems(hero,ItFo_Plants_RavenHerb_02,1);
		CreateInvItems(hero,ItFo_Potion_Mana_02,1);
		PrintScreen("Extrakt magischer Energie hergestellt!",-1,-1,"font_old_20_white.tga",1);
	}
	else
	{
		PrintScreen("Nicht genügend Zutaten!",-1,-1,"font_old_20_white.tga",1);
		AI_StopProcessInfos(self);
		PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
		self.aivar[AIV_INVINCIBLE] = FALSE;
	};
};


instance PC_MANA3(C_Info)
{
	npc = PC_Hero;
	condition = pc_mana3_condition;
	information = pc_mana3_info;
	permanent = 1;
	description = "Elixier magischer Energie";
};


func int pc_mana3_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONALCHEMY) && (MANASTART == TRUE) && (KNOWS_MANAELIXIER == TRUE))
	{
		return TRUE;
	};
};

func void pc_mana3_info()
{
	if((Npc_HasItems(hero,ItMi_Alchemy_Alcohol_01) >= 1) && (Npc_HasItems(hero,ItFo_Plants_RavenHerb_02) >= 2))
	{
		Npc_RemoveInvItems(hero,ItMi_Alchemy_Alcohol_01,1);
		Npc_RemoveInvItems(hero,ItFo_Plants_RavenHerb_02,2);
		CreateInvItems(hero,ItFo_Potion_Mana_02,1);
		PrintScreen("Elixier magischer Energie hergestellt!",-1,-1,"font_old_20_white.tga",1);
	}
	else
	{
		PrintScreen("Nicht genügend Zutaten!",-1,-1,"font_old_20_white.tga",1);
		AI_StopProcessInfos(self);
		PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
		self.aivar[AIV_INVINCIBLE] = FALSE;
	};
};


instance PC_SPECIAL_START(C_Info)
{
	npc = PC_Hero;
	nr = 6;
	condition = pc_special_start_condition;
	information = pc_special_start_info;
	permanent = TRUE;
	description = "Spezielle Tränke brauen";
};


func int pc_special_start_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONALCHEMY) && (MANASTART == FALSE) && (HEALTHSTART == FALSE) && (BOOZESTART == FALSE) && (SPECIALSTART == FALSE))
	{
		return TRUE;
	};
};

func void pc_special_start_info()
{
	SPECIALSTART = TRUE;
};


instance PC_SPECIAL_STOP(C_Info)
{
	npc = PC_Hero;
	nr = 99;
	condition = pc_special_stop_condition;
	information = pc_special_stop_info;
	permanent = TRUE;
	description = DIALOG_BACK;
};


func int pc_special_stop_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONALCHEMY) && (SPECIALSTART == TRUE))
	{
		return TRUE;
	};
};

func void pc_special_stop_info()
{
	SPECIALSTART = FALSE;
};


instance PC_CRAWLER(C_Info)
{
	npc = PC_Hero;
	condition = pc_crawler_condition;
	information = pc_crawler_info;
	permanent = 1;
	description = "Crawler Elixier";
};


func int pc_crawler_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONALCHEMY) && (SPECIALSTART == TRUE) && (KNOWS_PSICRAWLER == TRUE))
	{
		return TRUE;
	};
};

func void pc_crawler_info()
{
	if((Npc_HasItems(hero,ItFo_Potion_Water_01) >= 1) && (Npc_HasItems(hero,ItAt_Crawler_01) >= 4) && (Npc_HasItems(hero,ItMi_Plants_Swampherb_01) >= 4))
	{
		Npc_RemoveInvItems(hero,ItFo_Potion_Water_01,1);
		Npc_RemoveInvItems(hero,ItAt_Crawler_01,4);
		Npc_RemoveInvItems(hero,ItMi_Plants_Swampherb_01,4);
		CreateInvItems(hero,ItFo_Potion_Elixier_Egg,1);
		PrintScreen("Crawler Elixier hergestellt!",-1,-1,"font_old_20_white.tga",1);
	}
	else
	{
		PrintScreen("Nicht genügend Zutaten!",-1,-1,"font_old_20_white.tga",1);
		AI_StopProcessInfos(self);
		PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
		self.aivar[AIV_INVINCIBLE] = FALSE;
	};
};


instance PC_ELIXIER(C_Info)
{
	npc = PC_Hero;
	condition = pc_elixier_condition;
	information = pc_elixier_info;
	permanent = 1;
	description = "Elixier";
};


func int pc_elixier_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONALCHEMY) && (SPECIALSTART == TRUE) && (KNOWS_PSIELIXIER == TRUE))
	{
		return TRUE;
	};
};

func void pc_elixier_info()
{
	if((Npc_HasItems(hero,ItFo_Potion_Water_01) >= 1) && (Npc_HasItems(hero,ItAt_Bloodfly_02) >= 1) && (Npc_HasItems(hero,ItMi_Plants_Swampherb_01) >= 2))
	{
		Npc_RemoveInvItems(hero,ItFo_Potion_Water_01,1);
		Npc_RemoveInvItems(hero,ItAt_Bloodfly_02,1);
		Npc_RemoveInvItems(hero,ItMi_Plants_Swampherb_01,2);
		CreateInvItems(hero,ItFo_Potion_Elixier,1);
		PrintScreen("Elixier hergestellt!",-1,-1,"font_old_20_white.tga",1);
	}
	else
	{
		PrintScreen("Nicht genügend Zutaten!",-1,-1,"font_old_20_white.tga",1);
		AI_StopProcessInfos(self);
		PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
		self.aivar[AIV_INVINCIBLE] = FALSE;
	};
};


instance PC_HASTE1(C_Info)
{
	npc = PC_Hero;
	condition = pc_haste1_condition;
	information = pc_haste1_info;
	permanent = 1;
	description = "Trank der Geschwindigkeit";
};


func int pc_haste1_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONALCHEMY) && (SPECIALSTART == TRUE) && (KNOWS_HASTEGESCHWINDIGKEIT == TRUE))
	{
		return TRUE;
	};
};

func void pc_haste1_info()
{
	if((Npc_HasItems(hero,ItFo_Potion_Water_01) >= 1) && (Npc_HasItems(hero,ItFo_Plants_Seraphis_01) >= 1))
	{
		Npc_RemoveInvItems(hero,ItFo_Potion_Water_01,1);
		Npc_RemoveInvItems(hero,ItFo_Plants_Seraphis_01,1);
		CreateInvItems(hero,ItFo_Potion_Haste_01,1);
		PrintScreen("Trank der Geschwindigkeit hergestellt!",-1,-1,"font_old_20_white.tga",1);
	}
	else
	{
		PrintScreen("Nicht genügend Zutaten!",-1,-1,"font_old_20_white.tga",1);
		AI_StopProcessInfos(self);
		PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
		self.aivar[AIV_INVINCIBLE] = FALSE;
	};
};


instance PC_HASTE2(C_Info)
{
	npc = PC_Hero;
	condition = pc_haste2_condition;
	information = pc_haste2_info;
	permanent = 1;
	description = "Trank der Schnelligkeit";
};


func int pc_haste2_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONALCHEMY) && (SPECIALSTART == TRUE) && (KNOWS_HASTESCHNELLIGKEIT == TRUE))
	{
		return TRUE;
	};
};

func void pc_haste2_info()
{
	if((Npc_HasItems(hero,ItFo_Potion_Water_01) >= 1) && (Npc_HasItems(hero,ItFo_Plants_Seraphis_01) >= 2) && (Npc_HasItems(hero,ItFo_Plants_Velayis_01) >= 1))
	{
		Npc_RemoveInvItems(hero,ItFo_Potion_Water_01,1);
		Npc_RemoveInvItems(hero,ItFo_Plants_Seraphis_01,2);
		Npc_RemoveInvItems(hero,ItFo_Plants_Velayis_01,1);
		CreateInvItems(hero,ItFo_Potion_Haste_02,1);
		PrintScreen("Trank der Schnelligkeit hergestellt!",-1,-1,"font_old_20_white.tga",1);
	}
	else
	{
		PrintScreen("Nicht genügend Zutaten!",-1,-1,"font_old_20_white.tga",1);
		AI_StopProcessInfos(self);
		PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
		self.aivar[AIV_INVINCIBLE] = FALSE;
	};
};


instance PC_HASTE3(C_Info)
{
	npc = PC_Hero;
	condition = pc_haste3_condition;
	information = pc_haste3_info;
	permanent = 1;
	description = "Trank der Eile";
};


func int pc_haste3_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONALCHEMY) && (SPECIALSTART == TRUE) && (KNOWS_HASTEEILE == TRUE))
	{
		return TRUE;
	};
};

func void pc_haste3_info()
{
	if((Npc_HasItems(hero,ItFo_Potion_Water_01) >= 1) && (Npc_HasItems(hero,ItFo_Plants_Velayis_01) >= 2))
	{
		Npc_RemoveInvItems(hero,ItFo_Potion_Water_01,1);
		Npc_RemoveInvItems(hero,ItFo_Plants_Velayis_01,2);
		CreateInvItems(hero,ItFo_Potion_Haste_03,1);
		PrintScreen("Trank der Eile hergestellt!",-1,-1,"font_old_20_white.tga",1);
	}
	else
	{
		PrintScreen("Nicht genügend Zutaten!",-1,-1,"font_old_20_white.tga",1);
		AI_StopProcessInfos(self);
		PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
		self.aivar[AIV_INVINCIBLE] = FALSE;
	};
};


instance PC_STR1(C_Info)
{
	npc = PC_Hero;
	condition = pc_str1_condition;
	information = pc_str1_info;
	permanent = 1;
	description = "Essenz der Stärke";
};


func int pc_str1_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONALCHEMY) && (SPECIALSTART == TRUE) && (KNOWS_STRENGTHESSENZ == TRUE))
	{
		return TRUE;
	};
};

func void pc_str1_info()
{
	if((Npc_HasItems(hero,ItFo_Potion_Water_01) >= 1) && (Npc_HasItems(hero,ItFo_Plants_OrcHerb_01) >= 2) && (Npc_HasItems(hero,ItFo_Plants_Trollberrys_01) >= 1))
	{
		Npc_RemoveInvItems(hero,ItFo_Potion_Water_01,1);
		Npc_RemoveInvItems(hero,ItFo_Plants_OrcHerb_01,2);
		Npc_RemoveInvItems(hero,ItFo_Plants_Trollberrys_01,1);
		CreateInvItems(hero,ItFo_Potion_Strength_01,1);
		PrintScreen("Essenz der Stärke hergestellt!",-1,-1,"font_old_20_white.tga",1);
	}
	else
	{
		PrintScreen("Nicht genügend Zutaten!",-1,-1,"font_old_20_white.tga",1);
		AI_StopProcessInfos(self);
		PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
		self.aivar[AIV_INVINCIBLE] = FALSE;
	};
};


instance PC_STR2(C_Info)
{
	npc = PC_Hero;
	condition = pc_str2_condition;
	information = pc_str2_info;
	permanent = 1;
	description = "Extrakt der Stärke";
};


func int pc_str2_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONALCHEMY) && (SPECIALSTART == TRUE) && (KNOWS_STRENGTHEXTRAKT == TRUE))
	{
		return TRUE;
	};
};

func void pc_str2_info()
{
	if((Npc_HasItems(hero,ItFo_Potion_Water_01) >= 1) && (Npc_HasItems(hero,ItFo_Plants_OrcHerb_01) >= 3) && (Npc_HasItems(hero,ItFo_Plants_Trollberrys_01) >= 1))
	{
		Npc_RemoveInvItems(hero,ItFo_Potion_Water_01,1);
		Npc_RemoveInvItems(hero,ItFo_Plants_OrcHerb_01,3);
		Npc_RemoveInvItems(hero,ItFo_Plants_Trollberrys_01,1);
		CreateInvItems(hero,ItFo_Potion_Strength_02,1);
		PrintScreen("Extrakt der Stärke hergestellt!",-1,-1,"font_old_20_white.tga",1);
	}
	else
	{
		PrintScreen("Nicht genügend Zutaten!",-1,-1,"font_old_20_white.tga",1);
		AI_StopProcessInfos(self);
		PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
		self.aivar[AIV_INVINCIBLE] = FALSE;
	};
};


instance PC_STR3(C_Info)
{
	npc = PC_Hero;
	condition = pc_str3_condition;
	information = pc_str3_info;
	permanent = 1;
	description = "Elixier der Stärke";
};


func int pc_str3_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONALCHEMY) && (SPECIALSTART == TRUE) && (KNOWS_STRENGTHELIXIER == TRUE))
	{
		return TRUE;
	};
};

func void pc_str3_info()
{
	if((Npc_HasItems(hero,ItFo_Potion_Water_01) >= 1) && (Npc_HasItems(hero,ItFo_Plants_OrcHerb_01) >= 4) && (Npc_HasItems(hero,ItFo_Plants_Trollberrys_01) >= 1) && (Npc_HasItems(hero,ItFo_Plants_Stoneroot_02) >= 1))
	{
		Npc_RemoveInvItems(hero,ItFo_Potion_Water_01,1);
		Npc_RemoveInvItems(hero,ItFo_Plants_OrcHerb_01,4);
		Npc_RemoveInvItems(hero,ItFo_Plants_Trollberrys_01,1);
		Npc_RemoveInvItems(hero,ItFo_Plants_Stoneroot_02,1);
		CreateInvItems(hero,ItFo_Potion_Strength_03,1);
		PrintScreen("Elixier der Stärke hergestellt!",-1,-1,"font_old_20_white.tga",1);
	}
	else
	{
		PrintScreen("Nicht genügend Zutaten!",-1,-1,"font_old_20_white.tga",1);
		AI_StopProcessInfos(self);
		PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
		self.aivar[AIV_INVINCIBLE] = FALSE;
	};
};


instance PC_HEALPERMA1(C_Info)
{
	npc = PC_Hero;
	condition = pc_healperma1_condition;
	information = pc_healperma1_info;
	permanent = 1;
	description = "Essenz des Lebens";
};


func int pc_healperma1_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONALCHEMY) && (SPECIALSTART == TRUE) && (KNOWS_HEILPERMAESSENZ == TRUE))
	{
		return TRUE;
	};
};

func void pc_healperma1_info()
{
	if((Npc_HasItems(hero,ItFo_Potion_Water_01) >= 1) && (Npc_HasItems(hero,ItFo_Plants_Herb_03) >= 2))
	{
		Npc_RemoveInvItems(hero,ItFo_Potion_Water_01,1);
		Npc_RemoveInvItems(hero,ItFo_Plants_Herb_03,2);
		CreateInvItems(hero,ItFo_Potion_Health_Perma_01,1);
		PrintScreen("Essenz des Lebens hergestellt!",-1,-1,"font_old_20_white.tga",1);
	}
	else
	{
		PrintScreen("Nicht genügend Zutaten!",-1,-1,"font_old_20_white.tga",1);
		AI_StopProcessInfos(self);
		PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
		self.aivar[AIV_INVINCIBLE] = FALSE;
	};
};


instance PC_HEALPERMA2(C_Info)
{
	npc = PC_Hero;
	condition = pc_healperma2_condition;
	information = pc_healperma2_info;
	permanent = 1;
	description = "Extrakt des Lebens";
};


func int pc_healperma2_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONALCHEMY) && (SPECIALSTART == TRUE) && (KNOWS_HEILPERMAEXTRAKT == TRUE))
	{
		return TRUE;
	};
};

func void pc_healperma2_info()
{
	if((Npc_HasItems(hero,ItFo_Potion_Water_01) >= 1) && (Npc_HasItems(hero,ItFo_Plants_Herb_03) >= 2) && (Npc_HasItems(hero,ItFo_Plants_OrcHerb_01) >= 1))
	{
		Npc_RemoveInvItems(hero,ItFo_Potion_Water_01,1);
		Npc_RemoveInvItems(hero,ItFo_Plants_Herb_03,2);
		Npc_RemoveInvItems(hero,ItFo_Plants_OrcHerb_01,1);
		CreateInvItems(hero,ItFo_Potion_Health_Perma_02,1);
		PrintScreen("Extrakt des Lebens hergestellt!",-1,-1,"font_old_20_white.tga",1);
	}
	else
	{
		PrintScreen("Nicht genügend Zutaten!",-1,-1,"font_old_20_white.tga",1);
		AI_StopProcessInfos(self);
		PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
		self.aivar[AIV_INVINCIBLE] = FALSE;
	};
};


instance PC_HEALPERMA3(C_Info)
{
	npc = PC_Hero;
	condition = pc_healperma3_condition;
	information = pc_healperma3_info;
	permanent = 1;
	description = "Elixier des Lebens";
};


func int pc_healperma3_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONALCHEMY) && (SPECIALSTART == TRUE) && (KNOWS_HEILPERMAELIXIER == TRUE))
	{
		return TRUE;
	};
};

func void pc_healperma3_info()
{
	if((Npc_HasItems(hero,ItFo_Potion_Water_01) >= 1) && (Npc_HasItems(hero,ItFo_Plants_Herb_03) >= 3) && (Npc_HasItems(hero,ItFo_Plants_OrcHerb_02) >= 1))
	{
		Npc_RemoveInvItems(hero,ItFo_Potion_Water_01,1);
		Npc_RemoveInvItems(hero,ItFo_Plants_Herb_03,3);
		Npc_RemoveInvItems(hero,ItFo_Plants_OrcHerb_02,1);
		CreateInvItems(hero,ItFo_Potion_Health_Perma_03,1);
		PrintScreen("Elixier des Lebens hergestellt!",-1,-1,"font_old_20_white.tga",1);
	}
	else
	{
		PrintScreen("Nicht genügend Zutaten!",-1,-1,"font_old_20_white.tga",1);
		AI_StopProcessInfos(self);
		PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
		self.aivar[AIV_INVINCIBLE] = FALSE;
	};
};


instance PC_MANAPERMA1(C_Info)
{
	npc = PC_Hero;
	condition = pc_manaperma1_condition;
	information = pc_manaperma1_info;
	permanent = 1;
	description = "Essenz des Geistes";
};


func int pc_manaperma1_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONALCHEMY) && (SPECIALSTART == TRUE) && (KNOWS_MANAPERMAESSENZ == TRUE))
	{
		return TRUE;
	};
};

func void pc_manaperma1_info()
{
	if((Npc_HasItems(hero,ItMi_Alchemy_Alcohol_01) >= 1) && (Npc_HasItems(hero,ItFo_Plants_Nightshadow_01) >= 1) && (Npc_HasItems(hero,ItFo_Plants_RavenHerb_02) >= 2))
	{
		Npc_RemoveInvItems(hero,ItMi_Alchemy_Alcohol_01,1);
		Npc_RemoveInvItems(hero,ItFo_Plants_Nightshadow_01,1);
		Npc_RemoveInvItems(hero,ItFo_Plants_RavenHerb_02,2);
		CreateInvItems(hero,ItFo_Potion_Mana_Perma_01,1);
		PrintScreen("Essenz des Geistes hergestellt!",-1,-1,"font_old_20_white.tga",1);
	}
	else
	{
		PrintScreen("Nicht genügend Zutaten!",-1,-1,"font_old_20_white.tga",1);
		AI_StopProcessInfos(self);
		PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
		self.aivar[AIV_INVINCIBLE] = FALSE;
	};
};


instance PC_MANAPERMA2(C_Info)
{
	npc = PC_Hero;
	condition = pc_manaperma2_condition;
	information = pc_manaperma2_info;
	permanent = 1;
	description = "Extrakt des Geistes";
};


func int pc_manaperma2_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONALCHEMY) && (SPECIALSTART == TRUE) && (KNOWS_MANAPERMAEXTRAKT == TRUE))
	{
		return TRUE;
	};
};

func void pc_manaperma2_info()
{
	if((Npc_HasItems(hero,ItMi_Alchemy_Alcohol_01) >= 1) && (Npc_HasItems(hero,ItFo_Plants_Nightshadow_01) >= 2) && (Npc_HasItems(hero,ItFo_Plants_RavenHerb_02) >= 2))
	{
		Npc_RemoveInvItems(hero,ItMi_Alchemy_Alcohol_01,1);
		Npc_RemoveInvItems(hero,ItFo_Plants_Nightshadow_01,2);
		Npc_RemoveInvItems(hero,ItFo_Plants_RavenHerb_02,2);
		CreateInvItems(hero,ItFo_Potion_Mana_Perma_02,1);
		PrintScreen("Extrakt des Geistes hergestellt!",-1,-1,"font_old_20_white.tga",1);
	}
	else
	{
		PrintScreen("Nicht genügend Zutaten!",-1,-1,"font_old_20_white.tga",1);
		AI_StopProcessInfos(self);
		PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
		self.aivar[AIV_INVINCIBLE] = FALSE;
	};
};


instance PC_MANAPERMA3(C_Info)
{
	npc = PC_Hero;
	condition = pc_manaperma3_condition;
	information = pc_manaperma3_info;
	permanent = 1;
	description = "Elixier des Geistes";
};


func int pc_manaperma3_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONALCHEMY) && (SPECIALSTART == TRUE) && (KNOWS_MANAPERMAELIXIER == TRUE))
	{
		return TRUE;
	};
};

func void pc_manaperma3_info()
{
	if((Npc_HasItems(hero,ItMi_Alchemy_Alcohol_01) >= 1) && (Npc_HasItems(hero,ItFo_Plants_Nightshadow_02) >= 2) && (Npc_HasItems(hero,ItFo_Plants_RavenHerb_02) >= 3))
	{
		Npc_RemoveInvItems(hero,ItMi_Alchemy_Alcohol_01,1);
		Npc_RemoveInvItems(hero,ItFo_Plants_Nightshadow_02,2);
		Npc_RemoveInvItems(hero,ItFo_Plants_RavenHerb_02,3);
		CreateInvItems(hero,ItFo_Potion_Mana_Perma_03,1);
		PrintScreen("Elixier des Geistes hergestellt!",-1,-1,"font_old_20_white.tga",1);
	}
	else
	{
		PrintScreen("Nicht genügend Zutaten!",-1,-1,"font_old_20_white.tga",1);
		AI_StopProcessInfos(self);
		PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
		self.aivar[AIV_INVINCIBLE] = FALSE;
	};
};


instance PC_DEX1(C_Info)
{
	npc = PC_Hero;
	condition = pc_dex1_condition;
	information = pc_dex1_info;
	permanent = 1;
	description = "Essenz der Geschicklichkeit";
};


func int pc_dex1_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONALCHEMY) && (SPECIALSTART == TRUE) && (KNOWS_DEXESSENZ == TRUE))
	{
		return TRUE;
	};
};

func void pc_dex1_info()
{
	if((Npc_HasItems(hero,ItMi_Alchemy_Alcohol_01) >= 1) && (Npc_HasItems(hero,ItFo_Plants_Seraphis_01) >= 2) && (Npc_HasItems(hero,ItFo_Plants_Flameberry_01) >= 1))
	{
		Npc_RemoveInvItems(hero,ItMi_Alchemy_Alcohol_01,1);
		Npc_RemoveInvItems(hero,ItFo_Plants_Seraphis_01,2);
		Npc_RemoveInvItems(hero,ItFo_Plants_Flameberry_01,1);
		CreateInvItems(hero,ItFo_Potion_Dex_01,1);
		PrintScreen("Essenz der Geschicklichkeit hergestellt!",-1,-1,"font_old_20_white.tga",1);
	}
	else
	{
		PrintScreen("Nicht genügend Zutaten!",-1,-1,"font_old_20_white.tga",1);
		AI_StopProcessInfos(self);
		PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
		self.aivar[AIV_INVINCIBLE] = FALSE;
	};
};


instance PC_DEX2(C_Info)
{
	npc = PC_Hero;
	condition = pc_dex2_condition;
	information = pc_dex2_info;
	permanent = 1;
	description = "Extrakt der Geschicklichkeit";
};


func int pc_dex2_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONALCHEMY) && (SPECIALSTART == TRUE) && (KNOWS_DEXEXTRAKT == TRUE))
	{
		return TRUE;
	};
};

func void pc_dex2_info()
{
	if((Npc_HasItems(hero,ItMi_Alchemy_Alcohol_01) >= 1) && (Npc_HasItems(hero,ItFo_Plants_Seraphis_01) >= 3) && (Npc_HasItems(hero,ItFo_Plants_Flameberry_01) >= 1))
	{
		Npc_RemoveInvItems(hero,ItMi_Alchemy_Alcohol_01,1);
		Npc_RemoveInvItems(hero,ItFo_Plants_Seraphis_01,3);
		Npc_RemoveInvItems(hero,ItFo_Plants_Flameberry_01,1);
		CreateInvItems(hero,ItFo_Potion_Dex_02,1);
		PrintScreen("Extrakt der Geschicklichkeit hergestellt!",-1,-1,"font_old_20_white.tga",1);
	}
	else
	{
		PrintScreen("Nicht genügend Zutaten!",-1,-1,"font_old_20_white.tga",1);
		AI_StopProcessInfos(self);
		PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
		self.aivar[AIV_INVINCIBLE] = FALSE;
	};
};


instance PC_DEX3(C_Info)
{
	npc = PC_Hero;
	condition = pc_dex3_condition;
	information = pc_dex3_info;
	permanent = 1;
	description = "Elixier der Geschicklichkeit";
};


func int pc_dex3_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONALCHEMY) && (SPECIALSTART == TRUE) && (KNOWS_DEXELIXIER == TRUE))
	{
		return TRUE;
	};
};

func void pc_dex3_info()
{
	if((Npc_HasItems(hero,ItMi_Alchemy_Alcohol_01) >= 1) && (Npc_HasItems(hero,ItFo_Plants_Seraphis_01) >= 4) && (Npc_HasItems(hero,ItFo_Plants_Flameberry_01) >= 1) && (Npc_HasItems(hero,ItFo_Plants_Velayis_01) >= 1))
	{
		Npc_RemoveInvItems(hero,ItMi_Alchemy_Alcohol_01,1);
		Npc_RemoveInvItems(hero,ItFo_Plants_Seraphis_01,4);
		Npc_RemoveInvItems(hero,ItFo_Plants_Flameberry_01,1);
		Npc_RemoveInvItems(hero,ItFo_Plants_Velayis_01,1);
		CreateInvItems(hero,ItFo_Potion_Dex_03,1);
		PrintScreen("Elixier der Geschicklichkeit hergestellt!",-1,-1,"font_old_20_white.tga",1);
	}
	else
	{
		PrintScreen("Nicht genügend Zutaten!",-1,-1,"font_old_20_white.tga",1);
		AI_StopProcessInfos(self);
		PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
		self.aivar[AIV_INVINCIBLE] = FALSE;
	};
};


instance PC_FORCE1(C_Info)
{
	npc = PC_Hero;
	condition = pc_force1_condition;
	information = pc_force1_info;
	permanent = 1;
	description = "Trank der Macht";
};


func int pc_force1_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONALCHEMY) && (SPECIALSTART == TRUE) && (KNOWS_MASTERMACHT == TRUE))
	{
		return TRUE;
	};
};

func void pc_force1_info()
{
	if((Npc_HasItems(hero,ItMi_Alchemy_Syrianoil_01) >= 1) && (Npc_HasItems(hero,ItFo_Plants_Seraphis_01) >= 2) && (Npc_HasItems(hero,ItFo_Plants_Flameberry_01) >= 1) && (Npc_HasItems(hero,ItFo_Plants_OrcHerb_01) >= 2) && (Npc_HasItems(hero,ItFo_Plants_Trollberrys_01) >= 1))
	{
		Npc_RemoveInvItems(hero,ItMi_Alchemy_Syrianoil_01,1);
		Npc_RemoveInvItems(hero,ItFo_Plants_Seraphis_01,2);
		Npc_RemoveInvItems(hero,ItFo_Plants_Flameberry_01,1);
		Npc_RemoveInvItems(hero,ItFo_Plants_OrcHerb_01,2);
		Npc_RemoveInvItems(hero,ItFo_Plants_Trollberrys_01,1);
		CreateInvItems(hero,ItFo_Potion_Master_01,1);
		PrintScreen("Trank der Macht hergestellt!",-1,-1,"font_old_20_white.tga",1);
	}
	else
	{
		PrintScreen("Nicht genügend Zutaten!",-1,-1,"font_old_20_white.tga",1);
		AI_StopProcessInfos(self);
		PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
		self.aivar[AIV_INVINCIBLE] = FALSE;
	};
};


instance PC_FORCE2(C_Info)
{
	npc = PC_Hero;
	condition = pc_force2_condition;
	information = pc_force2_info;
	permanent = 1;
	description = "Trank der Herrschaft";
};


func int pc_force2_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONALCHEMY) && (SPECIALSTART == TRUE) && (KNOWS_MASTERHERRSCHAFT == TRUE))
	{
		return TRUE;
	};
};

func void pc_force2_info()
{
	if((Npc_HasItems(hero,ItMi_Alchemy_Syrianoil_01) >= 1) && (Npc_HasItems(hero,ItFo_Plants_Velayis_01) >= 3) && (Npc_HasItems(hero,ItFo_Plants_Flameberry_01) >= 1) && (Npc_HasItems(hero,ItFo_Plants_OrcHerb_02) >= 3) && (Npc_HasItems(hero,ItFo_Plants_Trollberrys_01) >= 1))
	{
		Npc_RemoveInvItems(hero,ItMi_Alchemy_Syrianoil_01,1);
		Npc_RemoveInvItems(hero,ItFo_Plants_Velayis_01,3);
		Npc_RemoveInvItems(hero,ItFo_Plants_Flameberry_01,1);
		Npc_RemoveInvItems(hero,ItFo_Plants_OrcHerb_02,3);
		Npc_RemoveInvItems(hero,ItFo_Plants_Trollberrys_01,1);
		CreateInvItems(hero,ItFo_Potion_Master_02,1);
		PrintScreen("Trank der Herrschaft hergestellt!",-1,-1,"font_old_20_white.tga",1);
	}
	else
	{
		PrintScreen("Nicht genügend Zutaten!",-1,-1,"font_old_20_white.tga",1);
		AI_StopProcessInfos(self);
		PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
		self.aivar[AIV_INVINCIBLE] = FALSE;
	};
};


instance PC_BOOZE_START(C_Info)
{
	npc = PC_Hero;
	nr = 6;
	condition = pc_booze_start_condition;
	information = pc_booze_start_info;
	permanent = TRUE;
	description = "Schnaps brennen";
};


func int pc_booze_start_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONALCHEMY) && (MANASTART == FALSE) && (HEALTHSTART == FALSE) && (SPECIALSTART == FALSE) && (BOOZESTART == FALSE))
	{
		return TRUE;
	};
};

func void pc_booze_start_info()
{
	BOOZESTART = TRUE;
};


instance PC_BOOZE_STOP(C_Info)
{
	npc = PC_Hero;
	nr = 99;
	condition = pc_booze_stop_condition;
	information = pc_booze_stop_info;
	permanent = TRUE;
	description = DIALOG_BACK;
};


func int pc_booze_stop_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONALCHEMY) && (BOOZESTART == TRUE))
	{
		return TRUE;
	};
};

func void pc_booze_stop_info()
{
	BOOZESTART = FALSE;
};


instance PC_BOOZE(C_Info)
{
	npc = PC_Hero;
	condition = pc_booze_condition;
	information = pc_booze_info;
	permanent = 1;
	description = "Reisschnaps";
};


func int pc_booze_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONALCHEMY) && (BOOZESTART == TRUE) && (KNOWS_BOOZE == TRUE))
	{
		return TRUE;
	};
};

func void pc_booze_info()
{
	if((Npc_HasItems(hero,ItMi_Alchemy_Alcohol_01) >= 1) && (Npc_HasItems(hero,itmi_plants_rice_01) >= 1) && (Npc_HasItems(hero,ItFo_Potion_Water_01) >= 1))
	{
		Npc_RemoveInvItems(hero,ItMi_Alchemy_Alcohol_01,1);
		Npc_RemoveInvItems(hero,itmi_plants_rice_01,1);
		Npc_RemoveInvItems(hero,ItFo_Potion_Water_01,1);
		CreateInvItems(hero,ItFoBooze,1);
		PrintScreen("Reisschnaps hergestellt!",-1,-1,"font_old_20_white.tga",1);
	}
	else
	{
		PrintScreen("Nicht genügend Zutaten!",-1,-1,"font_old_20_white.tga",1);
		AI_StopProcessInfos(self);
		PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
		self.aivar[AIV_INVINCIBLE] = FALSE;
		CreateInvItems(hero,ItMiFlask,1);
	};
};

