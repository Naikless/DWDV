
instance Tpl_1438_Templer_Exit(C_Info)
{
	npc = TPL_1438_Templer;
	nr = 999;
	condition = Tpl_1438_Templer_Exit_Condition;
	information = Tpl_1438_Templer_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Tpl_1438_Templer_Exit_Condition()
{
	return 1;
};

func void Tpl_1438_Templer_Exit_Info()
{
	AI_Output(other,self,"Tpl_1438_Templer_Exit_Info_15_01");	//Bis dann.
	AI_Output(self,other,"Tpl_1438_Templer_Exit_Info_13_02");	//M�ge der Schl�fer erwachen!
	AI_StopProcessInfos(self);
};


instance Tpl_1438_Templer_INFO(C_Info)
{
	npc = TPL_1438_Templer;
	condition = Tpl_1438_Templer_INFO_Condition;
	information = Tpl_1438_Templer_INFO_Info;
	important = 0;
	permanent = 0;
	description = "Was macht ihr Templer hier in der Mine?";
};


func int Tpl_1438_Templer_INFO_Condition()
{
	if(CorKalom_BringMCQBalls != LOG_RUNNING)
	{
		return TRUE;
	};
};

func void Tpl_1438_Templer_INFO_Info()
{
	AI_Output(other,self,"Tpl_1438_Templer_INFO_Info_15_01");	//Was macht ihr Templer hier in der Mine? 
	AI_Output(self,other,"Tpl_1438_Templer_INFO_Info_13_02");	//Wir jagen die Minecrawler. Geh lieber zur�ck ins Lager, da bist du sicher.
};


instance Tpl_1438_Templer_WHY(C_Info)
{
	npc = TPL_1438_Templer;
	condition = Tpl_1438_Templer_WHY_Condition;
	information = Tpl_1438_Templer_WHY_Info;
	important = 0;
	permanent = 0;
	description = "Warum jagt ihr die Crawler?";
};


func int Tpl_1438_Templer_WHY_Condition()
{
	if(Npc_KnowsInfo(hero,Tpl_1438_Templer_INFO))
	{
		return 1;
	};
};

func void Tpl_1438_Templer_WHY_Info()
{
	AI_Output(other,self,"Tpl_1438_Templer_WHY_Info_15_01");	//Warum jagt ihr die Crawler? 
	AI_Output(self,other,"Tpl_1438_Templer_WHY_Info_13_02");	//Wegen ihren Zangen. Sie enthalten ein wertvolles Sekret.
	AI_Output(other,self,"Tpl_1438_Templer_WHY_Info_15_03");	//Was f�r ein Sekret?
	AI_Output(self,other,"Tpl_1438_Templer_WHY_Info_13_04");	//Ein Gift. Nur unser Guru Cor Kalom wei�, wie man daraus Tr�nke brauen kann.
	AI_Output(self,other,"Tpl_1438_Templer_WHY_Info_13_05");	//Und neben ihm ist Baal Orun der einzige, der wei� wie man dann aus den Zangen eine Suppe kochen kann.
	Log_CreateTopic(GE_TeacherPSI,LOG_NOTE);
	B_LogEntry(GE_TeacherPSI,"Baal Orun kann mir beibringen zu kochen. Er kennt das Rezept f�r Minecrawler-Suppe.");
};


instance Tpl_1438_Templer_KALOM(C_Info)
{
	npc = TPL_1438_Templer;
	condition = Tpl_1438_Templer_KALOM_Condition;
	information = Tpl_1438_Templer_KALOM_Info;
	important = 0;
	permanent = 0;
	description = "Wer ist Cor Kalom?";
};


func int Tpl_1438_Templer_KALOM_Condition()
{
	if(Npc_KnowsInfo(hero,Tpl_1438_Templer_WHY))
	{
		return 1;
	};
};

func void Tpl_1438_Templer_KALOM_Info()
{
	AI_Output(other,self,"Tpl_1438_Templer_KALOM_Info_15_01");	//Wer ist Cor Kalom?
	AI_Output(self,other,"Tpl_1438_Templer_KALOM_Info_13_02");	//Er ist einer der m�chtigsten M�nner in der Bruderschaft. Er kennt viele Geheimnisse und kann die Gedanken anderer kontrollieren!
	AI_Output(self,other,"Tpl_1438_Templer_KALOM_Info_13_03");	//Zudem ist er der Alchemist. Er braut Tr�nke, damit wir geistigen Kontakt zum Schl�fer herstellen k�nnen. Geh doch einfach mal ins Lager. Wir suchen immer gute Leute!
	AI_Output(other,self,"Tpl_1438_Templer_KALOM_Info_15_04");	//Ich werde mal dar�ber nachdenken.
};


instance Tpl_1438_Templer_EGGSEARCH(C_Info)
{
	npc = TPL_1438_Templer;
	condition = Tpl_1438_Templer_EGGSEARCH_Condition;
	information = Tpl_1438_Templer_EGGSEARCH_Info;
	important = 0;
	permanent = 0;
	description = "Ich bin auf der Suche nach dem Crawlernest.";
};


func int Tpl_1438_Templer_EGGSEARCH_Condition()
{
	if(CorKalom_BringMCQBalls == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void Tpl_1438_Templer_EGGSEARCH_Info()
{
	AI_Output(other,self,"Tpl_1438_Templer_EGGSEARCH_Info_15_01");	//Ich bin auf der Suche nach dem Crawlernest.
	AI_Output(self,other,"Tpl_1438_Templer_EGGSEARCH_Info_13_02");	//Wende dich an Gor Na Vid, Gor Na Kosh oder Gor Na Bar. Die kennen sich da unten bei den Crawlern besser aus als ich.
	B_LogEntry(CH2_MCEggs,"Ich fragte einen Templer am Eingang der Alten Mine nach dem Nest der Minecrawler. Er verwies mich an drei andere Templer mit Namen Gor Na Vid, Gor Na Kosh und Gor Na Bar. Diese Namen der Bruderschaft bringen mich noch um den Verstand.");
};


instance Tpl_1438_Templer_ZANGEN(C_Info)
{
	npc = TPL_1438_Templer;
	condition = Tpl_1438_Templer_ZANGEN_Condition;
	information = Tpl_1438_Templer_ZANGEN_Info;
	important = 0;
	permanent = 0;
	description = "Wie kann ich den Minecrawlern die Zangen entfernen?";
};


func int Tpl_1438_Templer_ZANGEN_Condition()
{
	if((Npc_KnowsInfo(hero,Tpl_1438_Templer_WHY) || (CorKalom_BringMCQBalls == LOG_RUNNING)) && (Knows_GetMCMandibles == FALSE))
	{
		return TRUE;
	};
};

func void Tpl_1438_Templer_ZANGEN_Info()
{
	AI_Output(other,self,"Tpl_1438_Templer_ZANGEN_Info_15_01");	//Wie kann ich den Minecrawlern die Zangen entfernen?
	AI_Output(self,other,"Tpl_1438_Templer_ZANGEN_Info_13_02");	//Das ist ein Vorgang, der nicht so einfach ist. Ich kann dir das beibringen.
	Log_CreateTopic(GE_TeacherOW,LOG_NOTE);
	B_LogEntry(GE_TeacherOW,"Einer der Templer, der sich in der Alten Mine auf der obersten Ebene befindet, kann mir beibringen, wie ich Minecrawlern die Zangen rausschneiden kann.");
};


instance Tpl_1438_Templer_TEACHZANGEN(C_Info)
{
	npc = TPL_1438_Templer;
	condition = Tpl_1438_Templer_TEACHZANGEN_Condition;
	information = Tpl_1438_Templer_TEACHZANGEN_Info;
	important = 0;
	permanent = 1;
	description = "Zangen rausschneiden lernen (1 Lernpunkt)";
};


func int Tpl_1438_Templer_TEACHZANGEN_Condition()
{
	if(Npc_KnowsInfo(hero,Tpl_1438_Templer_ZANGEN) && (Knows_GetMCMandibles == FALSE))
	{
		return TRUE;
	};
};

func void Tpl_1438_Templer_TEACHZANGEN_Info()
{
	AI_Output(other,self,"Tpl_1438_Templer_TEACHZANGEN_Info_15_01");	//Kannst du mir das Zangen rausschneiden beibringen?
	if(hero.lp >= 1)
	{
		hero.lp = hero.lp - 1;
		AI_Output(self,other,"Tpl_1438_Templer_TEACHZANGEN_Info_13_01");	//Du musst erst einen tiefen Schnitt in das Fleisch machen. Sei vorsichtig, dass du nicht die Zangendr�se erwischst. Triffst du sie, spritzt das Sekret raus.
		AI_Output(other,self,"Tpl_1438_Templer_TEACHZANGEN_Info_15_02");	//Das ist bestimmt ziemlich schmerzhaft. 
		AI_Output(self,other,"Tpl_1438_Templer_TEACHZANGEN_Info_13_03");	//Und wie! Hast du eigentlich noch Drei-Finger-Korgur, den Crawlerj�ger, kennengelernt? Ach nein, das war vor deiner Zeit. Nun, also weiter...  
		AI_Output(self,other,"Tpl_1438_Templer_TEACHZANGEN_Info_13_04");	//Schneide gro�fl�chig um die Dr�sen herum und entferne dann das Fleisch zusammen mit der Zange. Wenn du dich daran h�ltst, wirst du keine Probleme mit dem Rausschneiden der Zangen haben.  
		Knows_GetMCMandibles = TRUE;
		Log_CreateTopic(GE_AnimalTrophies,LOG_NOTE);
		B_LogEntry(GE_AnimalTrophies,"Wissen �ber Zangen rausschneiden - Minecrawler");
		Tpl_1438_Templer_TEACHZANGEN.permanent = 0;
		PrintScreen("Lerne: Minecrawlerzangen rausschneiden",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	}
	else
	{
		PrintScreen("Zu wenig Lernpunkte!",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
		B_Say(self,other,"$NOLEARNNOPOINTS");
	};
};

