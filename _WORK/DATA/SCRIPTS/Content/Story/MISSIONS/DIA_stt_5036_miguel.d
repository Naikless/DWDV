
instance STT_5036_MIGUEL_EXIT(C_Info)
{
	npc = stt_5036_miguel;
	nr = 999;
	condition = stt_5036_miguel_exit_condition;
	information = stt_5036_miguel_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int stt_5036_miguel_exit_condition()
{
	return 1;
};

func void stt_5036_miguel_exit_info()
{
	AI_StopProcessInfos(self);
};


instance STT_5036_MIGUEL_HELLO(C_Info)
{
	npc = stt_5036_miguel;
	condition = stt_5036_miguel_hello_condition;
	information = stt_5036_miguel_hello_info;
	important = 0;
	permanent = 0;
	description = "Wer bist du?";
};


func int stt_5036_miguel_hello_condition()
{
	return 1;
};

func void stt_5036_miguel_hello_info()
{
	AI_Output(other,self,"STT_5036_Miguel_Hello_Info_15_01");	//Wer bist du?
	AI_Output(self,other,"STT_5036_Miguel_Hello_Info_07_02");	//Ich bin Miguel. Ich handle mit Kräutern und Pflanzen, die du im Wald und im Gebirge finden kannst.
	AI_Output(self,other,"STT_5036_Miguel_Hello_Info_07_03");	//Wenn du welche findest, kannst du sie mir verkaufen. Im Austausch dazu, hab' ich noch eine Menge anderer Sachen.
	AI_Output(self,other,"STT_5036_Miguel_Hello_Info_07_04");	//Ich kann dir auch was über die Kräuter und Pflanzen erzählen, die hier in der Kolonie zu finden sind.
	Log_CreateTopic(GE_TraderOW,LOG_NOTE);
	B_LogEntry(GE_TraderOW,"Miguel, einer der Schatten, handelt mit Kräutern und Pflanzen. Für gewöhnlich befindet er sich im Lager vor der Alten Mine.");
};


instance STT_5036_MIGUEL_TRADE(C_Info)
{
	npc = stt_5036_miguel;
	condition = stt_5036_miguel_trade_condition;
	information = stt_5036_miguel_trade_info;
	important = 0;
	permanent = 1;
	description = "Ich will handeln.";
	trade = 1;
};


func int stt_5036_miguel_trade_condition()
{
	if(Npc_KnowsInfo(hero,stt_5036_miguel_hello))
	{
		return 1;
	};
};

func void stt_5036_miguel_trade_info()
{
	AI_Output(other,self,"STT_5036_Miguel_Trade_Info_15_01");	//Ich will handeln.
	AI_Output(self,other,"STT_5036_Miguel_Trade_Info_07_02");	//Dann zeig' mal was du hast.
};


instance STT_5036_MIGUEL_ERZAEHL(C_Info)
{
	npc = stt_5036_miguel;
	condition = stt_5036_miguel_erzaehl_condition;
	information = stt_5036_miguel_erzaehl_info;
	important = 0;
	permanent = 1;
	description = "Erzähl mir was über Pflanzen.";
};


func int stt_5036_miguel_erzaehl_condition()
{
	if(Npc_KnowsInfo(hero,stt_5036_miguel_hello))
	{
		return 1;
	};
};

func void stt_5036_miguel_erzaehl_info()
{
	AI_Output(other,self,"STT_5036_Miguel_Erzaehl_Info_15_01");	//Erzähl mir was über Pflanzen.
	AI_Output(self,other,"STT_5036_Miguel_Erzaehl_Info_07_02");	//Was willst du wissen?
	Info_ClearChoices(stt_5036_miguel_erzaehl);
	Info_AddChoice(stt_5036_miguel_erzaehl,DIALOG_BACK,info_miguel_erzaehl_back);
	Info_AddChoice(stt_5036_miguel_erzaehl,"Was ist mit Heilpflanzen?",info_miguel_erzaehl_heal);
	Info_AddChoice(stt_5036_miguel_erzaehl,"Wie sieht es mit Manapflanzen aus?",info_miguel_erzaehl_mana);
	Info_AddChoice(stt_5036_miguel_erzaehl,"Was gibt es über spezielle Pflanzen zu wissen?",info_miguel_erzaehl_special);
};

func void info_miguel_erzaehl_back()
{
	Info_ClearChoices(stt_5036_miguel_erzaehl);
};

func void info_miguel_erzaehl_heal()
{
	AI_Output(other,self,",	Info_Miguel_Erzaehl_Heal_15_01");	//Was ist mit Heilpflanzen?
	AI_Output(self,other,",	Info_Miguel_Erzaehl_Heal_12_02");	//Es gibt drei verschiedene Arten von Heilpflanzen. Es gibt einmal leichte, mittlere und starke Heilpflanzen.
	AI_Output(self,other,",	Info_Miguel_Erzaehl_Heal_12_03");	//Heilpflanzen kannst du entweder einnehmen, oder aber du verarbeitest sie an einem Alchemietisch.
	AI_Output(self,other,",	Info_Miguel_Erzaehl_Heal_12_04");	//Verarbeitest du sie an einem Alchemietisch, lassen sich Heiltränke herstellen. Je stärker die Pflanze ist, desto besser wird der Heiltrank.
};

func void info_miguel_erzaehl_mana()
{
	AI_Output(other,self,",	Info_Miguel_Erzaehl_Mana_15_01");	//Wie sieht es mit Manapflanzen aus?
	AI_Output(self,other,",	Info_Miguel_Erzaehl_Mana_12_02");	//Es gibt drei verschiedene Arten von Manapflanzen. Es gibt einmal leichte, mittlere und starke Manapflanzen.
	AI_Output(self,other,",	Info_Miguel_Erzaehl_Mana_12_03");	//Manapflanzen kannst du entweder sofort einsetzen, oder aber du verarbeitest sie an einem Alchemietisch.
	AI_Output(self,other,",	Info_Miguel_Erzaehl_Mana_12_04");	//Verarbeitest du sie an einem Alchemietisch, lassen sich Manatränke herstellen. Je stärker die Pflanze ist, desto besser wird der Manatrank.
};

func void info_miguel_erzaehl_special()
{
	AI_Output(other,self,",	Info_Miguel_Erzaehl_Special_15_01");	//Was gibt es über spezielle Pflanzen zu wissen?
	AI_Output(self,other,",	Info_Miguel_Erzaehl_Special_12_02");	//Es gibt Pflanzen, die sehr schwer zu finden sind. Diese haben aber auch eine außergewöhnliche Wirkung.
	AI_Output(self,other,",	Info_Miguel_Erzaehl_Special_12_03");	//Neben seltenen Pflanzen gibt es auch Beeren, Samen und Moos.
	AI_Output(self,other,",	Info_Miguel_Erzaehl_Special_12_04");	//Es gibt Tränke die sich nur mit diesen seltenen Zutaten herstellen lassen. Dementsprechend hoch ist auch der Preis, den Händler wie ich für diese Pflanzen zahlen.
};


instance STT_5036_MIGUEL_GARAZ(C_Info)
{
	npc = stt_5036_miguel;
	condition = stt_5036_miguel_garaz_condition;
	information = stt_5036_miguel_garaz_info;
	important = 0;
	permanent = 0;
	description = "Kannst du mir was über Garaz erzählen?";
};


func int stt_5036_miguel_garaz_condition()
{
	if(Npc_KnowsInfo(hero,info_grd_5037_garaz_tax) && (ERZ_SCHULDEN == LOG_RUNNING))
	{
		return 1;
	};
};

func void stt_5036_miguel_garaz_info()
{
	AI_Output(other,self,"STT_5036_Miguel_Garaz_Info_15_01");	//Kannst du mir was über Garaz erzählen?
	AI_Output(self,other,"STT_5036_Miguel_Garaz_Info_07_02");	//Was willst du denn wissen?
	AI_Output(other,self,"STT_5036_Miguel_Garaz_Info_07_03");	//Ich müsste wirklich dringend den Schlüssel zu seiner Truhe haben. Leider trägt er den immer bei sich.
	AI_Output(self,other,"STT_5036_Miguel_Garaz_Info_07_04");	//Ach so sieht die Sache aus. Hehe.
	AI_Output(self,other,"STT_5036_Miguel_Garaz_Info_07_05");	//Nun gut, wenn du seinen Schlüssel willst, gibt es zwei Möglichkeiten, wie du an ihn rankommst.
	AI_Output(self,other,"STT_5036_Miguel_Garaz_Info_07_06");	//Du kannst ihm den Schlüssel einfach aus der Tasche stehlen...
	AI_Output(self,other,"STT_5036_Miguel_Garaz_Info_07_07");	//...oder aber du nutzt seine Schwäche aus.
	AI_Output(other,self,"STT_5036_Miguel_Garaz_Info_07_08");	//Was für eine Schwäche?
	AI_Output(self,other,"STT_5036_Miguel_Garaz_Info_07_09");	//Gib' ihm eine Flasche Wein. Davon wird er ziemlich schnell betrunken. Danach sollte es kein Problem mehr sein an seinen Schlüssel zu kommen.
	AI_Output(other,self,"STT_5036_Miguel_Garaz_Info_07_10");	//Danke, mach's gut!
	AI_Output(self,other,"STT_5036_Miguel_Garaz_Info_07_11");	//Kein Problem, dass wird ihm eine Lehre sein immer auf meinem - Gemüse - wie er es nennt herumzutrampeln.
	B_LogEntry(CH1_SCHULDEN,"Miguel meint, dass ich Garaz eine Flasche Wein ausgeben solle. Danach soll sein Schlüssel kein Problem mehr sein.");
};

