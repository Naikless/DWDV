
instance STT_335_Santino_Exit(C_Info)
{
	npc = STT_335_Santino;
	nr = 999;
	condition = STT_335_Santino_Exit_Condition;
	information = STT_335_Santino_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int STT_335_Santino_Exit_Condition()
{
	return 1;
};

func void STT_335_Santino_Exit_Info()
{
	AI_StopProcessInfos(self);
};


var int santino_trade;

instance STT_335_Santino_BUY(C_Info)
{
	npc = STT_335_Santino;
	condition = STT_335_Santino_BUY_Condition;
	information = STT_335_Santino_BUY_Info;
	important = 0;
	permanent = 1;
	description = "Bei dir kann ich tauschen?";
	trade = 1;
};


func int STT_335_Santino_BUY_Condition()
{
	return 1;
};

func void STT_335_Santino_BUY_Info()
{
	AI_Output(other,self,"STT_335_Santino_BUY_Info_15_01");	//Bei dir kann ich tauschen?
	AI_Output(self,other,"STT_335_Santino_BUY_Info_07_02");	//Ich habe alles, was du brauchst. Was ich nicht habe, willst du auch nicht.
	if(SANTINO_TRADE == FALSE)
	{
		Log_CreateTopic(GE_TraderOW,LOG_NOTE);
		B_LogEntry(GE_TraderOW,"Santino, ein Schatten innerhalb der Alten Mine handelt mit verschiedenen Waren. Er befindet sich immer auf der obersten Ebene.");
		SANTINO_TRADE = TRUE;
	};
};

