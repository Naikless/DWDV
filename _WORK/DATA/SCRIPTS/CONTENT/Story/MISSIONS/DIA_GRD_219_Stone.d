
instance DIA_Stone_Hello(C_Info)
{
	npc = GRD_219_Stone;
	nr = 1;
	condition = DIA_Stone_Hello_Condition;
	information = DIA_Stone_Hello_Info;
	permanent = 0;
	description = "Du bist der Schmied, richtig?";
};


func int DIA_Stone_Hello_Condition()
{
	if(Kapitel < 4)
	{
		return TRUE;
	};
};

func void DIA_Stone_Hello_Info()
{
	AI_Output(other,self,"DIA_Stone_Hello_15_00");	//Du bist der Schmied, richtig?
	AI_Output(self,other,"DIA_Stone_Hello_06_01");	//Richtig.
};


instance DIA_Stone_NotSelling(C_Info)
{
	npc = GRD_219_Stone;
	nr = 1;
	condition = DIA_Stone_NotSelling_Condition;
	information = DIA_Stone_NotSelling_Info;
	permanent = 1;
	description = "Verkaufst du Waffen und Rüstungen?";
};


func int DIA_Stone_NotSelling_Condition()
{
	if(((Npc_GetTrueGuild(hero) != GIL_GRD) && (Npc_GetTrueGuild(hero) != GIL_EBR)) && (Kapitel < 4))
	{
		return TRUE;
	};
};

func void DIA_Stone_NotSelling_Info()
{
	AI_Output(other,self,"DIA_Stone_NotSelling_15_00");	//Verkaufst du Waffen und Rüstungen?
	AI_Output(self,other,"DIA_Stone_NotSelling_06_01");	//Um die Waffen kümmert sich Skip. Ich verteile nur die Rüstungen.
	AI_Output(other,self,"DIA_Stone_NotSelling_15_02");	//Was für Rüstungen hast du denn da?
	AI_Output(self,other,"DIA_Stone_NotSelling_06_03");	//Nur Rüstungen für Gardisten. Und du bist keiner. Also wirst du dir deine Rüstung woanders besorgen müssen, du Arsch!
	AI_StopProcessInfos(self);
};


instance GRD_219_Stone_GETSTUFF(C_Info)
{
	npc = GRD_219_Stone;
	condition = GRD_219_Stone_GETSTUFF_Condition;
	information = GRD_219_Stone_GETSTUFF_Info;
	important = 0;
	permanent = 0;
	description = "Ich brauche eine Rüstung.";
};


func int GRD_219_Stone_GETSTUFF_Condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_GRD)
	{
		return TRUE;
	};
};

func void GRD_219_Stone_GETSTUFF_Info()
{
	AI_Output(other,self,"GRD_219_Stone_GETSTUFF_Info_15_01");	//Ich brauche eine Rüstung.
	AI_Output(self,other,"GRD_219_Stone_GETSTUFF_Info_06_02");	//Thorus hat dich in die Truppe aufgenommen? Glückwunsch!
	AI_Output(self,other,"GRD_219_Stone_GETSTUFF_Info_06_03");	//Wieder einer mehr, der seinen Hals für Gomez in die Schlinge legt. Na, mir soll's recht sein.
	AI_Output(self,other,"GRD_219_Stone_GETSTUFF_Info_06_04");	//Hier, nimm die Rüstung und dieses Schwert. Willkommen bei der Garde.
	CreateInvItems(self,ItMw_1H_Sword_03,1);
	B_GiveInvItems(self,other,ItMw_1H_Sword_03,1);
	Npc_RemoveInvItem(other,ItMw_1H_Sword_03);
	CreateInvItem(other,grd_armor_l);
	AI_EquipBestArmor(hero);
	AI_EquipBestMeleeWeapon(hero);
	B_LogEntry(GE_BecomeGuard,"Ich habe meine erste Gardistenrüstung bei Stone dem Schmied abgeholt. Ich kann dort noch bessere Rüstungen kaufen, was er sich allerdings teuer bezahlen lässt.");
	AI_StopProcessInfos(self);
};


instance GRD_219_Stone_BETTERARMOR(C_Info)
{
	npc = GRD_219_Stone;
	condition = GRD_219_Stone_BETTERARMOR_Condition;
	information = GRD_219_Stone_BETTERARMOR_Info;
	important = 0;
	permanent = 1;
	description = "Ich brauche eine bessere Rüstung.";
};


func int GRD_219_Stone_BETTERARMOR_Condition()
{
	if(Npc_KnowsInfo(hero,GRD_219_Stone_GETSTUFF) && (Kapitel < 4))
	{
		return TRUE;
	};
};

func void GRD_219_Stone_BETTERARMOR_Info()
{
	AI_Output(other,self,"GRD_219_Stone_BETTERARMOR_Info_15_01");	//Ich brauche eine bessere Rüstung.
	AI_Output(self,other,"GRD_219_Stone_BETTERARMOR_Info_06_02");	//Wenn die Zeit gekommen ist und du genug Erz hast ...
	Info_ClearChoices(GRD_219_Stone_BETTERARMOR);
	Info_AddChoice(GRD_219_Stone_BETTERARMOR,DIALOG_BACK,GRD_219_Stone_BETTERARMOR_BACK);
	Info_AddChoice(GRD_219_Stone_BETTERARMOR,B_BuildBuyArmorString(NAME_StoneHeavyGuards,VALUE_GRD_ARMOR_H),GRD_219_Stone_BETTERARMOR_H);
	Info_AddChoice(GRD_219_Stone_BETTERARMOR,B_BuildBuyArmorString(NAME_StoneGuards,VALUE_GRD_ARMOR_M),GRD_219_Stone_BETTERARMOR_M);
};

func void GRD_219_Stone_BETTERARMOR_M()
{
	AI_Output(hero,self,"GRD_219_Stone_BETTERARMOR_Info_M_15_01");	//Ich möchte eine normale Garderüstung haben.
	if(Kapitel < 3)
	{
		AI_Output(self,hero,"GRD_219_Stone_BETTERARMOR_Info_M_06_02");	//Thorus sagt, du musst dich erst mal als Gardist bewähren, bevor du eine bessere Rüstung bekommen kannst, du Arsch!
	}
	else if(Npc_HasItems(hero,ItMiNugget) < VALUE_GRD_ARMOR_M)
	{
		AI_Output(self,hero,"GRD_219_Stone_BETTERARMOR_Info_M_06_03");	//Ich hätte eine hier, aber du scheinst nicht genug Erz dabei zu haben! Komm wieder, wenn du sie dir leisten kannst!
	}
	else
	{
		AI_Output(self,hero,"GRD_219_Stone_BETTERARMOR_Info_M_06_04");	//In Ordnung, hier ist deine neue Garderüstung! Lass sie dir nicht zu sehr von den Söldnern zerbeulen, hahaha!
		B_GiveInvItems(hero,self,ItMiNugget,VALUE_GRD_ARMOR_M);
		B_GiveInvItems(self,hero,grd_armor_m,1);
		AI_EquipBestArmor(hero);
	};
	Info_ClearChoices(GRD_219_Stone_BETTERARMOR);
};

func void GRD_219_Stone_BETTERARMOR_H()
{
	AI_Output(hero,self,"GRD_219_Stone_BETTERARMOR_Info_H_15_01");	//Ich möchte eine schwere Garderüstung haben.
	if((Kapitel < 3) && (SCAR_QUEST != LOG_SUCCESS))
	{
		AI_Output(self,hero,"GRD_219_Stone_BETTERARMOR_Info_M_06_02");	//Thorus sagt, du musst dich erst mal als Gardist bewähren, bevor du eine bessere Rüstung bekommen kannst, du Arsch!
	}
	else if(Npc_HasItems(hero,ItMiNugget) < VALUE_GRD_ARMOR_H)
	{
		AI_Output(self,hero,"GRD_219_Stone_BETTERARMOR_Info_M_06_03");	//Ich hätte eine hier, aber du scheinst nicht genug Erz dabei zu haben! Komm wieder, wenn du sie dir leisten kannst!
	}
	else
	{
		AI_Output(self,hero,"GRD_219_Stone_BETTERARMOR_Info_M_06_04");	//In Ordnung, hier ist deine neue Garderüstung! Lass sie dir nicht zu sehr von den Söldnern zerbeulen, hahaha!
		B_GiveInvItems(hero,self,ItMiNugget,VALUE_GRD_ARMOR_H);
		B_GiveInvItems(self,hero,grd_armor_h,1);
		AI_EquipBestArmor(hero);
	};
	Info_ClearChoices(GRD_219_Stone_BETTERARMOR);
};

func void GRD_219_Stone_BETTERARMOR_BACK()
{
	AI_Output(hero,self,"GRD_219_Stone_BETTERARMOR_Info_BACK_15_01");	//Ich hab' es mir anders überlegt!
	AI_Output(self,hero,"GRD_219_Stone_BETTERARMOR_Info_BACK_06_02");	//Wie du meinst. Du weißt, wo du mich findest!
	Info_ClearChoices(GRD_219_Stone_BETTERARMOR);
};


instance DIA_GRD_219_Stone_Exit(C_Info)
{
	npc = GRD_219_Stone;
	nr = 999;
	condition = DIA_GRD_219_Stone_Exit_Condition;
	information = DIA_GRD_219_Stone_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_GRD_219_Stone_Exit_Condition()
{
	return 1;
};

func void DIA_GRD_219_Stone_Exit_Info()
{
	var C_Npc Stone;
	if(Npc_KnowsInfo(hero,DIA_GRD_219_Stone4))
	{
		AI_StopProcessInfos(self);
		Stone = Hlp_GetNpc(GRD_219_Stone);
		TA_BeginOverlay(Stone);
		TA_Min(Stone,0,0,0,5,ZS_Position,"OCC_MERCS_HALLWAY_BACK");
		TA_Min(Stone,0,5,0,10,ZS_Position,"OCC_MERCS_ENTRANCE");
		TA_Min(Stone,0,10,0,15,ZS_Position,"OCC_SHADOWS_CORNER");
		TA_Min(Stone,0,15,0,20,ZS_Position,"OCC_STABLE_ENTRANCE");
		TA_Min(Stone,0,20,72,0,ZS_Position,"OCC_STABLE_LEFT_FRONT");
		TA_EndOverlay(Stone);
		AI_Output(self,other,"Info_EXIT_06_02");	//Wir sehen uns.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"Info_EXIT_06_03");	//Wir sehen uns.
		AI_StopProcessInfos(self);
	};
};


instance DIA_GRD_219_Stone(C_Info)
{
	npc = GRD_219_Stone;
	condition = DIA_GRD_219_Stone_Condition;
	information = DIA_GRD_219_Stone_Info;
	important = 1;
	permanent = 0;
};


func int DIA_GRD_219_Stone_Condition()
{
	if(Kapitel >= 5)
	{
		return 1;
	};
};

func void DIA_GRD_219_Stone_Info()
{
	AI_Output(self,other,"DIA_GRD_219_Stone_06_01");	//Was willst du, du siehst nicht aus wie einer von Gomez' Schergen?
};


instance DIA_GRD_219_Stone1(C_Info)
{
	npc = GRD_219_Stone;
	condition = DIA_GRD_219_Stone1_Condition;
	information = DIA_GRD_219_Stone1_Info;
	important = 0;
	permanent = 0;
	description = "Stimmt, ich gehöre nicht zu Gomez";
};


func int DIA_GRD_219_Stone1_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_GRD_219_Stone))
	{
		return 1;
	};
};

func void DIA_GRD_219_Stone1_Info()
{
	AI_Output(other,self,"DIA_GRD_219_Stone1_15_01");	//Stimmt, ich gehöre nicht zu Gomez.
	AI_Output(self,other,"DIA_GRD_219_Stone1_06_02");	//Wie bist du dann hier rein gekommen? Gomez hatte den Schlüssel zum Kerker.
	AI_Output(other,self,"DIA_GRD_219_Stone1_15_03");	//Er hat ihn mir überlassen.
	AI_Output(self,other,"DIA_GRD_219_Stone1_06_04");	//Du willst doch nicht andeuten, dass DU Gomez aus dem Weg geräumt hast?
	AI_Output(other,self,"DIA_GRD_219_Stone1_15_05");	//Doch, will ich.
	AI_Output(self,other,"DIA_GRD_219_Stone1_06_06");	//Junge, das hätte ich dir gar nicht zugetraut, es freut mich aber, dass dieser dreckige Halsabschneider endlich das bekommen hat, was er verdient.
	AI_Output(self,other,"DIA_GRD_219_Stone1_06_07");	//Aber warum hast du mich befreit?
	AI_Output(other,self,"DIA_GRD_219_Stone1_15_08");	//Ich habe gehört, dass du im Kerker bist, und habe die Gelegenheit genutzt, um Gomez ruhig zu stellen und dich zu befreien.
	AI_Output(self,other,"DIA_GRD_219_Stone1_06_09");	//Habe Dank ...
	AI_Output(self,other,"DIA_GRD_219_Stone1_06_10");	//... ich stehe in deiner Schuld, triff mich in der Schmiede, dort reden wir weiter.
	Npc_SetPermAttitude(self,ATT_FRIENDLY);
	Npc_ExchangeRoutine(self,"OTNEW");
};


instance DIA_GRD_219_Stone3(C_Info)
{
	npc = GRD_219_Stone;
	condition = DIA_GRD_219_Stone3_Condition;
	information = DIA_GRD_219_Stone3_Info;
	important = 1;
	permanent = 0;
};


func int DIA_GRD_219_Stone3_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_GRD_219_Stone1) && Hlp_StrCmp(Npc_GetNearestWP(self),"OCC_STABLE_LEFT_FRONT"))
	{
		return 1;
	};
};

func void DIA_GRD_219_Stone3_Info()
{
	AI_Output(self,other,"DIA_GRD_219_Stone3_06_01");	//Da bist du ja. Da du mich aus diesem Rattenloch befreit hast, hast du was gut bei mir, Mann!
	AI_Output(self,other,"DIA_GRD_219_Stone3_06_02");	//Ich habe mir überlegt, da es nicht viel gibt, was ich dir geben kann, werde ich dir etwas schmieden.
	AI_Output(self,other,"DIA_GRD_219_Stone3_06_03");	//Könnte ein Ring sein oder etwas Vergleichbares ...
};


instance DIA_GRD_219_Stone2(C_Info)
{
	npc = GRD_219_Stone;
	condition = DIA_GRD_219_Stone2_Condition;
	information = DIA_GRD_219_Stone2_Info;
	important = 0;
	permanent = 0;
	description = "Warum hat man dich in den Kerker geworfen?";
};


func int DIA_GRD_219_Stone2_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_GRD_219_Stone3))
	{
		return 1;
	};
};

func void DIA_GRD_219_Stone2_Info()
{
	AI_Output(other,self,"DIA_GRD_219_Stone2_15_01");	//Warum hat man dich in den Kerker geworfen?
	AI_Output(self,other,"DIA_GRD_219_Stone2_06_02");	//Gomez! Der Bastard hat mir unterstellt, dass ich gemeinsame Sache mit den Feuermagiern machen würde. Nur weil ich der beste Schmied im Alten Lager bin, konnte ich meinen Kopf retten.
	AI_Output(self,other,"DIA_GRD_219_Stone2_06_03");	//Er hat mich in dieses Rattenloch werfen lassen und immer nur dann rausgelassen, wenn er meine Fähigkeiten gebraucht hat.
};


instance DIA_GRD_219_Stone4(C_Info)
{
	npc = GRD_219_Stone;
	condition = DIA_GRD_219_Stone4_Condition;
	information = DIA_GRD_219_Stone4_Info;
	important = 0;
	permanent = 0;
	description = "Kannst du mir diese Erzrüstung verstärken?";
};


func int DIA_GRD_219_Stone4_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_GRD_219_Stone3) && Npc_HasItems(hero,ore_armor_m) && (KnowStone == 0))
	{
		return 1;
	};
};

func void DIA_GRD_219_Stone4_Info()
{
	AI_Output(other,self,"DIA_GRD_219_Stone4_15_01");	//Kannst du mir diese Erzrüstung verstärken?
	AI_Output(self,other,"DIA_GRD_219_Stone4_06_02");	//Natürlich kann ich sie verstärken? Gib sie mir und warte kurz.
	AI_UnequipArmor(hero);
	B_GiveInvItems(hero,self,ore_armor_m,1);
	Npc_RemoveInvItem(self,ore_armor_m);
	B_StartUseMob(self,"BSFIRE");
	AI_Wait(self,1);
	B_StopUseMob(self,"BSFIRE");
	AI_Wait(self,1);
	B_StartUseMob(self,"BSANVIL");
	AI_Wait(self,1);
	B_StopUseMob(self,"BSANVIL");
	AI_Wait(self,1);
	AI_GotoNpc(self,hero);
	CreateInvItem(self,ore_armor_h);
	B_GiveInvItems(self,hero,ore_armor_h,1);
	AI_Output(self,other,"DIA_GRD_219_Stone4_06_03");	//Hier ist die verstärkte Rüstung, damit habe ich meine Schuld beglichen.
	KnowStone = 1;
};


instance DIA_GRD_219_Stone5(C_Info)
{
	npc = GRD_219_Stone;
	condition = DIA_GRD_219_Stone5_Condition;
	information = DIA_GRD_219_Stone5_Info;
	important = 0;
	permanent = 0;
	description = "Ich könnte einen Ring gebrauchen, der meine Lebenskraft steigert.";
};


func int DIA_GRD_219_Stone5_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_GRD_219_Stone3) && (KnowStone == 0))
	{
		return 1;
	};
};

func void DIA_GRD_219_Stone5_Info()
{
	AI_Output(other,self,"DIA_GRD_219_Stone5_15_01");	//Ich könnte einen Ring gebrauchen, der meine Lebenskraft steigert.
	AI_Output(self,other,"DIA_GRD_219_Stone5_06_02");	//Das ist nicht so schwer, warte kurz.
	B_StartUseMob(self,"BSFIRE");
	AI_Wait(self,1);
	B_StopUseMob(self,"BSFIRE");
	AI_Wait(self,1);
	B_StartUseMob(self,"BSANVIL");
	AI_Wait(self,1);
	B_StopUseMob(self,"BSANVIL");
	AI_Wait(self,1);
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"DIA_GRD_219_Stone5_06_03");	//Dieser Ring verleiht dir Lebenskraft, damit müsste meine Schuld mehr als beglichen sein.
	CreateInvItem(self,Ring_des_Lebens2);
	B_GiveInvItems(self,other,Ring_des_Lebens2,1);
	KnowStone = 1;
};


instance DIA_GRD_219_Stone6(C_Info)
{
	npc = GRD_219_Stone;
	condition = DIA_GRD_219_Stone6_Condition;
	information = DIA_GRD_219_Stone6_Info;
	important = 0;
	permanent = 0;
	description = "Ich will einen Schutzring geschmiedet haben";
};


func int DIA_GRD_219_Stone6_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_GRD_219_Stone3) && (KnowStone == 0))
	{
		return 1;
	};
};

func void DIA_GRD_219_Stone6_Info()
{
	AI_Output(other,self,"DIA_GRD_219_Stone6_15_01");	//Ich will einen Schutzring geschmiedet haben.
	AI_Output(self,other,"DIA_GRD_219_Stone6_06_02");	//Einen Schutzring, dann gehe ich an die Arbeit. Warte solange.
	B_StartUseMob(self,"BSFIRE");
	AI_Wait(self,1);
	B_StopUseMob(self,"BSFIRE");
	AI_Wait(self,1);
	B_StartUseMob(self,"BSANVIL");
	AI_Wait(self,1);
	B_StopUseMob(self,"BSANVIL");
	AI_Wait(self,1);
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"DIA_GRD_219_Stone6_06_03");	//Einen Schutzring wolltest du, hier ist er, jetzt sind wir quitt.
	CreateInvItem(self,Schutzring_Total2);
	B_GiveInvItems(self,other,Schutzring_Total2,1);
	KnowStone = 1;
};


instance DIA_GRD_219_Stone7(C_Info)
{
	npc = GRD_219_Stone;
	condition = DIA_GRD_219_Stone7_Condition;
	information = DIA_GRD_219_Stone7_Info;
	important = 0;
	permanent = 0;
	description = "Schmiede mir einen Gegenstand, der meine magische Energie vermehrt.";
};


func int DIA_GRD_219_Stone7_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_GRD_219_Stone3) && (KnowStone == 0))
	{
		return 1;
	};
};

func void DIA_GRD_219_Stone7_Info()
{
	AI_Output(other,self,"DIA_GRD_219_Stone7_15_01");	//Schmiede mir einen Gegenstand, der meine magische Energie vermehrt.
	AI_Output(self,other,"DIA_GRD_219_Stone7_06_02");	//... Einen Gegenstand, der magische Energie vermehrt ... ein Amulett, ich schmiede dir ein Amulett. Das dauert nicht lange.
	B_StartUseMob(self,"BSFIRE");
	AI_Wait(self,1);
	B_StopUseMob(self,"BSFIRE");
	AI_Wait(self,1);
	B_StartUseMob(self,"BSANVIL");
	AI_Wait(self,1);
	B_StopUseMob(self,"BSANVIL");
	AI_Wait(self,1);
	AI_GotoNpc(self,hero);
	AI_Output(self,other,"DIA_GRD_219_Stone7_06_03");	//So, das Amulett ist fertig, und ich muss sagen, es ist mir gut gelungen. Somit ist die Schuld beglichen.
	CreateInvItem(self,Amulett_der_Magie);
	B_GiveInvItems(self,other,Amulett_der_Magie,1);
	KnowStone = 1;
};


instance INFO_STONE_CRAFT_WHICH(C_Info)
{
	npc = GRD_219_Stone;
	nr = 9;
	condition = info_stone_craft_which_condition;
	information = info_stone_craft_which_info;
	important = 0;
	permanent = 1;
	description = "Kannst du meine Rüstung verbessern?";
};


func int info_stone_craft_which_condition()
{
	if((Npc_GetTrueGuild(hero) == GIL_STT) || (Npc_GetTrueGuild(hero) == GIL_GRD) || (Npc_GetTrueGuild(hero) == GIL_KDF) || (Npc_GetTrueGuild(hero) == GIL_EBR))
	{
		return TRUE;
	};
};

func void info_stone_craft_which_info()
{
	AI_Output(hero,self,"Info_Stone_CRAFT_WHICH_15_01");	//Kannst du meine Rüstung verbessern?
	AI_Output(self,hero,"Info_Stone_CRAFT_WHICH_09_02");	//Natürlich. Wenn du mir eine entsprechende Rüstung bringst, schau' ich was sich machen lässt.
	Info_ClearChoices(info_stone_craft_which);
	Info_AddChoice(info_stone_craft_which,DIALOG_BACK,info_stone_craft_which_back);
	if(Npc_HasItems(other,stt_armor_m) >= 1)
	{
		Info_AddChoice(info_stone_craft_which,"Verbesserte Schattenkluft (375 Erz)",info_stone_craft_which_stt);
	};
	if(Npc_HasItems(other,stt_armor_h) >= 1)
	{
		Info_AddChoice(info_stone_craft_which,"Verbesserte Schattenrüstung (600 Erz)",info_stone_craft_which_stth);
	};
	if(Npc_HasItems(other,kdf_armor_l) >= 1)
	{
		Info_AddChoice(info_stone_craft_which,"Verbesserte Feuermagierrobe (600 Erz)",info_stone_craft_which_kdfl);
	};
	if(Npc_HasItems(other,grd_armor_l) >= 1)
	{
		Info_AddChoice(info_stone_craft_which,"Verbesserte leichte Garderüstung (675 Erz)",info_stone_craft_which_grdl);
	};
	if(Npc_HasItems(other,grd_armor_m) >= 1)
	{
		Info_AddChoice(info_stone_craft_which,"Verbesserte Garderüstung (825 Erz)",info_stone_craft_which_grdm);
	};
	if(Npc_HasItems(other,grd_armor_h) >= 1)
	{
		Info_AddChoice(info_stone_craft_which,"Verbesserte schwere Garderüstung (1050 Erz)",info_stone_craft_which_grdh);
	};
};

func void info_stone_craft_which_back()
{
	Info_ClearChoices(info_stone_craft_which);
};

func void info_stone_craft_which_stt()
{
	AI_Output(other,self,",	Info_Stone_CRAFT_WHICH_Stone_13_01");	//Hier ist die Rüstung.
	if((Npc_HasItems(other,stt_armor_m) >= 1) && (Npc_HasItems(hero,ItMiNugget) >= 375))
	{
		AI_Output(self,other,",	Info_Stone_CRAFT_WHICH_Stone_16_02");	//Alles klar, damit kann ich was machen.
		AI_Output(self,other,",	Info_Stone_CRAFT_WHICH_Stone_15_04");	//Warte kurz, dass haben wir gleich.
		AI_UnequipArmor(hero);
		B_GiveInvItems(hero,self,stt_armor_m,1);
		B_GiveInvItems(hero,self,ItMiNugget,375);
		Npc_RemoveInvItem(self,stt_armor_m);
		B_StartUseMob(self,"BSFIRE");
		AI_Wait(self,1);
		B_StopUseMob(self,"BSFIRE");
		AI_Wait(self,1);
		B_StartUseMob(self,"BSANVIL");
		AI_Wait(self,1);
		B_StopUseMob(self,"BSANVIL");
		AI_Wait(self,1);
		AI_GotoNpc(self,hero);
		CreateInvItem(self,stt_armor_m_upgrade);
		B_GiveInvItems(self,hero,stt_armor_m_upgrade,1);
		AI_EquipBestArmor(hero);
		AI_Output(self,other,",	Info_Stone_CRAFT_WHICH_Stone_15_05");	//So, hier ist das Ding. Pass gut drauf auf, nicht das du morgen wieder bei mir auf der Matte stehst.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,",	Info_Stone_CRAFT_WHICH_Stone_15_02");	//Du hast nicht genügend Erz. Komm' wieder wenn du mehr Erz dabei hast.
		AI_StopProcessInfos(self);
		Info_ClearChoices(info_stone_craft_which);
	};
};

func void info_stone_craft_which_stth()
{
	AI_Output(other,self,",	Info_Stone_CRAFT_WHICH_Stone_13_01");	//Hier ist die Rüstung.
	if((Npc_HasItems(other,stt_armor_h) >= 1) && (Npc_HasItems(hero,ItMiNugget) >= 600))
	{
		AI_Output(self,other,",	Info_Stone_CRAFT_WHICH_Stone_16_02");	//Alles klar, damit kann ich was machen.
		AI_Output(self,other,",	Info_Stone_CRAFT_WHICH_Stone_15_04");	//Warte kurz, dass haben wir gleich.
		AI_UnequipArmor(hero);
		B_GiveInvItems(hero,self,stt_armor_h,1);
		B_GiveInvItems(hero,self,ItMiNugget,600);
		Npc_RemoveInvItem(self,stt_armor_h);
		B_StartUseMob(self,"BSFIRE");
		AI_Wait(self,1);
		B_StopUseMob(self,"BSFIRE");
		AI_Wait(self,1);
		B_StartUseMob(self,"BSANVIL");
		AI_Wait(self,1);
		B_StopUseMob(self,"BSANVIL");
		AI_Wait(self,1);
		AI_GotoNpc(self,hero);
		CreateInvItem(self,stt_armor_h_upgrade);
		B_GiveInvItems(self,hero,stt_armor_h_upgrade,1);
		AI_EquipBestArmor(hero);
		AI_Output(self,other,",	Info_Stone_CRAFT_WHICH_Stone_15_05");	//So, hier ist das Ding. Pass gut drauf auf, nicht das du morgen wieder bei mir auf der Matte stehst.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,",	Info_Stone_CRAFT_WHICH_Stone_15_02");	//Du hast nicht genügend Erz. Komm' wieder wenn du mehr Erz dabei hast.
		AI_StopProcessInfos(self);
		Info_ClearChoices(info_stone_craft_which);
	};
};

func void info_stone_craft_which_kdfl()
{
	AI_Output(other,self,",	Info_Stone_CRAFT_WHICH_Stone_13_01");	//Hier ist die Rüstung.
	if((Npc_HasItems(other,kdf_armor_l) >= 1) && (Npc_HasItems(hero,ItMiNugget) >= 600))
	{
		AI_Output(self,other,",	Info_Stone_CRAFT_WHICH_Stone_16_02");	//Alles klar, damit kann ich was machen.
		AI_Output(self,other,",	Info_Stone_CRAFT_WHICH_Stone_15_04");	//Warte kurz, dass haben wir gleich.
		AI_UnequipArmor(hero);
		B_GiveInvItems(hero,self,kdf_armor_l,1);
		B_GiveInvItems(hero,self,ItMiNugget,600);
		Npc_RemoveInvItem(self,kdf_armor_l);
		B_StartUseMob(self,"BSFIRE");
		AI_Wait(self,1);
		B_StopUseMob(self,"BSFIRE");
		AI_Wait(self,1);
		B_StartUseMob(self,"BSANVIL");
		AI_Wait(self,1);
		B_StopUseMob(self,"BSANVIL");
		AI_Wait(self,1);
		AI_GotoNpc(self,hero);
		CreateInvItem(self,kdf_armor_l_upgrade);
		B_GiveInvItems(self,hero,kdf_armor_l_upgrade,1);
		AI_EquipBestArmor(hero);
		AI_Output(self,other,",	Info_Stone_CRAFT_WHICH_Stone_15_05");	//So, hier ist das Ding. Pass gut drauf auf, nicht das du morgen wieder bei mir auf der Matte stehst.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,",	Info_Stone_CRAFT_WHICH_Stone_15_02");	//Du hast nicht genügend Erz. Komm' wieder wenn du mehr Erz dabei hast.
		AI_StopProcessInfos(self);
		Info_ClearChoices(info_stone_craft_which);
	};
};

func void info_stone_craft_which_grdl()
{
	AI_Output(other,self,",	Info_Stone_CRAFT_WHICH_Stone_13_01");	//Hier ist die Rüstung.
	if((Npc_HasItems(other,grd_armor_l) >= 1) && (Npc_HasItems(hero,ItMiNugget) >= 675))
	{
		AI_Output(self,other,",	Info_Stone_CRAFT_WHICH_Stone_16_02");	//Alles klar, damit kann ich was machen.
		AI_Output(self,other,",	Info_Stone_CRAFT_WHICH_Stone_15_04");	//Warte kurz, dass haben wir gleich.
		AI_UnequipArmor(hero);
		B_GiveInvItems(hero,self,grd_armor_l,1);
		B_GiveInvItems(hero,self,ItMiNugget,675);
		Npc_RemoveInvItem(self,grd_armor_l);
		B_StartUseMob(self,"BSFIRE");
		AI_Wait(self,1);
		B_StopUseMob(self,"BSFIRE");
		AI_Wait(self,1);
		B_StartUseMob(self,"BSANVIL");
		AI_Wait(self,1);
		B_StopUseMob(self,"BSANVIL");
		AI_Wait(self,1);
		AI_GotoNpc(self,hero);
		CreateInvItem(self,grd_armor_l_upgrade);
		B_GiveInvItems(self,hero,grd_armor_l_upgrade,1);
		AI_EquipBestArmor(hero);
		AI_Output(self,other,",	Info_Stone_CRAFT_WHICH_Stone_15_05");	//So, hier ist das Ding. Pass gut drauf auf, nicht das du morgen wieder bei mir auf der Matte stehst.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,",	Info_Stone_CRAFT_WHICH_Stone_15_02");	//Du hast nicht genügend Erz. Komm' wieder wenn du mehr Erz dabei hast.
		AI_StopProcessInfos(self);
		Info_ClearChoices(info_stone_craft_which);
	};
};

func void info_stone_craft_which_grdm()
{
	AI_Output(other,self,",	Info_Stone_CRAFT_WHICH_Stone_13_01");	//Hier ist die Rüstung.
	if((Npc_HasItems(other,grd_armor_m) >= 1) && (Npc_HasItems(hero,ItMiNugget) >= 825))
	{
		AI_Output(self,other,",	Info_Stone_CRAFT_WHICH_Stone_16_02");	//Alles klar, damit kann ich was machen.
		AI_Output(self,other,",	Info_Stone_CRAFT_WHICH_Stone_15_04");	//Warte kurz, dass haben wir gleich.
		AI_UnequipArmor(hero);
		B_GiveInvItems(hero,self,grd_armor_m,1);
		B_GiveInvItems(hero,self,ItMiNugget,825);
		Npc_RemoveInvItem(self,grd_armor_m);
		B_StartUseMob(self,"BSFIRE");
		AI_Wait(self,1);
		B_StopUseMob(self,"BSFIRE");
		AI_Wait(self,1);
		B_StartUseMob(self,"BSANVIL");
		AI_Wait(self,1);
		B_StopUseMob(self,"BSANVIL");
		AI_Wait(self,1);
		AI_GotoNpc(self,hero);
		CreateInvItem(self,grd_armor_m_upgrade);
		B_GiveInvItems(self,hero,grd_armor_m_upgrade,1);
		AI_EquipBestArmor(hero);
		AI_Output(self,other,",	Info_Stone_CRAFT_WHICH_Stone_15_05");	//So, hier ist das Ding. Pass gut drauf auf, nicht das du morgen wieder bei mir auf der Matte stehst.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,",	Info_Stone_CRAFT_WHICH_Stone_15_02");	//Du hast nicht genügend Erz. Komm' wieder wenn du mehr Erz dabei hast.
		AI_StopProcessInfos(self);
		Info_ClearChoices(info_stone_craft_which);
	};
};

func void info_stone_craft_which_grdh()
{
	AI_Output(other,self,",	Info_Stone_CRAFT_WHICH_Stone_13_01");	//Hier ist die Rüstung.
	if((Npc_HasItems(other,grd_armor_h) >= 1) && (Npc_HasItems(hero,ItMiNugget) >= 1050))
	{
		AI_Output(self,other,",	Info_Stone_CRAFT_WHICH_Stone_16_02");	//Alles klar, damit kann ich was machen.
		AI_Output(self,other,",	Info_Stone_CRAFT_WHICH_Stone_15_04");	//Warte kurz, dass haben wir gleich.
		AI_UnequipArmor(hero);
		B_GiveInvItems(hero,self,grd_armor_h,1);
		B_GiveInvItems(hero,self,ItMiNugget,1050);
		Npc_RemoveInvItem(self,grd_armor_h);
		B_StartUseMob(self,"BSFIRE");
		AI_Wait(self,1);
		B_StopUseMob(self,"BSFIRE");
		AI_Wait(self,1);
		B_StartUseMob(self,"BSANVIL");
		AI_Wait(self,1);
		B_StopUseMob(self,"BSANVIL");
		AI_Wait(self,1);
		AI_GotoNpc(self,hero);
		CreateInvItem(self,grd_armor_h_upgrade);
		B_GiveInvItems(self,hero,grd_armor_h_upgrade,1);
		AI_EquipBestArmor(hero);
		AI_Output(self,other,",	Info_Stone_CRAFT_WHICH_Stone_15_05");	//So, hier ist das Ding. Pass gut drauf auf, nicht das du morgen wieder bei mir auf der Matte stehst.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,",	Info_Stone_CRAFT_WHICH_Stone_15_02");	//Du hast nicht genügend Erz. Komm' wieder wenn du mehr Erz dabei hast.
		AI_StopProcessInfos(self);
		Info_ClearChoices(info_stone_craft_which);
	};
};

