
instance STT_300_Alberto_Exit(C_Info)
{
	npc = STT_300_Alberto;
	nr = 999;
	condition = STT_300_Alberto_Exit_Condition;
	information = STT_300_Alberto_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int STT_300_Alberto_Exit_Condition()
{
	return 1;
};

func void STT_300_Alberto_Exit_Info()
{
	AI_StopProcessInfos(self);
};


var int alberto_trade;

instance STT_300_Alberto_BUY(C_Info)
{
	npc = STT_300_Alberto;
	condition = STT_300_Alberto_BUY_Condition;
	information = STT_300_Alberto_BUY_Info;
	important = 0;
	permanent = 1;
	description = "Bei dir kann ich tauschen?";
	trade = 1;
};


func int STT_300_Alberto_BUY_Condition()
{
	return 1;
};

func void STT_300_Alberto_BUY_Info()
{
	AI_Output(other,self,"STT_300_Alberto_BUY_Info_15_01");	//Bei dir kann ich tauschen?
	AI_Output(self,other,"STT_300_Alberto_BUY_Info_12_02");	//Jupp. Alles, was du willst. Wenn du Erz hast.
	if(ALBERTO_TRADE == FALSE)
	{
		Log_CreateTopic(GE_TraderOW,LOG_NOTE);
		B_LogEntry(GE_TraderOW,"Alberto, einer der Schatten der Alten Mine handelt mit Waren der Alten Mine. Er befindet sich auf der Hauptebene.");
		ALBERTO_TRADE = TRUE;
	};
};

