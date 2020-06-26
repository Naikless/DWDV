
func void B_Story_GotoOrcGraveyard()
{
	var C_Npc Kalom;
	var C_Npc Novize;
	var C_Npc Novize_1;
	var C_Npc Novize_2;
	var C_Npc Novize_3;
	var C_Npc Novize_4;
	var C_Npc Novize_5;
	var C_Npc Novize_6;
	var C_Npc Novize_7;
	var C_Npc Novize_8;
	var C_Npc Novize_9;
	var C_Npc Novize_10;
	var C_Npc Novize_11;
	Log_CreateTopic(CH3_OrcGraveyard,LOG_MISSION);
	Log_SetTopicStatus(CH3_OrcGraveyard,LOG_RUNNING);
	B_LogEntry(CH3_OrcGraveyard,"Die gro�e Anrufung des Schl�fers lief nicht wie erwartet. Es waren nur sehr undeutliche Bilder von Orks in H�hlen zu sehen.  Y'Berion, der religi�se Kopf der Bruderschaft ist durch die Anstrengungen der Beschw�rung in ein Koma gefallen!");
	B_LogEntry(CH3_OrcGraveyard,"Cor-Angar, der Anf�hrer der Templer bat mich in den Ork-Friedhof, ein H�hlensystem in der N�he des Sumpflagers, zu gehen. Der Guru Baal-Lukor ist bereits mit einigen Templern vor Ort und sucht nach weiteren Hinweisen, um die unklare Vision des Schl�fers besser zu verstehen.");
	Wld_InsertNpc(OrcBiter,"OW_PATH_198_ORCGRAVEYARD4");
	Wld_InsertNpc(OrcBiter,"OW_PATH_198_ORCGRAVEYARD4");
	Wld_InsertNpc(OrcBiter,"OW_PATH_198_ORCGRAVEYARD4");
	Wld_InsertNpc(OrcBiter,"OW_PATH_198_ORCGRAVEYARD4");
	Wld_InsertNpc(OrcScout,"OW_PATH_198_ORCGRAVEYARD5");
	Wld_InsertNpc(OrcScout,"OW_PATH_198_ORCGRAVEYARD6");
	Wld_InsertNpc(OrcScout,"OW_PATH_198_ORCGRAVEYARD7");
	Wld_InsertNpc(OrcScout,"OW_PATH_198_ORCGRAVEYARD8");
	Wld_InsertNpc(Tpl_1463_Templer,"OW_PATH_198_ORCGRAVEYARD8");
	Kalom = Hlp_GetNpc(GUR_1201_CorKalom);
	Npc_ExchangeRoutine(Kalom,"FLEE");
	Npc_ExchangeRoutine(tpl_5026_gorboba,"PSI");
	Npc_ExchangeRoutine(Tpl_1422_GorHanis,"FLEE");
	Npc_ExchangeRoutine(TPL_1405_GorNaRan,"FLEE");
	Npc_ExchangeRoutine(nov_5022_novize,"PSI");
	Npc_ExchangeRoutine(nov_5023_novize,"PSI");
	Npc_ExchangeRoutine(nov_5024_novize,"PSI");
	Npc_ExchangeRoutine(nov_5025_novize,"PSI");
	Npc_ExchangeRoutine(TPL_1433_GorNaVid,"OMFULL");
	Npc_ExchangeRoutine(TPL_1400_GorNaBar,"OMFULL");
	Npc_ExchangeRoutine(TPL_1401_GorNaKosh,"OMFULL");
	Wld_InsertNpc(tpl_5065_gornavid,"PSI_START");
	Wld_InsertNpc(tpl_5066_gornabar,"PSI_START");
	Wld_InsertNpc(tpl_5067_gornakosh,"PSI_START");
	Npc_ExchangeRoutine(GUR_1210_BaalTyon,"OMFULL");
	Npc_ExchangeRoutine(NOV_1342_Novize,"AFTERRITUAL");
	Npc_ExchangeRoutine(NOV_1353_Novize,"AFTERRITUAL");
	Npc_ExchangeRoutine(NOV_1326_Novize,"AFTERRITUAL");
	if(BaalTondral_GetNewGuy == LOG_SUCCESS)
	{
		Npc_ExchangeRoutine(VLK_524_Dusty,"AFTERRITUAL");
	};
	Npc_ExchangeRoutine(GUR_1203_BaalTondral,"AFTERRITUAL");
	Npc_ExchangeRoutine(NOV_1336_Novize,"AFTERRITUAL");
	Npc_ExchangeRoutine(NOV_1340_Novize,"AFTERRITUAL");
	Npc_ExchangeRoutine(NOV_1345_Novize,"AFTERRITUAL");
	Npc_ExchangeRoutine(GUR_1208_BaalCadar,"AFTERRITUAL");
	CorAngar_GotoOGY = TRUE;
	Novize = Hlp_GetNpc(NOV_1319_Novize);
	Npc_ExchangeRoutine(Novize,"START");
	AI_ContinueRoutine(Novize);
	Novize_1 = Hlp_GetNpc(NOV_1320_Novize);
	Npc_ExchangeRoutine(Novize_1,"START");
	AI_ContinueRoutine(Novize_1);
	Novize_2 = Hlp_GetNpc(NOV_1343_Novize);
	Npc_ExchangeRoutine(Novize_2,"GRAVEYARD");
	AI_ContinueRoutine(Novize_2);
	Novize_3 = Hlp_GetNpc(NOV_1344_Novize);
	Npc_ExchangeRoutine(Novize_3,"GRAVEYARD");
	AI_ContinueRoutine(Novize_3);
	Novize_4 = Hlp_GetNpc(NOV_1339_Novize);
	Npc_ExchangeRoutine(Novize_4,"GRAVEYARD");
	AI_ContinueRoutine(Novize_4);
	Novize_5 = Hlp_GetNpc(NOV_1341_Novize);
	Npc_ExchangeRoutine(Novize_5,"GRAVEYARD");
	AI_ContinueRoutine(Novize_5);
	Novize_6 = Hlp_GetNpc(NOV_1346_Novize);
	Npc_ExchangeRoutine(Novize_6,"START");
	AI_ContinueRoutine(Novize_6);
	Novize_7 = Hlp_GetNpc(NOV_1347_Novize);
	Npc_ExchangeRoutine(Novize_7,"START");
	AI_ContinueRoutine(Novize_7);
	Novize_8 = Hlp_GetNpc(NOV_1348_Novize);
	Npc_ExchangeRoutine(Novize_8,"START");
	AI_ContinueRoutine(Novize_8);
	Novize_9 = Hlp_GetNpc(NOV_1349_Novize);
	Npc_ExchangeRoutine(Novize_9,"START");
	AI_ContinueRoutine(Novize_9);
	Novize_10 = Hlp_GetNpc(NOV_1338_Novize);
	Npc_ExchangeRoutine(Novize_10,"GRAVEYARD");
	AI_ContinueRoutine(Novize_10);
	Novize_11 = Hlp_GetNpc(NOV_1337_Novize);
	Npc_ExchangeRoutine(Novize_11,"GRAVEYARD");
	AI_ContinueRoutine(Novize_11);
};

