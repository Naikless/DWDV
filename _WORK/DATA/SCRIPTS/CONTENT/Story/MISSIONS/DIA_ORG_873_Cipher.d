
instance Org_873_Cipher_Exit(C_Info)
{
	npc = ORG_873_Cipher;
	nr = 999;
	condition = Org_873_Cipher_Exit_Condition;
	information = Org_873_Cipher_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Org_873_Cipher_Exit_Condition()
{
	return TRUE;
};

func void Org_873_Cipher_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance Org_873_Cipher_Hello(C_Info)
{
	npc = ORG_873_Cipher;
	nr = 1;
	condition = Org_873_Cipher_Hello_Condition;
	information = Org_873_Cipher_Hello_Info;
	permanent = 0;
	description = "Wie sieht's aus?";
};


func int Org_873_Cipher_Hello_Condition()
{
	return 1;
};

func void Org_873_Cipher_Hello_Info()
{
	AI_Output(other,self,"DIA_Cipher_Hello_15_00");	//Wie sieht's aus?
	AI_Output(self,other,"DIA_Cipher_Hello_12_01");	//Wir haben Gomez mal wieder ins Essen gespuckt.
	AI_Output(self,other,"DIA_Cipher_Hello_12_02");	//Drei tote Gardisten und 'ne ganze Menge Zeug zum Verhökern. Darauf trink ich!
	AI_Output(other,self,"DIA_Cipher_Hello_15_03");	//Du bist einer von den Jungs, die ständig das alte Lager überfallen?
	AI_Output(self,other,"DIA_Cipher_Hello_12_04");	//Nein. Nur wenn sich 'ne lohnende Gelegenheit bietet.
};


instance Org_873_Cipher_Fisk(C_Info)
{
	npc = ORG_873_Cipher;
	nr = 1;
	condition = Org_873_Cipher_Fisk_Condition;
	information = Org_873_Cipher_Fisk_Info;
	permanent = 1;
	description = "Fisk aus dem Alten Lager sucht einen Handelspartner.";
};


func int Org_873_Cipher_Fisk_Condition()
{
	if(Fisk_GetNewHehler == LOG_RUNNING)
	{
		return 1;
	};
};

func void Org_873_Cipher_Fisk_Info()
{
	AI_Output(other,self,"DIA_Cipher_Fisk_15_00");	//Fisk aus dem Alten Lager ist auf der Suche nach einem Handelspartner.
	AI_Output(self,other,"DIA_Cipher_Fisk_12_01");	//Kein Interesse.
	AI_Output(self,other,"DIA_Cipher_Fisk_12_02");	//Aber Sharky könnte sich dafür interessieren. Wenn du ihn findest, frag ihn.
};


var int Cipher_Trade;

instance Org_873_Cipher_FromBalor(C_Info)
{
	npc = ORG_873_Cipher;
	nr = 1;
	condition = Org_873_Cipher_FromBalor_Condition;
	information = Org_873_Cipher_FromBalor_Info;
	permanent = 1;
	description = "Was hast du anzubieten?";
};


func int Org_873_Cipher_FromBalor_Condition()
{
	if(Npc_KnowsInfo(hero,Org_873_Cipher_Hello))
	{
		return 1;
	};
};

func void Org_873_Cipher_FromBalor_Info()
{
	AI_Output(other,self,"DIA_Cipher_FromBalor_15_00");	//Was hast du anzubieten?
	AI_Output(self,other,"DIA_Cipher_FromBalor_12_01");	//Die Frage ist doch, was hast DU anzubieten. Ich bin nur an größeren Lieferungen interessiert.
	if(Balor_TellsNCDealer == TRUE)
	{
		AI_Output(other,self,"DIA_Cipher_FromBalor_15_02");	//Balor sagt, du hättest Interesse an etwas Sumpfkraut.
		AI_Output(self,other,"DIA_Cipher_FromBalor_12_03");	//Hmmm. Du willst also handeln?
		Cipher_Trade = TRUE;
	}
	else
	{
		AI_Output(other,self,"DIA_Cipher_FromBalor_15_04");	//Damit kann ich nicht dienen.
		AI_Output(self,other,"DIA_Cipher_FromBalor_12_05");	//Dann komm wieder, wenn du es kannst. 
	};
};


instance Org_873_Cipher_TRADE(C_Info)
{
	npc = ORG_873_Cipher;
	nr = 1;
	condition = Org_873_Cipher_TRADE_Condition;
	information = Org_873_Cipher_TRADE_Info;
	permanent = 1;
	description = "Lass uns handeln.";
	trade = 1;
};


func int Org_873_Cipher_TRADE_Condition()
{
	if(Cipher_Trade == TRUE)
	{
		return 1;
	};
};

func void Org_873_Cipher_TRADE_Info()
{
	AI_Output(other,self,"DIA_Cipher_TRADE_15_00");	//Lass uns handeln.
	AI_Output(self,other,"DIA_Cipher_TRADE_12_01");	//Was willst du haben?
};


instance ORG_873_CIPHER_BOTE(C_Info)
{
	npc = ORG_873_Cipher;
	nr = 1;
	condition = org_873_cipher_bote_condition;
	information = org_873_cipher_bote_info;
	permanent = 0;
	important = 1;
};


func int org_873_cipher_bote_condition()
{
	if((Npc_GetTrueGuild(hero) == GIL_NOV) || (Npc_GetTrueGuild(hero) == GIL_TPL) || (Npc_GetTrueGuild(hero) == GIL_GUR))
	{
		return 1;
	};
};

func void org_873_cipher_bote_info()
{
	AI_Output(self,other,"DIA_Cipher_BOTE_15_00");	//Hey du! Du bist doch aus dem Lager der Sekte, oder? Ich hätt' was zu tun für einen wie dich.
	AI_Output(other,self,"DIA_Cipher_BOTE_12_01");	//Um was geht's?
	AI_Output(self,other,"DIA_Cipher_BOTE_15_01");	//Balor, einer von euren Leuten, hat mir vor kurzem eine Lieferung zukommen lassen. Da du dich ja im Sektenlager rumtreibst, kannst du ihm auch seine Bezahlung bringen.
	AI_Output(self,other,"DIA_Cipher_BOTE_15_02");	//Hier, 50 Erz.
	AI_Output(self,other,"DIA_Cipher_BOTE_15_03");	//Sag' ihm einfach das ich dich schicke und er weiß schon bescheid.
	AI_StopProcessInfos(self);
	CreateInvItems(self,ItMiNugget,50);
	B_GiveInvItems(self,other,ItMiNugget,50);
	CIPHER_PAYMENT = LOG_RUNNING;
	Log_CreateTopic(CH1_CIPHERDELIEVERED,LOG_MISSION);
	Log_SetTopicStatus(CH1_CIPHERDELIEVERED,LOG_RUNNING);
	B_LogEntry(CH1_CIPHERDELIEVERED,"Cipher, einer der Hehler aus dem Neuen Lager, gab mir einen Botenauftrag. Ich soll Balor, einem Novizen aus dem Sumpflager seine Bezahlung zukommen lassen, für eine - Lieferung - die er Cipher hat zukommen lassen. Es handelt sich dabei um 50 Erz.");
};

