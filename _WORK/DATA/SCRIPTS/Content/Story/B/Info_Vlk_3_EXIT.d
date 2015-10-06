
instance Info_Vlk_3_EXIT(C_Info)
{
	nr = 999;
	condition = Info_Vlk_3_EXIT_Condition;
	information = Info_Vlk_3_EXIT_Info;
	permanent = 1;
	description = "ENDE";
};


func int Info_Vlk_3_EXIT_Condition()
{
	return 1;
};

func void Info_Vlk_3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance Info_Vlk_3_EinerVonEuchWerden(C_Info)
{
	nr = 4;
	condition = Info_Vlk_3_EinerVonEuchWerden_Condition;
	information = Info_Vlk_3_EinerVonEuchWerden_Info;
	permanent = 1;
	description = "Wie kann ich mich diesem Lager anschliessen?";
};


func int Info_Vlk_3_EinerVonEuchWerden_Condition()
{
	if(Npc_GetTrueGuild(other) == GIL_None)
	{
		return TRUE;
	};
};

func void Info_Vlk_3_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_Vlk_3_EinerVonEuchWerden_15_00");	//Wie kann ich mich diesem Lager anschließen?
	AI_Output(self,other,"Info_Vlk_3_EinerVonEuchWerden_03_01");	//Ich bin nur ein Buddler. Wir haben hier gar nichts zu sagen. Du solltest mit den Gardisten oder mit den Schatten reden.
};


instance Info_Vlk_3_WichtigePersonen(C_Info)
{
	nr = 3;
	condition = Info_Vlk_3_WichtigePersonen_Condition;
	information = Info_Vlk_3_WichtigePersonen_Info;
	permanent = 1;
	description = "Wer ist hier der Boss?";
};


func int Info_Vlk_3_WichtigePersonen_Condition()
{
	if(!C_NpcBelongsToOldCamp(other))
	{
		return 1;
	};
};

func void Info_Vlk_3_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Vlk_3_WichtigePersonen_15_00");	//Wer ist hier der Boss?
	AI_Output(self,other,"Info_Vlk_3_WichtigePersonen_03_01");	//Gomez. Er lebt in der Burg. Aber wir Buddler haben immer nur mit seinen Gardisten zu tun.
	AI_Output(self,other,"Info_Vlk_3_WichtigePersonen_03_02");	//Am besten ist es, wenn sie dich gar nicht bemerken. Sobald du hier auffällst, hast du ein Problem.
};


instance Info_Vlk_3_DasLager(C_Info)
{
	nr = 2;
	condition = Info_Vlk_3_DasLager_Condition;
	information = Info_Vlk_3_DasLager_Info;
	permanent = 1;
	description = "Was gibt es hier für wichtige Orte?";
};


func int Info_Vlk_3_DasLager_Condition()
{
	return 1;
};

func void Info_Vlk_3_DasLager_Info()
{
	AI_Output(other,self,"Info_Vlk_3_DasLager_15_00");	//Was gibt es hier für wichtige Orte?
	AI_Output(self,other,"Info_Vlk_3_DasLager_03_01");	//Nun, wenn du wetten willst, geh abends in die Arena. Wenn du Sachen kaufen willst, gehst du am besten zum Marktplatz.
	AI_Output(self,other,"Info_Vlk_3_DasLager_03_02");	//Da kriegt du fast alles. Außer Karten. Wenn du Karten kaufen willst, geh zu Graham. Seine Hütte ist schräg gegenüber dem Burgtor.
};


instance Info_Vlk_3_DieLage(C_Info)
{
	nr = 1;
	condition = Info_Vlk_3_DieLage_Condition;
	information = Info_Vlk_3_DieLage_Info;
	permanent = 1;
	description = "Wie steht's?";
};


func int Info_Vlk_3_DieLage_Condition()
{
	return 1;
};

func void Info_Vlk_3_DieLage_Info()
{
	AI_Output(other,self,"Info_Vlk_3_DieLage_15_00");	//Wie steht's?
	if(Npc_GetTrueGuild(hero) == GIL_EBR)
	{
		AI_Output(self,other,"Info_Vlk_3_DieLage_03_04");	//Ich hab' doch keinen Ärger gemacht oder? Ich zahle brav mein Schutzgeld an die Gardisten, keine Sorge.
	}
	else
	{
		AI_Output(self,other,"Info_Vlk_3_DieLage_03_01");	//Du wirst es auch noch lernen. Immer wachsam bleiben. Selbst nachts.
		AI_Output(self,other,"Info_Vlk_3_DieLage_03_02");	//Ich habe schon seit Tagen nicht mehr richtig geschlafen. Und wer hier in der Kolonie nicht schläft, sitzt die doppelte Zeit ab!
	};
};

func void B_AssignAmbientInfos_Vlk_3(var C_Npc slf)
{
	B_AssignFindNpc_OC(slf);
	Info_Vlk_3_EXIT.npc = Hlp_GetInstanceID(slf);
	Info_Vlk_3_EinerVonEuchWerden.npc = Hlp_GetInstanceID(slf);
	Info_Vlk_3_WichtigePersonen.npc = Hlp_GetInstanceID(slf);
	Info_Vlk_3_DasLager.npc = Hlp_GetInstanceID(slf);
	Info_Vlk_3_DieLage.npc = Hlp_GetInstanceID(slf);
};

