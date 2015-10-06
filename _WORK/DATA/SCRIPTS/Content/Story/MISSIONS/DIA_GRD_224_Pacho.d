
instance Info_Pacho_EXIT(C_Info)
{
	npc = GRD_224_Pacho;
	nr = 999;
	condition = Info_Pacho_EXIT_Condition;
	information = Info_Pacho_EXIT_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Info_Pacho_EXIT_Condition()
{
	return TRUE;
};

func void Info_Pacho_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance Info_Pacho_STOP(C_Info)
{
	npc = GRD_224_Pacho;
	condition = Info_Pacho_STOP_Condition;
	information = Info_Pacho_STOP_Info;
	important = 1;
	permanent = 0;
};


func int Info_Pacho_STOP_Condition()
{
	return TRUE;
};

func void Info_Pacho_STOP_Info()
{
	AI_Output(self,hero,"Info_Pacho_STOP_13_01");	//Hey, du!
	AI_Output(hero,self,"Info_Pacho_STOP_15_02");	//Wer? Ich?
	AI_Output(self,hero,"Info_Pacho_STOP_13_03");	//Nein, ich mein deine Großmutter ... Natürlich mein ich dich!
	AI_Output(self,hero,"Info_Pacho_STOP_13_04");	//Wenn ich du wäre, dann würde ich diesen Weg hier nicht weitergehen!
	AI_Output(hero,self,"Info_Pacho_STOP_15_05");	//Warum nicht?
	AI_Output(self,hero,"Info_Pacho_STOP_13_06");	//Du scheinst wirklich neu hier zu sein!
	AI_Output(self,hero,"Info_Pacho_STOP_13_07");	//Mann, hier geht es ins Orkgebiet!
	AI_Output(self,hero,"Info_Pacho_STOP_13_08");	//Die machen Kleinholz aus dir!
	AI_Output(hero,self,"Info_Pacho_STOP_15_09");	//Oh.
	AI_Output(self,hero,"Info_Pacho_STOP_13_10");	//Gern geschehen!
	AI_StopProcessInfos(self);
};


instance INFO_PACHO_MESSAGE(C_Info)
{
	npc = GRD_224_Pacho;
	condition = info_pacho_message_condition;
	information = info_pacho_message_info;
	important = 0;
	permanent = 0;
	description = "Ich habe 'ne Nachricht für dich.";
};


func int info_pacho_message_condition()
{
	return TRUE;
};

func void info_pacho_message_info()
{
	AI_Output(hero,self,"Info_Pacho_Message_15_02");	//Ich habe 'ne Nachricht für dich.
	AI_Output(self,hero,"Info_Pacho_Message_13_01");	//Ach ja?
	AI_Output(hero,self,"Info_Pacho_Message_15_03");	//Dein Kumpel Orry lässt ausrichten, dass die nächste Runde auf ihn geht.
	AI_Output(self,hero,"Info_Pacho_Message_15_04");	//Okay. Ich weiß bescheid. Hehe.
	ORRY_MESSAGE = LOG_SUCCESS;
	B_LogEntry(CH1_MESSAGEPACHO,"Ich habe Pacho die Nachricht überbracht und bekam keine weiteren Infos darüber, was damit gemeint war. Naja, immerhin war mir Pacho dankbar.");
	Log_SetTopicStatus(CH1_MESSAGEPACHO,LOG_SUCCESS);
	B_GiveXP(XP_PACHOMESSAGE);
	AI_StopProcessInfos(self);
};

