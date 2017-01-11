
instance Tpl_1436_Templer_Exit(C_Info)
{
	npc = TPL_1436_Templer;
	nr = 999;
	condition = Tpl_1436_Templer_Exit_Condition;
	information = Tpl_1436_Templer_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Tpl_1436_Templer_Exit_Condition()
{
	return TRUE;
};

func void Tpl_1436_Templer_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance Tpl_1436_Templer_CRAWLER(C_Info)
{
	npc = TPL_1436_Templer;
	condition = Tpl_1436_Templer_CRAWLER_Condition;
	information = Tpl_1436_Templer_CRAWLER_Info;
	important = 0;
	permanent = 1;
	description = "Was liegt an?";
};


func int Tpl_1436_Templer_CRAWLER_Condition()
{
	return TRUE;
};

func void Tpl_1436_Templer_CRAWLER_Info()
{
	AI_Output(other,self,"Tpl_1436_Templer_CRAWLER_Info_15_01");	//Was liegt an?
	AI_Output(self,other,"Tpl_1436_Templer_CRAWLER_Info_13_02");	//Wir sind hier, um die Crawler zu jagen. Das wir damit gleichzeitig die Buddler beschützen, kann allen Beteiligten ja nur Recht sein.
	AI_Output(self,other,"Tpl_1436_Templer_CRAWLER_Info_13_03");	//Was wir aber wirklich wollen, ist das Sekret der Crawler. Aus dem Sekret der Minecrawler-Zangen braut unser Guru Cor Kalom magische Tränke.
};

