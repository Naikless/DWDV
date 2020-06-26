
instance DIA_GRD_5032_EXIT(C_Info)
{
	npc = grd_5032_carlos;
	nr = 999;
	condition = dia_grd_5032_exit_condition;
	information = dia_grd_5032_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_grd_5032_exit_condition()
{
	return 1;
};

func void dia_grd_5032_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GRD_5032_KLEINER(C_Info)
{
	npc = grd_5032_carlos;
	nr = 1;
	condition = dia_grd_5032_kleiner_condition;
	information = dia_grd_5032_kleiner_info;
	permanent = 0;
	important = 1;
	description = "Hey kleiner!";
};


func int dia_grd_5032_kleiner_condition()
{
	if(Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist)
	{
		return 1;
	};
};

func void dia_grd_5032_kleiner_info()
{
	AI_Output(self,other,"DIA_Grd_5032_kleiner_15_00");	//Hey kleiner! Komm doch mal hier rüber!
};


instance DIA_GRD_5032_WILLST(C_Info)
{
	npc = grd_5032_carlos;
	nr = 1;
	condition = dia_grd_5032_willst_condition;
	information = dia_grd_5032_willst_info;
	permanent = 0;
	important = 0;
	description = "Was willst du von mir?";
};


func int dia_grd_5032_willst_condition()
{
	if(Npc_KnowsInfo(hero,dia_grd_5032_kleiner))
	{
		return 1;
	};
};

func void dia_grd_5032_willst_info()
{
	AI_Output(other,self,"DIA_Grd_5032_willst_15_00");	//Was willst du von mir?
	AI_Output(self,other,"DIA_Grd_5032_willst_01_01");	//Die haben dich gerade hier reingeworfen was? Du kannst dich schon direkt nützlich machen.
	AI_Output(self,other,"DIA_Grd_5032_willst_01_02");	//Bevor du hier reingworfen wurdest, haben wir eine Lieferung mit Waren aus der Außenwelt bekommen.
	AI_Output(self,other,"DIA_Grd_5032_willst_01_03");	//Leider sind einige Dinge ins Wasser gefallen, als die Lieferung hier runter gefahren wurde.
	AI_Output(self,other,"DIA_Grd_5032_willst_01_04");	//Spring nochmal schnell ins Wasser und hol' die Sachen wieder hoch.
	Info_ClearChoices(dia_grd_5032_willst);
	Info_AddChoice(dia_grd_5032_willst,"Was springt für mich raus?",dia_grd_5032_willst_okay);
	Info_AddChoice(dia_grd_5032_willst,"Warum machst du deinen Scheiss nicht selbst?",dia_grd_5032_willst_selbst);
};

func void dia_grd_5032_willst_okay()
{
	AI_Output(other,self,"DIA_Grd_5032_willst_Okay_15_00");	//Was springt für mich dabei raus?
	AI_Output(self,other,"DIA_Grd_5032_willst_okay_01_00");	//Darüber können wir uns noch unterhalten, wenn du fertig bist.
	AI_Output(self,other,"DIA_Grd_5032_willst_okay_01_01");	//Jetzt sieh erstmal zu, dass du deinen Arsch ins Wasser schaffst.
	Info_ClearChoices(dia_grd_5032_willst);
	Info_AddChoice(dia_grd_5032_willst,"Erst reden wir über die Belohnung.",dia_grd_5032_willst_belohnung);
	Info_AddChoice(dia_grd_5032_willst,"Dann mach ich mich mal an die Arbeit.",dia_grd_5032_willst_jetzt);
};

func void dia_grd_5032_willst_selbst()
{
	AI_Output(other,self,"DIA_Grd_5032_willst_selbst_15_00");	//Warum machst du deinen Scheiss nicht selbst?
	AI_Output(self,other,"DIA_Grd_5032_willst_selbst_02_00");	//Du solltest aufpassen wie du mit mir redest!
	AI_Output(self,other,"DIA_Grd_5032_willst_selbst_02_01");	//Du wirst aber auch noch lernen, wie du mit mir und den anderen Jungs zu reden hast, neuer.
	AI_Output(self,other,"DIA_Grd_5032_willst_selbst_02_02");	//Aber da ich heute einen Guten Tag habe, kriegst du eine Lektion von mir umsonst.
	Info_ClearChoices(dia_grd_5032_willst);
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_Attack,1,"");
};

func void dia_grd_5032_willst_belohnung()
{
	AI_Output(other,self,"DIA_Grd_5032_willst_Belohnung_15_00");	//Erst reden wir über die Belohnung.
	AI_Output(self,other,"DIA_Grd_5032_willst_Belohnung_01_00");	//Weißt du was wir hier mit vorlauten Neuen machen? Nein? Ich werd's dir zeigen.
	Info_ClearChoices(dia_grd_5032_willst);
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_Attack,1,"");
};

func void dia_grd_5032_willst_jetzt()
{
	AI_Output(other,self,"DIA_Grd_5032_willst_Jetzt_15_00");	//Dann mach ich mich mal an die Arbeit.
	AI_Output(self,other,"DIA_Grd_5032_willst_Jetzt_01_00");	//Und beeil dich mal ein bisschen. Die Lieferung hätte schon längst im Alten Lager sein müssen.
	Info_ClearChoices(dia_grd_5032_willst);
	AI_StopProcessInfos(self);
	CARLOS_THINGS = LOG_RUNNING;
	Log_CreateTopic(CH1_CARLOSTHINGS,LOG_MISSION);
	Log_SetTopicStatus(CH1_CARLOSTHINGS,LOG_RUNNING);
	B_LogEntry(CH1_CARLOSTHINGS,"Carlos erzählte mir das bei der letzten Lieferung einige Gegenstände in den See am Austauschplatz gefallen sind. Ich soll sie nun bergen.");
};


instance DIA_GRD_5032_NUNHELFEN(C_Info)
{
	npc = grd_5032_carlos;
	nr = 1;
	condition = dia_grd_5032_nunhelfen_condition;
	information = dia_grd_5032_nunhelfen_info;
	permanent = 0;
	important = 1;
	description = "Jetzt weißt du was mit Neuen passiert";
};


func int dia_grd_5032_nunhelfen_condition()
{
	var C_Npc carlos;
	carlos = Hlp_GetNpc(grd_5032_carlos);
	if((carlos.aivar[AIV_HASDEFEATEDSC] == TRUE) && (CARLOS_THINGS == LOG_RUNNING))
	{
		return 1;
	};
};

func void dia_grd_5032_nunhelfen_info()
{
	AI_Output(self,other,"DIA_Grd_5032_nunhelfen_15_00");	//Das passiert hier mit vorlauten Neuen, die nicht wissen wie sie sich zu verhalten haben.
	AI_Output(self,other,"DIA_Grd_5032_nunhelfen_01_01");	//Jetzt mach das du ins Wasser kommst oder ich werf dich rein!
	CARLOS_THINGS = LOG_RUNNING;
	Log_CreateTopic(CH1_CARLOSTHINGS,LOG_MISSION);
	Log_SetTopicStatus(CH1_CARLOSTHINGS,LOG_RUNNING);
	B_LogEntry(CH1_CARLOSTHINGS,"Carlos hat mir auf unangenehme Art gezeigt, wie das Leben hier in der Kolonie abläuft. Ich soll jetzt für ihn die Sachen aus dem See holen.");
};


instance DIA_GRD_5032_HABALLES(C_Info)
{
	npc = grd_5032_carlos;
	nr = 1;
	condition = dia_grd_5032_haballes_condition;
	information = dia_grd_5032_haballes_info;
	permanent = 0;
	important = 0;
	description = "Ich hab' die Sachen die du von mir wolltest.";
};


func int dia_grd_5032_haballes_condition()
{
	if((Npc_HasItems(other,ItMiNugget) >= 3) && (Npc_HasItems(other,ItFo_Potion_Health_01) >= 2) && (Npc_HasItems(other,ItMiHammer) >= 1) && (Npc_HasItems(other,ItMi_Stuff_Cup_02) >= 1) && (Npc_HasItems(other,ItMiLute) >= 1) && (CARLOS_THINGS == LOG_RUNNING))
	{
		return 1;
	};
};

func void dia_grd_5032_haballes_info()
{
	AI_Output(other,self,"DIA_Grd_5032_HabAlles_15_00");	//Ich hab die Sachen die du von mir wolltest.
	AI_Output(self,other,"DIA_Grd_5032_HabAlles_01_01");	//Gut. Dann kann ich den Rest mit dem nächsten Konvoi ins Lager schicken.
	AI_Output(other,self,"DIA_Grd_5032_HabAlles_01_02");	//Was ist mit meiner Belohnung?
	AI_Output(self,other,"DIA_Grd_5032_HabAlles_02_03");	//Hier hast du einen Erzbrocken. Das reicht doch wohl als Belohnung.
	AI_Output(self,other,"DIA_Grd_5032_HabAlles_02_04");	//Jetzt sieh zu das du hier verschwindest!
	B_GiveInvItems(other,self,ItMiNugget,3);
	B_GiveInvItems(other,self,ItFo_Potion_Health_01,2);
	B_GiveInvItems(other,self,ItMiHammer,1);
	B_GiveInvItems(other,self,ItMi_Stuff_Cup_02,1);
	B_GiveInvItems(other,self,ItMiLute,1);
	B_GiveInvItems(self,other,ItMiNugget,1);
	CARLOS_THINGS = LOG_SUCCESS;
	Log_SetTopicStatus(CH1_CARLOSTHINGS,LOG_SUCCESS);
	B_LogEntry(CH1_CARLOSTHINGS,"Nachdem ich für Carlos die Sachen aus dem See gefischt hab, gab es nur einen einzelnen Erzbrocken als Belohnung.");
	B_GiveXP(XP_CARLOSTHINGS);
};


instance DIA_GRD_5032_SUCHEN(C_Info)
{
	npc = grd_5032_carlos;
	nr = 1;
	condition = dia_grd_5032_suchen_condition;
	information = dia_grd_5032_suchen_info;
	permanent = 1;
	important = 0;
	description = "Wo genau soll ich suchen?";
};


func int dia_grd_5032_suchen_condition()
{
	var C_Npc carlos;
	carlos = Hlp_GetNpc(grd_5032_carlos);
	if(CARLOS_THINGS == LOG_RUNNING)
	{
		return 1;
	};
};

func void dia_grd_5032_suchen_info()
{
	AI_Output(other,self,"DIA_Grd_5032_suchen_15_00");	//Wo genau soll ich suchen?
	AI_Output(self,other,"DIA_Grd_5032_suchen_01_01");	//Du verarschst mich doch jetzt? Spring einfach mal rein und fang an den Boden abzusuchen.
};


instance DIA_GRD_5032_DUELL(C_Info)
{
	npc = grd_5032_carlos;
	nr = 1;
	condition = dia_grd_5032_duell_condition;
	information = dia_grd_5032_duell_info;
	permanent = 0;
	important = 0;
	description = "So kommst du mir nicht davon!";
};


func int dia_grd_5032_duell_condition()
{
	if(CARLOS_THINGS == LOG_SUCCESS)
	{
		return 1;
	};
};

func void dia_grd_5032_duell_info()
{
	AI_Output(other,self,"DIA_Grd_5032_DUELL_15_00");	//So kommst du mir nicht davon!
	AI_Output(self,other,"DIA_Grd_5032_DUELL_01_01");	//Ach? Was willst du denn tun? Mir eine auf's Maul hauen?
	AI_Output(other,self,"DIA_Grd_5032_DUELL_01_02");	//So sieht's aus.
	AI_Output(self,other,"DIA_Grd_5032_DUELL_01_03");	//Da weiß ich was besseres, ich werde DIR jetzt eine auf's Maul hauen!
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_Attack,1,"");
};

