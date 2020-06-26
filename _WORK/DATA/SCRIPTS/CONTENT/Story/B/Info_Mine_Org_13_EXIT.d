
instance Info_Mine_Org_13_EXIT(C_Info)
{
	nr = 999;
	condition = Info_Mine_Org_13_EXIT_Condition;
	information = Info_Mine_Org_13_EXIT_Info;
	permanent = 1;
	description = "ENDE";
};


func int Info_Mine_Org_13_EXIT_Condition()
{
	return 1;
};

func void Info_Mine_Org_13_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance Info_Mine_Org_13_Mine(C_Info)
{
	nr = 1;
	condition = Info_Mine_Org_13_Mine_Condition;
	information = Info_Mine_Org_13_Mine_Info;
	permanent = 1;
	description = "Erzähl mir mal was über das Camp hier.";
};


func int Info_Mine_Org_13_Mine_Condition()
{
	return 1;
};

func void Info_Mine_Org_13_Mine_Info()
{
	AI_Output(other,self,"Info_Mine_Org_13_Mine_15_00");	//Erzähl mir mal was über das Lager hier.
	AI_Output(self,other,"Info_Mine_Org_13_Mine_13_01");	//Dieses Felsloch wird uns hier raus bringen. Wenn wir erst genug Erz haben, kann uns das Alte Lager egal sein.
};


instance Info_Mine_Org_13_WichtigePersonen(C_Info)
{
	nr = 1;
	condition = Info_Mine_Org_13_WichtigePersonen_Condition;
	information = Info_Mine_Org_13_WichtigePersonen_Info;
	permanent = 1;
	description = "Wer gibt hier die Befehle?";
};


func int Info_Mine_Org_13_WichtigePersonen_Condition()
{
	return 1;
};

func void Info_Mine_Org_13_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Mine_Org_13_WichtigePersonen_15_00");	//Wer gibt hier die Befehle?
	AI_Output(self,other,"Info_Mine_Org_13_WichtigePersonen_13_01");	//Okyl hat hier das Sagen.
	AI_Output(self,other,"Info_Mine_Org_13_WichtigePersonen_13_02");	//Aber uns Banditen lässt er meist ins Ruhe.
};


instance Info_Mine_Org_13_DieLage(C_Info)
{
	nr = 1;
	condition = Info_Mine_Org_13_DieLage_Condition;
	information = Info_Mine_Org_13_DieLage_Info;
	permanent = 1;
	description = "Alles klar bei Dir?";
};


func int Info_Mine_Org_13_DieLage_Condition()
{
	return 1;
};

func void Info_Mine_Org_13_DieLage_Info()
{
	AI_Output(other,self,"Info_Mine_Org_13_DieLage_15_00");	//Alles klar bei dir?
	if((Npc_GetTrueGuild(other) == GIL_STT) || (Npc_GetTrueGuild(other) == GIL_GRD))
	{
		AI_Output(self,other,"Info_Mine_Sld_11_DieLage_15_01");	//Gar nicht gut.
		AI_Output(other,self,"Info_Mine_Sld_11_DieLage_15_02");	//Zumindest nicht solange hier Leute von Gomez', wie du, hier rumschleichen.
	}
	else
	{
		AI_Output(self,other,"Info_Mine_Org_13_DieLage_17_01");	//Man, verpiss dich. Was quatscht du mich an?
	};
};


instance INFO_MINE_ORG_13_KAMPF(C_Info)
{
	nr = 90;
	condition = info_mine_org_13_kampf_condition;
	information = info_mine_org_13_kampf_info;
	permanent = 1;
	description = "(Kampf provozieren)";
};


func int info_mine_org_13_kampf_condition()
{
	return 1;
};

func void info_mine_org_13_kampf_info()
{
	AI_Output(other,self,"Info_Mine_Org_13_Kampf_15_00");	//Ich glaub' ich werd' dir mal richtig die Fresse polieren müssen.
	AI_Output(self,other,"Info_Mine_Org_13_Kampf_07_01");	//Du willst dich mit mir anlegen? Komm her. Hehe.
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_Attack,1,"");
};

func void B_AssignAmbientInfos_Mine_Org_13(var C_Npc slf)
{
	Info_Mine_Org_13_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Org_13_Mine.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Org_13_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Org_13_DieLage.npc = Hlp_GetInstanceID(slf);
	info_mine_org_13_kampf.npc = Hlp_GetInstanceID(slf);
};

