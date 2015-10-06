
instance DIA_BaalCadar_Exit(C_Info)
{
	npc = GUR_1208_BaalCadar;
	nr = 999;
	condition = DIA_BaalCadar_Exit_Condition;
	information = DIA_BaalCadar_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_BaalCadar_Exit_Condition()
{
	return 1;
};

func void DIA_BaalCadar_Exit_Info()
{
	AI_StopProcessInfos(self);
};


var int BaalCadar_Ansprechbar;
var int BaalCadar_Sakrileg;

instance DIA_BaalCadar_NoTalk(C_Info)
{
	npc = GUR_1208_BaalCadar;
	nr = 2;
	condition = DIA_BaalCadar_NoTalk_Condition;
	information = DIA_BaalCadar_NoTalk_Info;
	permanent = 1;
	important = 1;
};


func int DIA_BaalCadar_NoTalk_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (BaalCadar_Ansprechbar == FALSE) && (Npc_GetPermAttitude(self,other) != ATT_FRIENDLY) && (Npc_GetTrueGuild(other) == GIL_None))
	{
		return 1;
	};
};

func void DIA_BaalCadar_NoTalk_Info()
{
	Info_ClearChoices(DIA_BaalCadar_NoTalk);
	Info_AddChoice(DIA_BaalCadar_NoTalk,DIALOG_ENDE,DIA_BaalCadar_NoTalk_ENDE);
	Info_AddChoice(DIA_BaalCadar_NoTalk,"Alles, klar, Alter?",DIA_BaalCadar_NoTalk_Imp);
	Info_AddChoice(DIA_BaalCadar_NoTalk,"Der Schläfer sei mit dir!",DIA_BaalCadar_NoTalk_Sleeper);
	Info_AddChoice(DIA_BaalCadar_NoTalk,"Hi! Ich bin neu hier!",DIA_BaalCadar_NoTalk_Hi);
};

func void DIA_BaalCadar_NoTalk_Hi()
{
	AI_Output(other,self,"DIA_BaalCadar_NoTalk_Hi_15_00");	//Hi! Ich bin neu hier!
	AI_Output(self,other,"DIA_BaalCadar_NoTalk_Hi_02_01");	//
	BaalCadar_Sakrileg = TRUE;
};

func void DIA_BaalCadar_NoTalk_Sleeper()
{
	AI_Output(other,self,"DIA_BaalCadar_NoTalk_Sleeper_15_00");	//Der Schläfer sei mit dir!
	AI_Output(self,other,"DIA_BaalCadar_NoTalk_Sleeper_02_01");	//
	BaalCadar_Sakrileg = TRUE;
};

func void DIA_BaalCadar_NoTalk_Imp()
{
	AI_Output(other,self,"DIA_BaalCadar_NoTalk_Imp_15_00");	//Alles klar, Alter? 
	AI_Output(self,other,"DIA_BaalCadar_NoTalk_Imp_02_01");	//
	BaalCadar_Sakrileg = TRUE;
};

func void DIA_BaalCadar_NoTalk_ENDE()
{
	AI_StopProcessInfos(self);
};


instance DIA_BaalCadar_SleepSpell(C_Info)
{
	npc = GUR_1208_BaalCadar;
	nr = 1;
	condition = DIA_BaalCadar_SleepSpell_Condition;
	information = DIA_BaalCadar_SleepSpell_Info;
	permanent = 0;
	important = 1;
};


func int DIA_BaalCadar_SleepSpell_Condition()
{
	var C_Npc Nov1336;
	var C_Npc Nov1340;
	var C_Npc Nov1345;
	Nov1336 = Hlp_GetNpc(NOV_1336_Novize);
	Nov1340 = Hlp_GetNpc(NOV_1340_Novize);
	Nov1345 = Hlp_GetNpc(NOV_1345_Novize);
	if(Npc_IsInState(Nov1336,ZS_MagicSleep) || Npc_IsInState(Nov1340,ZS_MagicSleep) || Npc_IsInState(Nov1345,ZS_MagicSleep))
	{
		return 1;
	};
};

func void DIA_BaalCadar_SleepSpell_Info()
{
	AI_Output(self,other,"DIA_BaalCadar_SleepSpell_02_00");	//Was tust du? Ich versuche hier gerade mit meinen Schülern zu meditieren.
	AI_Output(self,other,"DIA_BaalCadar_SleepSpell_02_01");	//Wer hat dir beigebracht, die Magie des Schläfers zu wirken?
	AI_Output(other,self,"DIA_BaalCadar_SleepSpell_15_02");	//Niemand. Es war ganz leicht.
	AI_Output(self,other,"DIA_BaalCadar_SleepSpell_02_03");	//Du scheinst ein sehr gelehriger Schüler zu sein. Ich werde dich unterrichten.
	BaalCadar_Ansprechbar = TRUE;
	if(Npc_GetTrueGuild(hero) == GIL_None)
	{
		Log_CreateTopic(CH1_JoinPsi,LOG_MISSION);
		Log_SetTopicStatus(CH1_JoinPsi,LOG_RUNNING);
	};
	B_LogEntry(CH1_JoinPsi,"Baal Cadar hält mich für einen gelehrigen Schüler! Damit habe ich ihn überzeugt das ich es Wert bin mich der Bruderschaft anzuschließen.");
	B_GiveXP(XP_ImpressBaalCadar);
};


instance Gur_1208_BaalCadar_Teach(C_Info)
{
	npc = GUR_1208_BaalCadar;
	condition = Gur_1208_BaalCadar_Teach_Condition;
	information = Gur_1208_BaalCadar_Teach_Info;
	permanent = 1;
	description = "Ich will lernen, die Kraft meiner Magie zu steigern.";
};


func int Gur_1208_BaalCadar_Teach_Condition()
{
	if((BaalCadar_Ansprechbar == TRUE) || (Npc_GetTrueGuild(other) == GIL_NOV) || (Npc_GetTrueGuild(other) == GIL_TPL) || (Npc_GetTrueGuild(other) == GIL_GUR))
	{
		return TRUE;
	};
};

func void Gur_1208_BaalCadar_Teach_Info()
{
	AI_Output(other,self,"Gur_1208_BaalCadar_Teach_Info_15_01");	//Ich will lernen, die Kraft meiner Magie zu steigern.
	AI_Output(self,other,"Gur_1208_BaalCadar_Teach_Info_02_02");	//Die Kraft deines Geistes ist der Schlüssel dazu.
	if(log_baalcadartrain == FALSE)
	{
		Log_CreateTopic(GE_TeacherPSI,LOG_NOTE);
		B_LogEntry(GE_TeacherPSI,"Der Guru Baal Cadar kann mir helfen, meine MANA zu steigern.");
		log_baalcadartrain = TRUE;
	};
	Info_ClearChoices(Gur_1208_BaalCadar_Teach);
	Info_AddChoice(Gur_1208_BaalCadar_Teach,DIALOG_BACK,Gur_1208_BaalCadar_Teach_BACK);
	Info_AddChoice(Gur_1208_BaalCadar_Teach,B_BuildLearnString(NAME_LearnMana_5,5 * LPCOST_ATTRIBUTE_MANA,0),Gur_1208_BaalCadar_Teach_MAN_5);
	Info_AddChoice(Gur_1208_BaalCadar_Teach,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0),Gur_1208_BaalCadar_Teach_MAN_1);
};

func void Gur_1208_BaalCadar_Teach_BACK()
{
	Info_ClearChoices(Gur_1208_BaalCadar_Teach);
};

func void Gur_1208_BaalCadar_Teach_MAN_1()
{
	B_BuyAttributePoints(other,ATR_MANA_MAX,LPCOST_ATTRIBUTE_MANA);
	Info_ClearChoices(Gur_1208_BaalCadar_Teach);
	Info_AddChoice(Gur_1208_BaalCadar_Teach,DIALOG_BACK,Gur_1208_BaalCadar_Teach_BACK);
	Info_AddChoice(Gur_1208_BaalCadar_Teach,B_BuildLearnString(NAME_LearnMana_5,5 * LPCOST_ATTRIBUTE_MANA,0),Gur_1208_BaalCadar_Teach_MAN_5);
	Info_AddChoice(Gur_1208_BaalCadar_Teach,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0),Gur_1208_BaalCadar_Teach_MAN_1);
};

func void Gur_1208_BaalCadar_Teach_MAN_5()
{
	B_BuyAttributePoints(other,ATR_MANA_MAX,5 * LPCOST_ATTRIBUTE_MANA);
	Info_ClearChoices(Gur_1208_BaalCadar_Teach);
	Info_AddChoice(Gur_1208_BaalCadar_Teach,DIALOG_BACK,Gur_1208_BaalCadar_Teach_BACK);
	Info_AddChoice(Gur_1208_BaalCadar_Teach,B_BuildLearnString(NAME_LearnMana_5,5 * LPCOST_ATTRIBUTE_MANA,0),Gur_1208_BaalCadar_Teach_MAN_5);
	Info_AddChoice(Gur_1208_BaalCadar_Teach,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0),Gur_1208_BaalCadar_Teach_MAN_1);
};


instance Gur_1208_BaalCadar_FIRSTTEST(C_Info)
{
	npc = GUR_1208_BaalCadar;
	condition = Gur_1208_BaalCadar_FIRSTTEST_Condition;
	information = Gur_1208_BaalCadar_FIRSTTEST_Info;
	important = 0;
	permanent = 0;
	description = "Lehre mich die Magie der Runen.";
};


func int Gur_1208_BaalCadar_FIRSTTEST_Condition()
{
	if((Npc_GetTrueGuild(hero) == GIL_GUR) || (Npc_GetTrueGuild(hero) == GIL_TPL))
	{
		return TRUE;
	};
};

func void Gur_1208_BaalCadar_FIRSTTEST_Info()
{
	AI_Output(other,self,"Gur_1208_BaalCadar_FIRSTTEST_Info_15_01");	//Lehre mich die Magie der Runen.
	AI_Output(self,other,"Gur_1208_BaalCadar_FIRSTTEST_Info_02_02");	//Die Sprache der Runen zu lernen, vermögen viele, doch nur wenige verstehen ihre Magie.
	AI_Output(self,other,"Gur_1208_BaalCadar_FIRSTTEST_Info_02_03");	//Ich werde es mit dir versuchen.
	Log_CreateTopic(GE_TeacherPSI,LOG_NOTE);
	B_LogEntry(GE_TeacherPSI,"Baal Cadar kann mich die magischen KREISE der Runenmagie lehren.");
};


instance Gur_1208_BaalCadar_KREIS1(C_Info)
{
	npc = GUR_1208_BaalCadar;
	condition = Gur_1208_BaalCadar_KREIS1_Condition;
	information = Gur_1208_BaalCadar_KREIS1_Info;
	important = 0;
	permanent = 1;
	description = B_BuildLearnString(NAME_LearnMage_1,LPCOST_TALENT_MAGE_1,0);
};


func int Gur_1208_BaalCadar_KREIS1_Condition()
{
	if(((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 0) && Npc_KnowsInfo(hero,Gur_1208_BaalCadar_FIRSTTEST) && (Npc_GetTrueGuild(hero) == GIL_GUR)) || ((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 0) && Npc_KnowsInfo(hero,Gur_1208_BaalCadar_FIRSTTEST) && (Npc_GetTrueGuild(hero) == GIL_TPL)))
	{
		return TRUE;
	};
};

func void Gur_1208_BaalCadar_KREIS1_Info()
{
	AI_Output(other,self,"Gur_1208_BaalCadar_KREIS1_Info_15_01");	//Ich bin bereit für den ersten Kreis.
	if(B_GiveSkill(other,NPC_TALENT_MAGE,1,LPCOST_TALENT_MAGE_1))
	{
		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS1_Info_02_02");	//Höre meine Worte:
		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS1_Info_02_03");	//Der Schläfer erschien vor langer Zeit und gab den Menschen eine Vision.
		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS1_Info_02_04");	//Viele wollten seine Zeichen jedoch nicht sehen, weil sie von der Gier nach Erz geblendet waren.
		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS1_Info_02_05");	//Nur Y'Berion und eine Hand voll anderer machten sich auf und gründeten die Bruderschaft.
		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS1_Info_02_06");	//In dem Augenblick, als sie dem Ruf des Schläfers folgten, entstand der erste Kreis. Die Magie der Runen offenbart sich demjenigen, der dem Schläfer folgt.
		Gur_1208_BaalCadar_KREIS1.permanent = 0;
	};
	AI_StopProcessInfos(self);
};


instance Gur_1208_BaalCadar_KREIS2(C_Info)
{
	npc = GUR_1208_BaalCadar;
	condition = Gur_1208_BaalCadar_KREIS2_Condition;
	information = Gur_1208_BaalCadar_KREIS2_Info;
	important = 0;
	permanent = 1;
	description = B_BuildLearnString(NAME_LearnMage_2,LPCOST_TALENT_MAGE_2,0);
};


func int Gur_1208_BaalCadar_KREIS2_Condition()
{
	if(((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 1) && (Npc_GetTrueGuild(hero) == GIL_GUR)) || ((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 1) && (Npc_GetTrueGuild(hero) == GIL_TPL)))
	{
		return TRUE;
	};
};

func void Gur_1208_BaalCadar_KREIS2_Info()
{
	AI_Output(other,self,"Gur_1208_BaalCadar_KREIS2_Info_15_01");	//Ich bin bereit für den zweiten Kreis.
	if(B_GiveSkill(other,NPC_TALENT_MAGE,2,LPCOST_TALENT_MAGE_2))
	{
		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS2_Info_02_02");	//Dann höre und begreife:
		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS2_Info_02_03");	//Der Schläfer führte Y'Berion und seine getreuen Anhänger an diesen Ort. Hier ließen sie sich nieder.
		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS2_Info_02_04");	//Sie arbeiteten ohne Unterlass, Tage, Wochen Monate. Und das Lager wuchs heran. Mehr Männer kamen dazu, die dem Ruf des Schläfers gefolgt waren.
		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS2_Info_02_05");	//Und zusammen versuchten sie, durch Gebet und Meditation den Schläfer auf spiritueller Ebene zu treffen.
		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS2_Info_02_06");	//Das war die Geburtsstunde des zweiten Kreises.
		Gur_1208_BaalCadar_KREIS2.permanent = 0;
	};
	AI_StopProcessInfos(self);
};


instance Gur_1208_BaalCadar_KREIS3(C_Info)
{
	npc = GUR_1208_BaalCadar;
	condition = Gur_1208_BaalCadar_KREIS3_Condition;
	information = Gur_1208_BaalCadar_KREIS3_Info;
	important = 0;
	permanent = 1;
	description = B_BuildLearnString(NAME_LearnMage_3,LPCOST_TALENT_MAGE_3,0);
};


func int Gur_1208_BaalCadar_KREIS3_Condition()
{
	if(((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 2) && (Npc_GetTrueGuild(hero) == GIL_GUR)) || ((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 2) && (Npc_GetTrueGuild(hero) == GIL_TPL)))
	{
		return TRUE;
	};
};

func void Gur_1208_BaalCadar_KREIS3_Info()
{
	AI_Output(other,self,"Gur_1208_BaalCadar_KREIS3_Info_15_01");	//Ich bin bereit für den dritten Kreis.
	if(B_GiveSkill(other,NPC_TALENT_MAGE,3,LPCOST_TALENT_MAGE_3))
	{
		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS3_Info_02_02");	//Achte das Wort:
		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS3_Info_02_03");	//Die Visionen wurden deutlicher, jedoch war die geistige Kraft der Brüder nicht ausreichend für einen Kontakt.
		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS3_Info_02_04");	//Einer der Gurus, ein Alchemist, fand einen Weg. Mit Hilfe eines Elixiers aus dem Sekret der Minecrawler, das die Brüder vor dem Gebet einnahmen, wurde es erstmalig möglich, die geistigen Kräfte zu vereinen.
		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS3_Info_02_05");	//Zur gleichen Zeit machten sich die Novizen auf in die Lager, die Worte des Schläfers zu predigen, um mehr Ungläubige von der Wahrheit zu überzeugen.
		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS3_Info_02_06");	//Dadurch wurde der dritte Kreis vollendet.
	};
	AI_StopProcessInfos(self);
};


instance Gur_1208_BaalCadar_KREIS4(C_Info)
{
	npc = GUR_1208_BaalCadar;
	condition = Gur_1208_BaalCadar_KREIS4_Condition;
	information = Gur_1208_BaalCadar_KREIS4_Info;
	important = 0;
	permanent = 1;
	description = B_BuildLearnString(NAME_LearnMage_4,LPCOST_TALENT_MAGE_4,0);
};


func int Gur_1208_BaalCadar_KREIS4_Condition()
{
	if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 3) && (Npc_GetTrueGuild(hero) == GIL_GUR))
	{
		return TRUE;
	};
};

func void Gur_1208_BaalCadar_KREIS4_Info()
{
	AI_Output(other,self,"Gur_1208_BaalCadar_KREIS4_Info_15_01");	//Ich bin bereit für den vierten Kreis.
	if(B_GiveSkill(other,NPC_TALENT_MAGE,4,LPCOST_TALENT_MAGE_4))
	{
		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS4_Info_02_02");	//Seit der Gründung des Lagers ist viel Zeit vergangen. Viel hat sich geändert.
		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS4_Info_02_03");	//Der Glaube ist gewachsen, hat sich gefestigt und wurde weitergetragen.
		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS4_Info_02_04");	//Und wir haben unser Ziel nie aus den Augen verloren, haben nicht aufgegeben, den Schläfer zu rufen.
		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS4_Info_02_05");	//Die Beständigkeit und Festigung des Glaubens, das ist der vierte Kreis.
		AI_Output(self,other,"Gur_1208_BaalCadar_KREIS4_Info_02_06");	//Du weißt nun alles, was ein Bruder über Magie wissen muss. Du warst ein gelehriger Schüler.
		Gur_1208_BaalCadar_KREIS4.permanent = 0;
	};
};


instance Gur_1208_BaalCadar_SELLSTUFF(C_Info)
{
	npc = GUR_1208_BaalCadar;
	condition = Gur_1208_BaalCadar_SELLSTUFF_Condition;
	information = Gur_1208_BaalCadar_SELLSTUFF_Info;
	important = 0;
	permanent = 1;
	description = "Ich möchte Schriften über Magie erwerben.";
	trade = 1;
};


func int Gur_1208_BaalCadar_SELLSTUFF_Condition()
{
	if(((Npc_GetTrueGuild(hero) == GIL_GUR) && (BaalCadar_Ansprechbar == TRUE)) || ((Npc_GetTrueGuild(hero) == GIL_TPL) && (BaalCadar_Ansprechbar == TRUE)) || ((Npc_GetTrueGuild(hero) == GIL_NOV) && (BaalCadar_Ansprechbar == TRUE)))
	{
		return TRUE;
	};
};

func void Gur_1208_BaalCadar_SELLSTUFF_Info()
{
	if(log_baalcadarsell == FALSE)
	{
		Log_CreateTopic(GE_TraderPSI,LOG_NOTE);
		B_LogEntry(GE_TraderPSI,"Der Guru Baal Cadar verkauft RUNEN, SPRUCHROLLEN, TRÄNKE, AMULETTE und RINGE.");
		log_baalcadarsell = TRUE;
	};
	AI_Output(other,self,"Gur_1208_BaalCadar_SELLSTUFF_Info_15_01");	//Ich möchte Schriften über Magie erwerben.
};

