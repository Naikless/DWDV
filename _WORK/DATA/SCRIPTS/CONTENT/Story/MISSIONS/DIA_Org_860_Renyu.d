
instance Info_Renyu_EXIT(C_Info)
{
	npc = Org_860_Renyu;
	nr = 999;
	condition = Info_Renyu_EXIT_Condition;
	information = Info_Renyu_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Info_Renyu_EXIT_Condition()
{
	return 1;
};

func void Info_Renyu_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance ORG_860_Renyu_GetLost(C_Info)
{
	npc = Org_860_Renyu;
	nr = 1;
	condition = ORG_860_Renyu_GetLost_Condition;
	information = ORG_860_Renyu_GetLost_Info;
	permanent = 1;
	important = 1;
};


func int ORG_860_Renyu_GetLost_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return 1;
};
};

func void ORG_860_Renyu_GetLost_Info()
{
	AI_Output(self,other,"Org_860_Renyu_GetLost_Info_06_00");	//Verpiß dich!
	AI_StopProcessInfos(self);
};


instance ORG_860_RENYU_DEAL(C_Info)
{
	npc = Org_860_Renyu;
	condition = org_860_renyu_deal_condition;
	information = org_860_renyu_deal_info;
	important = 0;
	permanent = 0;
	description = "Ich bin hier, um euch ein Angebot zu unterbreiten.";
};


func int org_860_renyu_deal_condition()
{
	if(Npc_KnowsInfo(hero,org_862_jacko_angebot) && (Kalom_DrugMonopol == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void org_860_renyu_deal_info()
{
	AI_Output(other,self,"ORG_860_Renyu_DEAL_Info_15_01");	//Ich bin hier, um euch ein Angebot zu unterbreiten.
	AI_Output(self,other,"ORG_860_Renyu_DEAL_Info_06_02");	//Da bin ich ja mal gespannt, um was geht's?
	AI_Output(other,self,"ORG_860_Renyu_DEAL_Info_15_03");	//Die Bruderschaft weiß, was ihr hier veranstaltet. Sie schicken mich um dafür zu sorgen das ihr aufhört!
	AI_Output(self,other,"ORG_860_Renyu_DEAL_Info_06_04");	//Komm zur Sache!
	Info_ClearChoices(org_860_renyu_deal);
	Info_AddChoice(org_860_renyu_deal,"Gebt mir 500 Erz.",org_860_renyu_deal_500);
	Info_AddChoice(org_860_renyu_deal,"Gebt mir 250 Erz.",org_860_renyu_deal_250);
};

func void org_860_renyu_deal_500()
{
	var C_Npc Killian;
	var C_Npc Jacko;
	AI_Output(other,self,"ORG_860_Renyu_DEAL_500_Info_15_01");	//Gebt mir 500 Erz, dann sorge ich dafür, dass die Bruderschaft euch in Ruhe lässt.
	AI_Output(self,other,"ORG_860_Renyu_DEAL_500_Info_06_02");	//Und wenn wir nicht zahlen? Was machst du dann?
	AI_Output(other,self,"ORG_860_Renyu_DEAL_500_Info_15_03");	//Dann schicke ich euch ein paar Templer vorbei, die bekommen alle einen dicken Sack Kraut von mir, wenn sich euch fertigmachen!
	AI_Output(self,other,"ORG_860_Renyu_DEAL_500_Info_06_04");	//Weißt du, ich denke wir sollten der Bruderschaft zeigen, dass wir es ernst meinen. Wir schicken ihnen deine Überreste, als Warnung! 
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,hero);
	AI_StartState(self,ZS_Attack,1,"");
	Killian = Hlp_GetNpc(Org_861_Killian);
	Npc_SetTarget(Killian,hero);
	AI_StartState(Killian,ZS_Attack,1,"");
	Jacko = Hlp_GetNpc(Org_862_Jacko);
	Npc_SetTarget(Jacko,hero);
	AI_StartState(Jacko,ZS_Attack,1,"");
};

func void org_860_renyu_deal_250()
{
	AI_Output(other,self,"ORG_860_Renyu_DEAL_250_Info_15_01");	//Gebt mir 250 Erz, dann sorge ich dafür, dass die Bruderschaft euch in Ruhe lässt.
	AI_Output(self,other,"ORG_860_Renyu_DEAL_250_Info_06_02");	//Hmmm.... nun gut. Einverstanden. Aber wenn du versuchst, mich reinzulegen, dann wirst du dir wünschen mich nie getroffen zu haben. Haben wir eine Abmachung? 
	AI_Output(other,self,"ORG_860_Renyu_DEAL_250_Info_15_03");	//Klar, her mit dem Erz!
	Info_ClearChoices(org_860_renyu_deal);
	CreateInvItems(self,ItMiNugget,250);
	B_GiveInvItems(self,other,ItMiNugget,250);
	idiots_deal = TRUE;
	B_LogEntry(CH1_DrugMonopol,"Ich habe von Renyu 250 Erz bekommen. Im Gegenzug dazu, darf er weiterarbeiten.");
	Kalom_DrugMonopol = LOG_FAILED;
	Log_SetTopicStatus(CH1_DrugMonopol,LOG_FAILED);
	Info_Kalom_Success.permanent = 0;
};


instance ORG_860_RENYU_LOST(C_Info)
{
	npc = Org_860_Renyu;
	condition = org_860_renyu_lost_condition;
	information = org_860_renyu_lost_info;
	important = 0;
	permanent = 0;
	description = "Was sagst du jetzt? Du mieser Schwächling! ";
};


func int org_860_renyu_lost_condition()
{
	var C_Npc Renyu;
	Renyu = Hlp_GetNpc(Org_860_Renyu);
	if(	(Renyu.aivar[AIV_WASDEFEATEDBYSC] == TRUE) && Npc_KnowsInfo(hero,org_860_renyu_deal) && (Kalom_DrugMonopol == LOG_RUNNING) && (idiots_deal == FALSE))
	{
		return TRUE;
	};
};

func void org_860_renyu_lost_info()
{
	AI_Output(other,self,"Org_861_Killian_WORK_Info_15_01");	//Was sagst du jetzt? Du mieser Schwächling! 
	AI_Output(self,other,"ORG_860_Renyu_LOST_Info_06_02");	//In Ordnung, mann du hast gewonnen! Wir werden aufhören! Das Kraut gehört dir!
	Stooges_Fled = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"ARBEITSLOS");
	B_ExchangeRoutine(Org_861_Killian,"ARBEITSLOS");
	B_ExchangeRoutine(Org_862_Jacko,"ARBEITSLOS");
	B_LogEntry(CH1_DrugMonopol,"Ich konnte Renyu davon überzeugen, sein kleines Unternehmen aufzulösen.");
	B_GiveXP(XP_JackoRetired);
};

