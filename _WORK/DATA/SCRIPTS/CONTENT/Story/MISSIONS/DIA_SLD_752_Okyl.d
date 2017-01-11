
instance DIA_SLD_752_OKYL_INTRO(C_Info)
{
	npc = SLD_752_Okyl;
	condition = dia_sld_752_okyl_intro_condition;
	information = dia_sld_752_okyl_intro_info;
	important = 1;
	permanent = 0;
};


func int dia_sld_752_okyl_intro_condition()
{
	if(Npc_GetDistToNpc(self,hero) < 250)
	{
		return 1;
	};
};

func void dia_sld_752_okyl_intro_info()
{
	AI_Output(self,other,"DIA_SLD_752_OKYL_INTRO_INFO_11_01");	//Hey, du! Du gehörst nicht zu meinen Jungs. Was machst du hier?
};


instance DIA_SLD_752_OKYL_EXIT(C_Info)
{
	nr = 999;
	npc = SLD_752_Okyl;
	condition = dia_sld_752_okyl_exit_condition;
	information = dia_sld_752_okyl_exit_info;
	important = 0;
	permanent = 1;
	description = "Ich muss weiter!";
};


func int dia_sld_752_okyl_exit_condition()
{
	return 1;
};

func void dia_sld_752_okyl_exit_info()
{
	AI_Output(other,self,"DIA_SLD_752_OKYL_EXIT_INFO_15_01");	//Ich muss weiter!
	AI_Output(self,other,"DIA_SLD_752_OKYL_EXIT_INFO_11_02");	//Dann lass mich in Ruhe.
	AI_StopProcessInfos(self);
};


instance DIA_SLD_752_OKYL_UMSEHEN(C_Info)
{
	npc = SLD_752_Okyl;
	condition = dia_sld_752_okyl_umsehen_condition;
	information = dia_sld_752_okyl_umsehen_info;
	important = 0;
	permanent = 0;
	description = "Ich seh mich hier nur mal um.";
};


func int dia_sld_752_okyl_umsehen_condition()
{
	return 1;
};

func void dia_sld_752_okyl_umsehen_info()
{
	AI_Output(other,self,"DIA_SLD_752_OKYL_UMSEHEN_INFO_15_01");	//Ich seh' mich hier nur mal um.
	AI_Output(self,other,"DIA_SLD_752_OKYL_UMSEHEN_INFO_11_02");	//Dann pass bloß auf, dass du hier im Kessel keinen Mist baust, sonst bist du schneller im Grab, als dir lieb ist. 
};


instance DIA_SLD_752_OKYL_WERBISTDU(C_Info)
{
	npc = SLD_752_Okyl;
	condition = dia_sld_752_okyl_werbistdu_condition;
	information = dia_sld_752_okyl_werbistdu_info;
	important = 0;
	permanent = 0;
	description = "Wer bist du?";
};


func int dia_sld_752_okyl_werbistdu_condition()
{
	return 1;
};

func void dia_sld_752_okyl_werbistdu_info()
{
	AI_Output(other,self,"DIA_SLD_752_OKYL_WERBISTDU_INFO_15_01");	//Wer bist du?
	AI_Output(self,other,"DIA_SLD_752_OKYL_WERBISTDU_INFO_11_02");	//Ich bin Okyl. Ich hab' das Kommando über den Kessel.
};


instance DIA_SLD_752_OKYL_INMINE(C_Info)
{
	npc = SLD_752_Okyl;
	condition = dia_sld_752_okyl_inmine_condition;
	information = dia_sld_752_okyl_inmine_info;
	important = 0;
	permanent = 0;
	description = "Ich wollte nur mal in die Mine.";
};


func int dia_sld_752_okyl_inmine_condition()
{
	return 1;
};

func void dia_sld_752_okyl_inmine_info()
{
	AI_Output(other,self,"DIA_SLD_752_OKYL_INMINE_INFO_15_01");	//Ich wollte nur mal in die Mine.
	AI_Output(self,other,"DIA_SLD_752_OKYL_INMINE_INFO_11_02");	//Ach so, du wolltest nur mal kurz in die Mine.
	AI_Output(self,other,"DIA_SLD_752_OKYL_INMINE_INFO_11_03");	//Ich glaube, du weisst nicht, wie das hier läuft. Keiner kommt in die Mine ohne meine Erlaubnis.
	AI_Output(self,other,"DIA_SLD_752_OKYL_INMINE_INFO_11_04");	//Schreib dir das hinter die Ohren. Wer ohne meine Erlaubnis die Mine oder das Torhaus betritt, ist ein toter Mann!
};


instance DIA_SLD_752_OKYL_PERMIT(C_Info)
{
	npc = SLD_752_Okyl;
	condition = dia_sld_752_okyl_permit_condition;
	information = dia_sld_752_okyl_permit_info;
	important = 0;
	permanent = 0;
	description = "Krieg ich die Erlaubnis?";
};


func int dia_sld_752_okyl_permit_condition()
{
	if(Npc_KnowsInfo(hero,dia_sld_752_okyl_inmine))
	{
		return 1;
	};
};

func void dia_sld_752_okyl_permit_info()
{
	AI_Output(other,self,"DIA_SLD_752_OKYL_PERMIT_INFO_15_01");	//Krieg ich die Erlaubnis?
	AI_Output(self,other,"DIA_SLD_752_OKYL_PERMIT_INFO_11_02");	//Ich kenn' dich nicht einmal. Wieso sollte ich dir erlauben in die Mine zu gehen.
	AI_Output(self,other,"DIA_SLD_752_OKYL_PERMIT_INFO_11_03");	//Jetzt verschwinde, ich hab' zu tun.
	AI_StopProcessInfos(self);
};


instance DIA_SLD_752_OKYL_QUEST(C_Info)
{
	npc = SLD_752_Okyl;
	condition = dia_sld_752_okyl_quest_condition;
	information = dia_sld_752_okyl_quest_info;
	important = 0;
	permanent = 0;
	description = "Kann ich hier irgendwobei helfen?";
};


func int dia_sld_752_okyl_quest_condition()
{
	if(Npc_KnowsInfo(hero,dia_sld_752_okyl_intro))
	{
		return 1;
	};
};

func void dia_sld_752_okyl_quest_info()
{
	AI_Output(other,self,"DIA_SLD_752_OKYL_QUEST_INFO_15_01");	//Kann ich hier irgendwobei helfen?
	AI_Output(self,other,"DIA_SLD_752_OKYL_QUEST_INFO_11_02");	//Wüsst' nicht wobei einer wie du hier helfen sollte.
	AI_Output(self,other,"DIA_SLD_752_OKYL_QUEST_INFO_11_03");	//Obwohl, du könntest schon was tun.
	AI_Output(self,other,"DIA_SLD_752_OKYL_QUEST_INFO_11_04");	//Unser letzter Schmied hat sich von den Crawlern in der Mine fressen lassen. Jetzt steht unsere Schmiede schon seit einiger Zeit leer.
	AI_Output(self,other,"DIA_SLD_752_OKYL_QUEST_INFO_11_05");	//Soweit ich weiß, hatten wir mal einen Schmied im neuen Lager, allerdings weiß ich seinen Namen nicht mehr.
	AI_Output(self,other,"DIA_SLD_752_OKYL_QUEST_INFO_11_06");	//Vielleicht ist er auch schon tot, keine Ahnung.
	AI_Output(self,other,"DIA_SLD_752_OKYL_QUEST_INFO_11_07");	//Sieh' dich mal um. Wenn du jemanden findest, schick ihn zu uns in den Kessel.
	FMC_SMITH = LOG_RUNNING;
	Log_CreateTopic(CH1_FMCSMITH,LOG_MISSION);
	Log_SetTopicStatus(CH1_FMCSMITH,LOG_RUNNING);
	B_LogEntry(CH1_FMCSMITH,"Okyl, der Chef der freien Mine, erzählte mir davon das die Schmiede im Kessel schon seit einiger Zeit leer steht. Ich soll nun einen neuen Schmied für das Lager finden. Im neuen Lager soll es jemanden geben.");
	AI_StopProcessInfos(self);
};


instance DIA_SLD_752_OKYL_FOUND(C_Info)
{
	npc = SLD_752_Okyl;
	condition = dia_sld_752_okyl_found_condition;
	information = dia_sld_752_okyl_found_info;
	important = 0;
	permanent = 0;
	description = "Ich hab' jemanden gefunden.";
};


func int dia_sld_752_okyl_found_condition()
{
	if(Npc_KnowsInfo(hero,dia_blade_smith))
	{
		return 1;
	};
};

func void dia_sld_752_okyl_found_info()
{
	AI_Output(other,self,"DIA_SLD_752_OKYL_Found_INFO_15_01");	//Ich hab' jemanden gefunden.
	AI_Output(self,other,"DIA_SLD_752_OKYL_Found_INFO_11_02");	//Ja, dass hab' ich schon mitbekommen. Blade ist ein guter Mann.
	AI_Output(self,other,"DIA_SLD_752_OKYL_Found_INFO_11_03");	//Er ist bereits in der Schmiede und hat angefangen zu arbeiten.
	AI_Output(self,other,"DIA_SLD_752_OKYL_Found_INFO_11_04");	//Hier, ein bisschen was für deine Mühen.
	CreateInvItems(self,ItMiNugget,50);
	B_GiveInvItems(self,other,ItMiNugget,50);
	AI_Teleport(SLD_704_Blade,"FMC_HUT08_IN");
	Npc_ExchangeRoutine(SLD_704_Blade,"SMITH");
	AI_ContinueRoutine(SLD_704_Blade);
	FMC_SMITH = LOG_SUCCESS;
	Log_SetTopicStatus(CH1_FMCSMITH,LOG_SUCCESS);
	B_LogEntry(CH1_FMCSMITH,"Nachdem ich Blade dazu überreden konnte in der freien Mine als Schmied anzuheuern, war Okyl zufrieden mit mir. Zur Belohnung dafür gab es einige Brocken Erz.");
	B_GiveXP(XP_SMITH);
	AI_StopProcessInfos(self);
};

