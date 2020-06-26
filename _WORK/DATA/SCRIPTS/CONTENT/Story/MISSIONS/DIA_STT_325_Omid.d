
instance STT_325_OMID_EXIT(C_Info)
{
	npc = STT_325_Omid;
	condition = stt_325_omid_exit_condition;
	information = stt_325_omid_exit_info;
	important = 0;
	permanent = 1;
	nr = 999;
	description = DIALOG_ENDE;
};


func int stt_325_omid_exit_condition()
{
	return 1;
};

func void stt_325_omid_exit_info()
{
	AI_StopProcessInfos(self);
};


instance STT_325_OMID_DOING(C_Info)
{
	npc = STT_325_Omid;
	condition = stt_325_omid_doing_condition;
	information = stt_325_omid_doing_info;
	important = 0;
	permanent = 0;
	description = "Wer bist du?";
};


func int stt_325_omid_doing_condition()
{
	return 1;
};

func void stt_325_omid_doing_info()
{
	AI_Output(other,self,"DIA_Lester_Hallo_15_00");	//Wer bist du?
	AI_Output(self,other,"Stt_325_Omid_DOING_02_73");	//Ich bin Omid. Ich bin einer der Köche von Gomez.
	AI_Output(self,other,"Stt_325_Omid_DOING_02_72");	//Die meisten kennen mich hier wegen meinem Fleischeintopf, der ist hier sehr beliebt.
	AI_Output(self,other,"Stt_325_Omid_DOING_04_71");	//Bist wohl noch nicht lange hier, was?
	AI_Output(other,self,"Stt_325_Omid_DOING_05_70");	//Ich bin vor einiger Zeit hier angekommen.
};


instance STT_325_OMID_NEEDHELP(C_Info)
{
	npc = STT_325_Omid;
	condition = stt_325_omid_needhelp_condition;
	information = stt_325_omid_needhelp_info;
	important = 0;
	permanent = 0;
	description = "Hast du was für mich von deinem Fleischeintopf?";
};


func int stt_325_omid_needhelp_condition()
{
	if(Npc_KnowsInfo(hero,stt_325_omid_doing))
	{
		return 1;
	};
};

func void stt_325_omid_needhelp_info()
{
	AI_Output(other,self,"Stt_325_Omid_NeedHelp_01_74");	//Hast du was für mich von deinem Fleischeintopf?
	AI_Output(self,other,"Stt_325_Omid_NeedHelp_02_73");	//Nein, den Rest davon haben Gomez und die anderen Erzbarone gestern gegessen.
	AI_Output(self,other,"Stt_325_Omid_NeedHelp_02_72");	//Wenn ich dir einen Fleischeintopf zubereiten soll, musst du mir vorher dazu die passenden Zutaten bringen.
	AI_Output(other,self,"Stt_325_Omid_NeedHelp_05_69");	//Was brauchst du?
	AI_Output(self,other,"Stt_325_Omid_NeedHelp_05_68");	//Ich brauche einen Schinken, zwei Käse, fünf gebratene Stücke Fleisch, ein Flammendorn und zwei Steinwurzeln.
	OMID_RECEPT = LOG_RUNNING;
	Log_CreateTopic(CH1_OMIDRECEPT,LOG_MISSION);
	Log_SetTopicStatus(CH1_OMIDRECEPT,LOG_RUNNING);
	B_LogEntry(CH1_OMIDRECEPT,"Omid, einer der Köche von Gomez aus dem Alten Lager, bat mich darum, dass ich ihm einige Zutaten für seinen Fleischeintopf suche. Ihm fehlen 1 Schinken, 2 Stücke Käse, 5 gebratene Stücke Fleisch, 1 Flammendorn und 2 Steinwurzeln.");
};


instance STT_325_OMID_SUCCESS(C_Info)
{
	npc = STT_325_Omid;
	condition = stt_325_omid_success_condition;
	information = stt_325_omid_success_info;
	important = 0;
	permanent = 1;
	description = "Ich hab' die Sachen, die du von mir wolltest!";
};


func int stt_325_omid_success_condition()
{
	if(OMID_RECEPT == LOG_RUNNING)
	{
		return 1;
	};
};

func void stt_325_omid_success_info()
{
	AI_Output(other,self,"DIA_Snaf_ZutatenSuccess_15_00");	//Ich hab' die Sachen, die du von mir wolltest!
	if((Npc_HasItems(other,ItFoMutton) >= 5) && (Npc_HasItems(other,ItFo_mutton_01) >= 1) && (Npc_HasItems(other,ItFoCheese) >= 2) && (Npc_HasItems(other,ItFo_Plants_Stoneroot_01) >= 2) && (Npc_HasItems(other,ItFo_Plants_Flameberry_01) >= 1))
	{
		AI_Output(self,other,"Stt_325_Omid_Success_02_73");	//Ah, sehr gut.
		AI_Output(self,other,"Stt_325_Omid_Success_04_71");	//Damit hab' ich jetzt alles was ich brauchte.
		AI_Output(self,other,"Stt_325_Omid_Success_05_70");	//Gute Arbeit. Gib' mir einen moment, ich muss die Sachen nur dazugeben.
		AI_Output(self,other,"Stt_325_Omid_Success_05_69");	//So, hier ist dein Fleischeintopf. Lass es dir schmecken!
		OMID_RECEPT = LOG_SUCCESS;
		Log_CreateTopic(CH1_OMIDRECEPT,LOG_MISSION);
		Log_SetTopicStatus(CH1_OMIDRECEPT,LOG_SUCCESS);
		B_LogEntry(CH1_OMIDRECEPT,"Durch meine Hilfe konnte Omid mir einen Eintopf kochen. Als Belohnung bekam ich etwas von seinem Fleischeintopf.");
		B_GiveXP(XP_OMIDRECEPT);
		CreateInvItems(self,itfofleischeintopf,1);
		B_GiveInvItems(self,other,itfofleischeintopf,1);
		B_GiveInvItems(other,self,ItFoMutton,5);
		B_GiveInvItems(other,self,ItFo_mutton_01,1);
		B_GiveInvItems(other,self,ItFoCheese,2);
		B_GiveInvItems(other,self,ItFo_Plants_Stoneroot_01,2);
		B_GiveInvItems(other,self,ItFo_Plants_Flameberry_01,1);
	}
	else
	{
		AI_Output(self,other,"Stt_325_Omid_Success_02_67");	//Das sind aber nicht alle Zutaten. Komm' wieder wenn du den Rest auch dabei hast.
	};
};

