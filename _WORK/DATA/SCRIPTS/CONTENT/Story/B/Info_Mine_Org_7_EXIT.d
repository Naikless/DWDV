
instance Info_Mine_Org_7_EXIT(C_Info)
{
	nr = 999;
	condition = Info_Mine_Org_7_EXIT_Condition;
	information = Info_Mine_Org_7_EXIT_Info;
	permanent = 1;
	description = "ENDE";
};


func int Info_Mine_Org_7_EXIT_Condition()
{
	return 1;
};

func void Info_Mine_Org_7_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance Info_Mine_Org_7_Mine(C_Info)
{
	nr = 1;
	condition = Info_Mine_Org_7_Mine_Condition;
	information = Info_Mine_Org_7_Mine_Info;
	permanent = 1;
	description = "Erzähl mir mal was über das Camp hier.";
};


func int Info_Mine_Org_7_Mine_Condition()
{
	return 1;
};

func void Info_Mine_Org_7_Mine_Info()
{
	AI_Output(other,self,"Info_Mine_Org_7_Mine_15_00");	//Erzähl mir mal was über das Camp hier.
	AI_Output(self,other,"Info_Mine_Org_7_Mine_07_01");	//Das Camp? Du meinst den Kessel. Ist nicht so schlecht hier. Die Schürfer bauen Erz ab, die Söldner passen auf, und wir Banditen behalten hier die Übersicht 
};


instance Info_Mine_Org_7_WichtigePersonen(C_Info)
{
	nr = 1;
	condition = Info_Mine_Org_7_WichtigePersonen_Condition;
	information = Info_Mine_Org_7_WichtigePersonen_Info;
	permanent = 1;
	description = "Wer hat den hier das Kommando?";
};


func int Info_Mine_Org_7_WichtigePersonen_Condition()
{
	return 1;
};

func void Info_Mine_Org_7_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Mine_Org_7_WichtigePersonen_15_00");	//Wer hat den hier das Kommando?
	AI_Output(self,other,"Info_Mine_Org_7_WichtigePersonen_07_01");	//Das kommt drauf an, von wem du dir was sagen lässt.
	AI_Output(self,other,"Info_Mine_Org_7_WichtigePersonen_07_02");	//Wenn Okyl etwas von dir will, solltest du allerdings nicht widersprechen. Er kann nämlich ziemlich ungemütlich werden.
};


instance Info_Mine_Org_7_DieLage(C_Info)
{
	nr = 1;
	condition = Info_Mine_Org_7_DieLage_Condition;
	information = Info_Mine_Org_7_DieLage_Info;
	permanent = 1;
	description = "Wie steht's?";
};


func int Info_Mine_Org_7_DieLage_Condition()
{
	return 1;
};

func void Info_Mine_Org_7_DieLage_Info()
{
	AI_Output(other,self,"Info_Mine_Org_7_DieLage_15_00");	//Wie steht's?
	AI_Output(self,other,"Info_Mine_Org_7_DieLage_07_01");	//Mann, geh mir nicht auf den Sack!
};


instance INFO_MINE_ORG_7_KAMPF(C_Info)
{
	nr = 90;
	condition = info_mine_org_7_kampf_condition;
	information = info_mine_org_7_kampf_info;
	permanent = 1;
	description = "(Kampf provozieren)";
};


func int info_mine_org_7_kampf_condition()
{
	return 1;
};

func void info_mine_org_7_kampf_info()
{
	AI_Output(other,self,"Info_Mine_Org_7_Kampf_15_00");	//Wie wärs wenn ich dir heute mal richtig in den Hintern trete?
	AI_Output(self,other,"Info_Mine_Org_7_Kampf_07_01");	//Wie wärs wenn ich dir heute mal schön die Fresse poliere, freundchen?
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_Attack,1,"");
};

func void B_AssignAmbientInfos_Mine_Org_7(var C_Npc slf)
{
	Info_Mine_Org_7_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Org_7_Mine.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Org_7_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Org_7_DieLage.npc = Hlp_GetInstanceID(slf);
	info_mine_org_7_kampf.npc = Hlp_GetInstanceID(slf);
};

