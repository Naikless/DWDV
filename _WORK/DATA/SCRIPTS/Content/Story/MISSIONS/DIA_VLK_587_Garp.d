
instance Vlk_587_Garp_Exit(C_Info)
{
	npc = VLK_587_Garp;
	nr = 999;
	condition = Vlk_587_Garp_Exit_Condition;
	information = Vlk_587_Garp_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Vlk_587_Garp_Exit_Condition()
{
	return 1;
};

func void Vlk_587_Garp_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance Vlk_587_Garp_ORK(C_Info)
{
	npc = VLK_587_Garp;
	nr = 1;
	condition = Vlk_587_Garp_ORK_Condition;
	information = Vlk_587_Garp_ORK_Info;
	important = 0;
	permanent = 0;
	description = "Was macht der Ork hier?";
};


func int Vlk_587_Garp_ORK_Condition()
{
	return 1;
};

func void Vlk_587_Garp_ORK_Info()
{
	AI_Output(other,self,"Vlk_587_Garp_ORK_Info_15_01");	//Was macht der Ork hier?
	AI_Output(self,other,"Vlk_587_Garp_ORK_Info_01_02");	//Die Gardisten haben ihn gefangen. Seitdem wird er hier zur Arbeit gezwungen.
	AI_Output(other,self,"Vlk_587_Garp_ORK_Info_15_03");	//Er ist ja noch nicht mal angekettet. Warum haut er nicht einfach ab?
	AI_Output(self,other,"Vlk_587_Garp_ORK_Info_01_04");	//Er hat es einmal versucht. Die Gardisten haben ihm so stark zugesetzt, dass er ein paar Wochen nicht laufen konnte. Seitdem hat er nie wieder versucht zu fliehen.  
};


instance VLK_587_GARP_SCHULDEN(C_Info)
{
	npc = VLK_587_Garp;
	nr = 2;
	condition = vlk_587_garp_schulden_condition;
	information = vlk_587_garp_schulden_info;
	important = 0;
	permanent = 0;
	description = "Dein Kumpel schickt mich.";
};


func int vlk_587_garp_schulden_condition()
{
	if(ERZ_SCHULDEN == LOG_RUNNING)
	{
		return 1;
	};
};

func void vlk_587_garp_schulden_info()
{
	AI_Output(other,self,"Vlk_587_Garp_Schulden_Info_15_01");	//Dein Kumpel schickt mich.
	AI_Output(self,other,"Vlk_587_Garp_Schulden_Info_01_02");	//Und?
	AI_Output(other,self,"Vlk_587_Garp_Schulden_Info_15_03");	//Er sagt, du schuldest ihm noch Erz. Das will er jetzt wiederhaben.
	AI_Output(self,other,"Vlk_587_Garp_Schulden_Info_01_04");	//Ich würd' ihm sein Erz ja geben, aber ich hab es nicht mehr. Einer der Gardisten hat es mir abgenommen, als ich in die Mine wollte.
	AI_Output(self,other,"Vlk_587_Garp_Schulden_Info_01_05");	//Er meinte das ich ihm noch Durchgangszoll zahlen müsste, wenn ich in die Mine wollte. Daraufhin hat er mir mein ganzes Erz abgenommen.
	B_LogEntry(CH1_SCHULDEN,"Garp hat das Erz seines Kumpels nicht mehr. Er musste es am Eingang der Mine als Zoll bezahlen.");
};


instance VLK_587_GARP_TYP(C_Info)
{
	npc = VLK_587_Garp;
	nr = 2;
	condition = vlk_587_garp_typ_condition;
	information = vlk_587_garp_typ_info;
	important = 0;
	permanent = 0;
	description = "Wer war der Typ?";
};


func int vlk_587_garp_typ_condition()
{
	if((ERZ_SCHULDEN == LOG_RUNNING) && Npc_KnowsInfo(hero,vlk_587_garp_schulden))
	{
		return 1;
	};
};

func void vlk_587_garp_typ_info()
{
	AI_Output(other,self,"Vlk_587_Garp_Typ_Info_15_01");	//Wer war der Typ, der dir dein Erz genommen hat?
	AI_Output(self,other,"Vlk_587_Garp_Typ_Info_01_02");	//Garaz heißt der Kerl. Er ist einer von Gomez Gardisten.
	AI_Output(self,other,"Vlk_587_Garp_Typ_Info_15_03");	//Er hat den ganzen Tag nichts besseres zu tun, als sich seinen Arsch platt zu sitzen und uns Buddlern das Erz abzunehmen.
	AI_Output(self,other,"Vlk_587_Garp_Typ_Info_15_04");	//Wenn du dich mit ihm anlegen willst, vergiss es. Er ist ein erfahrener Kämpfer und wird dir ordentlich was auf's Maul hauen.
	AI_Output(self,other,"Vlk_587_Garp_Typ_Info_15_05");	//Du solltest dir besser den Schlüssel besorgen und dir sein Zeug aus seiner Truhe nehmen. Soweit ich weiß, bewahrt er sein Zeug in einer Truhe nicht weit vom Lagerfeuer entfernt auf.
	AI_Output(self,other,"Vlk_587_Garp_Typ_Info_17_06");	//Aber lass dich bloß nicht dabei erwischen, wie du an seiner Truhe herumspielst, der zieht dir das Fell über die Ohren.
	AI_Output(self,other,"Vlk_587_Garp_Typ_Info_16_06");	//Red' auch mal mit Miguel, der Kerl ist zwar ein Schatten und handelt mit Pflanzen, aber der Kerl ist in Ordnung.
	AI_Output(self,other,"Vlk_587_Garp_Typ_Info_15_07");	//Viel Glück dabei, du wirst es brauchen!
	AI_StopProcessInfos(self);
	B_LogEntry(CH1_SCHULDEN,"Garaz, einer von Gomez' Gardisten, hat Garp das Erz abgenommen. Scheint so als müsste ich mich an ihn wenden, wenn ich das Erz holen möchte. Garp meinte, ich solle mir den Schlüssel zu Garaz' Truhe besorgen, damit ich mir das Erz einfach nehmen kann.");
};


instance VLK_587_GARP_GARRET(C_Info)
{
	npc = VLK_587_Garp;
	condition = vlk_587_garp_garret_condition;
	information = vlk_587_garp_garret_info;
	important = 0;
	permanent = 0;
	description = "Weißt du etwas über Garret?";
};


func int vlk_587_garp_garret_condition()
{
	if(LOST_DIGGER == LOG_RUNNING)
	{
		return 1;
	};
};

func void vlk_587_garp_garret_info()
{
	AI_Output(other,self,"Vlk_587_Garp_GARRET_Info_15_01");	//Weißt du etwas über Garret?
	AI_Output(self,other,"Vlk_587_Garp_GARRET_Info_15_02");	//Ja, er arbeitete eine Zeit lang mit uns zusammen hier unten im Schacht.
	AI_Output(self,other,"Vlk_587_Garp_GARRET_Info_15_03");	//Hab' ihn aber lange nicht mehr gesehen.
	AI_Output(self,other,"Vlk_587_Garp_GARRET_Info_15_04");	//Kurz vor dem Minecrawler-Überfall habe ich ihn zuletzt gesehen. Seitdem ist er nicht mehr hier gewesen.
	AI_Output(self,other,"Vlk_587_Garp_GARRET_Info_15_05");	//Er hatte eine wahnsinnige Angst vor den Biestern. Gut möglich, dass er von einem der Viecher gefressen wurde.
	AI_Output(other,self,"Vlk_587_Garp_GARRET_Info_15_06");	//Danke, dass hilft mir sehr weiter.
	AI_Output(self,other,"Vlk_587_Garp_GARRET_Info_15_07");	//Man tut mir leid, ich hab' keine Ahnung wo der Kerl stecken könnte.
	B_LogEntry(CH1_LOSTDIGGER,"Garp konnte mir bei der Suche nicht weiterhelfen. Er weiß nicht, was mit Garret passieren sein könnte.");
};

