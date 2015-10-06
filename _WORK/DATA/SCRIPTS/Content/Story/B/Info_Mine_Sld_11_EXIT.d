
instance Info_Mine_Sld_11_EXIT(C_Info)
{
	nr = 999;
	condition = Info_Mine_Sld_11_EXIT_Condition;
	information = Info_Mine_Sld_11_EXIT_Info;
	permanent = 1;
	description = "ENDE";
};


func int Info_Mine_Sld_11_EXIT_Condition()
{
	return 1;
};

func void Info_Mine_Sld_11_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance Info_Mine_Sld_11_EinerVonEuchWerden(C_Info)
{
	nr = 4;
	condition = Info_Mine_Sld_11_EinerVonEuchWerden_Condition;
	information = Info_Mine_Sld_11_EinerVonEuchWerden_Info;
	permanent = 1;
	description = "Wie kann ich bei Euch mitmachen?";
};


func int Info_Mine_Sld_11_EinerVonEuchWerden_Condition()
{
	if((Npc_GetTrueGuild(other) != GIL_SLD) && (Npc_GetTrueGuild(other) != GIL_KDW) && !C_NpcBelongsToOldCamp(other) && !C_NpcBelongsToPsiCamp(other))
	{
		return TRUE;
	};
};

func void Info_Mine_Sld_11_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_Mine_Sld_11_EinerVonEuchWerden_15_00");	//Wie kann ich bei euch mitmachen?
	AI_Output(self,other,"Info_Mine_Sld_11_EinerVonEuchWerden_011_01");	//Um hier mitzumachen, musst du erst einen Namen haben.
	AI_Output(self,other,"Info_Mine_Sld_11_EinerVonEuchWerden_011_02");	//Beweise dich erst einmal woanders, dann darfst du auch im Kessel Dienst tun.
};


instance Info_Mine_Sld_11_WichtigePersonen(C_Info)
{
	nr = 3;
	condition = Info_Mine_Sld_11_WichtigePersonen_Condition;
	information = Info_Mine_Sld_11_WichtigePersonen_Info;
	permanent = 1;
	description = "Wer erteilt hier die Befehle?";
};


func int Info_Mine_Sld_11_WichtigePersonen_Condition()
{
	return 1;
};

func void Info_Mine_Sld_11_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Mine_Sld_11_WichtigePersonen_15_00");	//Wer erteilt hier die Befehle?
	AI_Output(self,other,"Info_Mine_Sld_11_WichtigePersonen_011_01");	//Hier im Kessel läuft alles über Okyl. Er steht mit den wichtigen Leuten im Lager im Kontakt.
	AI_Output(self,other,"Info_Mine_Sld_11_WichtigePersonen_011_02");	//Also wenn du hier Mist baust, werden auch die Wassermagier im Neuen Lager davon erfahren.
};


instance Info_Mine_Sld_11_DasLager(C_Info)
{
	nr = 2;
	condition = Info_Mine_Sld_11_DasLager_Condition;
	information = Info_Mine_Sld_11_DasLager_Info;
	permanent = 1;
	description = "Gibt´s hier irgendwas besonderes?";
};


func int Info_Mine_Sld_11_DasLager_Condition()
{
	return 1;
};

func void Info_Mine_Sld_11_DasLager_Info()
{
	AI_Output(other,self,"Info_Mine_Sld_11_DasLager_15_00");	//Gibt's hier irgendwas besonderes?
	AI_Output(self,other,"Info_Mine_Sld_11_DasLager_011_01");	//Hier gibt's nichts außer ´ne ganze Menge Ärger, wenn man uns dumm kommt.
	AI_Output(self,other,"Info_Mine_Sld_11_DasLager_011_02");	//Ach ja, wer versucht ohne Genehmigung in die Mine oder ins Torhaus zu kommen, bekommt auch Ärger.
};


instance Info_Mine_Sld_11_DieLage(C_Info)
{
	nr = 1;
	condition = Info_Mine_Sld_11_DieLage_Condition;
	information = Info_Mine_Sld_11_DieLage_Info;
	permanent = 1;
	description = "Wie sieht´s aus?";
};


func int Info_Mine_Sld_11_DieLage_Condition()
{
	return 1;
};

func void Info_Mine_Sld_11_DieLage_Info()
{
	AI_Output(other,self,"Info_Mine_Sld_11_DieLage_15_00");	//Wie sieht's aus?
	if((Npc_GetTrueGuild(other) == GIL_STT) || (Npc_GetTrueGuild(other) == GIL_GRD))
	{
		AI_Output(self,other,"Info_Mine_Sld_11_DieLage_15_01");	//Gar nicht gut.
		AI_Output(other,self,"Info_Mine_Sld_11_DieLage_15_02");	//Zumindest nicht solange hier Leute von Gomez', wie du, hier rumschleichen.
		AI_Output(other,self,"Info_Mine_Sld_11_DieLage_15_03");	//Also mach dich vom Acker.
	}
	else
	{
		AI_Output(self,other,"Info_Mine_Sld_11_DieLage_011_01");	//Ruhig, für meinen Geschmack etwas zu ruhig.
	};
};

func void B_AssignAmbientInfos_Mine_Sld_11(var C_Npc slf)
{
	Info_Mine_Sld_11_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Sld_11_EinerVonEuchWerden.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Sld_11_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Sld_11_DasLager.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Sld_11_DieLage.npc = Hlp_GetInstanceID(slf);
};

