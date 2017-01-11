
instance DIA_Lefty_Exit(C_Info)
{
	npc = Org_844_Lefty;
	nr = 999;
	condition = DIA_Lefty_Exit_Condition;
	information = DIA_Lefty_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Lefty_Exit_Condition()
{
	return 1;
};

func void DIA_Lefty_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Lefty_FirstAtNight(C_Info)
{
	npc = Org_844_Lefty;
	nr = 1;
	condition = DIA_Lefty_FirstAtNight_Condition;
	information = DIA_Lefty_FirstAtNight_Info;
	permanent = 0;
	description = "Was machst du hier?";
};


func int DIA_Lefty_FirstAtNight_Condition()
{
	if(Wld_IsTime(19,0,8,0) && !Npc_KnowsInfo(hero,DIA_Lefty_First))
	{
		return 1;
	};
};

func void DIA_Lefty_FirstAtNight_Info()
{
	AI_Output(other,self,"DIA_Aidan_Hello_15_00");	//Was machst du hier?
	AI_Output(self,other,"DIA_846_Hello_07_01");	//Ich arbeite für den Reislord.
	AI_Output(other,self,"DIA_Ricelord_Arbeit_15_00");	//Hast du Arbeit für mich?
	AI_Output(self,other,"DIA_Shrike_GetLost_07_01");	//Wir sprechen uns noch!
	AI_StopProcessInfos(self);
};


instance DIA_Lefty_First(C_Info)
{
	npc = Org_844_Lefty;
	nr = 1;
	condition = DIA_Lefty_First_Condition;
	information = DIA_Lefty_First_Info;
	permanent = 0;
	important = 1;
};


func int DIA_Lefty_First_Condition()
{
	if(Wld_IsTime(8,0,19,0) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE) && (Npc_GetTrueGuild(hero) == GIL_None))
	{
		return 1;
	};
};

func void DIA_Lefty_First_Info()
{
	AI_Output(self,other,"DIA_Lefty_First_07_00");	//Hey, du! Neu hier, was? Auf den Reisfeldern brauchen wir noch jemanden, der den Bauern Wasser bringt.
	AI_Output(self,other,"DIA_Lefty_First_07_01");	//Da kannst du dir direkt ein paar Freunde machen. Was denkst du?
	Log_CreateTopic(CH1_CarryWater,LOG_MISSION);
	Log_SetTopicStatus(CH1_CarryWater,LOG_RUNNING);
	B_LogEntry(CH1_CarryWater,"Lefty, ein ziemlich großkotziger Bandit aus dem neuen Lager will, dass ich den Bauern auf den Reisfeldern Wasser bringe.");
	Info_ClearChoices(DIA_Lefty_First);
	Info_AddChoice(DIA_Lefty_First,"Vielleicht später.",DIA_Lefty_First_Later);
	Info_AddChoice(DIA_Lefty_First,"Bring dein Wasser selbst rum!",DIA_Lefty_First_Never);
	Info_AddChoice(DIA_Lefty_First,"Klar, ich helfe gerne.",DIA_Lefty_First_Yes);
};

func void DIA_Lefty_First_Yes()
{
	AI_Output(other,self,"DIA_Lefty_First_Yes_15_00");	//Klar, ich helfe gern.
	AI_Output(self,other,"DIA_Lefty_First_Yes_07_01");	//Gut! Geh zum Reislord. Er gibt dir das Wasser und erzählt dir alles andere.
	Lefty_WorkDay = B_SetDayTolerance();
	Lefty_Mission = LOG_RUNNING;
	An_Bauern_verteilt = 0;
	B_LogEntry(CH1_CarryWater,"Obwohl es vermutlich eine stupide Aufgabe ist, habe ich zugesagt, um mir vielleicht ein paar Freunde zu machen. Das zu verteilende Wasser soll ich vom sogenannten 'Reislord' abholen.");
	Info_ClearChoices(DIA_Lefty_First);
};

func void DIA_Lefty_First_Never()
{
	AI_Output(other,self,"DIA_Lefty_First_Never_15_00");	//Bring dein Wasser selbst rum!
	AI_Output(self,other,"DIA_Lefty_First_Never_07_01");	//So geht man aber nicht mit Freunden um! Ich glaube, ich muss dir mal Manieren beibringen!
	Lefty_WorkDay = B_SetDayTolerance();
	Lefty_Mission = LOG_FAILED;
	B_LogEntry(CH1_CarryWater,"Als ich Leftys 'Angebot' ablehnte, wurde er ziemlich ungehalten! Und ich dachte schon, das Alte Lager ist ein rauher Ort.");
	Info_ClearChoices(DIA_Lefty_First);
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_Attack,1,"");
};

func void DIA_Lefty_First_Later()
{
	AI_Output(other,self,"DIA_Lefty_First_Later_15_00");	//Vielleicht später.
	AI_Output(self,other,"DIA_Lefty_First_Later_07_01");	//Später brauche ich aber niemanden. Ich brauche JETZT Hilfe.  Willst du mir nun helfen oder nicht?
};


var int CarriedWaterForLefty;

instance DIA_Lefty_WorkDay(C_Info)
{
	npc = Org_844_Lefty;
	nr = 1;
	condition = DIA_Lefty_WorkDay_Condition;
	information = DIA_Lefty_WorkDay_Info;
	permanent = 1;
	important = 1;
};


func int DIA_Lefty_WorkDay_Condition()
{
	if((Wld_IsTime(8,0,19,0) || (Lefty_Mission == LOG_SUCCESS)) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE) && ((Lefty_WorkDay <= (Wld_GetDay() - 1)) || (Lefty_Mission == LOG_SUCCESS)) && (Npc_GetTrueGuild(hero) == GIL_None))
	{
		return 1;
	};
};

func void DIA_Lefty_WorkDay_Info()
{
	AI_Output(self,other,"DIA_Lefty_WorkDay_07_00");	//Hey, du!
	if(Lefty_Mission == LOG_FAILED)
	{
		AI_Output(self,other,"DIA_Lefty_WorkDay_NextChance_07_00");	//Du hast Glück! Du bekommst eine neue Chance.
		AI_Output(self,other,"DIA_Lefty_WorkDay_NextChance_07_01");	//Diesmal solltest du's nicht vermasseln! Also: Du gehst zum Reislord und dann bringst du schön brav allen Bauern ihr Wasser, klar?
		Lefty_WorkDay = B_SetDayTolerance();
		Lefty_Mission = LOG_RUNNING;
		An_Bauern_verteilt = 0;
		B_LogEntry(CH1_CarryWater,"Schon wieder bin ich Lefty über den Weg gelaufen! Er will, dass ich jetzt endlich zum Reislord gehe und das Wasser für die Verteilung an die Bauern auf den Reisfeldern abhole.");
		AI_StopProcessInfos(self);
	}
	else if(Lefty_Mission == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_Lefty_WorkDay_StillRunning_07_00");	//Ich habe dir doch gesagt, du sollst den Bauern Wasser bringen!
		AI_Output(self,other,"DIA_Lefty_WorkDay_StillRunning_07_01");	//Ich mag es nicht, wenn man mir Sachen verspricht und sie dann nicht hält!
		Lefty_WorkDay = B_SetDayTolerance();
		Lefty_Mission = LOG_FAILED;
		B_LogEntry(CH1_CarryWater,"Lefty war stinksauer darüber, dass ich das Wasser noch nicht verteilt haben! Das kann ja noch heiter werden mit diesem Burschen.");
		AI_StopProcessInfos(self);
		Npc_SetTarget(self,other);
		AI_StartState(self,ZS_Attack,1,"");
	}
	else if(Lefty_Mission == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Lefty_WorkDay_SUCCESS_07_00");	//Gut gemacht! Du bist ja zu was zu gebrauchen.
		AI_Output(self,other,"DIA_Lefty_WorkDay_SUCCESS_07_01");	//Ich denke, das ist genau die richtige Aufgabe für dich. Du wirst das ab jetzt jeden Tag tun. Fang direkt wieder damit an
		Lefty_WorkDay = B_SetDayTolerance();
		Lefty_Mission = LOG_RUNNING;
		An_Bauern_verteilt = 0;
		if(!CarriedWaterForLefty)
		{
			B_LogEntry(CH1_CarryWater,"Ich fasse es nicht. Nachdem ich das Wasser überall verteilt habe, will Lefty doch tatsächlich, dass ich nun jeden Tag den Wasserträger spiele. Ich glaube dieser Idiot muss mal seine Grenzen aufgezeigt bekommen.");
			B_GiveXP(XP_LeftyCarriedWater);
			CarriedWaterForLefty = TRUE;
		};
		AI_StopProcessInfos(self);
	};
};


instance DIA_Lefty_NeverAgain(C_Info)
{
	npc = Org_844_Lefty;
	nr = 1;
	condition = DIA_Lefty_NeverAgain_Condition;
	information = DIA_Lefty_NeverAgain_Info;
	permanent = 1;
	description = "Du kannst dein Wasser ab jetzt selbst bringen.";
};


func int DIA_Lefty_NeverAgain_Condition()
{
	if((Lefty_Mission == LOG_RUNNING) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE))
	{
		return 1;
	};
};

func void DIA_Lefty_NeverAgain_Info()
{
	AI_Output(other,self,"DIA_Lefty_NeverAgain_15_00");	//Du kannst dein Wasser ab jetzt selbst bringen.
	AI_Output(self,other,"DIA_Lefty_NeverAgain_07_01");	//Ach? Hast du was Besseres vor?
	AI_Output(self,other,"DIA_Lefty_NeverAgain_07_02");	//Ich glaube, ich muss dich noch einmal daran erinnern, wer hier der Boss ist!
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_Attack,1,"");
};


var int LeftyWasBeaten;

instance DIA_Lefty_PERM(C_Info)
{
	npc = Org_844_Lefty;
	nr = 1;
	condition = DIA_Lefty_PERM_Condition;
	information = DIA_Lefty_PERM_Info;
	permanent = 1;
	description = "Na, mein Freund?";
};


func int DIA_Lefty_PERM_Condition()
{
	if(self.aivar[AIV_WASDEFEATEDBYSC] == TRUE)
	{
		return 1;
	};
};

func void DIA_Lefty_PERM_Info()
{
	AI_Output(other,self,"DIA_Lefty_PERM_15_00");	//Na, mein Freund?
	AI_Output(self,other,"DIA_Lefty_PERM_07_01");	//Mann! Was willst du?
	if(!LeftyWasBeaten)
	{
		B_LogEntry(CH1_CarryWater,"Ich habe Lefty endgültig klargemacht, dass er mich besser nicht mehr mit seiner Wasserträgerei behelligen sollte. Mache Leute lernen nur durch Schmerzen.");
		Log_SetTopicStatus(CH1_CarryWater,LOG_SUCCESS);
		B_GiveXP(XP_LeftyConfronted);
		LeftyWasBeaten = TRUE;
		Lefty_Mission = LOG_SUCCESS;
	};
	Info_ClearChoices(DIA_Lefty_PERM);
	Info_AddChoice(DIA_Lefty_PERM,"Wollte nur mal sehen, wie's dir geht.",DIA_Lefty_PERM_Nothing);
	Info_AddChoice(DIA_Lefty_PERM,"Die Bauern sehen durstig aus.",DIA_Lefty_PERM_Durstig);
	Info_AddChoice(DIA_Lefty_PERM,"Ich hatte nen schlechten Tag und suche einen Ausgleich... Halt mal still.",DIA_Lefty_PERM_AufsMaul);
};

func void DIA_Lefty_PERM_AufsMaul()
{
	AI_Output(other,self,"DIA_Lefty_PERM_AufsMaul_15_00");	//Ich hatte 'nen schlechten Tag und suche ein bisschen Ausgleich ... Halt mal still.
	B_Say(self,other,"$YOUWANNAFOOLME");
	Info_ClearChoices(DIA_Lefty_PERM);
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_Attack,1,"");
};

func void DIA_Lefty_PERM_Durstig()
{
	AI_Output(other,self,"DIA_Lefty_PERM_Durstig_15_00");	//Die Bauern sehen durstig aus.
	AI_Output(self,other,"DIA_Lefty_PERM_Durstig_07_01");	//Ich kümmere mich drum ... Mach dir keine Sorgen.
	AI_StopProcessInfos(self);
};

func void DIA_Lefty_PERM_Nothing()
{
	AI_Output(other,self,"DIA_Lefty_PERM_Nothing_15_00");	//Wollte nur mal sehen, wie's dir geht.
	AI_StopProcessInfos(self);
};


instance DIA_LEFTY_RING(C_Info)
{
	npc = Org_844_Lefty;
	nr = 1;
	condition = dia_lefty_ring_condition;
	information = dia_lefty_ring_info;
	permanent = 0;
	important = 1;
};


func int dia_lefty_ring_condition()
{
	if(Npc_KnowsInfo(hero,dia_rufus_needhelp) && (RIOT_RICELORD == LOG_RUNNING) && Npc_HasItems(hero,ricelords_ring))
	{
		return 1;
	};
};

func void dia_lefty_ring_info()
{
	AI_Output(self,other,"DIA_Lefty_Ring_02_01");	//Hey du!
	AI_Output(other,self,"DIA_Lefty_Ring_02_02");	//Was?
	AI_Output(self,other,"DIA_Lefty_Ring_02_03");	//Dein Ring. Warum kommt der mir so bekannt vor?
	AI_Output(other,self,"DIA_Lefty_Ring_02_04");	//Tja.
	AI_Output(self,other,"DIA_Lefty_Ring_02_05");	//Ist ja auch egal. Sieht wertvoll aus, einer wie du kann damit sowieso nichts anfangen, also warum gibst du ihn mir nicht einfach?
	AI_Output(other,self,"DIA_Lefty_Ring_02_06");	//Klar. Hier ist er.
	AI_Output(self,other,"DIA_Lefty_Ring_02_07");	//Danke. Hehe. Jetzt schwing deinen Arsch wieder rüber auf die Felder!
	B_GiveInvItems(other,self,ricelords_ring,1);
	AI_StopProcessInfos(self);
	B_LogEntry(CH1_RICELORD,"Lefty hat es mir ziemlich einfach gemacht. Er sprach mich direkt auf den Ring an, als er ihn sah und ich erklärte mich dazu bereit ihm den Ring zu - überlassen - .");
};

