
instance DIA_Tpl_1416_Torwache_Exit(C_Info)
{
	npc = TPL_1416_Templer;
	nr = 999;
	condition = DIA_Tpl_1416_Torwache_Exit_Condition;
	information = DIA_Tpl_1416_Torwache_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Tpl_1416_Torwache_Exit_Condition()
{
	return 1;
};

func void DIA_Tpl_1416_Torwache_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Tpl_1416_Torwache_Life(C_Info)
{
	npc = TPL_1416_Templer;
	nr = 1;
	condition = DIA_Tpl_1416_Torwache_Life_Condition;
	information = DIA_Tpl_1416_Torwache_Life_Info;
	permanent = 1;
	description = "Wie ist das Leben hier als Wächter der Bruderschaft?";
};


func int DIA_Tpl_1416_Torwache_Life_Condition()
{
	return 1;
};

func void DIA_Tpl_1416_Torwache_Life_Info()
{
	AI_Output(other,self,"DIA_Tpl_1416_Torwache_Life_15_00");	//Wie ist das Leben hier als Wächter der Bruderschaft?
	AI_Output(self,other,"DIA_Tpl_1416_Torwache_Life_08_01");	//Ich habe eine wichtige Aufgabe bekommen. Der Erleuchtete und seine Jünger verlassen sich auf mich.
	AI_Output(self,other,"DIA_Tpl_1416_Torwache_Life_08_02");	//Mein vorheriges Leben gehört der Vergangenheit an. Ab jetzt bin ich ein GOR NA - ein Templer des Schläfers.
};


instance DIA_TPL_1416_TORWACHE_DARRION(C_Info)
{
	npc = TPL_1416_Templer;
	nr = 1;
	condition = dia_tpl_1416_torwache_darrion_condition;
	information = dia_tpl_1416_torwache_darrion_info;
	permanent = 0;
	important = 1;
};


func int dia_tpl_1416_torwache_darrion_condition()
{
	if(((FreemineOrc_LookingUlumulu == LOG_SUCCESS) && (Npc_GetTrueGuild(hero) == GIL_NOV)) || ((Npc_GetTrueGuild(hero) == GIL_TPL) && (FreemineOrc_LookingUlumulu == LOG_SUCCESS)))
	{
		return 1;
	};
};

func void dia_tpl_1416_torwache_darrion_info()
{
	AI_Output(self,other,"DIA_Tpl_1416_Torwache_Darrion_15_00");	//Hey du! Darrion will dich sprechen.
	AI_Output(other,self,"DIA_Tpl_1416_Torwache_Darrion_08_01");	//Was will er denn?
	AI_Output(self,other,"DIA_Tpl_1416_Torwache_Darrion_08_02");	//Das wird er dir schon sagen wenn du bei ihm bist. Er wartet wie üblich bei der Schmiede auf dich.
};

