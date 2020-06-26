
instance DIA_Wedge_Exit(C_Info)
{
	npc = ORG_850_Wedge;
	nr = 999;
	condition = DIA_Wedge_Exit_Condition;
	information = DIA_Wedge_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Wedge_Exit_Condition()
{
	return TRUE;
};

func void DIA_Wedge_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Wedge_Psst(C_Info)
{
	npc = ORG_850_Wedge;
	nr = 1;
	condition = DIA_Wedge_Psst_Condition;
	information = DIA_Wedge_Psst_Info;
	important = 1;
	permanent = 0;
};


func int DIA_Wedge_Psst_Condition()
{
	if((Npc_GetDistToNpc(hero,self) < 900) && Wld_IsTime(8,0,23,30))
	{
		return TRUE;
	};
};

func void DIA_Wedge_Psst_Info()
{
	AI_Output(self,other,"DIA_Wedge_Psst_05_00");	//Psst ... Hey,  du!
	AI_Output(other,self,"DIA_Wedge_Psst_15_01");	//Wer? ... ich?
	AI_Output(self,other,"DIA_Wedge_Psst_05_02");	//Genau du ... Komm mal her!
	AI_StopProcessInfos(self);
};


instance DIA_Wedge_Hello(C_Info)
{
	npc = ORG_850_Wedge;
	condition = DIA_Wedge_Hello_Condition;
	information = DIA_Wedge_Hello_Info;
	important = 0;
	permanent = 0;
	description = "Was willst du von mir?";
};


func int DIA_Wedge_Hello_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Wedge_Psst))
	{
		return TRUE;
	};
};

func void DIA_Wedge_Hello_Info()
{
	AI_Output(other,self,"DIA_Wedge_Hello_15_00");	//Was willst du von mir?
	AI_Output(self,other,"DIA_Wedge_Hello_05_01");	//Du bist noch nicht lange hier, was? So was sehe ich direkt.
	AI_Output(self,other,"DIA_Wedge_Hello_05_02");	//Es gibt 'ne Menge Sachen, die du hier wissen musst. Einige davon kann ich dir beibringen.
	AI_Output(self,other,"DIA_Wedge_Hello_05_03");	//Au�erdem musst du hier aufpassen, mit wem du redest. Butch zum Beispiel - der Typ da dr�ben am Lagerfeuer, vor dem musst du dich in Acht nehmen.
};


instance DIA_Wedge_WarnsOfButch(C_Info)
{
	npc = ORG_850_Wedge;
	condition = DIA_Wedge_WarnsOfButch_Condition;
	information = DIA_Wedge_WarnsOfButch_Info;
	important = 0;
	permanent = 0;
	description = "Was ist mit Butch?";
};


func int DIA_Wedge_WarnsOfButch_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Wedge_Hello))
	{
		return TRUE;
	};
};

func void DIA_Wedge_WarnsOfButch_Info()
{
	AI_Output(other,self,"DIA_Wedge_WarnsOfButch_15_00");	//Was ist mit Butch?
	AI_Output(self,other,"DIA_Wedge_WarnsOfButch_05_01");	//Er hat die fiese Angewohnheit, Neuen zur Begr��ung das Fell �ber die Ohren zu ziehen. Also geh' ihm am besten aus dem Weg.
	AI_Output(other,self,"DIA_Wedge_WarnsOfButch_05_04");	//Vielleicht sollte ich mich mal um Butch k�mmern.
	AI_Output(self,other,"DIA_Wedge_WarnsOfButch_05_05");	//Was? DU? Sag' hinterher nicht, dass ich dich nicht gewarnt h�tte.
	BUTCH_RESPECT = LOG_RUNNING;
	Log_CreateTopic(CH1_ORGRESPECT,LOG_MISSION);
	Log_SetTopicStatus(CH1_ORGRESPECT,LOG_RUNNING);
	B_LogEntry(CH1_ORGRESPECT,"Wedge, einer der Banditen aus dem neuen Lager, erz�hlte mir von einem Banditen namens Butch, der die Angewohnheit hat Neulingen das Fell �ber die Ohren zu ziehen. Vielleicht sollte ich ihm mal eine Lektion erteilen, so dass ich mir etwas Respekt im Lager verschaffe.");
};


instance DIA_Wedge_Lehrer(C_Info)
{
	npc = ORG_850_Wedge;
	nr = 700;
	condition = DIA_Wedge_Lehrer_Condition;
	information = DIA_Wedge_Lehrer_Info;
	permanent = 1;
	description = "Was kannst du mir beibringen?";
};


func int DIA_Wedge_Lehrer_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Wedge_Hello))
	{
		return TRUE;
	};
};

func void DIA_Wedge_Lehrer_Info()
{
	if(log_wedgelearn == FALSE)
	{
		Log_CreateTopic(GE_TeacherNC,LOG_NOTE);
		B_LogEntry(GE_TeacherNC,"Wedge der Bandit, kann mir die Talente SCHLEICHEN, TASCHENDIEBSTAHL und SCHL�SSER �FFNEN beibringen.");
		log_wedgelearn = TRUE;
	};
	AI_Output(other,self,"DIA_Wedge_Lehrer_15_00");	//Was kannst du mir beibringen?
	AI_Output(self,other,"DIA_Wedge_Lehrer_05_01");	//Kommt drauf an, was willst du wissen?
	Info_ClearChoices(DIA_Wedge_Lehrer);
	Info_AddChoice(DIA_Wedge_Lehrer,DIALOG_BACK,DIA_Wedge_Lehrer_BACK);
	if(Npc_GetTalentSkill(hero,NPC_TALENT_PICKPOCKET) == 1)
	{
		Info_AddChoice(DIA_Wedge_Lehrer,B_BuildLearnString(NAME_LearnPickpocket_2,LPCOST_TALENT_PICKPOCKET_2,0),DIA_Wedge_Lehrer_Pickpocket2);
	};
	if(Npc_GetTalentSkill(hero,NPC_TALENT_PICKPOCKET) == 0)
	{
		Info_AddChoice(DIA_Wedge_Lehrer,B_BuildLearnString(NAME_LearnPickpocket_1,LPCOST_TALENT_PICKPOCKET_1,0),DIA_Wedge_Lehrer_Pickpocket);
	};
	if(Npc_GetTalentSkill(hero,NPC_TALENT_PICKLOCK) == 1)
	{
		Info_AddChoice(DIA_Wedge_Lehrer,B_BuildLearnString(NAME_LearnPicklock_2,LPCOST_TALENT_PICKLOCK_2,0),DIA_Wedge_Lehrer_Lockpick2);
	};
	if(Npc_GetTalentSkill(hero,NPC_TALENT_PICKLOCK) == 0)
	{
		Info_AddChoice(DIA_Wedge_Lehrer,B_BuildLearnString(NAME_LearnPicklock_1,LPCOST_TALENT_PICKLOCK_1,0),DIA_Wedge_Lehrer_Lockpick);
	};
	if(Npc_GetTalentSkill(hero,NPC_TALENT_SNEAK) == 0)
	{
		Info_AddChoice(DIA_Wedge_Lehrer,B_BuildLearnString(NAME_LearnSneak,LPCOST_TALENT_SNEAK,0),DIA_Wedge_Lehrer_Schleichen);
	};
};

func void DIA_Wedge_Lehrer_Schleichen()
{
	AI_Output(other,self,"DIA_Wedge_Lehrer_Schleichen_15_00");	//Ich will lernen, mich lautlos zu bewegen.
	if(B_GiveSkill(other,NPC_TALENT_SNEAK,1,LPCOST_TALENT_SNEAK))
	{
		AI_Output(self,other,"DIA_Wedge_Lehrer_Schleichen_05_01");	//Es ist alles eine Frage des Gleichgewichts. Du musst auch lernen, deinen Atem zu kontrollieren.
		AI_Output(self,other,"DIA_Wedge_Lehrer_Schleichen_05_02");	//Beachte die richtige Haltung, und niemand wird dich h�ren, wenn du dich bewegst.
	};
};

func void DIA_Wedge_Lehrer_Lockpick()
{
	AI_Output(other,self,"DIA_Wedge_Lehrer_Lockpick_15_00");	//Wie werde ich besser im Knacken von Schl�ssern?
	if(B_GiveSkill(other,NPC_TALENT_PICKLOCK,1,LPCOST_TALENT_PICKLOCK_1))
	{
		AI_Output(self,other,"DIA_Wedge_Lehrer_Lockpick_05_01");	//Das willst du gerne wissen, hm? Ist f�r den Anfang nicht so schwer.
		AI_Output(self,other,"DIA_Wedge_Lehrer_Lockpick_05_02");	//Du musst vor allem darauf achten, dass dir dein Dietrich nicht abbricht.
		AI_Output(self,other,"DIA_Wedge_Lehrer_Lockpick_05_03");	//Wenn du in Zukunft mit weniger Gewalt an die Sache rangehst, wirst du merken, dass du weniger Dietriche verbrauchst!
	};
};

func void DIA_Wedge_Lehrer_Lockpick2()
{
	AI_Output(other,self,"DIA_Wedge_Lehrer_Lockpick2_15_00");	//Wie werde ich ein Meister im �ffnen von Schl�ssern?
	if(B_GiveSkill(other,NPC_TALENT_PICKLOCK,2,LPCOST_TALENT_PICKLOCK_2))
	{
		AI_Output(self,other,"DIA_Wedge_Lehrer_Lockpick2_05_01");	//Nur wer schon einige �bung hat, merkt genau, wann ihm ein Dietrich abbricht und wann nicht. Du erkennst es am Ger�usch!
		AI_Output(self,other,"DIA_Wedge_Lehrer_Lockpick2_05_02");	//Ich denke, du bist jetzt so weit - lerne auf das leise Klicken des Schlosses zu achten, und du wirst nur noch selten das Pech haben, einen Dietrich zu verlieren.
		AI_Output(self,other,"DIA_Wedge_Lehrer_Lockpick2_05_03");	//Ein Meister des Fachs hat eine gute Chance, eine Truhe zu �ffnen, ohne dass sein Dietrich �berhaupt abbricht.
	};
};

func void DIA_Wedge_Lehrer_Pickpocket()
{
	AI_Output(other,self,"DIA_Wedge_Lehrer_PICKPOCKET_15_00");	//Ich will ein guter Taschendieb werden!
	if(Npc_GetTalentSkill(other,NPC_TALENT_SNEAK) == 1)
	{
		if(B_GiveSkill(other,NPC_TALENT_PICKPOCKET,1,LPCOST_TALENT_PICKPOCKET_1))
		{
			AI_Output(self,other,"DIA_Wedge_Lehrer_PICKPOCKET_05_01");	//So, du willst also ein paar Leute um ihre Sachen erleichtern? Nun gut.
			AI_Output(self,other,"DIA_Wedge_Lehrer_PICKPOCKET_05_02");	//Ich werde dir beibringen, wie du besser wirst, aber es besteht immer noch eine Chance, dass du erwischt wirst.
			AI_Output(self,other,"DIA_Wedge_Lehrer_PICKPOCKET_05_03");	//Das Risiko solltest du nur eingehen, wenn au�er deinem Opfer niemand sonst da ist.
			AI_Output(self,other,"DIA_Wedge_Lehrer_PICKPOCKET_05_04");	//Erst als Meister wirst du in der Lage sein, jemanden etwas aus der Tasche zu ziehen, ohne dass er es bemerkt!
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Wedge_lehrer_Pickpocket_05_05");	//Vergiss es! Ohne dass du schleichen kannst, wirst du NIEMALS ein geschickter Dieb.
	};
};

func void DIA_Wedge_Lehrer_Pickpocket2()
{
	AI_Output(other,self,"DIA_Wedge_Lehrer_Pickpocket2_15_00");	//Ich will ein Meister der Taschendiebe werden!
	if(B_GiveSkill(other,NPC_TALENT_PICKPOCKET,2,LPCOST_TALENT_PICKPOCKET_2))
	{
		AI_Output(self,other,"DIA_Wedge_Lehrer_Pickpocket2_05_01");	//Ich denke, du bist gut genug, um in die letzten Geheimnisse eingeweiht zu werden.
		AI_Output(self,other,"DIA_Wedge_Lehrer_Pickpocket2_05_02");	//Du solltest aber wissen, dass es selbst den Besten manchmal passiert, dass sie bemerkt werden.
		AI_Output(self,other,"DIA_Wedge_Lehrer_Pickpocket2_05_03");	//Also pass auf dich auf.
	};
};

func void DIA_Wedge_Lehrer_BACK()
{
	Info_ClearChoices(DIA_Wedge_Lehrer);
};


instance DIA_WEDGE_NOWORG(C_Info)
{
	npc = ORG_850_Wedge;
	nr = 1;
	condition = dia_wedge_noworg_condition;
	information = dia_wedge_noworg_info;
	permanent = 0;
	important = 1;
};


func int dia_wedge_noworg_condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_ORG)
	{
		return TRUE;
	};
};

func void dia_wedge_noworg_info()
{
	AI_Output(self,other,"DIA_Wedge_NowORG_09_00");	//Du geh�rst jetzt auch zu uns, was? Einen wie dich k�nnen wir gut gebrauchen.
};


instance DIA_WEDGE_SUCCESS(C_Info)
{
	npc = ORG_850_Wedge;
	condition = dia_wedge_success_condition;
	information = dia_wedge_success_info;
	important = 0;
	permanent = 0;
	description = "Butch ist kein Problem mehr.";
};


func int dia_wedge_success_condition()
{
	if((BUTCH_RESPECT == LOG_RUNNING) && ORG_851_Butch.aivar[AIV_WASDEFEATEDBYSC])
	{
		return TRUE;
	};
};

func void dia_wedge_success_info()
{
	AI_Output(other,self,"DIA_Wedge_SUCCESS_15_00");	//Butch ist kein Problem mehr.
	AI_Output(self,other,"DIA_Wedge_SUCCESS_15_01");	//Das hab' ich schon mitbekommen. Nicht schlecht kleiner, nicht schlecht.
	AI_Output(self,other,"DIA_Wedge_SUCCESS_15_02");	//Willst dir wohl einen Namen machen, was?
	AI_Output(self,other,"DIA_Wedge_SUCCESS_15_03");	//Nur weiter so, dann wirst du leichtes Spiel haben bei uns aufgenommen zu werden.
	AI_StopProcessInfos(self);
	BUTCH_RESPECT = LOG_SUCCESS;
	B_GiveXP(XP_BUTCHRESPECT);
	Log_SetTopicStatus(CH1_ORGRESPECT,LOG_SUCCESS);
	B_LogEntry(CH1_ORGRESPECT,"Wedge, war sehr beeindruckt, dass ich Butch geschafft habe und erz�hlte mir, dass mir das einiges an Respekt im Lager verschafft habe.");
};

