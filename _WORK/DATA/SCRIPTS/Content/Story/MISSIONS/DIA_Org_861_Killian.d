
instance ORG_861_Killian_Exit(C_Info)
{
	npc = Org_861_Killian;
	nr = 999;
	condition = ORG_861_Killian_Exit_Condition;
	information = ORG_861_Killian_Exit_Info;
	important = 0;
	permanent = 1;
	description = "ENDE";
};


func int ORG_861_Killian_Exit_Condition()
{
	return TRUE;
};

func void ORG_861_Killian_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance ORG_861_Killian_GetLost(C_Info)
{
	npc = Org_861_Killian;
	nr = 1;
	condition = ORG_861_Killian_GetLost_Condition;
	information = ORG_861_Killian_GetLost_Info;
	permanent = 1;
	important = 1;
};


func int ORG_861_Killian_GetLost_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return 1;
};
};

func void ORG_861_Killian_GetLost_Info()
{
	AI_Output(self,other,"Org_861_Killian_GetLost_Info_13_00");	//Verpiß dich!
	AI_StopProcessInfos(self);
};


instance ORG_861_KILLIAN_WORK(C_Info)
{
	npc = Org_861_Killian;
	condition = org_861_killian_work_condition;
	information = org_861_killian_work_info;
	important = 0;
	permanent = 0;
	description = "Wie steht's denn so?";
};


func int org_861_killian_work_condition()
{
	return TRUE;
};

func void org_861_killian_work_info()
{
	AI_Output(other,self,"DIA_Gravo_Hallo_15_00");	//Wie steht's denn so?
	AI_Output(self,other,"Org_861_Killian_WORK_Info_13_02");	//Lass mich in Ruhe! Ich bin beschäftigt!
};


instance ORG_861_KILLIAN_DEAL(C_Info)
{
	npc = Org_861_Killian;
	condition = org_861_killian_deal_condition;
	information = org_861_killian_deal_info;
	important = 0;
	permanent = 0;
	description = "Wie läufts Kumpel?";
};


func int org_861_killian_deal_condition()
{
	if(idiots_deal == TRUE)
	{
		return TRUE;
	};
};

func void org_861_killian_deal_info()
{
	AI_Output(other,self,"Org_861_Killian_DEAL_Info_15_01");	//Wie läuft's Kumpel?
	AI_Output(self,other,"Org_861_Killian_DEAL_Info_13_02");	//Wir haben zwar eine Abmachung, aber ich bin nicht dein Kumpel, Penner!
};


instance ORG_861_KILLIAN_LOST(C_Info)
{
	npc = Org_861_Killian;
	condition = org_861_killian_lost_condition;
	information = org_861_killian_lost_info;
	important = 0;
	permanent = 0;
	description = "Und du penner? Hältst du jetzt die Füße still?";
};


func int org_861_killian_lost_condition()
{
	var C_Npc Killian;
	Killian = Hlp_GetNpc(Org_861_Killian);
//	Killian.aivar[AIV_WASDEFEATEDBYSC];
	if((Killian.aivar[AIV_WASDEFEATEDBYSC] == TRUE) && (Kalom_DrugMonopol == LOG_RUNNING) && Npc_KnowsInfo(hero,org_860_renyu_deal) && (idiots_deal == FALSE))
	{
		return TRUE;
	};
};

func void org_861_killian_lost_info()
{
	AI_Output(other,self,"Org_861_Killian_LOST_Info_15_01");	//Und du Penner? Hältst du jetzt die Füße still?
	AI_Output(self,other,"Org_861_Killian_LOST_Info_13_02");	//Hey KUMPEL, ich wusste ja nicht, dass die Bruderschaft da soviel Wert darauf legt!
	AI_Output(other,self,"Org_861_Killian_LOST_Info_15_03");	//Ich bin nicht dein Kumpel, Penner! 
	Kalom_DrugMonopol = LOG_SUCCESS;
	Npc_ExchangeRoutine(self,"ARBEITSLOS");
};

