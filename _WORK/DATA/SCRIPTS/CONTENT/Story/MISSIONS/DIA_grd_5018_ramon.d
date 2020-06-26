
instance DIA_GRD_5018_EXIT(C_Info)
{
	npc = grd_5018_ramon;
	nr = 999;
	condition = dia_grd_5018_exit_condition;
	information = dia_grd_5018_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_grd_5018_exit_condition()
{
	return 1;
};

func void dia_grd_5018_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GRD_5018_MACHSTHIER(C_Info)
{
	npc = grd_5018_ramon;
	nr = 2;
	condition = dia_grd_5018_machsthier_condition;
	information = dia_grd_5018_machsthier_info;
	permanent = 1;
	description = "Was machst du hier?";
};


func int dia_grd_5018_machsthier_condition()
{
	return 1;
};

func void dia_grd_5018_machsthier_info()
{
	AI_Output(other,self,"DIA_Orry_GuardGate_15_00");	//Was machst du hier?
	if((Npc_GetTrueGuild(hero) != GIL_ORG) || (Npc_GetTrueGuild(hero) != GIL_SLD))
	{
		AI_Output(self,other,"DIA_Grd_5018_MachstHier_07_01");	//Ich kümmere mich darum, dass die Alte Mine mit Nachschub aus unserem Lager versorgt wird.
		AI_Output(self,other,"DIA_Grd_5018_MachstHier_07_02");	//Jedes mal wenn die Leute in der Mine irgendwas brauchen, sind wir diejenigen, die denen das liefern.
		AI_Output(self,other,"DIA_Grd_5018_MachstHier_07_03");	//Außerdem muss ich auch aufpassen, dass uns keins der Schweine aus dem neuen Lager auflauert.
		AI_Output(self,other,"DIA_Grd_5018_MachstHier_07_04");	//Neben den ganzen Viechern, sind die das größte Problem.
	}
	else
	{
		AI_Output(self,other,"DIA_Grd_5018_MachstHier_07_05");	//Verpiss dich!
		AI_Output(self,other,"DIA_Grd_5018_MachstHier_07_06");	//Euch Dreckskerle aus dem Neuen Lager sollten wir gar nicht erst hier reinlassen.
	};
};


instance GRD_5018_RAMON_NEEDHELP(C_Info)
{
	npc = grd_5018_ramon;
	nr = 1;
	condition = grd_5018_ramon_needhelp_condition;
	information = grd_5018_ramon_needhelp_info;
	important = 0;
	permanent = 0;
	description = "Ich hab' gehört ihr könntet hier Hilfe gebrauchen?";
};


func int grd_5018_ramon_needhelp_condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_GRD)
	{
		return TRUE;
	};
};

func void grd_5018_ramon_needhelp_info()
{
	AI_Output(other,self,"GRD_5018_Ramon_NeedHelp_Info_08_01");	//Ich hab' gehört ihr könntet hier Hilfe gebrauchen?
	AI_Output(self,other,"GRD_5018_Ramon_NeedHelp_Info_08_02");	//Thorus hat dich in die Garde aufgenommen was? Gut gemacht.
	AI_Output(self,other,"GRD_5018_Ramon_NeedHelp_Info_08_03");	//Aber ja, du könntest helfen. Die Dreckskerle aus dem neuen Lager könnten uns wieder auflauern, da wäre eine weitere Wache keine schlechte Idee.
	AI_Output(self,other,"GRD_5018_Ramon_NeedHelp_Info_08_04");	//Vor allem, wenn es sich dabei um einen erfahrenen Kämpfer wie dich handelt.
	AI_Output(self,other,"GRD_5018_Ramon_NeedHelp_Info_08_05");	//Die Route ist diesselbe wie immer. Vom alten Lager bis zur alten Mine.
	AI_Output(self,other,"GRD_5018_Ramon_NeedHelp_Info_08_06");	//Du hast noch etwas Zeit und kannst dich also noch mit Vorräten ausstatten. wenn du bereit bist, kannst du uns bescheid geben und wir gehen los.
	CONVOY_OC = LOG_RUNNING;
	Log_CreateTopic(CH2_KONVOIOC,LOG_MISSION);
	Log_SetTopicStatus(CH2_KONVOIOC,LOG_RUNNING);
	B_LogEntry(CH2_KONVOIOC,"Ramon, der Anführer des Konvois zur alten Mine, bat mich darum ihn zur alten Mine zu begleiten. Wir sollen zusammen für den Konvoi den Weg freimachen, damit es keinen Hinterhalt gibt, bei dem der Konvoi augeraubt werden könne.");
};


instance GRD_5018_RAMON_LETSGO(C_Info)
{
	npc = grd_5018_ramon;
	nr = 1;
	condition = grd_5018_ramon_letsgo_condition;
	information = grd_5018_ramon_letsgo_info;
	important = 0;
	permanent = 0;
	description = "Ich bin bereit, lass uns gehen.";
};


func int grd_5018_ramon_letsgo_condition()
{
	if(Npc_KnowsInfo(hero,grd_5018_ramon_needhelp))
	{
		return TRUE;
	};
};

func void grd_5018_ramon_letsgo_info()
{
	AI_Output(other,self,"GRD_5018_Ramon_LetsGo_Info_08_01");	//Ich bin bereit, lass uns gehen.
	AI_Output(self,other,"GRD_5018_Ramon_LetsGo_Info_08_02");	//Alles klar, der Plan lautet so, wir beide gehen zusammen vor und...
	AI_Output(self,other,"GRD_5018_Ramon_LetsGo_Info_08_03");	//Was denn, nur wir beide?
	AI_Output(self,other,"GRD_5018_Ramon_LetsGo_Info_08_04");	//Ganz genau, nur wir beide. Wir gehen vor und sicheren den Pfad zur alten Mine. Der Rest des Konvois kommt nach, sobald wir beide den Weg frei gemacht haben.
	AI_Output(other,self,"GRD_5018_Ramon_LetsGo_Info_08_05");	//Okay. Los geht's!
	Npc_ExchangeRoutine(self,"FOLLOW");
	Npc_ExchangeRoutine(Org_858_Quentin,"FIGHT");
	Npc_ExchangeRoutine(Org_865_Raeuber,"FIGHT");
	Npc_ExchangeRoutine(Org_874_Raeuber,"FIGHT");
};


instance DIA_GRD_5018_FERTIG(C_Info)
{
	npc = grd_5018_ramon;
	nr = 2;
	condition = dia_grd_5018_fertig_condition;
	information = dia_grd_5018_fertig_info;
	important = 1;
};


func int dia_grd_5018_fertig_condition()
{
	if((Npc_GetDistToWP(self,"OW_OM_ENTRANCE01") < 1000) && (CONVOY_OC == LOG_RUNNING))
	{
		return 1;
	};
};

func void dia_grd_5018_fertig_info()
{
	AI_Output(self,other,"DIA_Grd_5018_Fertig_07_01");	//Okay, dass reicht. Ab hier beginnt das Lager vor der alten Mine.
	AI_Output(self,other,"DIA_Grd_5018_Fertig_07_02");	//Gute Arbeit. Ein Glück das wir einen wie dich in unserem Lager haben.
	AI_Output(self,other,"DIA_Grd_5018_Fertig_07_05");	//Wir sehen uns!
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"ALTERNATIVE");
	Npc_ExchangeRoutine(grd_5014_convoitraeger,"ALTERNATIVE");
	Npc_ExchangeRoutine(grd_5015_convoitraeger,"ALTERNATIVE");
	Npc_ExchangeRoutine(grd_5016_convoiwache,"ALTERNATIVE");
	Npc_ExchangeRoutine(grd_5017_convoiwache,"ALTERNATIVE");
	CONVOY_OC = LOG_SUCCESS;
	B_GiveXP(XP_CONVOYOC);
	Log_SetTopicStatus(CH2_KONVOIOC,LOG_SUCCESS);
	B_LogEntry(CH2_KONVOIOC,"Ramon war zufrieden mit meiner Arbeit und erzählte mir, dass er Stone einen Gruß ausrichte, damit mir dieser die schwere Garderüstung verkauft.");
};

