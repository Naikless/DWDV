
instance Info_GorHanis_Exit(C_Info)
{
	npc = Tpl_1422_GorHanis;
	nr = 999;
	condition = Info_GorHanis_Exit_Condition;
	information = Info_GorHanis_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Info_GorHanis_Exit_Condition()
{
	return 1;
};

func void Info_GorHanis_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance Info_GorHanis_What(C_Info)
{
	npc = Tpl_1422_GorHanis;
	nr = 1;
	condition = Info_GorHanis_What_Condition;
	information = Info_GorHanis_What_Info;
	permanent = 0;
	description = "Was machst du hier?";
};


func int Info_GorHanis_What_Condition()
{
	return 1;
};

func void Info_GorHanis_What_Info()
{
	AI_Output(other,self,"Info_GorHanis_What_15_00");	//Was machst du hier?
	AI_Output(self,other,"Info_GorHanis_What_08_01");	//Ich? Ich k�mpfe f�r den Ruhm des Schl�fers!
};


instance Info_GorHanis_Arena(C_Info)
{
	npc = Tpl_1422_GorHanis;
	nr = 1;
	condition = Info_GorHanis_Arena_Condition;
	information = Info_GorHanis_Arena_Info;
	permanent = 1;
	description = "Du k�mpfst in der Arena?";
};


func int Info_GorHanis_Arena_Condition()
{
	if(Npc_KnowsInfo(self,Info_GorHanis_What))
	{
		return 1;
	};
};

func void Info_GorHanis_Arena_Info()
{
	AI_Output(other,self,"Info_GorHanis_Arena_15_00");	//Du k�mpfst in der Arena?
	AI_Output(self,other,"Info_GorHanis_Arena_08_01");	//Ich wurde von meinen Meistern aus dem Sumpf hierher geschickt, um f�r den Schl�fer zu k�mpfen.
	AI_Output(self,other,"Info_GorHanis_Arena_08_02");	//Zu seiner h�heren Ehre k�mpfe ich hier - Auf dass alle Ungl�ubigen sehen, wie stark ich dank seiner Macht geworden bin!
};


instance Info_GorHanis_Sleeper(C_Info)
{
	npc = Tpl_1422_GorHanis;
	nr = 2;
	condition = Info_GorHanis_Sleeper_Condition;
	information = Info_GorHanis_Sleeper_Info;
	permanent = 0;
	description = "Was ist der Schl�fer?";
};


func int Info_GorHanis_Sleeper_Condition()
{
	if(Npc_KnowsInfo(self,Info_GorHanis_What))
	{
		return 1;
	};
};

func void Info_GorHanis_Sleeper_Info()
{
	AI_Output(other,self,"Info_GorHanis_Sleeper_15_00");	//Was ist der Schl�fer?
	AI_Output(self,other,"Info_GorHanis_Sleeper_08_01");	//Bei uns im Lager findest du Priester, die dir diese Frage besser beantworten k�nnen als ich.
	AI_Output(self,other,"Info_GorHanis_Sleeper_08_02");	//Ich will dir nur so viel sagen: Der Schl�fer ist unser Erl�ser, er hat uns an diesen Ort gef�hrt, und er wird uns auch wieder hier herausholen.
	AI_Output(other,self,"Info_GorHanis_Sleeper_15_03");	//Du meinst, ihr wartet darauf, dass euch euer Gott befreit?
	AI_Output(self,other,"Info_GorHanis_Sleeper_08_04");	//Ja! Und das Warten wird bald ein Ende haben. Die Vorbereitungen f�r eine gro�e Anrufung laufen schon.
};


instance Info_GorHanis_Summoning(C_Info)
{
	npc = Tpl_1422_GorHanis;
	nr = 2;
	condition = Info_GorHanis_Summoning_Condition;
	information = Info_GorHanis_Summoning_Info;
	permanent = 0;
	description = "Was ist das f�r eine gro�e Anrufung, die ihr plant?";
};


func int Info_GorHanis_Summoning_Condition()
{
	if(Npc_KnowsInfo(self,Info_GorHanis_Sleeper))
	{
		return 1;
	};
};

func void Info_GorHanis_Summoning_Info()
{
	AI_Output(other,self,"Info_GorHanis_Summoning_15_00");	//Was ist das f�r eine gro�e Anrufung, die ihr plant?
	AI_Output(self,other,"Info_GorHanis_Summoning_08_01");	//Unsere Propheten sagen, die gemeinsame Anrufung des Schl�fers sei der Schl�ssel zur Freiheit f�r uns alle!
	AI_Output(self,other,"Info_GorHanis_Summoning_08_02");	//Wenn du mehr dar�ber erfahren willst, begib dich zu uns ins Lager.
};


instance Info_GorHanis_WayToST(C_Info)
{
	npc = Tpl_1422_GorHanis;
	nr = 0;
	condition = Info_GorHanis_WayToST_Condition;
	information = Info_GorHanis_WayToST_Info;
	permanent = 1;
	description = "Kannst du mir den Weg zu eurem Lager beschreiben?";
};


func int Info_GorHanis_WayToST_Condition()
{
	if(Npc_KnowsInfo(hero,Info_GorHanis_Sleeper) || Npc_KnowsInfo(hero,Info_GorHanis_Summoning))
	{
		return 1;
	};
};

func void Info_GorHanis_WayToST_Info()
{
	AI_Output(other,self,"Info_GorHanis_WayToST_15_00");	//Kannst du mir den Weg zu eurem Lager beschreiben?
	AI_Output(self,other,"Info_GorHanis_WayToST_08_01");	//Hier im Alten Lager sind immer einige Novizen, die Neuank�mmlinge wie dich in unser Lager begleiten. Du musst sie nur ansprechen!
};


var int hanis_herausforderung;

instance Info_GorHanis_Charge(C_Info)
{
	npc = Tpl_1422_GorHanis;
	nr = 10;
	condition = Info_GorHanis_Charge_Condition;
	information = Info_GorHanis_Charge_Info;
	permanent = 0;
	description = "Ich fordere dich zum Duell in der Arena!";
};


func int Info_GorHanis_Charge_Condition()
{
	if(Npc_KnowsInfo(hero,dia_fletcher_gottofight))
	{
		return 1;
	};
};

func void Info_GorHanis_Charge_Info()
{
	AI_Output(other,self,"Info_GorHanis_Charge_15_00");	//Ich fordere dich zum Duell in der Arena!
	if(hero.level < 10)
	{
		AI_Output(self,other,"Info_GorHanis_Charge_08_01");	//Es dient nicht der h�heren Ehre des Schl�fers, wenn ich einen dahergelaufenen Bauert�lpel vorm Publikum niedermetzele.
		AI_Output(self,other,"Info_GorHanis_Charge_08_02");	//Ich werde erst gegen dich k�mpfen, wenn du ein w�rdiger Gegner f�r mich bist.
		AI_Output(self,other,"Info_GorHanis_Charge_08_03");	//Aber ich bin mir sicher, die K�mpfer aus dem Alten oder dem Neuen Lager haben nicht so einen hohen moralischen Anspruch ...
		PrintScreen("Vorraussetzung: Stufe 10",-1,-1,"font_old_20_white.tga",1);
	}
	else if(hero.level >= 10)
	{
		AI_Output(self,other,"Info_GorHanis_Charge_08_04");	//Du bist stark genug um gegen einen Auserw�hlten des Schl�fers anzutreten.
		AI_Output(self,other,"Info_GorHanis_Charge_08_05");	//Wenn du bereit bist, triff mich in der Arena.
		HANIS_HERAUSFORDERUNG = TRUE;
		Npc_ExchangeRoutine(self,"GUIDE");
		AI_StopProcessInfos(self);
	};
};


instance Info_GorHanis_ChargeGood(C_Info)
{
	npc = Tpl_1422_GorHanis;
	nr = 10;
	condition = Info_GorHanis_ChargeGood_Condition;
	information = Info_GorHanis_ChargeGood_Info;
	permanent = 1;
	description = "Bin ich jetzt gut genug, um gegen dich zu k�mpfen?";
};


func int Info_GorHanis_ChargeGood_Condition()
{
	if((HANIS_HERAUSFORDERUNG == FALSE) && Npc_KnowsInfo(hero,Info_GorHanis_Charge))
	{
		return 1;
	};
};

func void Info_GorHanis_ChargeGood_Info()
{
	AI_Output(other,self,"Info_GorHanis_ChargeGood_15_00");	//Bin ich jetzt gut genug, um gegen dich zu k�mpfen?
	if(hero.level < 10)
	{
		AI_Output(self,other,"Info_GorHanis_ChargeGood_08_01");	//Nein! Deine St�rke reicht noch nicht aus - du bist kein Gegner f�r mich!
		PrintScreen("Vorraussetzung: Stufe 10",-1,-1,"font_old_20_white.tga",1);
	}
	else if(hero.level >= 10)
	{
		AI_Output(self,other,"Info_GorHanis_Charge_08_04");	//Du bist stark genug um gegen einen Auserw�hlten des Schl�fers anzutreten.
		AI_Output(self,other,"Info_GorHanis_Charge_08_05");	//Wenn du bereit bist, triff mich in der Arena.
		HANIS_HERAUSFORDERUNG = TRUE;
		Npc_ExchangeRoutine(self,"GUIDE");
		AI_StopProcessInfos(self);
	};
};


instance INFO_GORHANIS_FIGHT(C_Info)
{
	npc = Tpl_1422_GorHanis;
	nr = 0;
	condition = info_gorhanis_fight_condition;
	information = info_gorhanis_fight_info;
	important = 1;
};


func int info_gorhanis_fight_condition()
{
	if((HANIS_HERAUSFORDERUNG == TRUE) && (Npc_GetDistToWP(hero,"OCR_ARENABATTLE_TRAIN") < 500))
	{
		return 1;
	};
};

func void info_gorhanis_fight_info()
{
	if(HANIS_HERAUSFORDERUNG == TRUE)
	{
		AI_Output(self,other,"Info_GorHanis_Fight_15_01");	//Der Schl�fer sch�tzt meinen K�rper und Geist vor meinen Feinden.
		AI_Output(self,other,"Info_GorHanis_Fight_08_01");	//Mache dich bereit in den Staub geworfen zu werden!
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"START");
		Npc_SetTarget(self,other);
		AI_StartState(self,ZS_Attack,1,"");
	}
	else
	{
		AI_Output(self,other,"SVM_8_LetsForgetOurLittleFight");	//Gut, vergessen wir unseren kleinen Streit.
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"START");
	};
};


instance INFO_GORHANIS_ARENAFIGHT(C_Info)
{
	npc = Tpl_1422_GorHanis;
	nr = 0;
	condition = info_gorhanis_arenafight_condition;
	information = info_gorhanis_arenafight_info;
	important = 1;
	permanent = 1;
};


func int info_gorhanis_arenafight_condition()
{
	var C_Npc hanis;
	hanis = Hlp_GetNpc(Tpl_1422_GorHanis);
	if((HANIS_FIGHT == TRUE) && (Npc_GetDistToWP(hero,"OCR_ARENABATTLE_TRAIN") < 500) && ((hanis.aivar[AIV_HASDEFEATEDSC] == FALSE) || (hanis.aivar[AIV_WASDEFEATEDBYSC] == FALSE)))
	{
		return 1;
	};
};

func void info_gorhanis_arenafight_info()
{
	AI_Output(self,other,"Info_GorHanis_Fight_15_01");	//Der Schl�fer sch�tzt meinen K�rper und Geist vor meinen Feinden.
	AI_Output(self,other,"Info_GorHanis_Fight_08_01");	//Mache dich bereit in den Staub geworfen zu werden!
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_Attack,1,"");
};


instance INFO_TPL_1422_GORHANIS(C_Info)
{
	npc = tpl_5055_gorhanis;
	condition = info_tpl_1422_gorhanis_condition;
	information = info_tpl_1422_gorhanis_info;
	important = 1;
	permanent = 0;
};


func int info_tpl_1422_gorhanis_condition()
{
	if(Kapitel >= 5)
	{
		return 1;
	};
};

func void info_tpl_1422_gorhanis_info()
{
	AI_Output(self,other,"Info_TPL_1422_GorHanis_08_01");	//Was machst du hier?
	Info_ClearChoices(info_tpl_1422_gorhanis);
	Info_AddChoice(info_tpl_1422_gorhanis,"Ich will helfen den Schl�fer zu erwecken.",info_tpl_1422_gorhanis1);
	Info_AddChoice(info_tpl_1422_gorhanis,"Das geht dich nichts an!",info_tpl_1422_gorhanis2);
	Info_AddChoice(info_tpl_1422_gorhanis,"Wie seit ihr an dem Priester vorbei gekommen?",info_tpl_1422_gorhanis3);
};

func void info_tpl_1422_gorhanis1()
{
	AI_Output(other,self,"Info_TPL_1422_GorHanis1_15_01");	//Ich will helfen den Schl�fer zu erwecken.
	AI_Output(self,other,"Info_TPL_1422_GorHanis1_08_02");	//Hmm, siehst gar nicht so aus, als wolltest Du wirklich helfen wollen. Geh aber ruhig weiter, ich halte dich nicht auf, falls du l�gst, wird der Hohenpriester dir schon eine Lektion erteilen.
	Info_ClearChoices(info_tpl_1422_gorhanis);
	AI_StopProcessInfos(self);
};

func void info_tpl_1422_gorhanis2()
{
	AI_Output(other,self,"Info_TPL_1422_GorHanis2_15_01");	//Das geht dich nichts an!
	AI_Output(self,other,"Info_TPL_1422_GorHanis2_08_02");	//Soso, dann lasse ich dich lieber passieren, bevor du mir weh tust (lacht). Am Hohenpriester kommst Du eh nicht vorbei und ich muss mein Schwert nicht mit deinem Blut beschmutzen.
	Info_ClearChoices(info_tpl_1422_gorhanis);
	AI_StopProcessInfos(self);
};

func void info_tpl_1422_gorhanis3()
{
	AI_Output(other,self,"Info_TPL_1422_GorHanis3_15_01");	//Wie seit ihr an dem Priester vorbei gekommen?
	AI_Output(self,other,"Info_TPL_1422_GorHanis3_08_02");	//Ich sage es dir, es wird dir eh nicht nutzen. Der Priester hat uns nur passieren lassen, weil Meister Kalom mit ihm gesprochen hat, dass Gl�ck wirst du nicht haben. Geh nur (lacht).
	Info_ClearChoices(info_tpl_1422_gorhanis);
	AI_StopProcessInfos(self);
};


instance INFO_GORHANIS_MEDITATE(C_Info)
{
	npc = Tpl_1422_GorHanis;
	nr = 1;
	condition = info_gorhanis_meditate_condition;
	information = info_gorhanis_meditate_info;
	permanent = 0;
	important = 1;
};


func int info_gorhanis_meditate_condition()
{
	if(Wld_IsTime(4,0,4,45))
	{
		return 1;
	};
};

func void info_gorhanis_meditate_info()
{
	AI_OutputSVM(self,other,"$Om");
	AI_Output(self,other,"Info_GorHanis_Meditate_08_01");	//Ommm... du st�rst meine Konzentration. (Seufzt)
	AI_Output(self,other,"Info_GorHanis_Meditate_08_02");	//Wenn du aber schonmal hier bist, kann ich dir auch direkt etwas �ber die Meditation der Templer beibringen.
	AI_Output(self,other,"Info_GorHanis_Meditate_08_03");	//Im Kampf z�hlt nicht deine k�rperliche Str�rke. Es ist die geistige St�rke auf die es wirklich ankommt.
	AI_Output(self,other,"Info_GorHanis_Meditate_08_04");	//Bist du im geiste klar, ist kein Gegner mehr eine Gefahr f�r dich.
	AI_Output(self,other,"Info_GorHanis_Meditate_08_05");	//Denn wisse, nur wer die Klinge mit der Kraft seines Geistes schwingt, dem wird niemand im Kampf �berlegen sein.
	AI_Output(self,other,"Info_GorHanis_Meditate_08_06");	//Geh' nun und nutze dein Wissen um deine Feinde von der wahren Macht des Geistes zu �berzeugen.
	AI_Output(self,other,"Info_GorHanis_Meditate_08_07");	//M�ge der Schl�fer dich auf deinem Weg sch�tzen!
	if(other.attribute[ATR_MANA_MAX] <= (1000 - 5))
	{
		other.attribute[ATR_MANA_MAX] = other.attribute[ATR_MANA_MAX] + 5;
		PrintScreen("Mana + 5",-1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
};

