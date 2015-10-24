
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
	description = "Wie ist das Leben hier als W�chter der Bruderschaft?";
};


func int DIA_Tpl_1416_Torwache_Life_Condition()
{
	return 1;
};

func void DIA_Tpl_1416_Torwache_Life_Info()
{
	AI_Output(other,self,"DIA_Tpl_1416_Torwache_Life_15_00");	//Wie ist das Leben hier als W�chter der Bruderschaft?
	AI_Output(self,other,"DIA_Tpl_1416_Torwache_Life_08_01");	//Ich habe eine wichtige Aufgabe bekommen. Der Erleuchtete und seine J�nger verlassen sich auf mich.
	AI_Output(self,other,"DIA_Tpl_1416_Torwache_Life_08_02");	//Mein vorheriges Leben geh�rt der Vergangenheit an. Ab jetzt bin ich ein GOR NA - ein Templer des Schl�fers.
};
