
instance DIA_Ricelord_EXIT(C_Info)
{
	npc = Bau_900_Ricelord;
	nr = 999;
	condition = DIA_Ricelord_EXIT_Condition;
	information = DIA_Ricelord_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Ricelord_EXIT_Condition()
{
	return 1;
};

func void DIA_Ricelord_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Ricelord_Hello(C_Info)
{
	npc = Bau_900_Ricelord;
	nr = 1;
	condition = DIA_Ricelord_Hello_Condition;
	information = DIA_Ricelord_Hello_Info;
	permanent = 0;
	description = "Du kümmerst dich um die Reisfelder, richtig?";
};


func int DIA_Ricelord_Hello_Condition()
{
	return 1;
};

func void DIA_Ricelord_Hello_Info()
{
	AI_Output(other,self,"DIA_Ricelord_Hello_15_00");	//Du kümmerst dich um die Reisfelder, richtig?
	AI_Output(self,other,"DIA_Ricelord_Hello_12_01");	//Warum? Suchst du Arbeit?
	Log_CreateTopic(GE_TraderNC,LOG_NOTE);
	B_LogEntry(GE_TraderNC,"Der Reislord kann mir verschiedenste Waren anbieten.");
};


instance DIA_RICELORD_TEACHME(C_Info)
{
	npc = Bau_900_Ricelord;
	nr = 1;
	condition = dia_ricelord_teachme_condition;
	information = dia_ricelord_teachme_info;
	permanent = 0;
	description = "Kannst du mir was beibringen?";
};


func int dia_ricelord_teachme_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Ricelord_Hello))
	{
		return 1;
	};
};

func void dia_ricelord_teachme_info()
{
	AI_Output(hero,self,"Info_Diego_Teach_15_00");	//Kannst du mir was beibringen?
	AI_Output(self,other,"DIA_Ricelord_TeachMe_12_01");	//Natürlich. Ich kenn' mich damit aus wie man Reispflanzen verarbeitet und daraus Reis kocht.
	AI_Output(self,other,"DIA_Ricelord_TeachMe_12_02");	//Bevor ich dir aber irgendwas beibringe, wirst auch du, wie die Anderen auf den Feldern arbeiten müssen.
	AI_Output(self,other,"DIA_Ricelord_TeachMe_12_03");	//Pass auf, bring mir 15 Reispflanzen und ich bring dir was bei.
	LEARN_RICELORD = LOG_RUNNING;
	Log_CreateTopic(CH1_FARMER,LOG_MISSION);
	Log_SetTopicStatus(CH1_FARMER,LOG_RUNNING);
	B_LogEntry(CH1_FARMER,"Wenn mir der Reislord was beibringen soll, muss ich zuerst wie die anderen Bauern auf den Feldern arbeiten. Ich soll 15 Reispflanzen auf den Feldern pflücken und anschließend dem Reislord bringen. Erst dann wird er mir beibringen zu kochen.");
};


instance DIA_RICELORD_DELIEVER(C_Info)
{
	npc = Bau_900_Ricelord;
	nr = 1;
	condition = dia_ricelord_deliever_condition;
	information = dia_ricelord_deliever_info;
	permanent = 0;
	description = "Hier sind deine Reispflanzen.";
};


func int dia_ricelord_deliever_condition()
{
	if((LEARN_RICELORD == LOG_RUNNING) && (Npc_HasItems(other,itmi_plants_rice_01) >= 15))
	{
		return 1;
	};
};

func void dia_ricelord_deliever_info()
{
	AI_Output(other,self,"DIA_Ricelord_Deliever_15_00");	//Hier sind deine Reispflanzen.
	AI_Output(self,other,"DIA_Ricelord_Deliever_12_01");	//Ahh. Bist ja doch zu was zu gebrauchen. Gut, wenn du willst, bring ich dir ab jetzt bei wie du Reis kochen kannst.
	AI_Output(self,other,"DIA_Ricelord_Deliever_12_02");	//Aber nur wenn du die nötige Erfahrung dafür mitbringen kannst.
	B_GiveInvItems(other,self,itmi_plants_rice_01,15);
	LEARN_RICELORD = LOG_SUCCESS;
	Log_SetTopicStatus(CH1_FARMER,LOG_SUCCESS);
	B_LogEntry(CH1_FARMER,"Ich übergab dem Reislord seine Pflanzen und erklärte sich dazu bereit mir zu helfen. Von nun an wird er mir also beibringen wie ich Reis kochen kann.");
	B_GiveXP(XP_RICELORDTRAIN);
};


instance DIA_RICELORD_RICE(C_Info)
{
	npc = Bau_900_Ricelord;
	nr = 3;
	condition = dia_ricelord_rice_condition;
	information = dia_ricelord_rice_info;
	permanent = 1;
	description = "Reis (Kosten: 1 Lernpunkt)";
};


func int dia_ricelord_rice_condition()
{
	if((LEARN_RICELORD == LOG_SUCCESS) && Npc_KnowsInfo(hero,dia_ricelord_deliever) && (KNOWS_RICE == FALSE))
	{
		return 1;
	};
};

func void dia_ricelord_rice_info()
{
	AI_Output(other,self,"DIA_Ricelord_Rice_15_00");	//Bring mir bei wie ich Reis koche.
	if(hero.lp >= 1)
	{
		hero.lp = hero.lp - 1;
		AI_Output(self,other,"DIA_Ricelord_Rice_12_01");	//Du fängst an, indem du das Wasser erst einmal zum kochen bringst.
		AI_Output(self,other,"DIA_Ricelord_Rice_12_02");	//Wenn es ordentlich brodelt, gibst du die Reispflanzen in den Topf.
		AI_Output(self,other,"DIA_Ricelord_Rice_12_03");	//Beim Reis musst du auf jeden Fall drauf achten, dass er nicht zu lange kocht. Sonst kannst du die ganze Sache vergessen.
		AI_Output(self,other,"DIA_Ricelord_Rice_12_04");	//Wenn du den Reis gekocht hast, kannst du ihn in eine Schale geben und essen. Sollte also nicht allzu schwer sein.
		Log_CreateTopic(GE_COOK,LOG_NOTE);
		B_LogEntry(GE_COOK,"Ab jetzt kann ich Reis kochen.");
		B_LogEntry(GE_COOK,"Die Zutaten sind: 2 Reispflanzen und 1 Wasser. ");
		KNOWS_RICE = TRUE;
		PrintScreen("Lerne: Reis",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
	}
	else
	{
		PrintScreen("Zu wenig Lernpunkte!",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
		B_Say(self,other,"$NOLEARNNOPOINTS");
	};
};


instance DIA_Ricelord_Arbeit(C_Info)
{
	npc = Bau_900_Ricelord;
	nr = 1;
	condition = DIA_Ricelord_Arbeit_Condition;
	information = DIA_Ricelord_Arbeit_Info;
	permanent = 0;
	description = "Hast du Arbeit für mich?";
};


func int DIA_Ricelord_Arbeit_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Ricelord_Hello) && !Npc_KnowsInfo(hero,DIA_Lefty_First) && (LeftyDead == FALSE))
	{
		return 1;
	};
};

func void DIA_Ricelord_Arbeit_Info()
{
	AI_Output(other,self,"DIA_Ricelord_Arbeit_15_00");	//Hast du Arbeit für mich?
	AI_Output(self,other,"DIA_Ricelord_Arbeit_12_01");	//Geh zu Lefty. Er ist meistens hier vorne rechts neben der Scheune.
};


instance DIA_Ricelord_TRADE(C_Info)
{
	npc = Bau_900_Ricelord;
	nr = 800;
	condition = DIA_Ricelord_TRADE_Condition;
	information = DIA_Ricelord_TRADE_Info;
	permanent = 1;
	description = "Wir könnten handeln...";
	trade = 1;
};


func int DIA_Ricelord_TRADE_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Ricelord_Hello))
	{
		return 1;
	};
};

func void DIA_Ricelord_TRADE_Info()
{
	AI_Output(other,self,"DIA_Ricelord_TRADE_15_00");	//Wir könnten handeln ...
	AI_Output(self,other,"DIA_Ricelord_TRADE_12_01");	//Was hast du denn zu bieten?
};


var int ricelord_onceaday;

instance DIA_Ricelord_LeftySentMe(C_Info)
{
	npc = Bau_900_Ricelord;
	nr = 1;
	condition = DIA_Ricelord_LeftySentMe_Condition;
	information = DIA_Ricelord_LeftySentMe_Info;
	permanent = 1;
	description = "Lefty schickt mich.";
};


func int DIA_Ricelord_LeftySentMe_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Ricelord_Hello) && (Lefty_Mission == LOG_RUNNING) && (Ricelord_AskedForWater == FALSE) && (LeftyDead == FALSE))
	{
		return 1;
	};
};

func void DIA_Ricelord_LeftySentMe_Info()
{
	AI_Output(other,self,"DIA_Ricelord_LeftySentMe_15_00");	//Lefty schickt mich.
	AI_Output(self,other,"DIA_Ricelord_LeftySentMe_12_01");	//Ach so. Was hat er gesagt?
	Ricelord_AskedForWater = TRUE;
};


instance DIA_Ricelord_GetWater(C_Info)
{
	npc = Bau_900_Ricelord;
	nr = 1;
	condition = DIA_Ricelord_GetWater_Condition;
	information = DIA_Ricelord_GetWater_Info;
	permanent = 1;
	description = "Ich soll den Bauern Wasser bringen.";
};


func int DIA_Ricelord_GetWater_Condition()
{
	if((Ricelord_AskedForWater == TRUE) && (Lefty_Mission == LOG_RUNNING))
	{
		return 1;
	};
};

func void DIA_Ricelord_GetWater_Info()
{
	AI_Output(other,self,"DIA_Ricelord_GetWater_15_00");	//Ich soll den Bauern Wasser bringen.
	if(Lefty_WorkDay == Wld_GetDay())
	{
		AI_Output(self,other,"DIA_Ricelord_GetWater_12_01");	//Gut. Hier sind ein Dutzend Flaschen Wasser.
		AI_Output(self,other,"DIA_Ricelord_GetWater_12_02");	//Es gibt etwa doppelt so viele Bauern, also verteil sie gleichmäßig.
		CreateInvItems(self,ItFo_Potion_Water_01,12);
		B_GiveInvItems(self,other,ItFo_Potion_Water_01,12);
		RICELORD_ONCEADAY = Wld_GetDay();
		Ricelord_AskedForWater = FALSE;
		B_LogEntry(CH1_CarryWater,"Der Reislord gab mir ein Dutzend Wasserflaschen.");
		AI_StopProcessInfos(self);
	}
	else if(Lefty_WorkDay == (Wld_GetDay() - 1))
	{
		AI_Output(self,other,"DIA_Ricelord_GetWater_TooLate_12_00");	//Das war gestern, Bursche! Geh besser zu ihm. Er hat dir was zu sagen.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Ricelord_GetWater_TooLate_12_01");	//Das war vor einigen Tagen, Bursche! Geh besser zu ihm. Er hat dir was zu sagen.
		AI_StopProcessInfos(self);
	};
};


instance DIA_RICELORD_LEFTY(C_Info)
{
	npc = Bau_900_Ricelord;
	nr = 1;
	condition = dia_ricelord_lefty_condition;
	information = dia_ricelord_lefty_info;
	permanent = 0;
	description = "Lohnt sich das Leben als einer deiner Aufpasser?";
};


func int dia_ricelord_lefty_condition()
{
	if(Npc_KnowsInfo(hero,dia_lefty_ring) && (RIOT_RICELORD == LOG_RUNNING))
	{
		return 1;
	};
};

func void dia_ricelord_lefty_info()
{
	AI_Output(other,self,"DIA_Ricelord_Lefty_15_00");	//Lohnt sich das Leben als einer deiner Aufpasser?
	AI_Output(self,other,"DIA_Ricelord_Lefty_15_01");	//Ich bezahl' meine Leute gut. Warum? Suchst du Arbeit?
	AI_Output(other,self,"DIA_Ricelord_Lefty_15_02");	//Ich hab' gesehen das Lefty einen wertvoll aussehenden Ring an seinem Finger hat.
	AI_Output(self,other,"DIA_Ricelord_Lefty_15_03");	//Achso? Hat er das also?
	AI_Output(self,other,"DIA_Ricelord_Lefty_15_04");	//Komisch, meiner wurde mir gestohlen. Und jetzt hat er einen neuen Ring?
	AI_Output(self,other,"DIA_Ricelord_Lefty_15_05");	//Warte mal, ich muss mich mal kurz mit Lefty unterhalten.
	CreateInvItems(self,ricelords_ring,1);
	EquipItem(self,ricelords_ring);
	Npc_RemoveInvItems(Org_844_Lefty,ricelords_ring,1);
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,Org_844_Lefty);
	AI_StartState(self,ZS_Attack,1,"");
};

