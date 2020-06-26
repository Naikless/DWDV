
instance GRD_261_Brandick_Exit(C_Info)
{
	npc = GRD_261_Brandick;
	nr = 999;
	condition = GRD_261_Brandick_Exit_Condition;
	information = GRD_261_Brandick_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int GRD_261_Brandick_Exit_Condition()
{
	return 1;
};

func void GRD_261_Brandick_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance GRD_261_Brandick_ALEPH(C_Info)
{
	npc = GRD_261_Brandick;
	condition = GRD_261_Brandick_ALEPH_Condition;
	information = GRD_261_Brandick_ALEPH_Info;
	important = 0;
	permanent = 0;
	description = "(Aleph anschwärzen)";
};


func int GRD_261_Brandick_ALEPH_Condition()
{
	if(Npc_KnowsInfo(hero,VLK_585_Aleph_GUARDS))
	{
		return 1;
	};
};

func void GRD_261_Brandick_ALEPH_Info()
{
	AI_Output(other,self,"GRD_261_Brandick_ALEPH_Info_15_01");	//Hör mal, wenn du nicht da bist, sitzt Aleph die ganze Zeit nur rum, ohne zu arbeiten.
	AI_Output(self,other,"GRD_261_Brandick_ALEPH_Info_06_02");	//Ist das so?
	AI_Output(self,other,"GRD_261_Brandick_ALEPH_Info_06_03");	//Weißt du, was ich noch viel weniger leiden kann als Faulpelze? Das sind Verräter. Also geh mir aus den Augen!
	AI_StopProcessInfos(self);
};


instance GRD_261_BRANDICK_WANNA(C_Info)
{
	npc = GRD_261_Brandick;
	condition = grd_261_brandick_wanna_condition;
	information = grd_261_brandick_wanna_info;
	important = 1;
	permanent = 0;
};


func int grd_261_brandick_wanna_condition()
{
	return 1;
};

func void grd_261_brandick_wanna_info()
{
	AI_Output(self,other,"GRD_261_Brandick_WANNA_Info_15_01");	//Hey Junge, du könntest mir einen gefallen tun anstatt hier rumzurennen.
	AI_Output(other,self,"GRD_261_Brandick_WANNA_Info_06_02");	//Was denn?
	AI_Output(self,other,"GRD_261_Brandick_WANNA_Info_06_03");	//Besorg' mir mal ein Bier. Ich steh' schon den ganzen Tag hier rum und könnte jetzt was gutes vertragen.
	AI_Output(self,other,"GRD_261_Brandick_WANNA_Info_06_04");	//Geh' am besten zum Hauptschacht, die haben bestimmt Bier da.
	BRANDICK_BEER = LOG_RUNNING;
	Log_CreateTopic(CH1_BRANDICKBEER,LOG_MISSION);
	Log_SetTopicStatus(CH1_BRANDICKBEER,LOG_RUNNING);
	B_LogEntry(CH1_BRANDICKBEER,"Brandick, einer der Gardisten der alten Mine bat mich darum ihm ein Bier zu besorgen. Ich solle mal im Hauptschacht nachsehen, da finde ich mit Sicherheit etwas.");
};


instance GRD_261_BRANDICK_BEER(C_Info)
{
	npc = GRD_261_Brandick;
	condition = grd_261_brandick_beer_condition;
	information = grd_261_brandick_beer_info;
	important = 0;
	permanent = 0;
	description = "Hier hast du dein Bier.";
};


func int grd_261_brandick_beer_condition()
{
	if(Npc_HasItems(other,ItFoBeer) > 0)
	{
		return 1;
	};
};

func void grd_261_brandick_beer_info()
{
	AI_Output(other,self,"GRD_261_Brandick_BEER_Info_15_01");	//Hier hast du dein Bier.
	AI_Output(self,other,"GRD_261_Brandick_BEER_Info_06_02");	//Danke, dass hab' ich jetzt gebraucht.
	B_GiveInvItems(other,self,ItFoBeer,1);
	AI_UseItem(self,ItFoBeer);
	AI_Output(self,other,"GRD_261_Brandick_BEER_Info_06_03");	//So, hier hast du 10 Erz für deine Mühe.
	CreateInvItems(self,ItMiNugget,10);
	B_GiveInvItems(self,other,ItMiNugget,10);
	AI_Output(self,other,"GRD_261_Brandick_BEER_Info_06_04");	//Jetzt sieh' zu das du wieder ans arbeiten kommst.
	BRANDICK_BEER = LOG_SUCCESS;
	Log_SetTopicStatus(CH1_BRANDICKBEER,LOG_SUCCESS);
	B_LogEntry(CH1_BRANDICKBEER,"Brandick konnte seinen Durst löschen und gab mir als Belohnung für das Bier 10 Erz.");
	B_GiveXP(XP_BRANDICKBEER);
};

