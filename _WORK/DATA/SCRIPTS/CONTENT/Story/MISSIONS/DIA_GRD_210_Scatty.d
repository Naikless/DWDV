
instance DIA_Scatty_Exit(C_Info)
{
	npc = GRD_210_Scatty;
	nr = 999;
	condition = DIA_Scatty_Exit_Condition;
	information = DIA_Scatty_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Scatty_Exit_Condition()
{
	return 1;
};

func void DIA_Scatty_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Scatty_WhatDoYouDo(C_Info)
{
	npc = GRD_210_Scatty;
	nr = 1;
	condition = DIA_Scatty_WhatDoYouDo_Condition;
	information = DIA_Scatty_WhatDoYouDo_Info;
	permanent = 0;
	description = "Was machst du hier?";
};


func int DIA_Scatty_WhatDoYouDo_Condition()
{
	return 1;
};

func void DIA_Scatty_WhatDoYouDo_Info()
{
	AI_Output(other,self,"DIA_Scatty_WhatDoYouDo_15_00");	//Was machst du hier?
	AI_Output(self,other,"DIA_Scatty_WhatDoYouDo_01_01");	//Ich k�mmere mich um die Arena. Organisiere die Wetten, heuere neue K�mpfer an und so weiter ...
};


var int Scatty_ChargeKirgo;
var int Scatty_ChargeKharim;
var int Scatty_ChargeGorHanis;

instance DIA_Scatty_JoinOC(C_Info)
{
	npc = GRD_210_Scatty;
	nr = 4;
	condition = DIA_Scatty_JoinOC_Condition;
	information = DIA_Scatty_JoinOC_Info;
	permanent = 0;
	description = "Ich will mich dem Lager anschlie�en. Kannst du mir dabei helfen?";
};


func int DIA_Scatty_JoinOC_Condition()
{
	if((Npc_GetTrueGuild(hero) == GIL_None) && (HANIS_BET != TRUE) && (KIRGO_BET != TRUE) && (KHARIM_BET != TRUE) && (KIRGO_FIGHT != TRUE) && (KHARIM_FIGHT != TRUE) && (HANIS_FIGHT != TRUE))
	{
		return 1;
	};
};

func void DIA_Scatty_JoinOC_Info()
{
	var C_Npc Kirgo;
	var C_Npc Kharim;
	var C_Npc GorHanis;
	AI_Output(other,self,"DIA_Scatty_JoinOC_15_00");	//Ich will mich dem Lager anschlie�en. Kannst du mir dabei helfen?
	AI_Output(self,other,"DIA_Scatty_JoinOC_01_01");	//Wenn du es schaffst, mich zu beeindrucken - vielleicht.
	AI_Output(self,other,"DIA_Scatty_JoinOC_01_02");	//Einige der besten K�mpfer aller drei Lager kommen hier her um sich zu messen.
	AI_Output(self,other,"DIA_Scatty_JoinOC_01_03");	//Fordere einen von ihnen heraus und k�mpfe gegen ihn. Je nachdem, wie gut du dich schl�gst, wird mein Urteil �ber dich ausfallen.
	Scatty_ChargeKirgo = LOG_RUNNING;
	Scatty_ChargeKharim = LOG_RUNNING;
	Scatty_ChargeGorHanis = LOG_RUNNING;
	Kirgo = Hlp_GetNpc(GRD_251_Kirgo);
	Kirgo.aivar[AIV_WASDEFEATEDBYSC] = FALSE;
	Kirgo.aivar[AIV_HASDEFEATEDSC] = FALSE;
	Kharim = Hlp_GetNpc(Sld_729_Kharim);
	Kharim.aivar[AIV_WASDEFEATEDBYSC] = FALSE;
	Kharim.aivar[AIV_HASDEFEATEDSC] = FALSE;
	GorHanis = Hlp_GetNpc(Tpl_1422_GorHanis);
	GorHanis.aivar[AIV_WASDEFEATEDBYSC] = FALSE;
	GorHanis.aivar[AIV_HASDEFEATEDSC] = FALSE;
	B_LogEntry(CH1_JoinOC,"Scatty der Arenameister wird von mir beeindruckt sein, wenn ich einen der K�mpfer fordere.");
};


instance DIA_Scatty_KirgoSuccess(C_Info)
{
	npc = GRD_210_Scatty;
	nr = 1;
	condition = DIA_Scatty_KirgoSuccess_Condition;
	information = DIA_Scatty_KirgoSuccess_Info;
	permanent = 0;
	description = "Ich habe gegen Kirgo gek�mpft!";
};


func int DIA_Scatty_KirgoSuccess_Condition()
{
	var C_Npc Kirgo;
	Kirgo = Hlp_GetNpc(GRD_251_Kirgo);
	if((Scatty_ChargeKirgo == LOG_RUNNING) && (Kirgo_Charged == TRUE) && ((Kirgo.aivar[AIV_WASDEFEATEDBYSC] == TRUE) || (Kirgo.aivar[AIV_HASDEFEATEDSC] == TRUE)))
	{
		return 1;
	};
};

func void DIA_Scatty_KirgoSuccess_Info()
{
	var C_Npc Kirgo;
	Kirgo = Hlp_GetNpc(GRD_251_Kirgo);
	AI_Output(other,self,"DIA_Scatty_KirgoSuccess_15_00");	//Ich habe gegen Kirgo gek�mpft!
	if(Kirgo.aivar[AIV_HASDEFEATEDSC] == TRUE)
	{
		AI_Output(self,other,"DIA_Scatty_KirgoSuccess_01_01");	//Und du hast dich besiegen lassen!
		AI_Output(self,other,"DIA_Scatty_KirgoSuccess_01_02");	//Du erwartest hoffentlich nicht, dass ich durch dein Versagen beeindruckt bin ...
		Scatty_ChargeKirgo = LOG_FAILED;
		B_LogEntry(CH1_JoinOC,"Meine Niederlage gegen Kirgo hat Scatty nicht sehr beeindruckt.");
	}
	else if(Kirgo.aivar[AIV_WASDEFEATEDBYSC] == TRUE)
	{
		AI_Output(self,other,"DIA_Scatty_KirgoSuccess_01_03");	//Und du hast ihn geschafft! Nicht schlecht f�r einen Anf�nger wie dich! Ich bin beeindruckt!
		Scatty_ChargeKirgo = LOG_SUCCESS;
		B_LogEntry(CH1_JoinOC,"Scatty ist beeindruckt von meinem Kampf gegen Kirgo.");
		B_GiveXP(XP_kirgovictory);
	};
};


instance DIA_Scatty_KHARIMSuccess(C_Info)
{
	npc = GRD_210_Scatty;
	nr = 1;
	condition = DIA_Scatty_KHARIMSuccess_Condition;
	information = DIA_Scatty_KHARIMSuccess_Info;
	permanent = 0;
	description = "Ich bin gegen Kharim angetreten!";
};


func int DIA_Scatty_KHARIMSuccess_Condition()
{
	var C_Npc Kharim;
	Kharim = Hlp_GetNpc(Sld_729_Kharim);
	if((Scatty_ChargeKharim == LOG_RUNNING) && (Kharim_Charged == TRUE) && ((Kharim.aivar[AIV_WASDEFEATEDBYSC] == TRUE) || (Kharim.aivar[AIV_HASDEFEATEDSC] == TRUE)))
	{
		return 1;
	};
};

func void DIA_Scatty_KHARIMSuccess_Info()
{
	var C_Npc Kharim;
	Kharim = Hlp_GetNpc(Sld_729_Kharim);
	AI_Output(other,self,"DIA_Scatty_KHARIMSuccess_15_00");	//Ich bin gegen Kharim angetreten!
	if(Kharim.aivar[AIV_HASDEFEATEDSC] == TRUE)
	{
		AI_Output(self,other,"DIA_Scatty_KHARIMSuccess_01_01");	//Er hat dir ganz sch�n in den Arsch getreten.
		if(Npc_GetTrueGuild(hero) == GIL_None)
		{
			AI_Output(self,other,"DIA_Scatty_KHARIMSuccess_01_02");	//Trotzdem hast du dir den richtigen Gegner gew�hlt! Ich kann diese Bastarde aus dem Neuen Lager nicht ausstehen.
			AI_Output(self,other,"DIA_Scatty_KHARIMSuccess_01_03");	//Scheint dir ja genauso zu gehen - so jemanden k�nnen wir hier brauchen!
		};
		Scatty_ChargeKharim = LOG_FAILED;
		B_GiveXP(XP_Kharimlost);
		B_LogEntry(CH1_JoinOC,"Ich bin Kharim unterlegen! Mein Mut hat Scatty gefallen, aber meine Kampff�higkeiten nicht.");
	}
	else if(Kharim.aivar[AIV_WASDEFEATEDBYSC] == TRUE)
	{
		AI_Output(self,other,"DIA_Scatty_KHARIMSuccess_01_04");	//Und du hast ihn umgehauen! Ich muss schon sagen, nicht schlecht. Er war immer einer der besten K�mpfer hier.
		AI_Output(self,other,"DIA_Scatty_KHARIMSuccess_01_05");	//Du hast mich schwer beeindruckt!
		Scatty_ChargeKharim = LOG_SUCCESS;
		B_LogEntry(CH1_JoinOC,"Ich habe es Kharim gezeigt! Scatty hat gestaunt.");
		B_GiveXP(XP_kharimvictory);
	};
};


instance DIA_Scatty_OtherCamps(C_Info)
{
	npc = GRD_210_Scatty;
	nr = 3;
	condition = DIA_Scatty_OtherCamps_Condition;
	information = DIA_Scatty_OtherCamps_Info;
	permanent = 0;
	description = "Wieso lasst ihr die Leute aus den anderen Lagern hier k�mpfen?";
};


func int DIA_Scatty_OtherCamps_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Scatty_WhatDoYouDo) && (KIRGO_FIGHT != TRUE) && (KHARIM_FIGHT != TRUE) && (HANIS_FIGHT != TRUE) && (HANIS_BET != TRUE) && (KIRGO_BET != TRUE) && (KHARIM_BET != TRUE))
	{
		return 1;
	};
};

func void DIA_Scatty_OtherCamps_Info()
{
	AI_Output(other,self,"DIA_Scatty_OtherCamps_15_00");	//Ich dachte, das Alte und das Neue Lager verstehen sich nicht besonders gut - wieso lasst ihr ihre Leute hier k�mpfen?
	AI_Output(self,other,"DIA_Scatty_OtherCamps_01_01");	//Ganz einfach: Wenn es hier einmal die Woche einen Kampf gibt, sehen es die Buddler am liebsten, wenn einer der Banditen aus dem Neuen Lager was aufs Maul bekommt.
	AI_Output(self,other,"DIA_Scatty_OtherCamps_01_02");	//Wenn einer von denen k�mpft, wird mehr gewettet - das ist gut!
	AI_Output(self,other,"DIA_Scatty_OtherCamps_01_03");	//Ich pers�nlich kann die Schweine aus dem Neuen Lager ja nicht ausstehen - aber Gesch�ft ist nun mal Gesch�ft ...
};


var int scatty_betday;

instance DIA_Scatty_WannaBet(C_Info)
{
	npc = GRD_210_Scatty;
	nr = 1;
	condition = DIA_Scatty_WannaBet_Condition;
	information = DIA_Scatty_WannaBet_Info;
	permanent = 1;
	description = "Ich will wetten!";
};


func int DIA_Scatty_WannaBet_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Scatty_WhatDoYouDo) && (HANIS_BET != TRUE) && (KIRGO_BET != TRUE) && (KHARIM_BET != TRUE) && (KIRGO_FIGHT != TRUE) && (KHARIM_FIGHT != TRUE) && (HANIS_FIGHT != TRUE))
	{
		return 1;
	};
};

func void DIA_Scatty_WannaBet_Info()
{
	AI_Output(other,self,"DIA_Scatty_WannaBet_15_00");	//Ich will wetten.
	if((SCATTY_BETDAY <= (Wld_GetDay() - 7)) && Wld_IsTime(18,0,23,0))
	{
		AI_Output(self,other,"DIA_Scatty_WannaBet_01_11");	//Also gut. Alle K�mpfer steigen heute in die Arena. Du kannst also w�hlen, auf wen du setzen willst.
		AI_Output(self,other,"DIA_Scatty_WannaBet_01_12");	//Du kannst genauso 75 Erz setzen wie alle anderen hier. Keine Ausnahmen, der Wetteinsatz gilt hier f�r jeden.
		Info_ClearChoices(DIA_Scatty_WannaBet);
		Info_AddChoice(DIA_Scatty_WannaBet,"Ich setze auf Kirgo.",dia_scatty_wannabet_kirgo);
		Info_AddChoice(DIA_Scatty_WannaBet,"Ich setze auf Kharim.",dia_scatty_wannabet_kharim);
		if(Kapitel <= 2)
		{
			Info_AddChoice(DIA_Scatty_WannaBet,"Ich setze auf Gor Hanis.",dia_scatty_wannabet_hanis);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Scatty_WannaBet_01_01");	//Aber im Moment findet kein Kampf statt.
		AI_Output(self,other,"DIA_Scatty_WannaBet_01_02");	//Der n�chste Kampf ist in ein paar Tagen - er wird vorher angek�ndigt.
		AI_Output(self,other,"DIA_Scatty_WannaBet_01_03");	//Zwischen 18 und 23 Uhr kannst du dann deinen Wetteinsatz bei mir abgeben.
	};
};

func void dia_scatty_wannabet_kirgo()
{
	AI_Output(other,self,"DIA_Scatty_Kirgo_WannaBet_15_00");	//Ich setze auf Kirgo.
	if(Npc_HasItems(other,ItMiNugget) >= 75)
	{
		B_GiveInvItems(other,self,ItMiNugget,75);
		AI_Output(self,other,"DIA_Scatty_Kirgo_WannaBet_01_01");	//Gut. Kirgo ist zwar noch nicht lange dabei, aber er macht gro�e Fortschritte.
		AI_Output(self,other,"DIA_Scatty_Kirgo_WannaBet_01_02");	//Wenn Kirgo gewinnt, winken dir 150 Erz. Tut er das nicht, behalt' ich dein Wetteinsatz und du bekommst nichts.
		AI_Output(self,other,"DIA_Scatty_Kirgo_WannaBet_01_04");	//Geh' zur Trib�ne zu den anderen Zuschauern und genie� den Kampf.
		Info_ClearChoices(DIA_Scatty_WannaBet);
		b_story_npcs_watchfight();
		KIRGO_BET = TRUE;
		ARENA_FIGHT = TRUE;
		SCATTY_BETDAY = Wld_GetDay();
		Npc_ExchangeRoutine(GRD_251_Kirgo,"FIGHT");
		Npc_ExchangeRoutine(Sld_729_Kharim,"FIGHT");
		AI_ContinueRoutine(GRD_251_Kirgo);
		AI_ContinueRoutine(Sld_729_Kharim);
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Scatty_Kirgo_WannaBet_01_05");	//Ich seh' keine 75 Erz. Kein Erz, kein Kampf f�r dich.
		Info_ClearChoices(DIA_Scatty_WannaBet);
		AI_StopProcessInfos(self);
	};
};

func void dia_scatty_wannabet_kharim()
{
	AI_Output(other,self,"DIA_Scatty_Kharim_WannaBet_15_00");	//Ich setze auf Kharim.
	if(Npc_HasItems(other,ItMiNugget) >= 75)
	{
		B_GiveInvItems(other,self,ItMiNugget,75);
		AI_Output(self,other,"DIA_Scatty_Kharim_WannaBet_01_01");	//Du setzt auf Kharim? Nun gut, er ist ein guter K�mpfer, obwohl er aus dem Neuen Lager ist.
		AI_Output(self,other,"DIA_Scatty_Kharim_WannaBet_01_02");	//Wenn Kharim gewinnt, winken dir 150 Erz. Tut er das nicht, behalt' ich dein Wetteinsatz und du bekommst nichts.
		AI_Output(self,other,"DIA_Scatty_Kharim_WannaBet_01_04");	//Geh' zur Trib�ne zu den anderen Zuschauern und genie� den Kampf.
		Info_ClearChoices(DIA_Scatty_WannaBet);
		b_story_npcs_watchfight();
		KHARIM_BET = TRUE;
		ARENA_FIGHT = TRUE;
		SCATTY_BETDAY = Wld_GetDay();
		Npc_ExchangeRoutine(GRD_251_Kirgo,"FIGHT");
		Npc_ExchangeRoutine(Sld_729_Kharim,"FIGHT");
		AI_ContinueRoutine(GRD_251_Kirgo);
		AI_ContinueRoutine(Sld_729_Kharim);
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Scatty_Kharim_WannaBet_01_05");	//Ich seh' keine 75 Erz. Kein Erz, kein Kampf f�r dich.
		Info_ClearChoices(DIA_Scatty_WannaBet);
		AI_StopProcessInfos(self);
	};
};

func void dia_scatty_wannabet_hanis()
{
	AI_Output(other,self,"DIA_Scatty_Hanis_WannaBet_15_00");	//Ich setze auf Gor Hanis.
	if(Npc_HasItems(other,ItMiNugget) >= 75)
	{
		B_GiveInvItems(other,self,ItMiNugget,75);
		AI_Output(self,other,"DIA_Scatty_Hanis_WannaBet_01_01");	//Den Sektenspinner? Er ist ein guter K�mpfer und hat schon viele K�mpfe gewonnen.
		AI_Output(self,other,"DIA_Scatty_Hanis_WannaBet_01_02");	//Wenn Kharim gewinnt, winken dir 150 Erz. Tut er das nicht, behalt' ich dein Wetteinsatz und du bekommst nichts.
		AI_Output(self,other,"DIA_Scatty_Hanis_WannaBet_01_04");	//Geh' zur Trib�ne zu den anderen Zuschauern und genie� den Kampf.
		Info_ClearChoices(DIA_Scatty_WannaBet);
		b_story_npcs_watchfight();
		HANIS_BET = TRUE;
		ARENA_FIGHT = TRUE;
		SCATTY_BETDAY = Wld_GetDay();
		Npc_ExchangeRoutine(Tpl_1422_GorHanis,"FIGHT");
		Npc_ExchangeRoutine(Sld_729_Kharim,"FIGHT");
		AI_ContinueRoutine(Tpl_1422_GorHanis);
		AI_ContinueRoutine(Sld_729_Kharim);
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Scatty_Hanis_WannaBet_01_05");	//Ich seh' keine 75 Erz. Kein Erz, kein Kampf f�r dich.
		Info_ClearChoices(DIA_Scatty_WannaBet);
		AI_StopProcessInfos(self);
	};
};


instance DIA_Scatty_WannaFight(C_Info)
{
	npc = GRD_210_Scatty;
	nr = 1;
	condition = DIA_Scatty_WannaFight_Condition;
	information = DIA_Scatty_WannaFight_Info;
	permanent = 1;
	description = "Ich will in der Arena k�mpfen!";
};


func int DIA_Scatty_WannaFight_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Scatty_WhatDoYouDo) && (Npc_GetTrueGuild(hero) == GIL_None) && (HANIS_BET != TRUE) && (KIRGO_BET != TRUE) && (KHARIM_BET != TRUE) && (KIRGO_FIGHT != TRUE) && (KHARIM_FIGHT != TRUE) && (HANIS_FIGHT != TRUE))
	{
		return 1;
	};
};

func void DIA_Scatty_WannaFight_Info()
{
	AI_Output(other,self,"DIA_Scatty_WannaFight_15_00");	//Ich will in der Arena k�mpfen!
	AI_Output(self,other,"DIA_Scatty_WannaFight_01_01");	//Bevor du nicht einem der Lager angeh�rst, werde ich dich nicht k�mpfen lassen!
	AI_Output(self,other,"DIA_Scatty_WannaFight_01_02");	//Einen unabh�ngigen K�mpfer will hier keiner sehen!
};


instance DIA_Scatty_TRAIN(C_Info)
{
	npc = GRD_210_Scatty;
	nr = 10;
	condition = DIA_Scatty_TRAIN_Condition;
	information = DIA_Scatty_TRAIN_Info;
	permanent = 1;
	description = "Trainierst du auch K�mpfer?";
};


func int DIA_Scatty_TRAIN_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Scatty_WhatDoYouDo) && (HANIS_BET != TRUE) && (KIRGO_BET != TRUE) && (KHARIM_BET != TRUE) && (KIRGO_FIGHT != TRUE) && (KHARIM_FIGHT != TRUE) && (HANIS_FIGHT != TRUE))
	{
		return 1;
	};
};

func void DIA_Scatty_TRAIN_Info()
{
	if(log_scattytrain == FALSE)
	{
		Log_CreateTopic(GE_TeacherOC,LOG_NOTE);
		B_LogEntry(GE_TeacherOC,"Scatty der Arenameister kann mich im Kampf mit EINH�NDERN ausbilden.");
		log_scattytrain = TRUE;
	};
	AI_Output(other,self,"DIA_Scatty_TRAIN_15_00");	//Trainierst du auch K�mpfer?
	AI_Output(self,other,"DIA_Scatty_TRAIN_01_01");	//Schon, aber nicht zum Spa�. Wenn ich dich trainieren soll, musst du daf�r zahlen.
	Info_ClearChoices(DIA_Scatty_TRAIN);
	Info_AddChoice(DIA_Scatty_TRAIN,DIALOG_BACK,DIA_Scatty_TRAIN_BACK);
	if(Npc_GetTalentSkill(hero,NPC_TALENT_1H) == 1)
	{
		Info_AddChoice(DIA_Scatty_TRAIN,B_BuildLearnString(NAME_Learn1h_2,LPCOST_TALENT_1H_2,150),DIA_Scatty_TRAIN_2h);
	};
	if(Npc_GetTalentSkill(hero,NPC_TALENT_1H) == 0)
	{
		Info_AddChoice(DIA_Scatty_TRAIN,B_BuildLearnString(NAME_Learn1h_1,LPCOST_TALENT_1H_1,50),DIA_Scatty_TRAIN_1h);
	};
};

func void DIA_Scatty_TRAIN_BACK()
{
	Info_ClearChoices(DIA_Scatty_TRAIN);
};

func void DIA_Scatty_TRAIN_1h()
{
	AI_Output(other,self,"DIA_Scatty_TRAIN_1h_15_00");	//Ich will besser mit Einhandwaffen umgehen k�nnen.
	if(Npc_HasItems(other,ItMiNugget) >= 50)
	{
		if(B_GiveSkill(other,NPC_TALENT_1H,1,LPCOST_TALENT_1H_1))
		{
			AI_Output(self,other,"DIA_Scatty_TRAIN_1h_01_01");	//Gute Entscheidung! Um deine Technik zu verbessern, musst du erst einmal lernen, deine Waffe richtig zu halten.
			AI_Output(self,other,"DIA_Scatty_TRAIN_1h_01_02");	//Anf�nger neigen dazu, Einhandwaffen mit beiden H�nden zu halten. Mit so was f�ngst du am besten gar nicht erst an, das behindert dich nur.
			AI_Output(self,other,"DIA_Scatty_TRAIN_1h_01_03");	//Halt die Waffe mit einer Hand, Klinge nach oben, und dann immer sch�n schwingen lassen.
			AI_Output(self,other,"DIA_Scatty_TRAIN_1h_01_04");	//Du musst lernen, den Schwung deiner Waffe mit deinen Bewegungen in Einklang zu bringen, dann kannst du schneller zuschlagen.
			AI_Output(self,other,"DIA_Scatty_TRAIN_1h_01_05");	//Wenn du dich an meine Anweisungen h�ltst, wirst du in Zukunft eleganter und vor allem schneller k�mpfen.
			AI_Output(self,other,"DIA_Scatty_TRAIN_1h_01_06");	//Ach und noch was: Manche Treffer richten mehr Schaden an als andere! Als Anf�nger hast du nur eine geringe Chance, solche kritischen Treffer zu landen.
			AI_Output(self,other,"DIA_Scatty_TRAIN_1h_01_07");	//Aber je weiter du fortschreitest, desto besser wird diese F�higkeit.
			B_GiveInvItems(other,self,ItMiNugget,50);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Scatty_TRAIN_1h_NoOre_01_00");	//Du hast nicht genug Erz!
	};
};

func void DIA_Scatty_TRAIN_2h()
{
	AI_Output(other,self,"DIA_Scatty_TRAIN_2h_15_01");	//Bring mir bei, noch besser mit Einhandwaffen umzugehen.
	if(Npc_HasItems(other,ItMiNugget) >= 150)
	{
		if(B_GiveSkill(other,NPC_TALENT_1H,2,LPCOST_TALENT_1H_2))
		{
			AI_Output(self,other,"DIA_Scatty_TRAIN_2h_Info_01_02");	//Na gut, die Grundkenntnisse hast du ja schon. Wenn du die Waffe gesenkt h�ltst, dann kannst du direkt mehr Wucht in deinen ersten Schlag legen.
			AI_Output(self,other,"DIA_Scatty_TRAIN_2h_Info_01_03");	//Nutze den Schwung, wei�t du noch? Gut, der n�chste Schritt ist, du musst deinen K�rper mehr einsetzen. Wenn du zweimal geschlagen hast, drehe dich um die eigene Achse, damit �berraschst du den Gegner und bist in einer optimalen Position.
			AI_Output(self,other,"DIA_Scatty_TRAIN_2h_Info_01_04");	//Dann ziehst du deine Klinge noch einmal quer von rechts nach links.
			AI_Output(self,other,"DIA_Scatty_TRAIN_2h_Info_01_05");	//Und wieder von vorne. Vergiss nicht, �bung macht den Meister. Also, geh jetzt und werde ein wahrer Meister des einh�ndigen Kampfes.
			B_GiveInvItems(other,self,ItMiNugget,150);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Scatty_TRAIN_2h_NoOre_01_00");	//Komm wieder, wenn du genug Erz hast!
	};
};


var int scatty_maybefight;
var int scatty_idoit;

instance DIA_SCATTY_FLETCHER(C_Info)
{
	npc = GRD_210_Scatty;
	nr = 2;
	condition = dia_scatty_fletcher_condition;
	information = dia_scatty_fletcher_info;
	permanent = 0;
	description = "Fletcher hat Schulden bei dir?";
};


func int dia_scatty_fletcher_condition()
{
	if(Npc_KnowsInfo(hero,dia_fletcher_reden) && (HANIS_BET != TRUE) && (KIRGO_BET != TRUE) && (KHARIM_BET != TRUE) && (KIRGO_FIGHT != TRUE) && (KHARIM_FIGHT != TRUE) && (HANIS_FIGHT != TRUE))
	{
		return 1;
	};
};

func void dia_scatty_fletcher_info()
{
	AI_Output(other,self,"DIA_Scatty_Fletcher_15_00");	//Fletcher hat Schulden bei dir?
	AI_Output(self,other,"DIA_Scatty_Fletcher_01_01");	//Hat er dir das gesagt? Aber ja, es stimmt und die Schulden sind nicht gerade wenig.
	AI_Output(self,other,"DIA_Scatty_Fletcher_01_02");	//Was geht dich das denn an?
	AI_Output(other,self,"DIA_Scatty_Fletcher_01_03");	//Ich will ihm helfen.
	AI_Output(self,other,"DIA_Scatty_Fletcher_01_04");	//Ach so sieht die Sache also aus.
	AI_Output(self,other,"DIA_Scatty_Fletcher_01_05");	//Nun gut, ich denke ich kann dir einen Vorschlag machen.
	Info_ClearChoices(dia_scatty_fletcher);
	Info_AddChoice(dia_scatty_fletcher,"Was f�r einen Vorschlag denn?",dia_scatty_fletcher_idea);
};

func void dia_scatty_fletcher_idea()
{
	AI_Output(other,self,"DIA_Scatty_Idea_15_00");	//Was f�r einen Vorschlag denn?
	AI_Output(self,other,"DIA_Scatty_Idea_01_01");	//Du k�mpfst f�r Fletcher in der Arena.
	AI_Output(self,other,"DIA_Scatty_Idea_01_02");	//Gewinnst du den Kampf, erlasse ich Fletcher seine Schulden.
	AI_Output(self,other,"DIA_Scatty_Idea_01_03");	//Verlierst du aber, wird Fletcher nochmal die Summe Erz auf seine Schulden draufzahlen m�ssen.
	AI_Output(self,other,"DIA_Scatty_Idea_01_04");	//Was denkst du?
	Info_ClearChoices(dia_scatty_fletcher);
	Info_AddChoice(dia_scatty_fletcher,"Okay ich hab ja wohl keine andere Wahl.",dia_scatty_fletcher_okay);
	Info_AddChoice(dia_scatty_fletcher,"Ich werde dar�ber nachdenken.",dia_scatty_fletcher_maybe);
};

func void dia_scatty_fletcher_okay()
{
	AI_Output(other,self,"DIA_Scatty_Okay_15_00");	//Okay ich hab' ja wohl keine andere Wahl.
	AI_Output(self,other,"DIA_Scatty_Okay_01_01");	//Gut. Ich werde die entsprechenden Vorbereitungen f�r den Kampf treffen.
	AI_Output(self,other,"DIA_Scatty_Okay_01_02");	//Sprich mit Gor Hanis. Er wird dein Gegner in dem Kampf sein.
	AI_Output(self,other,"DIA_Scatty_Okay_01_03");	//Du solltest vorher nochmal mit Fletcher dar�ber reden. Er m�chte wahrscheinlich auch in die Sache eingeweiht werden.
	Info_ClearChoices(dia_scatty_fletcher);
	SCATTY_IDOIT = TRUE;
	B_LogEntry(CH1_FLETCHER_SCHULDEN,"Scatty hat mir die Chance gegen Gor Hanis zu k�mpfen damit er Fletcher seine Schulden erl�sst. Gewinne ich, erl�sst Scatty Fletcher seine Schulden. Verliere ich, muss Fletcher nochmal die gleiche Summe Erz auf seine Schulden draufzahlen. Vielleicht sollte ich Fletcher vorher erz�hlen, was ich in Erfahrung gebracht hab.");
};

func void dia_scatty_fletcher_maybe()
{
	AI_Output(other,self,"DIA_Scatty_Maybe_15_00");	//Ich werde dar�ber nachdenken.
	AI_Output(self,other,"DIA_Scatty_Maybe_01_01");	//Okay. Aber lass dir nicht zu lange Zeit. Ich werde nicht ewig auf das Erz warten.
	Info_ClearChoices(dia_scatty_fletcher);
	SCATTY_MAYBEFIGHT = TRUE;
};


instance DIA_SCATTY_REMEMBER(C_Info)
{
	npc = GRD_210_Scatty;
	nr = 2;
	condition = dia_scatty_remember_condition;
	information = dia_scatty_remember_info;
	permanent = 0;
	description = "Ich hab' nochmal �ber die Sache mit Fletcher nachgedacht.";
};


func int dia_scatty_remember_condition()
{
	if((SCATTY_MAYBEFIGHT == TRUE) && (HANIS_BET != TRUE) && (KIRGO_BET != TRUE) && (KHARIM_BET != TRUE) && (KIRGO_FIGHT != TRUE) && (KHARIM_FIGHT != TRUE) && (HANIS_FIGHT != TRUE))
	{
		return 1;
	};
};

func void dia_scatty_remember_info()
{
	AI_Output(other,self,"DIA_Scatty_Remember_15_00");	//Ich hab' nochmal �ber die Sache mit Fletcher nachgedacht.
	AI_Output(self,other,"DIA_Scatty_Remember_01_01");	//Und?
	AI_Output(other,self,"DIA_Scatty_Remember_01_02");	//Ich werde dein Angebot annehmen.
	AI_Output(self,other,"DIA_Scatty_Remember_01_03");	//Gut. Ich werde mich schonmal um alles k�mmern. Sprich mit Gor Hanis, er wird dein Gegner sein.
	AI_Output(self,other,"DIA_Scatty_Remember_01_04");	//Am besten wird sein, wenn du vorher auch mal Fletcher in die Sache einweihst.
	B_LogEntry(CH1_FLETCHER_SCHULDEN,"Scatty hat mir die Chance gegen Gor Hanis zu k�mpfen damit er Fletcher seine Schulden erl�sst. Gewinne ich, erl�sst Scatty Fletcher seine Schulden. Verliere ich, muss Fletcher nochmal die gleiche Summe auf seine Schulden draufzahlen. Vielleicht sollte ich Fletcher vorher erz�hlen, was ich in Erfahrung gebracht hab.");
};


instance DIA_SCATTY_HANISSUCCESS(C_Info)
{
	npc = GRD_210_Scatty;
	nr = 1;
	condition = dia_scatty_hanissuccess_condition;
	information = dia_scatty_hanissuccess_info;
	permanent = 0;
	description = "Ich bin gegen Gor Hanis angetreten!";
};


func int dia_scatty_hanissuccess_condition()
{
	var C_Npc hanis;
	hanis = Hlp_GetNpc(Tpl_1422_GorHanis);
	if((HANIS_HERAUSFORDERUNG == TRUE) && ((hanis.aivar[AIV_WASDEFEATEDBYSC] == TRUE) || (hanis.aivar[AIV_HASDEFEATEDSC] == TRUE)))
	{
		return 1;
	};
};

func void dia_scatty_hanissuccess_info()
{
	var C_Npc hanis;
	hanis = Hlp_GetNpc(Tpl_1422_GorHanis);
	AI_Output(other,self,"DIA_Scatty_HanisSuccess_15_00");	//Ich bin gegen Gor Hanis angetreten!
	if(hanis.aivar[AIV_HASDEFEATEDSC] == TRUE)
	{
		AI_Output(self,other,"DIA_Scatty_HanisSuccess_01_01");	//Er hat dich in den Staub getreten.
		AI_Output(self,other,"DIA_Scatty_HanisSuccess_01_02");	//Du kannst Fletcher sagen, dass er mir jetzt die doppelte Summe schuldet.
		FLETCHER_SCHULDEN = LOG_FAILED;
		Log_SetTopicStatus(CH1_FLETCHER_SCHULDEN,LOG_FAILED);
		B_LogEntry(CH1_FLETCHER_SCHULDEN,"Nach meiner Niederlage gegen Gor Hanis, wird Fletcher nun die Doppelte Summe an Scatty zahlen m�ssen. Ich glaube er wird nicht sehr erfreut dar�ber sein.");
	}
	else if(hanis.aivar[AIV_WASDEFEATEDBYSC] == TRUE)
	{
		AI_Output(self,other,"DIA_Scatty_HanisSuccess_01_03");	//Du hast ihn geschlagen. Nicht schlecht daf�r, dass du noch nicht solange hier bist. Sag Fletcher das er seine Schulden los ist.
		FLETCHER_SCHULDEN = LOG_SUCCESS;
		Log_SetTopicStatus(CH1_FLETCHER_SCHULDEN,LOG_SUCCESS);
		B_LogEntry(CH1_FLETCHER_SCHULDEN,"Ich habe den Kampf gegen Gor Hanis gewonnen und damit ist Fletcher von seinen Schulden befreit.");
		B_GiveXP(XP_HANISVICTORY);
	};
};


var int scatty_fightday;

instance DIA_SCATTY_FIGHTNOW(C_Info)
{
	npc = GRD_210_Scatty;
	nr = 1;
	condition = dia_scatty_fightnow_condition;
	information = dia_scatty_fightnow_info;
	permanent = 0;
	description = "Ich geh�re einem Lager an. Lass mich k�mpfen.";
};


func int dia_scatty_fightnow_condition()
{
	if(((Npc_GetTrueGuild(hero) == GIL_NOV) && (HANIS_BET != TRUE) && (KIRGO_BET != TRUE) && (KHARIM_BET != TRUE) && (KIRGO_FIGHT != TRUE) && (KHARIM_FIGHT != TRUE) && (HANIS_FIGHT != TRUE)) || ((Npc_GetTrueGuild(hero) == GIL_ORG) && (HANIS_BET != TRUE) && (KIRGO_BET != TRUE) && (KHARIM_BET != TRUE) && (KIRGO_FIGHT != TRUE) && (KHARIM_FIGHT != TRUE) && (HANIS_FIGHT != TRUE)) || ((Npc_GetTrueGuild(hero) == GIL_SLD) && (HANIS_BET != TRUE) && (KIRGO_BET != TRUE) && (KHARIM_BET != TRUE) && (KIRGO_FIGHT != TRUE) && (KHARIM_FIGHT != TRUE) && (HANIS_FIGHT != TRUE)) || ((Npc_GetTrueGuild(hero) == GIL_GRD) && (HANIS_BET != TRUE) && (KIRGO_BET != TRUE) && (KHARIM_BET != TRUE) && (KIRGO_FIGHT != TRUE) && (KHARIM_FIGHT != TRUE) && (HANIS_FIGHT != TRUE)) || ((Npc_GetTrueGuild(hero) == GIL_STT) && (HANIS_BET != TRUE) && (KIRGO_BET != TRUE) && (KHARIM_BET != TRUE) && (KIRGO_FIGHT != TRUE) && (KHARIM_FIGHT != TRUE) && (HANIS_FIGHT != TRUE)) || ((Npc_GetTrueGuild(hero) == GIL_TPL) && (HANIS_BET != TRUE) && (KIRGO_BET != TRUE) && (KHARIM_BET != TRUE) && (KIRGO_FIGHT != TRUE) && (KHARIM_FIGHT != TRUE) && (HANIS_FIGHT != TRUE)))
	{
		return 1;
	};
};

func void dia_scatty_fightnow_info()
{
	var C_Npc Kirgo;
	var C_Npc Kharim;
	var C_Npc GorHanis;
	AI_Output(other,self,"DIA_Scatty_FightNow_15_00");	//Ich geh�re einem Lager an. Lass mich k�mpfen.
	Kirgo = Hlp_GetNpc(GRD_251_Kirgo);
	Kirgo.aivar[AIV_WASDEFEATEDBYSC] = FALSE;
	Kirgo.aivar[AIV_HASDEFEATEDSC] = FALSE;
	Kharim = Hlp_GetNpc(Sld_729_Kharim);
	Kharim.aivar[AIV_WASDEFEATEDBYSC] = FALSE;
	Kharim.aivar[AIV_HASDEFEATEDSC] = FALSE;
	GorHanis = Hlp_GetNpc(Tpl_1422_GorHanis);
	GorHanis.aivar[AIV_WASDEFEATEDBYSC] = FALSE;
	GorHanis.aivar[AIV_HASDEFEATEDSC] = FALSE;
	if((Npc_GetTrueGuild(hero) == GIL_NOV) || (Npc_GetTrueGuild(hero) == GIL_TPL))
	{
		AI_Output(self,other,"DIA_Scatty_FightNowPSI_01_01");	//Ah, du hast dich also dem Sumpflager angeschlossen? Sehr gut. Gor Hanis ist einer unserer besten K�mpfer.
		AI_Output(self,other,"DIA_Scatty_FightNow_01_02");	//Gut, ich erkl�re dir vorher die Regeln die du als Arenak�mpfer kennen musst.
		AI_Output(self,other,"DIA_Scatty_FightNow_01_03");	//Als erstes solltest du wissen, dass wir hier nicht bis zum Tod k�mpfen.
		AI_Output(self,other,"DIA_Scatty_FightNow_01_04");	//Sobald der erste zu Boden geht ist schluss.
		AI_Output(self,other,"DIA_Scatty_FightNow_01_05");	//Wir brauchen die K�mpfer f�r zuk�nftige K�mpfe, also komm mir nicht auf die Idee, dass du einen umbringst. Dann bist du n�mlich selber dran.
		AI_Output(self,other,"DIA_Scatty_FightNow_01_06");	//Dann solltest du wissen, dass du als K�mpfer f�r jeden Kampf etwas Erz verdienst. Erwarte aber nicht zu viel, du bekommst nur einen kleinen Teil ab.
		AI_Output(self,other,"DIA_Scatty_FightNow_01_07");	//Aber mach' dir nichts draus, du bekommst den gr��ten Teil des Ruhmes f�r einen gewonnenen Kampf.
		AI_Output(self,other,"DIA_Scatty_FightNow_01_08");	//Wenn du k�mpfen willst, musst du nur zu mir kommen und wir sprechen �ber deinen Gegner.
	}
	else if((Npc_GetTrueGuild(hero) == GIL_GRD) || (Npc_GetTrueGuild(hero) == GIL_STT))
	{
		AI_Output(self,other,"DIA_Scatty_FightNowOC_01_01");	//Sehr gut. Noch jemand der f�r unser Lager k�mpft. Wird Zeit das du den Pennern aus dem Neuen Lager was auf's Maul haust.
		AI_Output(self,other,"DIA_Scatty_FightNow_01_02");	//Gut, ich erkl�re dir vorher die Regeln die du als Arenak�mpfer kennen musst.
		AI_Output(self,other,"DIA_Scatty_FightNow_01_03");	//Als erstes solltest du wissen, dass wir hier nicht bis zum Tod k�mpfen.
		AI_Output(self,other,"DIA_Scatty_FightNow_01_04");	//Sobald der erste zu Boden geht ist schluss.
		AI_Output(self,other,"DIA_Scatty_FightNow_01_05");	//Wir brauchen die K�mpfer f�r zuk�nftige K�mpfe, also komm mir nicht auf die Idee, dass du einen umbringst. Dann bist du n�mlich selber dran.
		AI_Output(self,other,"DIA_Scatty_FightNow_01_06");	//Dann solltest du wissen, dass du als K�mpfer f�r jeden Kampf etwas Erz verdienst. Erwarte aber nicht zu viel, du bekommst nur einen kleinen Teil ab.
		AI_Output(self,other,"DIA_Scatty_FightNow_01_07");	//Aber mach' dir nichts draus, du bekommst den gr��ten Teil des Ruhmes f�r einen gewonnenen Kampf.
		AI_Output(self,other,"DIA_Scatty_FightNow_01_08");	//Wenn du k�mpfen willst, musst du nur zu mir kommen und wir sprechen �ber deinen Gegner.
	}
	else if((Npc_GetTrueGuild(hero) == GIL_ORG) || (Npc_GetTrueGuild(hero) == GIL_SLD))
	{
		AI_Output(self,other,"DIA_Scatty_FightNowNC_01_01");	//Noch einer aus dem Neuen Lager? Na da bin ich ja mal gespannt was du drauf hast.
		AI_Output(self,other,"DIA_Scatty_FightNow_01_02");	//Gut, ich erkl�re dir vorher die Regeln die du als Arenak�mpfer kennen musst.
		AI_Output(self,other,"DIA_Scatty_FightNow_01_03");	//Als erstes solltest du wissen, dass wir hier nicht bis zum Tod k�mpfen.
		AI_Output(self,other,"DIA_Scatty_FightNow_01_04");	//Sobald der erste zu Boden geht ist schluss.
		AI_Output(self,other,"DIA_Scatty_FightNow_01_05");	//Wir brauchen die K�mpfer f�r zuk�nftige K�mpfe, also komm mir nicht auf die Idee, dass du einen umbringst. Dann bist du n�mlich selber dran.
		AI_Output(self,other,"DIA_Scatty_FightNow_01_06");	//Dann solltest du wissen, dass du als K�mpfer f�r jeden Kampf etwas Erz verdienst. Erwarte aber nicht zu viel, du bekommst nur einen kleinen Teil ab.
		AI_Output(self,other,"DIA_Scatty_FightNow_01_07");	//Aber mach' dir nichts draus, du bekommst den gr��ten Teil des Ruhmes f�r einen gewonnenen Kampf.
		AI_Output(self,other,"DIA_Scatty_FightNow_01_08");	//Wenn du k�mpfen willst, musst du nur zu mir kommen und wir sprechen �ber deinen Gegner.
	};
};


var int kirgo_fight;
var int kharim_fight;
var int hanis_fight;

instance DIA_SCATTY_FIGHTER(C_Info)
{
	npc = GRD_210_Scatty;
	nr = 2;
	condition = dia_scatty_fighter_condition;
	information = dia_scatty_fighter_info;
	permanent = 1;
	description = "Lass mich in der Arena k�mpfen.";
};


func int dia_scatty_fighter_condition()
{
	if(Npc_KnowsInfo(hero,dia_scatty_fightnow) && (HANIS_BET != TRUE) && (KIRGO_BET != TRUE) && (KHARIM_BET != TRUE) && (KIRGO_FIGHT != TRUE) && (KHARIM_FIGHT != TRUE) && (HANIS_FIGHT != TRUE))
	{
		return 1;
	};
};

func void dia_scatty_fighter_info()
{
	AI_Output(other,self,"DIA_Scatty_Fighter_15_00");	//Lass mich in der Arena k�mpfen.
	if(SCATTY_FIGHTDAY <= (Wld_GetDay() - 4))
	{
		AI_Output(self,other,"DIA_Scatty_Fighter_01_01");	//In Ordnung. Erst reden wir �ber deinen Gegner, anschliessend �ber deine Bezahlung.
		AI_Output(self,other,"DIA_Scatty_Fighter_01_02");	//Je nachdem welchen Gegner du dir w�hlst, f�llt die Bezahlung h�her oder geringer aus.
		Info_ClearChoices(dia_scatty_fighter);
		Info_AddChoice(dia_scatty_fighter,"Ich will gegen Kirgo k�mpfen.",dia_scatty_fighter_kirgo);
		Info_AddChoice(dia_scatty_fighter,"Ich will gegen Kharim k�mpfen.",dia_scatty_fighter_kharim);
		if(Kapitel <= 2)
		{
			Info_AddChoice(dia_scatty_fighter,"Ich will gegen Gor Hanis k�mpfen.",dia_scatty_fighter_hanis);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Scatty_Fighter_15_01");	//Im moment steht aber kein Kampf an. Komm in ein paar Tagen wieder, dann hab' ich bestimmt was f�r dich.
		AI_StopProcessInfos(self);
	};
};

func void dia_scatty_fighter_kirgo()
{
	AI_Output(other,self,"DIA_Scatty_Kirgo_15_00");	//Ich will gegen Kirgo k�mpfen.
	AI_Output(self,other,"DIA_Scatty_Kirgo_01_01");	//Also gut. Bei ihm sieht die Bezahlung so aus.
	AI_Output(self,other,"DIA_Scatty_Kirgo_01_02");	//Gewinnst du den Kampf, gibt es 25 Erz f�r dich.
	AI_Output(self,other,"DIA_Scatty_Kirgo_01_03");	//Verlierst du allerdings den Kampf, bekommst du gar nichts. Au�er eine auf's Maul.
	AI_Output(self,other,"DIA_Scatty_Kirgo_01_04");	//Kirgo erwartet dich in der Arena. Viel Gl�ck!
	Info_ClearChoices(dia_scatty_fighter);
	AI_Teleport(GRD_251_Kirgo,"OCR_ARENABATTLE");
	Npc_SetTarget(GRD_251_Kirgo,other);
	AI_StartState(GRD_251_Kirgo,ZS_Attack,1,"");
	Npc_ExchangeRoutine(GRD_251_Kirgo,"GUIDE");
	b_story_npcs_watchfight();
	KIRGO_FIGHT = TRUE;
	SCATTY_FIGHTDAY = Wld_GetDay();
	if(Kapitel == 1)
	{
		EquipItem(GRD_251_Kirgo,ItMw_1H_LightGuardsSword_03);
		AI_EquipBestMeleeWeapon(GRD_251_Kirgo);
	};
	if(Kapitel >= 2)
	{
		Npc_RemoveInvItem(GRD_251_Kirgo,ItMw_1H_LightGuardsSword_03);
		CreateInvItems(GRD_251_Kirgo,ItMw_1H_Sword_03,1);
		AI_EquipBestMeleeWeapon(GRD_251_Kirgo);
	};
	AI_StopProcessInfos(self);
};

func void dia_scatty_fighter_kharim()
{
	AI_Output(other,self,"DIA_Scatty_Kharim_15_00");	//Ich will gegen Kharim k�mpfen.
	AI_Output(self,other,"DIA_Scatty_Kharim_01_01");	//Also gut. Bei ihm sieht die Bezahlung so aus.
	AI_Output(self,other,"DIA_Scatty_Kharim_01_02");	//Gewinnst du den Kampf, gibt es 50 Erz f�r dich.
	AI_Output(self,other,"DIA_Scatty_Kharim_01_03");	//Verlierst du allerdings den Kampf, bekommst du gar nichts. Au�er eine auf's Maul.
	AI_Output(self,other,"DIA_Scatty_Kharim_01_04");	//Kharim erwartet dich in der Arena. Viel Gl�ck!
	Info_ClearChoices(dia_scatty_fighter);
	AI_Teleport(Sld_729_Kharim,"OCR_ARENABATTLE");
	Npc_SetTarget(Sld_729_Kharim,other);
	AI_StartState(Sld_729_Kharim,ZS_Attack,1,"");
	Npc_ExchangeRoutine(Sld_729_Kharim,"GUIDE");
	b_story_npcs_watchfight();
	KHARIM_FIGHT = TRUE;
	SCATTY_FIGHTDAY = Wld_GetDay();
	if(Kapitel == 1)
	{
		EquipItem(Sld_729_Kharim,ItMw_1H_Mace_02);
		AI_EquipBestMeleeWeapon(Sld_729_Kharim);
	};
	if(Kapitel >= 2)
	{
		Npc_RemoveInvItem(Sld_729_Kharim,ItMw_1H_Mace_02);
		CreateInvItems(Sld_729_Kharim,ItMw_1H_Mace_War_03,1);
		AI_EquipBestMeleeWeapon(Sld_729_Kharim);
	};
	AI_StopProcessInfos(self);
};

func void dia_scatty_fighter_hanis()
{
	AI_Output(other,self,"DIA_Scatty_Hanis_15_00");	//Ich will gegen Gor Hanis k�mpfen.
	AI_Output(self,other,"DIA_Scatty_Hanis_01_01");	//Also gut. Bei ihm sieht die Bezahlung so aus.
	AI_Output(self,other,"DIA_Scatty_Hanis_01_02");	//Gewinnst du den Kampf, gibt es 100 Erz f�r dich.
	AI_Output(self,other,"DIA_Scatty_Hanis_01_03");	//Verlierst du allerdings den Kampf, bekommst du gar nichts. Au�er eine auf's Maul.
	AI_Output(self,other,"DIA_Scatty_Hanis_01_04");	//Gor Hanis erwartet dich in der Arena. Viel Gl�ck!
	Info_ClearChoices(dia_scatty_fighter);
	AI_Teleport(Tpl_1422_GorHanis,"OCR_ARENABATTLE");
	Npc_SetTarget(Tpl_1422_GorHanis,other);
	AI_StartState(Tpl_1422_GorHanis,ZS_Attack,1,"");
	Npc_ExchangeRoutine(Tpl_1422_GorHanis,"GUIDE");
	b_story_npcs_watchfight();
	HANIS_FIGHT = TRUE;
	SCATTY_FIGHTDAY = Wld_GetDay();
	if(Kapitel == 1)
	{
		EquipItem(Tpl_1422_GorHanis,ItMw_1H_Sword_01);
		AI_EquipBestMeleeWeapon(Tpl_1422_GorHanis);
	};
	if(Kapitel >= 2)
	{
		Npc_RemoveInvItem(Tpl_1422_GorHanis,ItMw_1H_Sword_01);
		CreateInvItems(Tpl_1422_GorHanis,ItMw_2H_Sword_Light_01,1);
		AI_EquipBestMeleeWeapon(Tpl_1422_GorHanis);
	};
	AI_StopProcessInfos(self);
};


instance DIA_SCATTY_KIRGOFIGHT(C_Info)
{
	npc = GRD_210_Scatty;
	nr = 1;
	condition = dia_scatty_kirgofight_condition;
	information = dia_scatty_kirgofight_info;
	permanent = 1;
	description = "Ich bin gegen Kirgo angetreten.";
};


func int dia_scatty_kirgofight_condition()
{
	var C_Npc Kirgo;
	Kirgo = Hlp_GetNpc(GRD_251_Kirgo);
	if(((Kirgo.aivar[AIV_WASDEFEATEDBYSC] == TRUE) && (KIRGO_FIGHT == TRUE)) || ((Kirgo.aivar[AIV_HASDEFEATEDSC] == TRUE) && (KIRGO_FIGHT == TRUE)))
	{
		return 1;
	};
};

func void dia_scatty_kirgofight_info()
{
	var C_Npc Kirgo;
	Kirgo = Hlp_GetNpc(GRD_251_Kirgo);
	AI_Output(other,self,"DIA_Scatty_KirgoFight_15_00");	//Ich bin gegen Kirgo angetreten.
	if(Kirgo.aivar[AIV_HASDEFEATEDSC] == TRUE)
	{
		AI_Output(self,other,"DIA_Scatty_KirgoFight_01_01");	//Man er hat dir ja ganz sch�n auf's Maul gehauen.
		AI_Output(self,other,"DIA_Scatty_KirgoFight_01_02");	//Erz gibt's keins, hier bekommen nur Sieger eine Belohnung.
		Kirgo.aivar[AIV_WASDEFEATEDBYSC] = FALSE;
		Kirgo.aivar[AIV_HASDEFEATEDSC] = FALSE;
		KIRGO_FIGHT = FALSE;
		AI_Teleport(Kirgo,"OCR_ARENABATTLE_OUTSIDE");
		Npc_ExchangeRoutine(Kirgo,"START");
		b_story_npcs_fightisover();
		Npc_ChangeAttribute(GRD_251_Kirgo,ATR_HITPOINTS,self.attribute[ATR_HITPOINTS_MAX]);
		Npc_ChangeAttribute(Tpl_1422_GorHanis,ATR_HITPOINTS,self.attribute[ATR_HITPOINTS_MAX]);
		Npc_ChangeAttribute(Sld_729_Kharim,ATR_HITPOINTS,self.attribute[ATR_HITPOINTS_MAX]);
	}
	else if(Kirgo.aivar[AIV_WASDEFEATEDBYSC] == TRUE)
	{
		AI_Output(self,other,"DIA_Scatty_KirgoSuccess1_01_03");	//Und du hast ihm ordentlich den Arsch versohlt.
		AI_Output(self,other,"DIA_Scatty_KirgoSuccess1_01_04");	//War ein guter Kampf. Hier ist dein Anteil.
		Kirgo.aivar[AIV_WASDEFEATEDBYSC] = FALSE;
		Kirgo.aivar[AIV_HASDEFEATEDSC] = FALSE;
		KIRGO_FIGHT = FALSE;
		AI_Teleport(Kirgo,"OCR_ARENABATTLE_OUTSIDE");
		Npc_ExchangeRoutine(Kirgo,"START");
		b_story_npcs_fightisover();
		CreateInvItems(self,ItMiNugget,25);
		B_GiveInvItems(self,hero,ItMiNugget,25);
		Npc_ChangeAttribute(GRD_251_Kirgo,ATR_HITPOINTS,self.attribute[ATR_HITPOINTS_MAX]);
		Npc_ChangeAttribute(Tpl_1422_GorHanis,ATR_HITPOINTS,self.attribute[ATR_HITPOINTS_MAX]);
		Npc_ChangeAttribute(Sld_729_Kharim,ATR_HITPOINTS,self.attribute[ATR_HITPOINTS_MAX]);
	};
};


instance DIA_SCATTY_KHARIMFIGHT(C_Info)
{
	npc = GRD_210_Scatty;
	nr = 1;
	condition = dia_scatty_kharimfight_condition;
	information = dia_scatty_kharimfight_info;
	permanent = 1;
	description = "Ich bin gegen Kharim angetreten.";
};


func int dia_scatty_kharimfight_condition()
{
	var C_Npc Kharim;
	Kharim = Hlp_GetNpc(Sld_729_Kharim);
	if(((Kharim.aivar[AIV_WASDEFEATEDBYSC] == TRUE) && (KHARIM_FIGHT == TRUE)) || ((Kharim.aivar[AIV_HASDEFEATEDSC] == TRUE) && (KHARIM_FIGHT == TRUE)))
	{
		return 1;
	};
};

func void dia_scatty_kharimfight_info()
{
	var C_Npc Kharim;
	Kharim = Hlp_GetNpc(Sld_729_Kharim);
	AI_Output(other,self,"DIA_Scatty_KharimFight_15_00");	//Ich bin gegen Kharim angetreten.
	if(Kharim.aivar[AIV_HASDEFEATEDSC] == TRUE)
	{
		AI_Output(self,other,"DIA_Scatty_KharimFight_01_01");	//Er hat dir ganz sch�n die Fresse poliert.
		AI_Output(self,other,"DIA_Scatty_KharimFight_01_02");	//Dein Erz ist jetzt in den Taschen des S�ldners.
		Kharim.aivar[AIV_WASDEFEATEDBYSC] = FALSE;
		Kharim.aivar[AIV_HASDEFEATEDSC] = FALSE;
		KHARIM_FIGHT = FALSE;
		AI_Teleport(Kharim,"OCR_ARENABATTLE_OUTSIDE");
		Npc_ExchangeRoutine(Kharim,"START");
		b_story_npcs_fightisover();
		Npc_ChangeAttribute(GRD_251_Kirgo,ATR_HITPOINTS,self.attribute[ATR_HITPOINTS_MAX]);
		Npc_ChangeAttribute(Tpl_1422_GorHanis,ATR_HITPOINTS,self.attribute[ATR_HITPOINTS_MAX]);
		Npc_ChangeAttribute(Sld_729_Kharim,ATR_HITPOINTS,self.attribute[ATR_HITPOINTS_MAX]);
	}
	else if(Kharim.aivar[AIV_WASDEFEATEDBYSC] == TRUE)
	{
		AI_Output(self,other,"DIA_Scatty_KharimSuccess_01_03");	//Du hast ihn in den Staub geworfen.
		AI_Output(self,other,"DIA_Scatty_KharimSuccess_01_04");	//Ich mag es, wenn die Mistkerle aus dem Neuen Lager was auf's Maul kriegen. Hier ist dein Erz.
		Kharim.aivar[AIV_WASDEFEATEDBYSC] = FALSE;
		Kharim.aivar[AIV_HASDEFEATEDSC] = FALSE;
		KHARIM_FIGHT = FALSE;
		AI_Teleport(Kharim,"OCR_ARENABATTLE_OUTSIDE");
		Npc_ExchangeRoutine(Kharim,"START");
		b_story_npcs_fightisover();
		CreateInvItems(self,ItMiNugget,50);
		B_GiveInvItems(self,hero,ItMiNugget,50);
		Npc_ChangeAttribute(GRD_251_Kirgo,ATR_HITPOINTS,self.attribute[ATR_HITPOINTS_MAX]);
		Npc_ChangeAttribute(Tpl_1422_GorHanis,ATR_HITPOINTS,self.attribute[ATR_HITPOINTS_MAX]);
		Npc_ChangeAttribute(Sld_729_Kharim,ATR_HITPOINTS,self.attribute[ATR_HITPOINTS_MAX]);
	};
};


instance DIA_SCATTY_HANISFIGHT(C_Info)
{
	npc = GRD_210_Scatty;
	nr = 1;
	condition = dia_scatty_hanisfight_condition;
	information = dia_scatty_hanisfight_info;
	permanent = 1;
	description = "Ich bin gegen Gor Hanis angetreten.";
};


func int dia_scatty_hanisfight_condition()
{
	var C_Npc hanis;
	hanis = Hlp_GetNpc(Tpl_1422_GorHanis);
	if(((hanis.aivar[AIV_WASDEFEATEDBYSC] == TRUE) && (HANIS_FIGHT == TRUE)) || ((hanis.aivar[AIV_HASDEFEATEDSC] == TRUE) && (HANIS_FIGHT == TRUE)))
	{
		return 1;
	};
};

func void dia_scatty_hanisfight_info()
{
	var C_Npc hanis;
	hanis = Hlp_GetNpc(Tpl_1422_GorHanis);
	AI_Output(other,self,"DIA_Scatty_HanisFight_15_00");	//Ich bin gegen Gor Hanis angetreten.
	if(hanis.aivar[AIV_HASDEFEATEDSC] == TRUE)
	{
		AI_Output(self,other,"DIA_Scatty_HanisFight_01_01");	//Ich hab' schon lange niemanden mehr gesehen, dem so auf's Maul gehauen wurde.
		AI_Output(self,other,"DIA_Scatty_HanisFight_01_02");	//Da hast du dir auch einen harten Brocken ausgesucht gehabt. Der jetzt auch dein Erz hat.
		hanis.aivar[AIV_WASDEFEATEDBYSC] = FALSE;
		hanis.aivar[AIV_HASDEFEATEDSC] = FALSE;
		HANIS_FIGHT = FALSE;
		AI_Teleport(hanis,"OCR_ARENABATTLE_OUTSIDE");
		Npc_ExchangeRoutine(hanis,"START");
		b_story_npcs_fightisover();
		Npc_ChangeAttribute(GRD_251_Kirgo,ATR_HITPOINTS,self.attribute[ATR_HITPOINTS_MAX]);
		Npc_ChangeAttribute(Tpl_1422_GorHanis,ATR_HITPOINTS,self.attribute[ATR_HITPOINTS_MAX]);
		Npc_ChangeAttribute(Sld_729_Kharim,ATR_HITPOINTS,self.attribute[ATR_HITPOINTS_MAX]);
	}
	else if(hanis.aivar[AIV_WASDEFEATEDBYSC] == TRUE)
	{
		AI_Output(self,other,"DIA_Scatty_HanisSuccess_01_03");	//Du hast ihn geschlagen. Nicht schlecht daf�r, dass du noch nicht solange hier bist. Sag Fletcher das er seine Schulden los ist.
		AI_Output(self,other,"DIA_Scatty_HanisSuccess_01_04");	//Hier ist dein Anteil. Du hast ihn dir verdient.
		hanis.aivar[AIV_WASDEFEATEDBYSC] = FALSE;
		hanis.aivar[AIV_HASDEFEATEDSC] = FALSE;
		HANIS_FIGHT = FALSE;
		AI_Teleport(hanis,"OCR_ARENABATTLE_OUTSIDE");
		Npc_ExchangeRoutine(hanis,"START");
		b_story_npcs_fightisover();
		CreateInvItems(self,ItMiNugget,100);
		B_GiveInvItems(self,hero,ItMiNugget,100);
		Npc_ChangeAttribute(GRD_251_Kirgo,ATR_HITPOINTS,self.attribute[ATR_HITPOINTS_MAX]);
		Npc_ChangeAttribute(Tpl_1422_GorHanis,ATR_HITPOINTS,self.attribute[ATR_HITPOINTS_MAX]);
		Npc_ChangeAttribute(Sld_729_Kharim,ATR_HITPOINTS,self.attribute[ATR_HITPOINTS_MAX]);
	};
};


instance DIA_SCATTY_FIGHTSOVER(C_Info)
{
	npc = GRD_210_Scatty;
	nr = 1;
	condition = dia_scatty_fightsover_condition;
	information = dia_scatty_fightsover_info;
	permanent = 1;
	description = "Ich will meinen Wetteinsatz abholen.";
};


func int dia_scatty_fightsover_condition()
{
	if(((HANIS_BET == TRUE) && (ARENA_FIGHT == FALSE)) || ((KIRGO_BET == TRUE) && (ARENA_FIGHT == FALSE)) || ((KHARIM_BET == TRUE) && (ARENA_FIGHT == FALSE)))
	{
		return 1;
	};
};

func void dia_scatty_fightsover_info()
{
	AI_Output(other,self,"DIA_Scatty_FightsOver_15_00");	//Ich will meinen Wetteinsatz abholen.
	if((HANIS_BET == TRUE) && (Tpl_1422_GorHanis.attribute[ATR_HITPOINTS] <= 5))
	{
		AI_Output(self,other,"DIA_Scatty_FightsOver_02_11");	//Gor Hanis hat den Kampf verloren, dass hei�t es gibt kein Erz f�r dich.
		AI_Output(self,other,"DIA_Scatty_FightsOver_02_02");	//In ein paar Tagen steht erneut ein Kampf an. Dann kannst du immer noch dein Gl�ck versuchen.
		AI_Teleport(Sld_729_Kharim,"OCR_ARENABATTLE_OUTSIDE");
		Npc_ExchangeRoutine(Sld_729_Kharim,"START");
		AI_Teleport(Tpl_1422_GorHanis,"OCR_ARENABATTLE_OUTSIDE");
		Npc_ExchangeRoutine(Tpl_1422_GorHanis,"START");
		b_story_npcs_fightisover();
		KIRGO_BET = FALSE;
		KHARIM_BET = FALSE;
		HANIS_BET = FALSE;
		Npc_ChangeAttribute(GRD_251_Kirgo,ATR_HITPOINTS,self.attribute[ATR_HITPOINTS_MAX]);
		Npc_ChangeAttribute(Tpl_1422_GorHanis,ATR_HITPOINTS,self.attribute[ATR_HITPOINTS_MAX]);
		Npc_ChangeAttribute(Sld_729_Kharim,ATR_HITPOINTS,self.attribute[ATR_HITPOINTS_MAX]);
		if(Kapitel == 1)
		{
			Npc_RemoveInvItem(Tpl_1422_GorHanis,ItMw_1H_LightGuardsSword_03);
			Npc_RemoveInvItem(Sld_729_Kharim,ItMw_1H_LightGuardsSword_03);
			Npc_RemoveInvItem(GRD_251_Kirgo,ItMw_1H_Sword_01);
			Npc_RemoveInvItem(Sld_729_Kharim,ItMw_1H_Sword_01);
			Npc_RemoveInvItem(Tpl_1422_GorHanis,ItMw_1H_Mace_02);
			Npc_RemoveInvItem(GRD_251_Kirgo,ItMw_1H_Mace_02);
			EquipItem(GRD_251_Kirgo,ItMw_1H_LightGuardsSword_03);
			EquipItem(Tpl_1422_GorHanis,ItMw_1H_Sword_01);
			EquipItem(Sld_729_Kharim,ItMw_1H_Mace_02);
			AI_EquipBestMeleeWeapon(GRD_251_Kirgo);
			AI_EquipBestMeleeWeapon(Tpl_1422_GorHanis);
			AI_EquipBestMeleeWeapon(Sld_729_Kharim);
		};
		if(Kapitel >= 2)
		{
			Npc_RemoveInvItem(Tpl_1422_GorHanis,ItMw_1H_Sword_03);
			Npc_RemoveInvItem(Sld_729_Kharim,ItMw_1H_Sword_03);
			Npc_RemoveInvItem(GRD_251_Kirgo,ItMw_2H_Sword_Light_01);
			Npc_RemoveInvItem(Sld_729_Kharim,ItMw_2H_Sword_Light_01);
			Npc_RemoveInvItem(Tpl_1422_GorHanis,ItMw_1H_Mace_War_03);
			Npc_RemoveInvItem(GRD_251_Kirgo,ItMw_1H_Mace_War_03);
			Npc_RemoveInvItem(Sld_729_Kharim,ItMw_1H_Mace_02);
			CreateInvItems(Sld_729_Kharim,ItMw_1H_Mace_War_03,1);
			AI_EquipBestMeleeWeapon(Sld_729_Kharim);
			Npc_RemoveInvItem(GRD_251_Kirgo,ItMw_1H_LightGuardsSword_03);
			CreateInvItems(GRD_251_Kirgo,ItMw_1H_Sword_03,1);
			AI_EquipBestMeleeWeapon(GRD_251_Kirgo);
			Npc_RemoveInvItem(Tpl_1422_GorHanis,ItMw_1H_Sword_01);
			CreateInvItems(Tpl_1422_GorHanis,ItMw_2H_Sword_Light_01,1);
			AI_EquipBestMeleeWeapon(Tpl_1422_GorHanis);
		};
	}
	else if((HANIS_BET == TRUE) && (Sld_729_Kharim.attribute[ATR_HITPOINTS] <= 5))
	{
		AI_Output(self,other,"DIA_Scatty_FightsOver_03_22");	//Gor Hanis hat den Kampf gewonnen, dass hei�t du bekommst 150 Erz.
		AI_Output(self,other,"DIA_Scatty_FightsOver_03_04");	//Aber nicht das du alles vers�ufst. Hehe.
		AI_Output(self,other,"DIA_Scatty_FightsOver_03_05");	//In ein paar Tagen steht der n�chste Kampf an. Du kannst dann wieder wetten.
		AI_Teleport(Sld_729_Kharim,"OCR_ARENABATTLE_OUTSIDE");
		Npc_ExchangeRoutine(Sld_729_Kharim,"START");
		AI_Teleport(Tpl_1422_GorHanis,"OCR_ARENABATTLE_OUTSIDE");
		Npc_ExchangeRoutine(Tpl_1422_GorHanis,"START");
		b_story_npcs_fightisover();
		KIRGO_BET = FALSE;
		KHARIM_BET = FALSE;
		HANIS_BET = FALSE;
		CreateInvItems(self,ItMiNugget,150);
		B_GiveInvItems(self,hero,ItMiNugget,150);
		Npc_ChangeAttribute(GRD_251_Kirgo,ATR_HITPOINTS,self.attribute[ATR_HITPOINTS_MAX]);
		Npc_ChangeAttribute(Tpl_1422_GorHanis,ATR_HITPOINTS,self.attribute[ATR_HITPOINTS_MAX]);
		Npc_ChangeAttribute(Sld_729_Kharim,ATR_HITPOINTS,self.attribute[ATR_HITPOINTS_MAX]);
		if(Kapitel == 1)
		{
			Npc_RemoveInvItem(Tpl_1422_GorHanis,ItMw_1H_LightGuardsSword_03);
			Npc_RemoveInvItem(Sld_729_Kharim,ItMw_1H_LightGuardsSword_03);
			Npc_RemoveInvItem(GRD_251_Kirgo,ItMw_1H_Sword_01);
			Npc_RemoveInvItem(Sld_729_Kharim,ItMw_1H_Sword_01);
			Npc_RemoveInvItem(Tpl_1422_GorHanis,ItMw_1H_Mace_02);
			Npc_RemoveInvItem(GRD_251_Kirgo,ItMw_1H_Mace_02);
			EquipItem(GRD_251_Kirgo,ItMw_1H_LightGuardsSword_03);
			EquipItem(Tpl_1422_GorHanis,ItMw_1H_Sword_01);
			EquipItem(Sld_729_Kharim,ItMw_1H_Mace_02);
			AI_EquipBestMeleeWeapon(GRD_251_Kirgo);
			AI_EquipBestMeleeWeapon(Tpl_1422_GorHanis);
			AI_EquipBestMeleeWeapon(Sld_729_Kharim);
		};
		if(Kapitel >= 2)
		{
			Npc_RemoveInvItem(Tpl_1422_GorHanis,ItMw_1H_Sword_03);
			Npc_RemoveInvItem(Sld_729_Kharim,ItMw_1H_Sword_03);
			Npc_RemoveInvItem(GRD_251_Kirgo,ItMw_2H_Sword_Light_01);
			Npc_RemoveInvItem(Sld_729_Kharim,ItMw_2H_Sword_Light_01);
			Npc_RemoveInvItem(Tpl_1422_GorHanis,ItMw_1H_Mace_War_03);
			Npc_RemoveInvItem(GRD_251_Kirgo,ItMw_1H_Mace_War_03);
			Npc_RemoveInvItem(Sld_729_Kharim,ItMw_1H_Mace_02);
			CreateInvItems(Sld_729_Kharim,ItMw_1H_Mace_War_03,1);
			AI_EquipBestMeleeWeapon(Sld_729_Kharim);
			Npc_RemoveInvItem(GRD_251_Kirgo,ItMw_1H_LightGuardsSword_03);
			CreateInvItems(GRD_251_Kirgo,ItMw_1H_Sword_03,1);
			AI_EquipBestMeleeWeapon(GRD_251_Kirgo);
			Npc_RemoveInvItem(Tpl_1422_GorHanis,ItMw_1H_Sword_01);
			CreateInvItems(Tpl_1422_GorHanis,ItMw_2H_Sword_Light_01,1);
			AI_EquipBestMeleeWeapon(Tpl_1422_GorHanis);
		};
	}
	else if((KHARIM_BET == TRUE) && (Sld_729_Kharim.attribute[ATR_HITPOINTS] <= 5))
	{
		AI_Output(self,other,"DIA_Scatty_FightsOver_04_33");	//Kharim hat den Kampf verloren, dass hei�t es gibt kein Erz f�r dich.
		AI_Output(self,other,"DIA_Scatty_FightsOver_04_02");	//In ein paar Tagen steht erneut ein Kampf an. Dann kannst du immer noch dein Gl�ck versuchen.
		AI_Teleport(Sld_729_Kharim,"OCR_ARENABATTLE_OUTSIDE");
		Npc_ExchangeRoutine(Sld_729_Kharim,"START");
		AI_Teleport(GRD_251_Kirgo,"OCR_ARENABATTLE_OUTSIDE");
		Npc_ExchangeRoutine(GRD_251_Kirgo,"START");
		b_story_npcs_fightisover();
		KIRGO_BET = FALSE;
		KHARIM_BET = FALSE;
		HANIS_BET = FALSE;
		Npc_ChangeAttribute(GRD_251_Kirgo,ATR_HITPOINTS,self.attribute[ATR_HITPOINTS_MAX]);
		Npc_ChangeAttribute(Tpl_1422_GorHanis,ATR_HITPOINTS,self.attribute[ATR_HITPOINTS_MAX]);
		Npc_ChangeAttribute(Sld_729_Kharim,ATR_HITPOINTS,self.attribute[ATR_HITPOINTS_MAX]);
		if(Kapitel == 1)
		{
			Npc_RemoveInvItem(Tpl_1422_GorHanis,ItMw_1H_LightGuardsSword_03);
			Npc_RemoveInvItem(Sld_729_Kharim,ItMw_1H_LightGuardsSword_03);
			Npc_RemoveInvItem(GRD_251_Kirgo,ItMw_1H_Sword_01);
			Npc_RemoveInvItem(Sld_729_Kharim,ItMw_1H_Sword_01);
			Npc_RemoveInvItem(Tpl_1422_GorHanis,ItMw_1H_Mace_02);
			Npc_RemoveInvItem(GRD_251_Kirgo,ItMw_1H_Mace_02);
			EquipItem(GRD_251_Kirgo,ItMw_1H_LightGuardsSword_03);
			EquipItem(Tpl_1422_GorHanis,ItMw_1H_Sword_01);
			EquipItem(Sld_729_Kharim,ItMw_1H_Mace_02);
			AI_EquipBestMeleeWeapon(GRD_251_Kirgo);
			AI_EquipBestMeleeWeapon(Tpl_1422_GorHanis);
			AI_EquipBestMeleeWeapon(Sld_729_Kharim);
		};
		if(Kapitel >= 2)
		{
			Npc_RemoveInvItem(Tpl_1422_GorHanis,ItMw_1H_Sword_03);
			Npc_RemoveInvItem(Sld_729_Kharim,ItMw_1H_Sword_03);
			Npc_RemoveInvItem(GRD_251_Kirgo,ItMw_2H_Sword_Light_01);
			Npc_RemoveInvItem(Sld_729_Kharim,ItMw_2H_Sword_Light_01);
			Npc_RemoveInvItem(Tpl_1422_GorHanis,ItMw_1H_Mace_War_03);
			Npc_RemoveInvItem(GRD_251_Kirgo,ItMw_1H_Mace_War_03);
			Npc_RemoveInvItem(Sld_729_Kharim,ItMw_1H_Mace_02);
			CreateInvItems(Sld_729_Kharim,ItMw_1H_Mace_War_03,1);
			AI_EquipBestMeleeWeapon(Sld_729_Kharim);
			Npc_RemoveInvItem(GRD_251_Kirgo,ItMw_1H_LightGuardsSword_03);
			CreateInvItems(GRD_251_Kirgo,ItMw_1H_Sword_03,1);
			AI_EquipBestMeleeWeapon(GRD_251_Kirgo);
			Npc_RemoveInvItem(Tpl_1422_GorHanis,ItMw_1H_Sword_01);
			CreateInvItems(Tpl_1422_GorHanis,ItMw_2H_Sword_Light_01,1);
			AI_EquipBestMeleeWeapon(Tpl_1422_GorHanis);
		};
	}
	else if((KHARIM_BET == TRUE) && (GRD_251_Kirgo.attribute[ATR_HITPOINTS] <= 5))
	{
		AI_Output(self,other,"DIA_Scatty_FightsOver_05_44");	//Kharim hat den Kampf gewonnen, dass hei�t du bekommst 150 Erz.
		AI_Output(self,other,"DIA_Scatty_FightsOver_05_04");	//Aber nicht das du alles vers�ufst. Hehe.
		AI_Output(self,other,"DIA_Scatty_FightsOver_05_05");	//In ein paar Tagen steht der n�chste Kampf an. Du kannst dann wieder wetten.
		AI_Teleport(Sld_729_Kharim,"OCR_ARENABATTLE_OUTSIDE");
		Npc_ExchangeRoutine(Sld_729_Kharim,"START");
		AI_Teleport(GRD_251_Kirgo,"OCR_ARENABATTLE_OUTSIDE");
		Npc_ExchangeRoutine(GRD_251_Kirgo,"START");
		b_story_npcs_fightisover();
		KIRGO_BET = FALSE;
		KHARIM_BET = FALSE;
		HANIS_BET = FALSE;
		CreateInvItems(self,ItMiNugget,150);
		B_GiveInvItems(self,hero,ItMiNugget,150);
		Npc_ChangeAttribute(GRD_251_Kirgo,ATR_HITPOINTS,self.attribute[ATR_HITPOINTS_MAX]);
		Npc_ChangeAttribute(Tpl_1422_GorHanis,ATR_HITPOINTS,self.attribute[ATR_HITPOINTS_MAX]);
		Npc_ChangeAttribute(Sld_729_Kharim,ATR_HITPOINTS,self.attribute[ATR_HITPOINTS_MAX]);
		if(Kapitel == 1)
		{
			Npc_RemoveInvItem(Tpl_1422_GorHanis,ItMw_1H_LightGuardsSword_03);
			Npc_RemoveInvItem(Sld_729_Kharim,ItMw_1H_LightGuardsSword_03);
			Npc_RemoveInvItem(GRD_251_Kirgo,ItMw_1H_Sword_01);
			Npc_RemoveInvItem(Sld_729_Kharim,ItMw_1H_Sword_01);
			Npc_RemoveInvItem(Tpl_1422_GorHanis,ItMw_1H_Mace_02);
			Npc_RemoveInvItem(GRD_251_Kirgo,ItMw_1H_Mace_02);
			EquipItem(GRD_251_Kirgo,ItMw_1H_LightGuardsSword_03);
			EquipItem(Tpl_1422_GorHanis,ItMw_1H_Sword_01);
			EquipItem(Sld_729_Kharim,ItMw_1H_Mace_02);
			AI_EquipBestMeleeWeapon(GRD_251_Kirgo);
			AI_EquipBestMeleeWeapon(Tpl_1422_GorHanis);
			AI_EquipBestMeleeWeapon(Sld_729_Kharim);
		};
		if(Kapitel >= 2)
		{
			Npc_RemoveInvItem(Tpl_1422_GorHanis,ItMw_1H_Sword_03);
			Npc_RemoveInvItem(Sld_729_Kharim,ItMw_1H_Sword_03);
			Npc_RemoveInvItem(GRD_251_Kirgo,ItMw_2H_Sword_Light_01);
			Npc_RemoveInvItem(Sld_729_Kharim,ItMw_2H_Sword_Light_01);
			Npc_RemoveInvItem(Tpl_1422_GorHanis,ItMw_1H_Mace_War_03);
			Npc_RemoveInvItem(GRD_251_Kirgo,ItMw_1H_Mace_War_03);
			Npc_RemoveInvItem(Sld_729_Kharim,ItMw_1H_Mace_02);
			CreateInvItems(Sld_729_Kharim,ItMw_1H_Mace_War_03,1);
			AI_EquipBestMeleeWeapon(Sld_729_Kharim);
			Npc_RemoveInvItem(GRD_251_Kirgo,ItMw_1H_LightGuardsSword_03);
			CreateInvItems(GRD_251_Kirgo,ItMw_1H_Sword_03,1);
			AI_EquipBestMeleeWeapon(GRD_251_Kirgo);
			Npc_RemoveInvItem(Tpl_1422_GorHanis,ItMw_1H_Sword_01);
			CreateInvItems(Tpl_1422_GorHanis,ItMw_2H_Sword_Light_01,1);
			AI_EquipBestMeleeWeapon(Tpl_1422_GorHanis);
		};
	}
	else if((KIRGO_BET == TRUE) && (Sld_729_Kharim.attribute[ATR_HITPOINTS] <= 5))
	{
		AI_Output(self,other,"DIA_Scatty_FightsOver_06_55");	//Kirgo hat den Kampf gewonnen, dass hei�t du bekommst 150 Erz.
		AI_Output(self,other,"DIA_Scatty_FightsOver_06_04");	//Aber nicht das du alles vers�ufst. Hehe.
		AI_Output(self,other,"DIA_Scatty_FightsOver_06_05");	//In ein paar Tagen steht der n�chste Kampf an. Du kannst dann wieder wetten.
		AI_Teleport(Sld_729_Kharim,"OCR_ARENABATTLE_OUTSIDE");
		Npc_ExchangeRoutine(Sld_729_Kharim,"START");
		AI_Teleport(GRD_251_Kirgo,"OCR_ARENABATTLE_OUTSIDE");
		Npc_ExchangeRoutine(GRD_251_Kirgo,"START");
		b_story_npcs_fightisover();
		KIRGO_BET = FALSE;
		KHARIM_BET = FALSE;
		HANIS_BET = FALSE;
		CreateInvItems(self,ItMiNugget,150);
		B_GiveInvItems(self,hero,ItMiNugget,150);
		Npc_ChangeAttribute(GRD_251_Kirgo,ATR_HITPOINTS,self.attribute[ATR_HITPOINTS_MAX]);
		Npc_ChangeAttribute(Tpl_1422_GorHanis,ATR_HITPOINTS,self.attribute[ATR_HITPOINTS_MAX]);
		Npc_ChangeAttribute(Sld_729_Kharim,ATR_HITPOINTS,self.attribute[ATR_HITPOINTS_MAX]);
		if(Kapitel == 1)
		{
			Npc_RemoveInvItem(Tpl_1422_GorHanis,ItMw_1H_LightGuardsSword_03);
			Npc_RemoveInvItem(Sld_729_Kharim,ItMw_1H_LightGuardsSword_03);
			Npc_RemoveInvItem(GRD_251_Kirgo,ItMw_1H_Sword_01);
			Npc_RemoveInvItem(Sld_729_Kharim,ItMw_1H_Sword_01);
			Npc_RemoveInvItem(Tpl_1422_GorHanis,ItMw_1H_Mace_02);
			Npc_RemoveInvItem(GRD_251_Kirgo,ItMw_1H_Mace_02);
			EquipItem(GRD_251_Kirgo,ItMw_1H_LightGuardsSword_03);
			EquipItem(Tpl_1422_GorHanis,ItMw_1H_Sword_01);
			EquipItem(Sld_729_Kharim,ItMw_1H_Mace_02);
			AI_EquipBestMeleeWeapon(GRD_251_Kirgo);
			AI_EquipBestMeleeWeapon(Tpl_1422_GorHanis);
			AI_EquipBestMeleeWeapon(Sld_729_Kharim);
		};
		if(Kapitel >= 2)
		{
			Npc_RemoveInvItem(Tpl_1422_GorHanis,ItMw_1H_Sword_03);
			Npc_RemoveInvItem(Sld_729_Kharim,ItMw_1H_Sword_03);
			Npc_RemoveInvItem(GRD_251_Kirgo,ItMw_2H_Sword_Light_01);
			Npc_RemoveInvItem(Sld_729_Kharim,ItMw_2H_Sword_Light_01);
			Npc_RemoveInvItem(Tpl_1422_GorHanis,ItMw_1H_Mace_War_03);
			Npc_RemoveInvItem(GRD_251_Kirgo,ItMw_1H_Mace_War_03);
			Npc_RemoveInvItem(Sld_729_Kharim,ItMw_1H_Mace_02);
			CreateInvItems(Sld_729_Kharim,ItMw_1H_Mace_War_03,1);
			AI_EquipBestMeleeWeapon(Sld_729_Kharim);
			Npc_RemoveInvItem(GRD_251_Kirgo,ItMw_1H_LightGuardsSword_03);
			CreateInvItems(GRD_251_Kirgo,ItMw_1H_Sword_03,1);
			AI_EquipBestMeleeWeapon(GRD_251_Kirgo);
			Npc_RemoveInvItem(Tpl_1422_GorHanis,ItMw_1H_Sword_01);
			CreateInvItems(Tpl_1422_GorHanis,ItMw_2H_Sword_Light_01,1);
			AI_EquipBestMeleeWeapon(Tpl_1422_GorHanis);
		};
	}
	else if((KIRGO_BET == TRUE) && (GRD_251_Kirgo.attribute[ATR_HITPOINTS] <= 5))
	{
		AI_Output(self,other,"DIA_Scatty_FightsOver_07_66");	//Kirgo hat den Kampf verloren, dass hei�t es gibt kein Erz f�r dich.
		AI_Output(self,other,"DIA_Scatty_FightsOver_07_02");	//In ein paar Tagen steht erneut ein Kampf an. Dann kannst du immer noch dein Gl�ck versuchen.
		AI_Teleport(Sld_729_Kharim,"OCR_ARENABATTLE_OUTSIDE");
		Npc_ExchangeRoutine(Sld_729_Kharim,"START");
		AI_Teleport(GRD_251_Kirgo,"OCR_ARENABATTLE_OUTSIDE");
		Npc_ExchangeRoutine(GRD_251_Kirgo,"START");
		b_story_npcs_fightisover();
		KIRGO_BET = FALSE;
		KHARIM_BET = FALSE;
		HANIS_BET = FALSE;
		Npc_ChangeAttribute(GRD_251_Kirgo,ATR_HITPOINTS,self.attribute[ATR_HITPOINTS_MAX]);
		Npc_ChangeAttribute(Tpl_1422_GorHanis,ATR_HITPOINTS,self.attribute[ATR_HITPOINTS_MAX]);
		Npc_ChangeAttribute(Sld_729_Kharim,ATR_HITPOINTS,self.attribute[ATR_HITPOINTS_MAX]);
		if(Kapitel == 1)
		{
			Npc_RemoveInvItem(Tpl_1422_GorHanis,ItMw_1H_LightGuardsSword_03);
			Npc_RemoveInvItem(Sld_729_Kharim,ItMw_1H_LightGuardsSword_03);
			Npc_RemoveInvItem(GRD_251_Kirgo,ItMw_1H_Sword_01);
			Npc_RemoveInvItem(Sld_729_Kharim,ItMw_1H_Sword_01);
			Npc_RemoveInvItem(Tpl_1422_GorHanis,ItMw_1H_Mace_02);
			Npc_RemoveInvItem(GRD_251_Kirgo,ItMw_1H_Mace_02);
			EquipItem(GRD_251_Kirgo,ItMw_1H_LightGuardsSword_03);
			EquipItem(Tpl_1422_GorHanis,ItMw_1H_Sword_01);
			EquipItem(Sld_729_Kharim,ItMw_1H_Mace_02);
			AI_EquipBestMeleeWeapon(GRD_251_Kirgo);
			AI_EquipBestMeleeWeapon(Tpl_1422_GorHanis);
			AI_EquipBestMeleeWeapon(Sld_729_Kharim);
		};
		if(Kapitel >= 2)
		{
			Npc_RemoveInvItem(Tpl_1422_GorHanis,ItMw_1H_Sword_03);
			Npc_RemoveInvItem(Sld_729_Kharim,ItMw_1H_Sword_03);
			Npc_RemoveInvItem(GRD_251_Kirgo,ItMw_2H_Sword_Light_01);
			Npc_RemoveInvItem(Sld_729_Kharim,ItMw_2H_Sword_Light_01);
			Npc_RemoveInvItem(Tpl_1422_GorHanis,ItMw_1H_Mace_War_03);
			Npc_RemoveInvItem(GRD_251_Kirgo,ItMw_1H_Mace_War_03);
			Npc_RemoveInvItem(Sld_729_Kharim,ItMw_1H_Mace_02);
			CreateInvItems(Sld_729_Kharim,ItMw_1H_Mace_War_03,1);
			AI_EquipBestMeleeWeapon(Sld_729_Kharim);
			Npc_RemoveInvItem(GRD_251_Kirgo,ItMw_1H_LightGuardsSword_03);
			CreateInvItems(GRD_251_Kirgo,ItMw_1H_Sword_03,1);
			AI_EquipBestMeleeWeapon(GRD_251_Kirgo);
			Npc_RemoveInvItem(Tpl_1422_GorHanis,ItMw_1H_Sword_01);
			CreateInvItems(Tpl_1422_GorHanis,ItMw_2H_Sword_Light_01,1);
			AI_EquipBestMeleeWeapon(Tpl_1422_GorHanis);
		};
	};
};

