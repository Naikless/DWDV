
instance DIA_Kyle_Exit(C_Info)
{
	npc = VLK_536_Kyle;
	nr = 999;
	condition = DIA_Kyle_Exit_Condition;
	information = DIA_Kyle_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Kyle_Exit_Condition()
{
	return 1;
};

func void DIA_Kyle_Exit_Info()
{
	Npc_SetRefuseTalk(self,120);
	AI_StopProcessInfos(self);
};


instance DIA_Kyle_HutRage(C_Info)
{
	npc = VLK_536_Kyle;
	nr = 2;
	condition = DIA_Kyle_HutRage_Condition;
	information = DIA_Kyle_HutRage_Info;
	permanent = 1;
	important = 1;
};


func int DIA_Kyle_HutRage_Condition()
{
	if((Npc_RefuseTalk(self) == FALSE) && (Npc_GetDistToNpc(self,other) <= ZivilAnquatschDist) && (HEREK_KICKASS != LOG_SUCCESS))
	{
		return 1;
	};
};

func void DIA_Kyle_HutRage_Info()
{
	AI_Output(self,other,"DIA_Kyle_HutRage_10_00");	//Wie oft hab' ich euch Pennern gesagt, rennt nicht durch meine Hütte.
};


instance DIA_Kyle_Problem(C_Info)
{
	npc = VLK_536_Kyle;
	nr = 2;
	condition = DIA_Kyle_Problem_Condition;
	information = DIA_Kyle_Problem_Info;
	permanent = 0;
	description = "Was ist dein Problem?";
};


func int DIA_Kyle_Problem_Condition()
{
	return 1;
};

func void DIA_Kyle_Problem_Info()
{
	AI_Output(other,self,"DIA_Kyle_Problem_15_00");	//Was ist dein Problem?
	AI_Output(self,other,"DIA_Kyle_Problem_10_01");	//Mann, lass mich bloß in Ruhe! Jeder hier hat ein Problem mit mir!
	AI_Output(self,other,"DIA_Kyle_Problem_10_02");	//Es fing alles damit an, dass ich meine Hütte gebaut hab'.
	AI_Output(self,other,"DIA_Kyle_Problem_10_03");	//Bau deine Hütte nicht an den Graben, haben sie gesagt.
	AI_Output(self,other,"DIA_Kyle_Problem_10_04");	//Aber keiner von den Pennern hat mir gesagt, was passiert, wenn ich es doch tue.
	AI_Output(self,other,"DIA_Kyle_Problem_10_05");	//Als ich vor ein paar Tagen aus der Mine wiederkam, hatte ich  'ne zweite Tür.
	AI_Output(self,other,"DIA_Kyle_Problem_10_06");	//Diese Schweine. Ich hasse sie. Ich kann dir gar nicht sagen, wie ich sie hasse!
	AI_Output(self,other,"DIA_Kyle_Problem_10_07");	//Jetzt rennt jeder durch meine Hütte. Jeder Arsch.
	AI_Output(self,other,"DIA_Kyle_Problem_10_08");	//Am schlimmsten ist dieser Herek.
	AI_Output(self,other,"DIA_Kyle_Problem_10_09");	//Der Penner meint er sei einer der Härtesten hier.
	AI_Output(self,other,"DIA_Kyle_Problem_10_10");	//Dabei ist er auch nicht mehr als ein Buddler wie jeder Andere von uns.
};


var int herek_kickass;

instance DIA_KYLE_HEREK(C_Info)
{
	npc = VLK_536_Kyle;
	nr = 2;
	condition = dia_kyle_herek_condition;
	information = dia_kyle_herek_info;
	permanent = 0;
	description = "Was ist mit Herek?";
};


func int dia_kyle_herek_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Kyle_Problem))
	{
		return 1;
	};
};

func void dia_kyle_herek_info()
{
	AI_Output(other,self,"DIA_Kyle_Herek_15_00");	//Was ist mit Herek?
	AI_Output(self,other,"DIA_Kyle_Herek_10_01");	//Der Typ rannte vor einigen Tagen durch meine Hütte, genau wie jeder andere Arsch hier.
	AI_Output(self,other,"DIA_Kyle_Herek_10_02");	//Allerdings meinte Herek sich mit mir anlegen zu müssen.
	AI_Output(self,other,"DIA_Kyle_Herek_10_03");	//Er erzählte mir was davon wie hart er doch sei und was er gemacht hat, dass er hier drin sei.
	AI_Output(self,other,"DIA_Kyle_Herek_10_04");	//Ich wäre froh wenn der Penner mal was auf's Maul kriegen würde.
	AI_Output(other,self,"DIA_Kyle_Herek_10_05");	//Ich könnte mich um Herek kümmern.
	AI_Output(self,other,"DIA_Kyle_Herek_10_06");	//Du? Da bin ich ja mal gespannt.
	AI_Output(self,other,"DIA_Kyle_Herek_10_07");	//Ich sag' dir was. Wenn du dem Mistkerl den Arsch versohlst, kannst du meine Hütte immer als Durchgang benutzen.
	AI_Output(other,self,"DIA_Kyle_Herek_10_08");	//Gibt's da keine handfeste Belohnung?
	AI_Output(self,other,"DIA_Kyle_Herek_10_09");	//Meinetwegen kann ich dir auch noch 10 Erz geben.
	AI_Output(other,self,"DIA_Kyle_Herek_10_10");	//Klingt schon besser.
	AI_Output(self,other,"DIA_Kyle_Herek_10_11");	//Dann sieh' mal zu das du dich um den Typen kümmerst.
	HEREK_KICKASS = LOG_RUNNING;
	Log_CreateTopic(CH1_KYLE,LOG_MISSION);
	Log_SetTopicStatus(CH1_KYLE,LOG_RUNNING);
	B_LogEntry(CH1_KYLE,"Kyle, einer der Buddler aus dem Alten Lager, hat Probleme mit einem Buddler namens Herek. Herek benutzt die Hütte von Kyle unerlaubt als Durchgang und wünscht, dass ich Herek in Zukunft daran hindere.");
	VLK_511_Herek.aivar[AIV_WASDEFEATEDBYSC] = FALSE;
};


instance DIA_KYLE_SUCCESS(C_Info)
{
	npc = VLK_536_Kyle;
	nr = 1;
	condition = dia_kyle_success_condition;
	information = dia_kyle_success_info;
	permanent = 0;
	description = "Ich hab' mich um Herek gekümmert.";
};


func int dia_kyle_success_condition()
{
	if((HEREK_KICKASS == LOG_RUNNING) && (VLK_511_Herek.aivar[AIV_WASDEFEATEDBYSC] == TRUE) && Npc_KnowsInfo(hero,dia_herek_kyle))
	{
		return 1;
	};
};

func void dia_kyle_success_info()
{
	AI_Output(other,self,"DIA_Kyle_SUCCESS_15_00");	//Ich hab' mich um Herek gekümmert.
	AI_Output(self,other,"DIA_Kyle_SUCCESS_10_01");	//Hast du? Hoffentlich hast du's dem Penner ordentlich gezeigt.
	AI_Output(other,self,"DIA_Kyle_SUCCESS_10_02");	//Was ist mit meiner Belohnung?
	AI_Output(self,other,"DIA_Kyle_SUCCESS_10_03");	//Ach ja. Hier hast du deine 10 Erz.
	AI_Output(self,other,"DIA_Kyle_SUCCESS_10_04");	//Ab jetzt kannst du meine Hütte jederzeit als Durchgang benutzen.
	CreateInvItems(self,ItMiNugget,10);
	B_GiveInvItems(self,other,ItMiNugget,10);
	HEREK_KICKASS = LOG_SUCCESS;
	Log_SetTopicStatus(CH1_KYLE,LOG_SUCCESS);
	B_LogEntry(CH1_KYLE,"Kyle war zufrieden darüber, wie ich Kyle seine Lektion erteilt habe. Er gab mir zur Belohnung 10 Erz und die Erlaubnis seine Hütte zu benutzen.");
	B_GiveXP(XP_KYLEPROBLEM);
};

