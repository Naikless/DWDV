
instance DIA_TPL_1402_GorNaToth_Exit(C_Info)
{
	npc = TPL_1402_GorNaToth;
	nr = 999;
	condition = DIA_TPL_1402_GorNaToth_Exit_Condition;
	information = DIA_TPL_1402_GorNaToth_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_TPL_1402_GorNaToth_Exit_Condition()
{
	return TRUE;
};

func void DIA_TPL_1402_GorNaToth_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GorNaToth_Abweisend(C_Info)
{
	npc = TPL_1402_GorNaToth;
	nr = 1;
	condition = DIA_GorNaToth_Abweisend_Condition;
	information = DIA_GorNaToth_Abweisend_Info;
	permanent = 1;
	description = "Kannst du mich trainieren?";
};


func int DIA_GorNaToth_Abweisend_Condition()
{
	if(!Npc_KnowsInfo(hero,DIA_GorNaToth_AngarTalked) && !C_NpcBelongsToPsiCamp(hero))
	{
		return 1;
	};
};

func void DIA_GorNaToth_Abweisend_Info()
{
	AI_Output(other,self,"DIA_GorNaToth_AngarTalked_15_00");	//Kannst du mich trainieren?
	AI_Output(self,other,"DIA_GorNaToth_AngarTalked_11_01");	//Geh mir aus den Augen, Unw�rdiger. Ich trainiere nur die Templer des Schl�fers.
	AI_StopProcessInfos(self);
};


var int shark_hunter;

instance DIA_GorNaToth_AngarTalked(C_Info)
{
	npc = TPL_1402_GorNaToth;
	nr = 1;
	condition = DIA_GorNaToth_AngarTalked_Condition;
	information = DIA_GorNaToth_AngarTalked_Info;
	permanent = 0;
	important = 1;
};


func int DIA_GorNaToth_AngarTalked_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_CorAngar_LaterTrainer))
	{
		return 1;
	};
};

func void DIA_GorNaToth_AngarTalked_Info()
{
	AI_Output(self,other,"DIA_GorNaToth_AngarTalked_11_00");	//Cor Angar hat mit dir geredet? Was hat er gesagt?
	Info_ClearChoices(DIA_GorNaToth_AngarTalked);
	Info_AddChoice(DIA_GorNaToth_AngarTalked,"Er hat gesagt, du seist unw�rdig, die R�stung eines Templers zu tragen.",DIA_GorNaToth_AngarTalked_Unworthy);
	Info_AddChoice(DIA_GorNaToth_AngarTalked,"Er sagte, die Sumpfhaie habe er noch nie leiden k�nnen.",DIA_GorNaToth_AngarTalked_Shark);
	Info_AddChoice(DIA_GorNaToth_AngarTalked,"Er hat gesagt, ich soll wiederkommen, wenn ich Templer bin.",DIA_GorNaToth_AngarTalked_Normal);
};

func void DIA_GorNaToth_AngarTalked_Normal()
{
	AI_Output(other,self,"DIA_GorNaToth_AngarTalked_Normal_15_00");	//Er hat gesagt, ich soll wiederkommen, wenn ich Templer bin.
	AI_Output(self,other,"DIA_GorNaToth_AngarTalked_Normal_11_01");	//Er scheint sehr viel von dir zu halten. Er redet so gut wie nie mit jemandem.
	AI_Output(self,other,"DIA_GorNaToth_AngarTalked_Normal_11_02");	//Es ist eine gro�e Ehre f�r dich, dass er dich �berhaupt bemerkt hat. Mit MIR hat er das letzte Mal vor zwei Monaten geredet.
	Info_ClearChoices(DIA_GorNaToth_AngarTalked);
};

func void DIA_GorNaToth_AngarTalked_Shark()
{
	AI_Output(other,self,"DIA_GorNaToth_AngarTalked_Shark_15_00");	//Er sagte, die Sumpfhaie habe er noch nie leiden k�nnen.
	AI_Output(self,other,"DIA_GorNaToth_AngarTalked_Shark_11_01");	//Was ...? (bestimmt) Eine heilige Aufgabe erwartet mich!
	AI_Output(self,other,"DIA_GorNaToth_AngarTalked_Shark_11_02");	//Der Wunsch meines Meisters ist mir Befehl.
	SHARK_HUNTER = TRUE;
	Info_ClearChoices(DIA_GorNaToth_AngarTalked);
};

func void DIA_GorNaToth_AngarTalked_Unworthy()
{
	AI_Output(other,self,"DIA_GorNaToth_AngarTalked_Unworthy_15_00");	//Er hat gesagt, du seiest unw�rdig, die R�stung eines Templers zu tragen.
	AI_Output(self,other,"DIA_GorNaToth_AngarTalked_Unworthy_11_01");	//Niemals! Das hat er nicht gesagt! Nicht �ber MICH!
	Info_ClearChoices(DIA_GorNaToth_AngarTalked);
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_Attack,1,"");
};


instance TPL_1402_GorNaToth_GETSTUFF(C_Info)
{
	npc = TPL_1402_GorNaToth;
	condition = TPL_1402_GorNaToth_GETSTUFF_Condition;
	information = TPL_1402_GorNaToth_GETSTUFF_Info;
	important = 0;
	permanent = 0;
	description = "Ich m�chte meine Templer-R�stung abholen.";
};


func int TPL_1402_GorNaToth_GETSTUFF_Condition()
{
	if(Npc_KnowsInfo(hero,GUR_1202_CorAngar_WANNABETPL) && (Npc_GetTrueGuild(hero) == GIL_TPL))
	{
		return TRUE;
	};
};

func void TPL_1402_GorNaToth_GETSTUFF_Info()
{
	AI_Output(other,self,"TPL_1402_GorNaToth_GETSTUFF_Info_15_01");	//Ich m�chte meine Templer-R�stung abholen.
	AI_Output(self,other,"TPL_1402_GorNaToth_GETSTUFF_Info_11_02");	//Es ist mir eine Freude, dem Mann eine von unseren R�stungen zu �berreichen, der die Eier der Minecrawler gefunden hat.
	AI_Output(self,other,"TPL_1402_GorNaToth_GETSTUFF_Info_11_03");	//Diese R�stung soll dich sch�tzen, so wie der Schl�fer die Bruderschaft sch�tzt!
	B_LogEntry(GE_BecomeTemplar,"Gor Na Toth �berreichte mir meine erste Templer-R�stung. Nun bin ich ein vollwertiges Mitglied dieser Kriegergemeinschaft!");
	Log_CreateTopic(GE_TraderPSI,LOG_NOTE);
	B_LogEntry(GE_TraderPSI,"Gor Na Toth verteilt bessere Templer-R�STUNGEN. Daf�r erwarteter allerdings eine gro�z�gige Spende an die Bruderschaft. Er ist tags�ber auf dem �bungsplatz der Templer zu finden.");
	CreateInvItem(hero,tpl_armor_l);
	CreateInvItem(self,ItAmArrow);
	B_GiveInvItems(self,hero,ItAmArrow,1);
	Npc_RemoveInvItem(hero,ItAmArrow);
	AI_EquipBestArmor(hero);
};


instance TPL_1402_GorNaToth_ARMOR(C_Info)
{
	npc = TPL_1402_GorNaToth;
	condition = TPL_1402_GorNaToth_ARMOR_Condition;
	information = TPL_1402_GorNaToth_ARMOR_Info;
	important = 0;
	permanent = 1;
	description = "Ich brauche eine bessere R�stung.";
};


func int TPL_1402_GorNaToth_ARMOR_Condition()
{
	if(Npc_KnowsInfo(hero,TPL_1402_GorNaToth_GETSTUFF))
	{
		return TRUE;
	};
};

func void TPL_1402_GorNaToth_ARMOR_Info()
{
	AI_Output(other,self,"Info_GorNaToth_ARMOR_15_01");	//Ich brauche eine bessere R�stung.
	AI_Output(self,other,"Info_GorNaToth_ARMOR_11_02");	//Ich k�nnte dir eine bessere R�stung zuteilen, doch daf�r musst du einen gro�z�gigen Beitrag an die Bruderschaft spenden!
	Info_ClearChoices(TPL_1402_GorNaToth_ARMOR);
	Info_AddChoice(TPL_1402_GorNaToth_ARMOR,DIALOG_BACK,TPL_1402_GorNaToth_ARMOR_BACK);
	Info_AddChoice(TPL_1402_GorNaToth_ARMOR,B_BuildBuyArmorString(NAME_GorNaTothHeavyTpl,VALUE_TPL_ARMOR_H),TPL_1402_GorNaToth_ARMOR_H);
	Info_AddChoice(TPL_1402_GorNaToth_ARMOR,B_BuildBuyArmorString(NAME_GorNaTothTpl,VALUE_TPL_ARMOR_M),TPL_1402_GorNaToth_ARMOR_M);
};

func void TPL_1402_GorNaToth_ARMOR_M()
{
	AI_Output(hero,self,"Info_GorNaToth_ARMOR_M_15_01");	//Ich m�chte eine mittelschwere Templer-R�stung haben.
	if(Kapitel < 3)
	{
		AI_Output(self,hero,"Info_GorNaToth_ARMOR_M_11_02");	//Du bist noch nicht so weit! Bew�hre dich erst als Templer, dann wirst dir auch das Recht zuteil, eine bessere R�stung zu tragen.
	}
	else if(Npc_HasItems(hero,ItMiNugget) < VALUE_TPL_ARMOR_M)
	{
		AI_Output(self,hero,"Info_GorNaToth_ARMOR_M_11_03");	//Sobald du in der Lage bist, eine ausreichend gro�e Spende an unsere Gemeinschaft zu leisten, steht dir eine bessere R�stung zur Verf�gung!
	}
	else
	{
		AI_Output(self,hero,"Info_GorNaToth_ARMOR_M_11_04");	//Nun, da du in der Lage bist, die erforderliche Spende zu leisten, sollst du fortan von einer neuen R�stung gesch�tzt werden.
		B_GiveInvItems(hero,self,ItMiNugget,VALUE_TPL_ARMOR_M);
		CreateInvItem(hero,tpl_armor_m);
		CreateInvItem(self,ItAmArrow);
		B_GiveInvItems(self,hero,ItAmArrow,1);
		Npc_RemoveInvItem(hero,ItAmArrow);
		AI_EquipBestArmor(hero);
	};
	Info_ClearChoices(TPL_1402_GorNaToth_ARMOR);
};

func void TPL_1402_GorNaToth_ARMOR_H()
{
	AI_Output(hero,self,"Info_GorNaToth_ARMOR_H_15_01");	//Ich m�chte eine schwere Templer-R�stung haben.
	if(Kapitel < 4)
	{
		AI_Output(self,hero,"Info_GorNaToth_ARMOR_H_11_02");	//Du bist noch nicht so weit! Bew�hre dich erst noch weiter f�r unsere Gemeinschaft, dann wirst dir auch das Recht zuteil, solch eine erlesene R�stung zu tragen.
	}
	else if(Npc_HasItems(hero,ItMiNugget) < VALUE_TPL_ARMOR_H)
	{
		AI_Output(self,hero,"Info_GorNaToth_ARMOR_H_11_03");	//Du hast dir mittlerweile das Recht verdient, einen solchen Panzer zu tragen, doch du bist zurzeit nicht in der Lage, eine ausreichende Spende an die Gemeinschaft zu leisten!
	}
	else
	{
		AI_Output(self,hero,"Info_GorNaToth_ARMOR_H_11_04");	//Trage diese R�stung fortan als Zeichen der h�chsten Ehre!
		B_GiveInvItems(hero,self,ItMiNugget,VALUE_TPL_ARMOR_H);
		CreateInvItem(self,ItAmArrow);
		B_GiveInvItems(self,hero,ItAmArrow,1);
		Npc_RemoveInvItem(hero,ItAmArrow);
		CreateInvItem(hero,tpl_armor_h);
		AI_EquipBestArmor(hero);
	};
	Info_ClearChoices(TPL_1402_GorNaToth_ARMOR);
};

func void TPL_1402_GorNaToth_ARMOR_BACK()
{
	AI_Output(hero,self,"Info_GorNaToth_ARMOR_BACK_15_01");	//Ich hab' es mir anders �berlegt!
	AI_Output(self,hero,"Info_GorNaToth_ARMOR_BACK_11_02");	//Wie du meinst. Du wei�t, wo du mich findest!
	Info_ClearChoices(TPL_1402_GorNaToth_ARMOR);
};


instance TPL_1402_GorNaToth_Teach(C_Info)
{
	npc = TPL_1402_GorNaToth;
	nr = 10;
	condition = TPL_1402_GorNaToth_Teach_Condition;
	information = TPL_1402_GorNaToth_Teach_Info;
	permanent = 1;
	description = "Kannst du mich trainieren?";
};


func int TPL_1402_GorNaToth_Teach_Condition()
{
	if(C_NpcBelongsToPsiCamp(hero))
	{
		return TRUE;
	};
};

func void TPL_1402_GorNaToth_Teach_Info()
{
	AI_Output(other,self,"TPL_1402_GorNaToth_Teach_15_00");	//Kannst du mich trainieren?
	AI_Output(self,other,"TPL_1402_GorNaToth_Teach_11_01");	//St�rke und Geschicklichkeit sind ebenso wichtig wie geistige Kraft.
	Info_ClearChoices(TPL_1402_GorNaToth_Teach);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,DIALOG_BACK,TPL_1402_GorNaToth_Teach_BACK);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnStrength_5,5 * LPCOST_ATTRIBUTE_STRENGTH,0),TPL_1402_GorNaToth_Teach_STR_5);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0),TPL_1402_GorNaToth_Teach_STR_1);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),TPL_1402_GorNaToth_Teach_DEX_5);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),TPL_1402_GorNaToth_Teach_DEX_1);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnMana_5,5 * LPCOST_ATTRIBUTE_MANA,0),TPL_1402_GorNaToth_Teach_MAN_5);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0),TPL_1402_GorNaToth_Teach_MAN_1);
	if(log_gornatothtrain == FALSE)
	{
		Log_CreateTopic(GE_TeacherPSI,LOG_NOTE);
		B_LogEntry(GE_TeacherPSI,"Der Templer Gor Na Toth kann mir helfen, meine ST�RKE, mein GESCHICK und mein MANA zu verbessern.");
		log_gornatothtrain = TRUE;
	};
};

func void TPL_1402_GorNaToth_Teach_BACK()
{
	Info_ClearChoices(TPL_1402_GorNaToth_Teach);
};

func void TPL_1402_GorNaToth_Teach_STR_1()
{
	B_BuyAttributePoints(other,ATR_STRENGTH,LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices(TPL_1402_GorNaToth_Teach);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,DIALOG_BACK,TPL_1402_GorNaToth_Teach_BACK);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnStrength_5,5 * LPCOST_ATTRIBUTE_STRENGTH,0),TPL_1402_GorNaToth_Teach_STR_5);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0),TPL_1402_GorNaToth_Teach_STR_1);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),TPL_1402_GorNaToth_Teach_DEX_5);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),TPL_1402_GorNaToth_Teach_DEX_1);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnMana_5,5 * LPCOST_ATTRIBUTE_MANA,0),TPL_1402_GorNaToth_Teach_MAN_5);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0),TPL_1402_GorNaToth_Teach_MAN_1);
};

func void TPL_1402_GorNaToth_Teach_STR_5()
{
	B_BuyAttributePoints(other,ATR_STRENGTH,5 * LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices(TPL_1402_GorNaToth_Teach);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,DIALOG_BACK,TPL_1402_GorNaToth_Teach_BACK);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnStrength_5,5 * LPCOST_ATTRIBUTE_STRENGTH,0),TPL_1402_GorNaToth_Teach_STR_5);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0),TPL_1402_GorNaToth_Teach_STR_1);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),TPL_1402_GorNaToth_Teach_DEX_5);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),TPL_1402_GorNaToth_Teach_DEX_1);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnMana_5,5 * LPCOST_ATTRIBUTE_MANA,0),TPL_1402_GorNaToth_Teach_MAN_5);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0),TPL_1402_GorNaToth_Teach_MAN_1);
};

func void TPL_1402_GorNaToth_Teach_DEX_1()
{
	B_BuyAttributePoints(other,ATR_DEXTERITY,LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices(TPL_1402_GorNaToth_Teach);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,DIALOG_BACK,TPL_1402_GorNaToth_Teach_BACK);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnStrength_5,5 * LPCOST_ATTRIBUTE_STRENGTH,0),TPL_1402_GorNaToth_Teach_STR_5);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0),TPL_1402_GorNaToth_Teach_STR_1);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),TPL_1402_GorNaToth_Teach_DEX_5);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),TPL_1402_GorNaToth_Teach_DEX_1);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnMana_5,5 * LPCOST_ATTRIBUTE_MANA,0),TPL_1402_GorNaToth_Teach_MAN_5);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0),TPL_1402_GorNaToth_Teach_MAN_1);
};

func void TPL_1402_GorNaToth_Teach_DEX_5()
{
	B_BuyAttributePoints(other,ATR_DEXTERITY,5 * LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices(TPL_1402_GorNaToth_Teach);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,DIALOG_BACK,TPL_1402_GorNaToth_Teach_BACK);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnStrength_5,5 * LPCOST_ATTRIBUTE_STRENGTH,0),TPL_1402_GorNaToth_Teach_STR_5);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0),TPL_1402_GorNaToth_Teach_STR_1);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),TPL_1402_GorNaToth_Teach_DEX_5);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),TPL_1402_GorNaToth_Teach_DEX_1);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnMana_5,5 * LPCOST_ATTRIBUTE_MANA,0),TPL_1402_GorNaToth_Teach_MAN_5);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0),TPL_1402_GorNaToth_Teach_MAN_1);
};

func void TPL_1402_GorNaToth_Teach_MAN_1()
{
	B_BuyAttributePoints(other,ATR_MANA_MAX,LPCOST_ATTRIBUTE_MANA);
	Info_ClearChoices(TPL_1402_GorNaToth_Teach);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,DIALOG_BACK,TPL_1402_GorNaToth_Teach_BACK);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnStrength_5,5 * LPCOST_ATTRIBUTE_STRENGTH,0),TPL_1402_GorNaToth_Teach_STR_5);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0),TPL_1402_GorNaToth_Teach_STR_1);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),TPL_1402_GorNaToth_Teach_DEX_5);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),TPL_1402_GorNaToth_Teach_DEX_1);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnMana_5,5 * LPCOST_ATTRIBUTE_MANA,0),TPL_1402_GorNaToth_Teach_MAN_5);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0),TPL_1402_GorNaToth_Teach_MAN_1);
};

func void TPL_1402_GorNaToth_Teach_MAN_5()
{
	B_BuyAttributePoints(other,ATR_MANA_MAX,5 * LPCOST_ATTRIBUTE_MANA);
	Info_ClearChoices(TPL_1402_GorNaToth_Teach);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,DIALOG_BACK,TPL_1402_GorNaToth_Teach_BACK);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnStrength_5,5 * LPCOST_ATTRIBUTE_STRENGTH,0),TPL_1402_GorNaToth_Teach_STR_5);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0),TPL_1402_GorNaToth_Teach_STR_1);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),TPL_1402_GorNaToth_Teach_DEX_5);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),TPL_1402_GorNaToth_Teach_DEX_1);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnMana_5,5 * LPCOST_ATTRIBUTE_MANA,0),TPL_1402_GorNaToth_Teach_MAN_5);
	Info_AddChoice(TPL_1402_GorNaToth_Teach,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0),TPL_1402_GorNaToth_Teach_MAN_1);
};


instance TPL_1402_GorNaToth_TRAIN(C_Info)
{
	npc = TPL_1402_GorNaToth;
	condition = TPL_1402_GorNaToth_TRAIN_Condition;
	information = TPL_1402_GorNaToth_TRAIN_Info;
	important = 0;
	permanent = 1;
	description = B_BuildLearnString(NAME_Learn1h_1,LPCOST_TALENT_1H_1,0);
};


func int TPL_1402_GorNaToth_TRAIN_Condition()
{
	if((Npc_GetTalentSkill(hero,NPC_TALENT_1H) < 1) && C_NpcBelongsToPsiCamp(hero))
	{
		return TRUE;
	};
};

func void TPL_1402_GorNaToth_TRAIN_Info()
{
	if(log_gornatothfight == FALSE)
	{
		Log_CreateTopic(GE_TeacherPSI,LOG_NOTE);
		B_LogEntry(GE_TeacherPSI,"Der Templer Gor Na Toth kann mir den Kampf mit EINH�NDIGEN Waffen beibringen.");
		log_gornatothfight = TRUE;
	};
	AI_Output(other,self,"TPL_1402_GorNaToth_TRAIN_Info_15_00");	//Ich will besser mit Einhandwaffen umgehen k�nnen.
	if(B_GiveSkill(hero,NPC_TALENT_1H,1,LPCOST_TALENT_1H_1))
	{
		AI_Output(self,other,"TPL_1402_GorNaToth_TRAIN_11_01");	//Gute Entscheidung! Um deine Technik zu verbessern, musst du erst einmal lernen, deine Waffe richtig zu halten.
		AI_Output(self,other,"TPL_1402_GorNaToth_TRAIN_11_02");	//Anf�nger neigen dazu, Einhandwaffen mit beiden H�nden zu halten. Mit so was f�ngst du am besten gar nicht erst an, das behindert dich nur.
		AI_Output(self,other,"TPL_1402_GorNaToth_TRAIN_11_03");	//Halt die Waffe mit einer Hand, Klinge nach oben, und dann immer sch�n schwingen lassen.
		AI_Output(self,other,"TPL_1402_GorNaToth_TRAIN_11_04");	//Du musst lernen, den Schwung deiner Waffe mit deinen Bewegungen in Einklang zu bringen, dann kannst du schneller zuschlagen.
		AI_Output(self,other,"TPL_1402_GorNaToth_TRAIN_11_05");	//Wenn du dich an meine Anweisungen h�ltst, wirst du in Zukunft eleganter und vor allem schneller k�mpfen.
		AI_Output(self,other,"TPL_1402_GorNaToth_TRAIN_11_06");	//Ach, und noch was: Manche Treffer richten mehr Schaden an als andere! Als Anf�nger hast du nur eine geringe Chance, solche kritischen Treffer zu landen.
		AI_Output(self,other,"TPL_1402_GorNaToth_TRAIN_11_07");	//Aber je weiter du fortschreitest, desto besser wird diese F�higkeit.
		TPL_1402_GorNaToth_TRAIN.permanent = 0;
		AI_StopProcessInfos(self);
	};
};


instance TPL_1402_GorNaToth_TRAINAGAIN(C_Info)
{
	npc = TPL_1402_GorNaToth;
	condition = TPL_1402_GorNaToth_TRAINAGAIN_Condition;
	information = TPL_1402_GorNaToth_TRAINAGAIN_Info;
	important = 0;
	permanent = 1;
	description = B_BuildLearnString(NAME_Learn1h_2,LPCOST_TALENT_1H_2,0);
};


func int TPL_1402_GorNaToth_TRAINAGAIN_Condition()
{
	if((Npc_GetTalentSkill(hero,NPC_TALENT_1H) == 1) && C_NpcBelongsToPsiCamp(hero))
	{
		return TRUE;
	};
};

func void TPL_1402_GorNaToth_TRAINAGAIN_Info()
{
	AI_Output(other,self,"TPL_1402_GorNaToth_TRAINAGAIN_Info_15_01");	//Zeige mir, wie ich im Umgang mit Waffen noch besser werden kann.
	if(B_GiveSkill(hero,NPC_TALENT_1H,2,LPCOST_TALENT_1H_2))
	{
		AI_Output(self,other,"TPL_1402_GorNaToth_TRAINAGAIN_Info_11_02");	//Na gut, die Grundkenntnisse hast du ja schon. Wenn du die Waffe gesenkt h�ltst, dann kannst du direkt mehr Wucht in deinen ersten Schlag legen.
		AI_Output(self,other,"TPL_1402_GorNaToth_TRAINAGAIN_Info_11_03");	//Nutze den Schwung, wei�t du noch? Gut, der n�chste Schritt ist, dass du deinen K�rper mehr einsetzt. Wenn du zweimal geschlagen hast, drehe dich um die eigene Achse, damit �berraschst du den Gegner und bist in einer optimalen Position.
		AI_Output(self,other,"TPL_1402_GorNaToth_TRAINAGAIN_Info_11_04");	//Dann ziehst du deine Klinge noch einmal quer von rechts nach links .
		AI_Output(self,other,"TPL_1402_GorNaToth_TRAINAGAIN_Info_11_05");	//Und wieder von vorne. Vergiss nicht, �bung macht den Meister. Also, geh jetzt und werde ein wahrer Meister des einh�ndigen Kampfes.
		TPL_1402_GorNaToth_TRAINAGAIN.permanent = 0;
		AI_StopProcessInfos(self);
	};
};


var int joinpsi_aufgabe;

instance DIA_GORNATOTH_JAGD(C_Info)
{
	npc = TPL_1402_GorNaToth;
	nr = 1;
	condition = dia_gornatoth_jagd_condition;
	information = dia_gornatoth_jagd_info;
	permanent = 0;
	description = "Wonach h�lst du ausschau?";
};


func int dia_gornatoth_jagd_condition()
{
	if(Npc_KnowsInfo(hero,DIA_GorNaToth_AngarTalked) && (SHARK_HUNTER == TRUE) && (Kapitel == 3))
	{
		return 1;
	};
};

func void dia_gornatoth_jagd_info()
{
	AI_Output(other,self,"DIA_GorNaToth_Jagd_15_00");	//Wonach h�lst du ausschau?
	if(C_NpcBelongsToPsiCamp(hero))
	{
		AI_Output(self,other,"DIA_GorNaToth_Jagd_11_01");	//Gor Na Ran, sah vor einigen Tagen einen Sumpfhai der gef�hrlich nahe am Lager schwomm.
		AI_Output(self,other,"DIA_GorNaToth_Jagd_11_02");	//Er griff den Sumpfhai an, aber der konnte zur�ck in den Sumpf fl�chten und bereitet sich mit Sicherheit schon auf den n�chsten Angriff vor.
		AI_Output(self,other,"DIA_GorNaToth_Jagd_11_03");	//Es ist wohl an der Zeit f�r meine heilige Aufgabe.
		JOINPSI_AUFGABE = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_GorNaToth_Jagd_11_04");	//Geh mir aus den Augen! Die Aufgaben der Templer sind zu tiefgr�ndig um von Ungl�ubigen verstanden zu werden.
		AI_StopProcessInfos(self);
	};
};


instance DIA_GORNATOTH_HELFEN(C_Info)
{
	npc = TPL_1402_GorNaToth;
	nr = 1;
	condition = dia_gornatoth_helfen_condition;
	information = dia_gornatoth_helfen_info;
	permanent = 0;
	description = "Kann ich dir bei deiner heiligen Aufgabe helfen?";
};


func int dia_gornatoth_helfen_condition()
{
	if((JOINPSI_AUFGABE == TRUE) && (SHARK_HUNTER == TRUE))
	{
		return 1;
	};
};

func void dia_gornatoth_helfen_info()
{
	AI_Output(other,self,"DIA_GorNaToth_Helfen_15_00");	//Kann ich dir bei deiner "heiligen Aufgabe" helfen?
	AI_Output(self,other,"DIA_GorNaToth_Helfen_11_01");	//Ja das kannst du. Ich denke es wird am besten sein, wenn wir den Sumpfhai zu zweit angreifen.
	if(Npc_GetTrueGuild(hero) == GIL_NOV)
	{
		AI_Output(self,other,"DIA_GorNaToth_Helfen_11_02");	//Du bist zwar noch ein Novize, aber wenn der Schl�fer mit dir ist, bist auch du in der Lage diese Aufgabe zu meistern.
	}
	else if(Npc_GetTrueGuild(hero) == GIL_TPL)
	{
		AI_Output(self,other,"DIA_GorNaToth_Helfen_11_03");	//Als ein Templer des Schl�fers geh�rt es zu deinen Aufgaben das Lager zu besch�tzen.
	}
	else if(Npc_GetTrueGuild(hero) == GIL_GUR)
	{
		AI_Output(self,other,"DIA_GorNaToth_Helfen_11_04");	//Da du einer der Gurus unseres Lagers bist, bin ich mir sicher das uns deine Magie und geistige St�rke �berlegenheit im Kampf geben wird.
	};
	AI_Output(self,other,"DIA_GorNaToth_Helfen_11_05");	//Zusammen werden wir den Sumpfhai vernichten.
	AI_Output(self,other,"DIA_GorNaToth_Helfen_11_06");	//Aber wir sollten vorsichtig sein.
	AI_Output(self,other,"DIA_GorNaToth_Helfen_11_07");	//Gor Na Ran meinte, dass es sich um keinen normalen Sumpfhai handelt. Er schien viel st�rker und aggressiver als die normalen Exemplare.
	AI_Output(self,other,"DIA_GorNaToth_Helfen_11_08");	//Am besten folgst du mir. Ich werde vorraus gehen und uns so sicher wie m�glich durch den Sumpf f�hren.
	AI_Output(self,other,"DIA_GorNaToth_Helfen_11_09");	//Der Schl�fer ist mit uns!
	GORNATOTH_SHARKHUNT = LOG_RUNNING;
	Log_CreateTopic(CH3_SHARKHUNT,LOG_MISSION);
	Log_SetTopicStatus(CH3_SHARKHUNT,LOG_RUNNING);
	B_LogEntry(CH3_SHARKHUNT,"Gor Na Toth erz�hlte mir, dass sich ein verletzter Sumpfhai in der n�he des Lagers herumtreibt. Ich habe mich dazu bereit erkl�rt ihm zu helfen den Sumpfhai zu finden.");
	Npc_ExchangeRoutine(self,"GUIDE");
	AI_StopProcessInfos(self);
	Wld_InsertNpc(HurtSwampshark,"PATH_AROUND_PSI21");
};


instance DIA_GORNATOTH_ERLEDIGT(C_Info)
{
	npc = TPL_1402_GorNaToth;
	nr = 1;
	condition = dia_gornatoth_erledigt_condition;
	information = dia_gornatoth_erledigt_info;
	permanent = 0;
	important = 1;
	description = "Der Sumpfhai ist erledigt.";
};


func int dia_gornatoth_erledigt_condition()
{
	if(Hlp_StrCmp(Npc_GetNearestWP(self),"PATH_AROUND_PSI21"))
	{
		return 1;
	};
};

func void dia_gornatoth_erledigt_info()
{
	AI_Output(self,other,"DIA_GorNaToth_Erledigt_15_00");	//Der Sumpfhai ist erledigt.
	AI_Output(self,other,"DIA_GorNaToth_Erledigt_12_01");	//Das war gute Arbeit. Das Lager sollte jetzt wieder sicher sein.
	AI_Output(self,other,"DIA_GorNaToth_Erledigt_12_02");	//Du kannst wieder zur�ck ins Lager gehen und dich wieder deinen Aufgaben widmen.
	AI_Output(other,self,"DIA_GorNaToth_Erledigt_12_03");	//Wie sieht's mit einer Belohnung aus?
	AI_Output(self,other,"DIA_GorNaToth_Erledigt_12_04");	//Die hast du doch bereits erhalten?
	AI_Output(self,other,"DIA_GorNaToth_Erledigt_12_05");	//Gibt es eine sch�nere Belohnung als vom Schl�fer erleuchtet zu werden?
	AI_Output(self,other,"DIA_GorNaToth_Erledigt_12_06");	//Ich bin mir sicher, dass der Schl�fer �ber deine Taten wacht und immer bei dir ist.
	AI_Output(self,other,"DIA_GorNaToth_Erledigt_12_07");	//Viel Gl�ck bei deinen weiteren Aufgaben. Vergiss nie, dass die Opfer die du bringt f�r den Schl�fer sind. Er wird uns die Freiheit schenken.
	GORNATOTH_SHARKHUNT = LOG_SUCCESS;
	B_GiveXP(XP_SHARKHUNT);
	Log_SetTopicStatus(CH3_SHARKHUNT,LOG_SUCCESS);
	B_LogEntry(CH3_SHARKHUNT,"Ich habe den Sumpfhai zusammen mit Gor Na Toth zur Strecke gebracht. Statt einer handfesten Belohnung, habe ich die G�te des Schl�fers erhalten.");
	Npc_ExchangeRoutine(self,"START");
	AI_StopProcessInfos(self);
};

