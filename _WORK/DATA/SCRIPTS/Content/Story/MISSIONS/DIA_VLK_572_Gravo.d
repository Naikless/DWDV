
instance DIA_Gravo_Exit(C_Info)
{
	npc = VLK_572_Gravo;
	nr = 999;
	condition = DIA_Gravo_Exit_Condition;
	information = DIA_Gravo_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Gravo_Exit_Condition()
{
	return 1;
};

func void DIA_Gravo_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Gravo_Hallo(C_Info)
{
	npc = VLK_572_Gravo;
	nr = 1;
	condition = DIA_Gravo_Hallo_Condition;
	information = DIA_Gravo_Hallo_Info;
	permanent = 0;
	description = "Wie steht's denn so?";
};


func int DIA_Gravo_Hallo_Condition()
{
	return 1;
};

func void DIA_Gravo_Hallo_Info()
{
	AI_Output(other,self,"DIA_Gravo_Hallo_15_00");	//Wie steht's denn so?
	AI_Output(self,other,"DIA_Gravo_Hallo_04_01");	//Seit ich aufgehört habe, in der Mine zu arbeiten, lässt sich's hier richtig gut leben.
	AI_Output(other,self,"DIA_Gravo_Hallo_15_02");	//Und woher kriegst du dein Erz?
	AI_Output(self,other,"DIA_Gravo_Hallo_04_03");	//Ich helfe Leuten, die Probleme haben.
	AI_Output(self,other,"DIA_Gravo_Hallo_04_04");	//Wenn du hier Ärger mit einflussreichen Leuten hast, kann ich dafür sorgen, dass die Sache wieder ins Lot kommt.
};


instance DIA_Gravo_HelpHow(C_Info)
{
	npc = VLK_572_Gravo;
	nr = 1;
	condition = DIA_Gravo_HelpHow_Condition;
	information = DIA_Gravo_HelpHow_Info;
	permanent = 0;
	description = "Wenn ich hier Ärger habe, kannst DU mir also helfen? Wie?";
};


func int DIA_Gravo_HelpHow_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Gravo_Hallo))
	{
		return 1;
	};
};

func void DIA_Gravo_HelpHow_Info()
{
	AI_Output(other,self,"DIA_Gravo_HelpHow_15_00");	//Wenn ich hier Ärger habe, kannst DU mir also helfen? Wie?
	AI_Output(self,other,"DIA_Gravo_HelpHow_04_01");	//Nun - sagen wir mal, du hast Ärger mit Thorus. Du solltest es besser nie dazu kommen lassen, aber man weiß ja nie, was passiert.
	AI_Output(self,other,"DIA_Gravo_HelpHow_04_02");	//Thorus kann ziemlich stur sein - wenn du's dir einmal mit ihm verscherzt hast, redet er nicht mehr mit dir. Das ist schlecht.
	AI_Output(self,other,"DIA_Gravo_HelpHow_04_03");	//Denn als Neuer bist du auf ihn angewiesen. Also kommst du zu mir. Ich kenne 'ne Menge Leute hier, die Einfluss auf Thorus haben.
	AI_Output(self,other,"DIA_Gravo_HelpHow_04_04");	//Die legen ein gutes Wort für dich ein und Thorus ist wieder auf deiner Seite. Natürlich wollen die Jungs dafür Erz sehen. Dein Erz.
	AI_Output(self,other,"DIA_Gravo_HelpHow_04_05");	//Und ICH kümmere mich darum, dass dein Erz die richtigen Leute erreicht ...
	B_LogEntry(GE_TraderOC,"Der Buddler Gravo verkauft eine Dienstleistung besonderer Art. Wenn ich es mir bei wichtigen Leuten im Alten Lager verscherzt habe, kann ich ihn bezahlen, um den Streit beizulegen.");
};

func void B_Gravo_HelpAttitude(var C_Npc prob)
{
	if(Npc_GetPermAttitude(prob,other) == ATT_ANGRY)
	{
		AI_Output(self,other,"B_Gravo_HelpAttitude_ANGRY_04_00");	//Stimmt, er ist nicht besonders gut auf dich zu sprechen.
		AI_Output(self,other,"B_Gravo_HelpAttitude_ANGRY_04_01");	//Ich werd' zusehen, dass sich ein paar Leute mal mit ihm unterhalten. 100 Erz und ich erledige die Sache.
		if(Npc_HasItems(other,ItMiNugget) >= 100)
		{
			AI_Output(self,other,"B_Gravo_HelpAttitude_ANGRY_04_02");	//Lass sehen, wie viel du hast ... Ah! Das sollte reichen. Betrachte die Sache als erledigt.
			AI_Output(self,other,"B_Gravo_HelpAttitude_ANGRY_04_03");	//Und sprich mit keinem darüber. Tu einfach so, als wär' nichts passiert.
			B_GiveInvItems(hero,self,ItMiNugget,100);
			Npc_SetPermAttitude(prob,ATT_NEUTRAL);
		}
		else
		{
			AI_Output(other,self,"B_Gravo_HelpAttitude_NoOre_15_01");	//So viel hab' ich nicht.
			AI_Output(self,other,"B_Gravo_HelpAttitude_NoOre_04_02");	//Dann kann ich nichts für dich tun - tut mir Leid, Junge.
		};
	}
	else if(Npc_GetPermAttitude(prob,other) == ATT_HOSTILE)
	{
		AI_Output(self,other,"B_Gravo_HelpAttitude_HOSTILE_04_00");	//Ärger ist gar kein Ausdruck, Junge. Er würde dir am liebsten den Kopf abreißen.
		AI_Output(self,other,"B_Gravo_HelpAttitude_HOSTILE_04_01");	//Wenn ich ein paar Jungs davon überzeugen soll, ihn wieder gut zu stimmen, wird das nicht billig. 500 Erz musst du schon hinlegen.
		if(Npc_HasItems(other,ItMiNugget) >= 500)
		{
			AI_Output(self,other,"B_Gravo_HelpAttitude_HOSTILE_04_02");	//Lass sehen, wie viel du hast ... Du scheinst ein reicher Bursche zu sein. Ich nehme die 500 und kümmere mich drum.
			AI_Output(self,other,"B_Gravo_HelpAttitude_HOSTILE_04_03");	//Und noch was: Er darf nie erfahren, dass ICH die Sache für dich geregelt habe - also rede mit KEINEM darüber!
			B_GiveInvItems(hero,self,ItMiNugget,500);
			Npc_SetPermAttitude(prob,ATT_NEUTRAL);
		}
		else
		{
			AI_Output(other,self,"B_Gravo_HelpAttitude_NoOre_15_01");	//So viel hab' ich nicht.
			AI_Output(self,other,"B_Gravo_HelpAttitude_NoOre_04_02");	//Dann kann ich nichts für dich tun - tut mir Leid, Junge.
		};
	}
	else
	{
		AI_Output(self,other,"B_Gravo_HelpAttitude_NoProb_04_00");	//Soweit ich weiß, hat er kein Problem mit dir - mach dir keine Sorgen.
	};
};


instance DIA_Gravo_HelpAngryNow(C_Info)
{
	npc = VLK_572_Gravo;
	nr = 1;
	condition = DIA_Gravo_HelpAngryNow_Condition;
	information = DIA_Gravo_HelpAngryNow_Info;
	permanent = 1;
	description = "Kannst du mir helfen - ich glaub, ich hab' Ärger.";
};


func int DIA_Gravo_HelpAngryNow_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Gravo_HelpHow))
	{
		return 1;
	};
};

func void DIA_Gravo_HelpAngryNow_Info()
{
	AI_Output(other,self,"DIA_Gravo_HelpAngryNow_15_00");	//Kannst du mir helfen - ich glaub, ich hab' Ärger.
	AI_Output(self,other,"DIA_Gravo_HelpAngryNow_04_01");	//Ich denke schon, aber ich warne dich, die Sache kann dich zwischen 100 und 500 Erz kosten.
	Info_ClearChoices(DIA_Gravo_HelpAngryNow);
	Info_AddChoice(DIA_Gravo_HelpAngryNow,DIALOG_BACK,DIA_Gravo_HelpAngryNow_BACK);
	Info_AddChoice(DIA_Gravo_HelpAngryNow,"Mit Diego.",DIA_Gravo_HelpAngryNow_Diego);
	Info_AddChoice(DIA_Gravo_HelpAngryNow,"Mit Thorus",DIA_Gravo_HelpAngryNow_Thorus);
	Info_AddChoice(DIA_Gravo_HelpAngryNow,"Mit Gomez",DIA_Gravo_HelpAngryNow_Gomez);
};

func void DIA_Gravo_HelpAngryNow_BACK()
{
	Info_ClearChoices(DIA_Gravo_HelpAngryNow);
};

func void DIA_Gravo_HelpAngryNow_Diego()
{
	var C_Npc diego;
	AI_Output(other,self,"DIA_Gravo_HelpAngryNow_Diego_15_00");	//Mit Diego.
	diego = Hlp_GetNpc(PC_Thief);
	B_Gravo_HelpAttitude(diego);
	Info_ClearChoices(DIA_Gravo_HelpAngryNow);
};

func void DIA_Gravo_HelpAngryNow_Thorus()
{
	var C_Npc Thorus;
	AI_Output(other,self,"DIA_Gravo_HelpAngryNow_Thorus_15_00");	//Mit Thorus.
	Thorus = Hlp_GetNpc(GRD_200_Thorus);
	B_Gravo_HelpAttitude(Thorus);
	Info_ClearChoices(DIA_Gravo_HelpAngryNow);
};

func void DIA_Gravo_HelpAngryNow_Gomez()
{
	var C_Npc Gomez;
	AI_Output(other,self,"DIA_Gravo_HelpAngryNow_Gomez_15_00");	//Mit Gomez.
	Gomez = Hlp_GetNpc(EBR_100_Gomez);
	B_Gravo_HelpAttitude(Gomez);
	Info_ClearChoices(DIA_Gravo_HelpAngryNow);
};


instance DIA_Gravo_Influence(C_Info)
{
	npc = VLK_572_Gravo;
	nr = 2;
	condition = DIA_Gravo_Influence_Condition;
	information = DIA_Gravo_Influence_Info;
	permanent = 1;
	description = "Kannst du mir sagen, wer hier zu den einflussreichen Leuten gehört?";
};


func int DIA_Gravo_Influence_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Gravo_Hallo))
	{
		return 1;
	};
};

func void DIA_Gravo_Influence_Info()
{
	AI_Output(other,self,"DIA_Gravo_Influence_15_00");	//Kannst du mir sagen, wer von den Schatten hier zu den einflussreichen Leuten gehört?
	AI_Output(self,other,"DIA_Gravo_Influence_04_01");	//Du willst die richtigen Leute beeindrucken, he?
	AI_Output(self,other,"DIA_Gravo_Influence_04_02");	//Diego hat von allen Schatten am meisten zu melden. Zu seinen Vertrauten zählen Fingers, Whistler und Sly.
	AI_Output(self,other,"DIA_Gravo_Influence_04_03");	//Dexter und Fisk verscherbeln ihre Sachen auf dem Marktplatz. Sie haben viele Kunden, selbst unter den Gardisten und sind dementsprechend einflussreich.
	AI_Output(self,other,"DIA_Gravo_Influence_04_04");	//Und dann wäre da noch Scatty, er leitet die Arena, bestimmt wer kämpft und so. Es gibt viele hier, die ihm noch Erz schulden - auch an ihn kannst du dich halten.
	Log_CreateTopic(GE_TraderOC,LOG_NOTE);
	B_LogEntry(GE_TraderOC,"Dexter und Fisk handeln mit verschiedenen Waren am Marktplatz.");
};


instance DIA_GRAVO_HELPGILBERT(C_Info)
{
	npc = VLK_572_Gravo;
	nr = 1;
	condition = dia_gravo_helpgilbert_condition;
	information = dia_gravo_helpgilbert_info;
	permanent = 0;
	description = "Kannst du jemandem helfen?";
};


func int dia_gravo_helpgilbert_condition()
{
	if(Npc_KnowsInfo(hero,dia_gilbert_und))
	{
		return 1;
	};
};

func void dia_gravo_helpgilbert_info()
{
	AI_Output(other,self,"DIA_Gravo_HelpGilbert_15_00");	//Kannst du jemandem helfen?
	AI_Output(self,other,"DIA_Gravo_HelpGilbert_04_01");	//Wem soll ich helfen? Und warum kommt er nicht alleine?
	AI_Output(other,self,"DIA_Gravo_HelpGilbert_04_02");	//Er hat Ärger mit Gomez' Leuten gehabt und kann sich deswegen im Lager nicht mehr sehen lassen.
	AI_Output(self,other,"DIA_Gravo_HelpGilbert_04_03");	//So sieht die Sache also aus. Nun gut, ich kann dir helfen. Allerdings nicht umsonst.
	AI_Output(other,self,"DIA_Gravo_HelpGilbert_04_04");	//Wie viel?
	AI_Output(self,other,"DIA_Gravo_HelpGilbert_04_05");	//500 Erzbrocken.
	AI_Output(other,self,"DIA_Gravo_HelpGilbert_04_06");	//500?!
	AI_Output(self,other,"DIA_Gravo_HelpGilbert_04_07");	//Deswegen solltest du dir nie mit Gomez' Leuten einhandeln. Das wird IMMER teuer.
	B_LogEntry(CH1_GILBERT,"Gravo kann Gilbert helfen, allerdings verlangt er 500 ERZ für seine Hilfe.");
};


var int erz_gegeben;

instance DIA_GRAVO_GILBERTORE(C_Info)
{
	npc = VLK_572_Gravo;
	nr = 1;
	condition = dia_gravo_gilbertore_condition;
	information = dia_gravo_gilbertore_info;
	permanent = 1;
	description = "Ich hab' die 500 Erz.";
};


func int dia_gravo_gilbertore_condition()
{
	if(Npc_KnowsInfo(hero,dia_gravo_helpgilbert) && (ERZ_GEGEBEN == FALSE))
	{
		return 1;
	};
};

func void dia_gravo_gilbertore_info()
{
	AI_Output(other,self,"DIA_Gravo_GilbertOre_15_00");	//Ich hab' die 500 Erz.
	AI_Output(self,other,"DIA_Gravo_GilbertOre_15_01");	//Wirklich? Zeig her'.
	if(Npc_HasItems(other,ItMiNugget) >= 500)
	{
		AI_Output(self,other,"DIA_Gravo_GilbertOre_15_02");	//Das sollte reichen. Du kannst deinem Freund sagen das die Sache erledigt ist.
		AI_Output(self,other,"DIA_Gravo_GilbertOre_15_03");	//Red' mit niemandem darüber und mach' einfach ganz normal so weiter wie immer.
		B_GiveInvItems(hero,self,ItMiNugget,500);
		ERZ_GEGEBEN = TRUE;
		B_LogEntry(CH1_GILBERT,"Gravo war zufrieden mit der Bezahlung und sagte mir, dass die Sache erledigt ist. Das heißt dann das Gilbert wieder zurück ins Alte Lager kann.");
	}
	else
	{
		AI_Output(self,other,"DIA_Gravo_GilbertOre_15_04");	//Das reicht nicht, tut mir Leid, Junge.
		AI_Output(self,other,"DIA_Gravo_GilbertOre_15_05");	//Komm' wieder wenn du ausreichend hast.
	};
};

