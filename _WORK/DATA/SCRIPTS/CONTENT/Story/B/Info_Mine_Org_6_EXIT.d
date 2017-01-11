
instance Info_Mine_Org_6_EXIT(C_Info)
{
	nr = 999;
	condition = Info_Mine_Org_6_EXIT_Condition;
	information = Info_Mine_Org_6_EXIT_Info;
	permanent = 1;
	description = "ENDE";
};


func int Info_Mine_Org_6_EXIT_Condition()
{
	return 1;
};

func void Info_Mine_Org_6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance Info_Mine_Org_6_Mine(C_Info)
{
	nr = 1;
	condition = Info_Mine_Org_6_Mine_Condition;
	information = Info_Mine_Org_6_Mine_Info;
	permanent = 1;
	description = "Was läuft in der Mine?";
};


func int Info_Mine_Org_6_Mine_Condition()
{
	return 1;
};

func void Info_Mine_Org_6_Mine_Info()
{
	AI_Output(other,self,"Info_Mine_Org_6_Mine_15_00");	//Was läuft in der Mine?
	AI_Output(self,other,"Info_Mine_Org_6_Mine_06_01");	//In der Mine? Die Typen da drin sind unter sich, es kommt keiner rein und keiner raus.
	AI_Output(self,other,"Info_Mine_Org_6_Mine_06_02");	//Man kann froh sein, dass wir hier draußen sind.
};


instance Info_Mine_Org_6_WichtigePersonen(C_Info)
{
	nr = 1;
	condition = Info_Mine_Org_6_WichtigePersonen_Condition;
	information = Info_Mine_Org_6_WichtigePersonen_Info;
	permanent = 1;
	description = "Wer erteilt hier die Befehle?";
};


func int Info_Mine_Org_6_WichtigePersonen_Condition()
{
	return 1;
};

func void Info_Mine_Org_6_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Mine_Org_6_WichtigePersonen_15_00");	//Wer erteilt hier die Befehle?
	AI_Output(self,other,"Info_Mine_Org_6_WichtigePersonen_06_01");	//Mir erteilt hier niemand Befehle, aber man muss schon wissen, wie man das anstellt.
	AI_Output(other,self,"Info_Mine_Org_6_WichtigePersonen_15_01");	//Und wie stellt man das an?
	AI_Output(self,other,"Info_Mine_Org_6_WichtigePersonen_06_02");	//Berufsgeheimnis! Aber unter uns, als Bandit ist das gar nicht so schwer.
};


instance Info_Mine_Org_6_DieLage(C_Info)
{
	nr = 1;
	condition = Info_Mine_Org_6_DieLage_Condition;
	information = Info_Mine_Org_6_DieLage_Info;
	permanent = 1;
	description = "Scheinst Dich ja nicht gerade zu überarbeiten.";
};


func int Info_Mine_Org_6_DieLage_Condition()
{
	return 1;
};

func void Info_Mine_Org_6_DieLage_Info()
{
	AI_Output(other,self,"Info_Mine_Org_6_DieLage_15_00");	//Scheinst dich ja nicht gerade zu überarbeiten.
	AI_Output(self,other,"Info_Mine_Org_6_DieLage_06_01");	//Ich und arbeiten? Wenn ich arbeiten würde, wäre ich nicht hier in der Kuppel, wenn du verstehst was ich meine.
};


instance INFO_MINE_ORG_6_KAMPF(C_Info)
{
	nr = 90;
	condition = info_mine_org_6_kampf_condition;
	information = info_mine_org_6_kampf_info;
	permanent = 1;
	description = "(Kampf provozieren)";
};


func int info_mine_org_6_kampf_condition()
{
	return 1;
};

func void info_mine_org_6_kampf_info()
{
	AI_Output(other,self,"Info_Mine_Org_6_Kampf_15_00");	//Ich glaub' ich hau dir mal ein bisschen was auf's Maul.
	AI_Output(self,other,"Info_Mine_Org_6_Kampf_07_01");	//Ich glaub' nicht das du das schaffst. Kannst es ja mal versuchen.
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_Attack,1,"");
};

func void B_AssignAmbientInfos_Mine_Org_6(var C_Npc slf)
{
	Info_Mine_Org_6_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Org_6_Mine.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Org_6_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_Mine_Org_6_DieLage.npc = Hlp_GetInstanceID(slf);
	info_mine_org_6_kampf.npc = Hlp_GetInstanceID(slf);
};

