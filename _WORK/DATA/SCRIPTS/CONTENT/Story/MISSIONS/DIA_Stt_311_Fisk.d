
instance Stt_311_Fisk_Exit(C_Info)
{
	npc = Stt_311_Fisk;
	nr = 999;
	condition = Stt_311_Fisk_Exit_Condition;
	information = Stt_311_Fisk_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Stt_311_Fisk_Exit_Condition()
{
	return 1;
};

func void Stt_311_Fisk_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance Stt_311_Fisk_First(C_Info)
{
	npc = Stt_311_Fisk;
	nr = 1;
	condition = Stt_311_Fisk_First_Condition;
	information = Stt_311_Fisk_First_Info;
	permanent = 0;
	important = 1;
};


func int Stt_311_Fisk_First_Condition()
{
	return 1;
};

func void Stt_311_Fisk_First_Info()
{
	AI_Output(self,other,"Stt_311_Fisk_First_12_00");	//Hey, Mann! Ich bin Fisk. Ich handele mit Waren aller Art. Wenn du jemals etwas brauchen solltest - bei mir bist du richtig.
	Log_CreateTopic(GE_TraderOC,LOG_NOTE);
	B_LogEntry(GE_TraderOC,"Fisk, der Schatten handelt mit Waren aller Art, vor allem WAFFEN. Er hält sich am Marktplatz auf.");
};


instance Stt_311_Fisk_Trade(C_Info)
{
	npc = Stt_311_Fisk;
	nr = 800;
	condition = Stt_311_Fisk_Trade_Condition;
	information = Stt_311_Fisk_Trade_Info;
	permanent = 1;
	description = "Zeig mir deine Ware.";
	trade = 1;
};


func int Stt_311_Fisk_Trade_Condition()
{
	return 1;
};

func void Stt_311_Fisk_Trade_Info()
{
	AI_Output(other,self,"Stt_311_Fisk_Trade_15_00");	//Zeig mir deine Ware.
};


instance Stt_311_Fisk_WhistlersSword(C_Info)
{
	npc = Stt_311_Fisk;
	nr = 801;
	condition = Stt_311_Fisk_WhistlersSword_Condition;
	information = Stt_311_Fisk_WhistlersSword_Info;
	permanent = 1;
	description = "Ich will ein Schwert kaufen. Was mit Ornamenten wär schön.";
};


func int Stt_311_Fisk_WhistlersSword_Condition()
{
	if((Fisk_ForgetSword == FALSE) && (Whistler_BuyMySword == LOG_RUNNING) && (Fisk_SwordSold == FALSE))
	{
		return 1;
	};
};

func void Stt_311_Fisk_WhistlersSword_Info()
{
	AI_Output(other,self,"Stt_311_Fisk_WhistlersSword_15_00");	//Ich will ein Schwert kaufen. Aber nicht so ein einfaches Ding. Was mit Ornamenten wär schön.
	AI_Output(self,other,"Stt_311_Fisk_WhistlersSword_12_01");	//Ich hab' da eins, das dir gefallen könnte. Der Schatten, der es abholen sollte, kommt nicht mehr .
	AI_Output(self,other,"Stt_311_Fisk_WhistlersSword_12_02");	//Kostet 110 Erz. Interessiert?
	Fisk_SCknows110 = TRUE;
	Info_ClearChoices(Stt_311_Fisk_WhistlersSword);
	Info_AddChoice(Stt_311_Fisk_WhistlersSword,"Vielleicht später.",Stt_311_Fisk_WhistlersSword_BACK);
	Info_AddChoice(Stt_311_Fisk_WhistlersSword,"Whistler wolltest du es für 100 verkaufen...",Stt_311_Fisk_WhistlersSword_Fault);
	Info_AddChoice(Stt_311_Fisk_WhistlersSword,"Ja, ich nehme es.",Stt_311_Fisk_WhistlersSword_TakeIt);
};

func void Stt_311_Fisk_WhistlersSword_BACK()
{
	AI_Output(other,self,"Org_826_Mordrag_WhistlersSword_BACK_15_00");	//Vielleicht später.
	Info_ClearChoices(Stt_311_Fisk_WhistlersSword);
};

func void Stt_311_Fisk_WhistlersSword_Fault()
{
	AI_Output(other,self,"Stt_311_Fisk_WhistlersSword_Fault_15_00");	//Whistler wolltest du es für hundert verkaufen...
	AI_Output(self,other,"Stt_311_Fisk_WhistlersSword_Fault_12_01");	//Ah! Warte mal ... Stimmt, da hätte ich dir ja fast zu wenig abgeknöpft! Ich meinte natürlich fünfhundert.
	AI_Output(other,self,"Stt_311_Fisk_WhistlersSword_Fault_15_02");	//Fünfhundert?
	AI_Output(self,other,"Stt_311_Fisk_WhistlersSword_Fault_12_03");	//Zu wenig? Tausend sind dir lieber? Auch gut. Ach, wenn ich's mir so recht überlege - ich glaube, ich behalte es einfach!
	Fisk_ForgetSword = TRUE;
	Info_ClearChoices(Stt_311_Fisk_WhistlersSword);
};

func void Stt_311_Fisk_WhistlersSword_TakeIt()
{
	AI_Output(other,self,"Stt_311_Fisk_WhistlersSword_TakeIt_15_00");	//Ja, ich nehme es.
	if(Npc_HasItems(other,ItMiNugget) >= 110)
	{
		AI_Output(self,other,"Stt_311_Fisk_WhistlersSword_TakeIt_12_01");	//Du hast ein gutes Geschäft gemacht!
		B_GiveInvItems(other,self,ItMiNugget,110);
		CreateInvItem(self,Whistlers_Schwert);
		B_GiveInvItems(self,other,Whistlers_Schwert,1);
		Info_ClearChoices(Stt_311_Fisk_WhistlersSword);
		Fisk_SwordSold = TRUE;
	}
	else
	{
		AI_Output(self,other,"Stt_311_Fisk_WhistlersSword_TakeIt_12_02");	//Ich fürchte, du hast nicht genug Erz. Ich werde das Schwert noch 'ne Weile für dich zurückhalten, aber nimm dir nicht zu viel Zeit!
	};
};


instance Stt_311_Fisk_ForgetSword(C_Info)
{
	npc = Stt_311_Fisk;
	nr = 800;
	condition = Stt_311_Fisk_ForgetSword_Condition;
	information = Stt_311_Fisk_ForgetSword_Info;
	permanent = 1;
	description = "Wegen Whistlers Schwert...";
};


func int Stt_311_Fisk_ForgetSword_Condition()
{
	if(Fisk_ForgetSword == TRUE)
	{
		return 1;
	};
};

func void Stt_311_Fisk_ForgetSword_Info()
{
	AI_Output(other,self,"Stt_311_Fisk_ForgetSword_15_00");	//Lass uns noch mal über Whistlers Schwert reden.
	AI_Output(self,other,"Stt_311_Fisk_ForgetSword_12_01");	//Du kannst ihm sagen, er wird sein Schwert nie kriegen.
};


var int Fisk_GetNewHehler;

instance Stt_311_Fisk_MordragKO(C_Info)
{
	npc = Stt_311_Fisk;
	nr = 800;
	condition = Stt_311_Fisk_MordragKO_Condition;
	information = Stt_311_Fisk_MordragKO_Info;
	permanent = 0;
	important = 1;
};


func int Stt_311_Fisk_MordragKO_Condition()
{
	var C_NPC Mordrag;
	Mordrag = Hlp_GetNpc(Org_826_Mordrag);
	if((Npc_GetTrueGuild(hero) == GIL_NONE) && ((MordragKO_HauAb == TRUE) || (Npc_IsDead(Mordrag))))
	{
		return 1;
	};
};

func void Stt_311_Fisk_MordragKO_Info()
{
	AI_Output(self,other,"Stt_311_Fisk_MordragKO_12_00");	//Hey, du!
	AI_Output(self,other,"Stt_311_Fisk_MordragKO_12_01");	//Mordrag war einer meiner wichtigsten Lieferanten, du Schwachkopf!
	AI_Output(self,other,"Stt_311_Fisk_MordragKO_12_02");	//Wenn du hier im Lager aufgenommen werden willst, kriegst du MEINE Stimme jedenfalls nicht!
	Info_ClearChoices(Stt_311_Fisk_MordragKO);
	Info_AddChoice(Stt_311_Fisk_MordragKO,"Deine Ware gehört den Erzbaronen. Das wird Thorus sicher interessieren...",Stt_311_Fisk_MordragKO_Petze);
	Info_AddChoice(Stt_311_Fisk_MordragKO,"Entspann dich! Die Sache läßt sich sicher wieder geradebiegen, oder?",Stt_311_Fisk_MordragKO_Relax);
	Info_AddChoice(Stt_311_Fisk_MordragKO,"Dann leck mich doch einfach!",Stt_311_Fisk_MordragKO_FuckOff);
};

func void Stt_311_Fisk_MordragKO_Relax()
{
	AI_Output(other,self,"Stt_311_Fisk_MordragKO_Relax_15_00");	//Entspann dich! Die Sache lässt sich sicher wieder geradebiegen, oder?
	AI_Output(self,other,"Stt_311_Fisk_MordragKO_Relax_12_01");	//Ich wüsste nicht, wie du das wieder gutmachen kannst. Es sei denn, du schaffst mir einen neuen Hehler aus dem Neuen Lager ran!
	AI_Output(other,self,"Stt_311_Fisk_MordragKO_Relax_15_02");	//Wie soll ich so jemanden finden?
	AI_Output(self,other,"Stt_311_Fisk_MordragKO_Relax_12_03");	//Ich sagte ja, ich glaube kaum, dass du bei mir noch mal gute Karten hast.
	Log_CreateTopic(CH1_FiskNewDealer,LOG_MISSION);
	Log_SetTopicStatus(CH1_FiskNewDealer,LOG_RUNNING);
	B_LogEntry(CH1_FiskNewDealer,"Der Händler Fisk am Marktplatz des Alten Lagers verlangt, dass ich ihm einen neuen Hehler beschaffe, nachdem ich Mordrag vermöbelt habe.");
	Fisk_GetNewHehler = LOG_RUNNING;
	AI_StopProcessInfos(self);
	Info_ClearChoices(Stt_311_Fisk_MordragKO);
};

func void Stt_311_Fisk_MordragKO_FuckOff()
{
	AI_Output(other,self,"Stt_311_Fisk_MordragKO_FuckOff_15_00");	//Dann leck mich doch einfach!
	Info_ClearChoices(Stt_311_Fisk_MordragKO);
	AI_StopProcessInfos(self);
	Log_CreateTopic(CH1_FiskNewDealer,LOG_MISSION);
	Log_SetTopicStatus(CH1_FiskNewDealer,LOG_FAILED);
	B_LogEntry(CH1_FiskNewDealer,"Der Händler Fisk vom Marktplatz war ziemlich sauer darüber, dass ich Mordrag aus dem Lager gejagt habe. Ab jetzt werde ich keine guten Karten mehr bei ihm haben.");
	Npc_SetPermAttitude(self,ATT_ANGRY);
	Fisk_GetNewHehler = LOG_FAILED;
	Info_ClearChoices(Stt_311_Fisk_MordragKO);
};

func void Stt_311_Fisk_MordragKO_Petze()
{
	AI_Output(other,self,"Stt_311_Fisk_MordragKO_Petze_15_00");	//Du handelst mit Ware, die den Erzbaronen gehört. Das wird Thorus sicher interessieren ...
	AI_Output(self,other,"Stt_311_Fisk_MordragKO_Petze_12_01");	//So nicht, Junge!
	AI_StopProcessInfos(self);
	Log_CreateTopic(CH1_FiskNewDealer,LOG_MISSION);
	Log_SetTopicStatus(CH1_FiskNewDealer,LOG_FAILED);
	B_LogEntry(CH1_FiskNewDealer,"Der Händler Fisk vom Marktplatz war ziemlich sauer darüber, dass ich Mordrag aus dem Lager gejagt habe. Ab jetzt werde ich keine guten Karten mehr bei ihm haben.");
	Npc_SetPermAttitude(self,ATT_ANGRY);
	Fisk_GetNewHehler = LOG_FAILED;
	Info_ClearChoices(Stt_311_Fisk_MordragKO);
};


instance Stt_311_Fisk_HehlerSuccess(C_Info)
{
	npc = Stt_311_Fisk;
	nr = 10;
	condition = Stt_311_Fisk_HehlerSuccess_Condition;
	information = Stt_311_Fisk_HehlerSuccess_Info;
	permanent = 0;
	description = "Ich habe jemanden aus dem Neuen Lager, der mit dir handeln will.";
};


func int Stt_311_Fisk_HehlerSuccess_Condition()
{
	if((Fisk_GetNewHehler == LOG_RUNNING) && Npc_KnowsInfo(hero,Org_843_Sharky_Fisk))
	{
		return 1;
	};
};

func void Stt_311_Fisk_HehlerSuccess_Info()
{
	AI_Output(other,self,"Stt_311_Fisk_HehlerSuccess_15_00");	//Ich habe jemanden aus dem Neuen Lager, der mit dir handeln will.
	AI_Output(self,other,"Stt_311_Fisk_HehlerSuccess_12_01");	//Nein! Wer hätte das gedacht. Du scheinst dich hier ja richtig beliebt machen zu wollen...
	AI_Output(self,other,"Stt_311_Fisk_HehlerSuccess_12_02");	//Das ist dir auch gelungen! Wer ist es?
	AI_Output(other,self,"Stt_311_Fisk_HehlerSuccess_15_03");	//Sein Name ist Sharky.
	AI_Output(self,other,"Stt_311_Fisk_HehlerSuccess_12_04");	//Sharky? Der ist ja noch schlimmer, als Mordrag jemals hätte sein können.
	AI_Output(self,other,"Stt_311_Fisk_HehlerSuccess_12_05");	//Was Diego betrifft, brauchst du dir keine Sorgen mehr zu machen.
	Fisk_GetNewHehler = LOG_SUCCESS;
	B_GiveXP(XP_fiskdealer);
	Log_SetTopicStatus(CH1_FiskNewDealer,LOG_SUCCESS);
	B_LogEntry(CH1_FiskNewDealer,"Fisk ist zufrieden ,denn Sharky wird Mordrags Geschäfte übernehmen.");
};


instance Stt_311_Fisk_ARMOR(C_Info)
{
	npc = Stt_311_Fisk;
	condition = Stt_311_Fisk_ARMOR_Condition;
	information = Stt_311_Fisk_ARMOR_Info;
	important = 0;
	permanent = 1;
	description = "Hast du eine Rüstung für mich?";
};


func int Stt_311_Fisk_ARMOR_Condition()
{
	if((Kapitel < 2) && Npc_KnowsInfo(hero,Stt_311_Fisk_First))
	{
		return TRUE;
	};
};

func void Stt_311_Fisk_ARMOR_Info()
{
	AI_Output(other,self,"Stt_311_Fisk_ARMOR_Info_15_01");	//Hast du eine Rüstung für mich?
	AI_Output(self,other,"Stt_311_Fisk_ARMOR_Info_12_02");	//Nun, ich bin sicher, dass ich dich zufrieden stellen kann.
	Info_ClearChoices(Stt_311_Fisk_ARMOR);
	Info_AddChoice(Stt_311_Fisk_ARMOR,DIALOG_BACK,Stt_311_Fisk_ARMOR_BACK);
	Info_AddChoice(Stt_311_Fisk_ARMOR,B_BuildBuyArmorString(NAME_FiskLightDiggers,VALUE_VLK_ARMOR_L),Stt_311_Fisk_ARMOR_L);
	Info_AddChoice(Stt_311_Fisk_ARMOR,B_BuildBuyArmorString(NAME_FiskDiggers,VALUE_VLK_ARMOR_M),Stt_311_Fisk_ARMOR_M);
};

func void Stt_311_Fisk_ARMOR_BACK()
{
	Info_ClearChoices(Stt_311_Fisk_ARMOR);
};

func void Stt_311_Fisk_ARMOR_L()
{
	AI_Output(other,self,"Stt_311_Fisk_ARMOR_L_Info_15_01");	//Gib mir die leichte Buddlerhose.
	if(Npc_HasItems(hero,ItMiNugget) < VALUE_VLK_ARMOR_L)
	{
		AI_Output(self,other,"Stt_311_Fisk_ARMOR_L_Info_12_02");	//Komm wieder, wenn du genug Erz hast!
	}
	else
	{
		AI_Output(self,other,"Stt_311_Fisk_ARMOR_L_Info_12_03");	//Eine gute Wahl!
		B_GiveInvItems(hero,self,ItMiNugget,VALUE_VLK_ARMOR_L);
		CreateInvItem(self,vlk_armor_l);
		B_GiveInvItems(self,hero,vlk_armor_l,1);
	};
};

func void Stt_311_Fisk_ARMOR_M()
{
	AI_Output(other,self,"Stt_311_Fisk_ARMOR_M_Info_15_01");	//Gib mir die Buddlerhose.
	if(Npc_HasItems(hero,ItMiNugget) < VALUE_VLK_ARMOR_M)
	{
		AI_Output(self,other,"Stt_311_Fisk_ARMOR_M_Info_12_02");	//Komm wieder, wenn du genug Erz hast!
	}
	else
	{
		AI_Output(self,other,"Stt_311_Fisk_ARMOR_M_Info_12_03");	//Eine gute Wahl!
		B_GiveInvItems(hero,self,ItMiNugget,VALUE_VLK_ARMOR_M);
		CreateInvItem(self,vlk_armor_m);
		B_GiveInvItems(self,hero,vlk_armor_m,1);
	};
};


instance INFO_FISK_GILBERT(C_Info)
{
	npc = Stt_311_Fisk;
	nr = 1;
	condition = info_fisk_gilbert_condition;
	information = info_fisk_gilbert_info;
	permanent = 0;
	description = "Sagt dir der Name Gilbert was?";
};


func int info_fisk_gilbert_condition()
{
	if(OC_BACK == LOG_RUNNING)
	{
		return 1;
	};
};

func void info_fisk_gilbert_info()
{
	AI_Output(other,self,"Info_Fisk_Gilbert_07_01");	//Sagt dir der Name Gilbert was?
	AI_Output(self,other,"Info_Fisk_Gilbert_07_02");	//Hmm... ja, der Typ kam früher öfter vorbei und hat mit mir gehandelt. Hab' ihn aber länger nicht gesehen, keine Ahnung wo der steckt.
	B_LogEntry(CH1_GILBERT,"Fisk kann sich zwar noch an Gilbert erinnern, weiß aber nichts von Ärger den Gilbert mit Gomez' Leuten hatte.");
};


var int huno_swordsold;

instance STT_311_FISK_HUNOSSWORD(C_Info)
{
	npc = Stt_311_Fisk;
	nr = 801;
	condition = stt_311_fisk_hunossword_condition;
	information = stt_311_fisk_hunossword_info;
	permanent = 1;
	description = "Weißt du etwas über ein gestohlenes Schwert von Huno?";
};


func int stt_311_fisk_hunossword_condition()
{
	if((HUNO_LOSTSWORD == LOG_RUNNING) && (HUNO_SWORDSOLD == FALSE))
	{
		return 1;
	};
};

func void stt_311_fisk_hunossword_info()
{
	AI_Output(other,self,"Stt_311_Fisk_HunosSword_15_00");	//Weißt du etwas über ein gestohlenes Schwert von Huno?
	AI_Output(self,other,"Stt_311_Fisk_HunosSword_12_01");	//Ich weiß nichts von einem Schwert. Zumindest kann ich mich nicht mehr dran erinnern...
	AI_Output(other,self,"Stt_311_Fisk_HunosSword_12_02");	//Was würde deiner Erinnerung denn auf die Sprünge helfen?
	AI_Output(self,other,"Stt_311_Fisk_HunosSword_12_03");	//Sag' du es mir.
	Info_ClearChoices(stt_311_fisk_hunossword);
	Info_AddChoice(stt_311_fisk_hunossword,"Ich komme später wieder.",stt_311_fisk_hunossword_back);
	Info_AddChoice(stt_311_fisk_hunossword,"Wie wärs mit 50 Erz?",stt_311_fisk_hunossword_fault);
	Info_AddChoice(stt_311_fisk_hunossword,"Was hälst du von 100 Erz?",stt_311_fisk_hunossword_right);
};

func void stt_311_fisk_hunossword_back()
{
	AI_Output(other,self,"Org_826_Mordrag_HunosSword_BACK_15_00");	//Vielleicht später.
	Info_ClearChoices(stt_311_fisk_hunossword);
};

func void stt_311_fisk_hunossword_fault()
{
	AI_Output(other,self,"Stt_311_Fisk_HunosSword_Fault_15_00");	//Wie wärs mit 50 Erz?
	AI_Output(self,other,"Stt_311_Fisk_HunosSword_Fault_12_01");	//Nein, ich hab' nichts von einem Schwert mitbekommen.
};

func void stt_311_fisk_hunossword_right()
{
	AI_Output(other,self,"Stt_311_Fisk_HunosSword_TakeIt_15_00");	//Was hälst du von 100 Erz?
	if(Npc_HasItems(other,ItMiNugget) >= 100)
	{
		AI_Output(self,other,"Stt_311_Fisk_HunosSword_TakeIt_12_01");	//Ach ja. Jetzt erinnere ich mich.
		AI_Output(self,other,"Stt_311_Fisk_HunosSword_TakeIt_11_02");	//Ich kann dir nur so viel sagen, sprich mal mit Fingers darüber.
		AI_Output(other,self,"Stt_311_Fisk_HunosSword_TakeIt_12_03");	//Das ist alles?
		AI_Output(self,other,"Stt_311_Fisk_HunosSword_TakeIt_12_04");	//Das ist alles.
		B_GiveInvItems(other,self,ItMiNugget,100);
		Info_ClearChoices(stt_311_fisk_hunossword);
		HUNO_SWORDSOLD = TRUE;
		B_LogEntry(CH1_HUNOLOSTSWORD,"Fisk erzählte mir, dass ich mit einem Schatten namens Fingers reden soll.");
	}
	else
	{
		AI_Output(self,other,"Stt_311_Fisk_HunosSword_TakeIt_12_02");	//Ich fürchte, du hast nicht genug Erz. Komm' wieder wenn du genug Erz hast.
	};
};

