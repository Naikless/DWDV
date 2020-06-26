
instance Info_Nov_2_EXIT(C_Info)
{
	nr = 999;
	condition = Info_Nov_2_EXIT_Condition;
	information = Info_Nov_2_EXIT_Info;
	permanent = 1;
	description = "ENDE";
};


func int Info_Nov_2_EXIT_Condition()
{
	return 1;
};

func void Info_Nov_2_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance Info_Nov_2_EinerVonEuchWerden(C_Info)
{
	nr = 4;
	condition = Info_Nov_2_EinerVonEuchWerden_Condition;
	information = Info_Nov_2_EinerVonEuchWerden_Info;
	permanent = 1;
	description = "Ich will bei euch mitmachen.";
};


func int Info_Nov_2_EinerVonEuchWerden_Condition()
{
	if(Npc_GetTrueGuild(other) == GIL_None)
	{
		return TRUE;
	};
};

func void Info_Nov_2_EinerVonEuchWerden_Info()
{
	var C_Npc CorKalom;
	AI_Output(other,self,"Info_Nov_2_EinerVonEuchWerden_15_00");	//Ich will bei euch mitmachen.
	AI_Output(self,other,"Info_Nov_2_EinerVonEuchWerden_02_01");	//Du hast dich entschieden, dem Schläfer zu dienen? Vor dir liegt ein Weg voller Freude und Glück.
	AI_Output(self,other,"Info_Nov_2_EinerVonEuchWerden_02_02");	//Gehe zu Cor Kalom, er entscheidet, für welche Aufgabe du am besten geeignet bist.
	CorKalom = Hlp_GetNpc(GUR_1201_CorKalom);
	CorKalom.aivar[AIV_FINDABLE] = TRUE;
};


instance Info_Nov_2_WichtigePersonen(C_Info)
{
	nr = 3;
	condition = Info_Nov_2_WichtigePersonen_Condition;
	information = Info_Nov_2_WichtigePersonen_Info;
	permanent = 1;
	description = "Wer sind eure Anführer?";
};


func int Info_Nov_2_WichtigePersonen_Condition()
{
	return 1;
};

func void Info_Nov_2_WichtigePersonen_Info()
{
	var C_Npc YBerion;
	var C_Npc CorKalom;
	var C_Npc CorAngar;
	AI_Output(other,self,"Info_Nov_2_WichtigePersonen_15_00");	//Wer sind eure Anführer?
	if(Kapitel <= 2)
	{
		AI_Output(self,other,"Info_Nov_2_WichtigePersonen_02_01");	//Y'Berion, Cor Kalom und Cor Angar sind unsere geistigen Väter.
		AI_Output(self,other,"Info_Nov_2_WichtigePersonen_02_02");	//Sie stellen unsere Verbindung zum Schläfer dar. Wenn wir an den Anrufungen teilnehmen, sind sie es, die den Kontakt zum Schläfer herstellen.
	}
	else if(Kapitel >= 3)
	{
		AI_Output(self,other,"Info_Nov_2_WichtigePersonen_02_03");	//Seit Y'Berions tot und Cor Kalom fort ist, gibt es niemanden mehr, der dieses Lager zusammen hält. 
		AI_Output(self,other,"Info_Nov_2_WichtigePersonen_02_04");	//Die, die nicht mit Cor Kalom gingen, blieben einfach im Lager und gingen einfach ihren Aufgaben weiterhin nach.
		AI_Output(self,other,"Info_Nov_2_WichtigePersonen_02_05");	//Niemand weiß, was der Bruderschaft in Zukunft bevorsteht.
	};
	YBerion = Hlp_GetNpc(GUR_1200_YBerion);
	CorKalom = Hlp_GetNpc(GUR_1201_CorKalom);
	CorAngar = Hlp_GetNpc(GUR_1202_CorAngar);
	YBerion.aivar[AIV_FINDABLE] = TRUE;
	CorKalom.aivar[AIV_FINDABLE] = TRUE;
	CorAngar.aivar[AIV_FINDABLE] = TRUE;
};


instance Info_Nov_2_DasLager(C_Info)
{
	nr = 2;
	condition = Info_Nov_2_DasLager_Condition;
	information = Info_Nov_2_DasLager_Info;
	permanent = 1;
	description = "Was gibt es wichtiges über diesen Ort zu wissen?";
};


func int Info_Nov_2_DasLager_Condition()
{
	return 1;
};

func void Info_Nov_2_DasLager_Info()
{
	AI_Output(other,self,"Info_Nov_2_DasLager_15_00");	//Was gibt es wichtiges über diesen Ort zu wissen?
	if(Kapitel <= 2)
	{
		AI_Output(self,other,"Info_Nov_2_DasLager_02_01");	//Es ist ein Ort des Glaubens, Bruder. Wir haben nicht viel, aber was wir haben, teilen wir gerne mit denen, die sich die Lehren des Schläfers anhören wollen.
		AI_Output(self,other,"Info_Nov_2_DasLager_02_02");	//Suche einen der Gurus auf, und lass deine Seele bereichern.
	}
	else if(Kapitel >= 3)
	{
		AI_Output(self,other,"Info_Nov_2_DasLager_02_03");	//Nun, du solltest wissen, dass das hier eins ein Ort des Glaubens war.
		AI_Output(self,other,"Info_Nov_2_DasLager_02_04");	//Doch seit Y'Berions tot, hat sich hier viel im Lager verändert.
		AI_Output(self,other,"Info_Nov_2_DasLager_02_05");	//Es ist nicht mehr das Leben, dass wir noch vor wenigen Wochen führten.
	};
};


instance Info_Nov_2_DieLage(C_Info)
{
	nr = 1;
	condition = Info_Nov_2_DieLage_Condition;
	information = Info_Nov_2_DieLage_Info;
	permanent = 1;
	description = "Wie sieht's aus?";
};


func int Info_Nov_2_DieLage_Condition()
{
	return 1;
};

func void Info_Nov_2_DieLage_Info()
{
	AI_Output(other,self,"Info_Nov_2_DieLage_15_00");	//Wie sieht's aus?
	if(Npc_GetTrueGuild(other) == GIL_GUR)
	{
		AI_Output(self,other,"Info_Nov_2_DieLage_02_02");	//Meister! Ich diene dem Schläfer, so wie es mir bestimmt ist.
		AI_Output(self,other,"Info_Nov_2_DieLage_02_03");	//Ich erledige die Aufgaben die mir von euch und den anderen Meisten aufgetragen wurden so gut wie möglich.
	}
	else
	{
		AI_Output(self,other,"Info_Nov_2_DieLage_02_01");	//Ich habe wenig Zeit - muss mich um meine Aufgaben kümmern.
	};
};


instance INFO_NOV_2_GURUWERDEN(C_Info)
{
	nr = 4;
	condition = info_nov_2_guruwerden_condition;
	information = info_nov_2_guruwerden_info;
	permanent = 1;
	description = "Ich möchte Guru werden.";
};


func int info_nov_2_guruwerden_condition()
{
	if(Npc_GetTrueGuild(other) == GIL_NOV)
	{
		return TRUE;
	};
};

func void info_nov_2_guruwerden_info()
{
	AI_Output(other,self,"Info_Nov_2_GuruWerden_15_00");	//Ich möchte Guru werden.
	AI_Output(self,other,"Info_Nov_2_GuruWerden_02_01");	//Du möchtest Guru werden? Das ist ein langer und anstrengender Weg. Du wirst Jahre für die Ausbildung brauchen.
	AI_Output(self,other,"Info_Nov_2_GuruWerden_02_02");	//Wenn es dann aber eines Tages so weit ist, darfst du dich glücklich schätzen einer der heiligen Propheten des Schläfers zu sein.
};

func void B_AssignAmbientInfos_Nov_2(var C_Npc slf)
{
	B_AssignFindNpc_ST(slf);
	Info_Nov_2_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_Nov_2_EinerVonEuchWerden.npc = Hlp_GetInstanceID(slf);
	Info_Nov_2_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_Nov_2_DasLager.npc = Hlp_GetInstanceID(slf);
	Info_Nov_2_DieLage.npc = Hlp_GetInstanceID(slf);
	info_nov_2_guruwerden.npc = Hlp_GetInstanceID(slf);
};

