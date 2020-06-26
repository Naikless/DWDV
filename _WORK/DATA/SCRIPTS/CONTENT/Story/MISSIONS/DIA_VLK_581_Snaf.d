
instance DIA_Snaf_Exit(C_Info)
{
	npc = VLK_581_Snaf;
	nr = 999;
	condition = DIA_Snaf_Exit_Condition;
	information = DIA_Snaf_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Snaf_Exit_Condition()
{
	return 1;
};

func void DIA_Snaf_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Snaf_Hello(C_Info)
{
	npc = VLK_581_Snaf;
	nr = 2;
	condition = DIA_Snaf_Hello_Condition;
	information = DIA_Snaf_Hello_Info;
	permanent = 0;
	description = "Wie steht's?";
};


func int DIA_Snaf_Hello_Condition()
{
	return 1;
};

func void DIA_Snaf_Hello_Info()
{
	AI_Output(other,self,"DIA_Snaf_Hello_15_00");	//Wie steht's?
	AI_Output(self,other,"DIA_Snaf_Hello_01_01");	//Nicht schlecht. Wenn man gut kochen kann, hat man viele Freunde hier.
	AI_Output(self,other,"DIA_Snaf_Hello_01_02");	//Willst du etwas von meinem Reiseintopf? Hier, nimm und lass es dir schmecken.
	AI_Output(other,self,"DIA_Snaf_Hello_15_03");	//Danke.
	AI_Output(self,other,"DIA_Snaf_Hello_01_04");	//Du könntest mir einen Gefallen tun.
	CreateInvItem(self,ItFoRice);
	B_GiveInvItems(self,other,ItFoRice,1);
};


var int Snaf_Zutaten;
var int Snaf_FreeMBRagout;

instance DIA_Snaf_Zutaten(C_Info)
{
	npc = VLK_581_Snaf;
	nr = 2;
	condition = DIA_Snaf_Zutaten_Condition;
	information = DIA_Snaf_Zutaten_Info;
	permanent = 0;
	description = "Was kann ich für dich tun?";
};


func int DIA_Snaf_Zutaten_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Snaf_Hello))
	{
		return 1;
	};
};

func void DIA_Snaf_Zutaten_Info()
{
	AI_Output(other,self,"DIA_Snaf_Zutaten_15_00");	//Was kann ich für dich tun?
	AI_Output(self,other,"DIA_Snaf_Zutaten_01_01");	//Du bist sicher gutes Essen gewöhnt. Ich hab' da ein neues Rezept: Fleischwanzen-Ragout a la Snaf, mit Reis und Pilzen.
	AI_Output(self,other,"DIA_Snaf_Zutaten_01_02");	//Du kannst haben, so viel du willst, aber ich brauche aber noch 3 Fleischwanzen und einige Höllenpilze - 5 müssten reichen.
	Info_ClearChoices(DIA_Snaf_Zutaten);
	Info_AddChoice(DIA_Snaf_Zutaten,"Willst du, dass ich kotze?",DIA_Snaf_Zutaten_KOTZ);
	Info_AddChoice(DIA_Snaf_Zutaten,"Hört sich gut an.",DIA_Snaf_Zutaten_DoIt);
};

func void DIA_Snaf_Zutaten_KOTZ()
{
	AI_Output(other,self,"DIA_Snaf_Zutaten_KOTZ_15_00");	//Willst du, dass ich kotze?
	AI_Output(self,other,"DIA_Snaf_Zutaten_KOTZ_01_01");	//Du musst es ja nicht essen, aber zumindest probieren solltest du es! Falls du an die Sachen rankommst, denk an mich.
	AI_Output(self,other,"DIA_Snaf_Zutaten_KOTZ_01_02");	//Ich hab' schon jemanden geschickt, aber der kommt einfach nicht wieder - ist bestimmt zum Neuen Lager übergelaufen.
	Snaf_Zutaten = LOG_RUNNING;
	Log_CreateTopic(CH1_SnafsRecipe,LOG_MISSION);
	Log_SetTopicStatus(CH1_SnafsRecipe,LOG_RUNNING);
	B_LogEntry(CH1_SnafsRecipe,"Der Koch Snaf im Aussenring des Alten Lagers hat mich geschickt, ihm 3 Fleischwanzen und 5 Höllenpilze für ein neues Rezept zu besorgen.");
	Info_ClearChoices(DIA_Snaf_Zutaten);
};

func void DIA_Snaf_Zutaten_DoIt()
{
	AI_Output(other,self,"DIA_Snaf_Zutaten_DoIt_15_00");	//Hört sich gut an.
	AI_Output(self,other,"DIA_Snaf_Zutaten_DoIt_01_01");	//Dann sieh mal zu, dass du die Sachen besorgst.
	AI_Output(self,other,"DIA_Snaf_Zutaten_DoIt_01_02");	//Der Letzte, den ich losgeschickt hab, kommt einfach nicht wieder - ist bestimmt zum Neuen Lager übergelaufen.
	Snaf_Zutaten = LOG_RUNNING;
	Snaf_FreeMBRagout = TRUE;
	Log_CreateTopic(CH1_SnafsRecipe,LOG_MISSION);
	Log_SetTopicStatus(CH1_SnafsRecipe,LOG_RUNNING);
	B_LogEntry(CH1_SnafsRecipe,"Der Koch Snaf im Aussenring des Alten Lagers hat mich geschickt, ihm 3 Fleischwanzen und 5 Höllenpilze für ein neues Rezept zu besorgen. Er gibt mir dann auch was ab.");
	Info_ClearChoices(DIA_Snaf_Zutaten);
};


instance DIA_Snaf_ZutatenSuccess(C_Info)
{
	npc = VLK_581_Snaf;
	nr = 2;
	condition = DIA_Snaf_ZutatenSuccess_Condition;
	information = DIA_Snaf_ZutatenSuccess_Info;
	permanent = 0;
	description = "Ich hab' die Sachen, die du von mir wolltest!";
};


func int DIA_Snaf_ZutatenSuccess_Condition()
{
	if((Snaf_Zutaten == LOG_RUNNING) && (Npc_HasItems(other,ItFo_Plants_mushroom_01) >= 5) && (Npc_HasItems(other,ItAt_Meatbug_01) >= 3))
	{
		return 1;
	};
};

func void DIA_Snaf_ZutatenSuccess_Info()
{
	AI_Output(other,self,"DIA_Snaf_ZutatenSuccess_15_00");	//Ich hab' die Sachen, die du von mir wolltest!
	AI_Output(self,other,"DIA_Snaf_ZutatenSuccess_01_01");	//Gut, ich brauch sie nur noch dazuzugeben, dann ist der Eintopf fertig ... warte ...
	CreateInvItems(other,ItFo_Plants_mushroom_01,3);
	B_GiveInvItems(other,self,ItFo_Plants_mushroom_01,5);
	Npc_RemoveInvItems(self,ItFo_Plants_mushroom_01,5);
	Npc_RemoveInvItems(other,ItAt_Meatbug_01,3);
	CreateInvItems(self,ItFoMeatbugragout,3);
	B_GiveInvItems(self,other,ItFoMeatbugragout,3);
	Snaf_Zutaten = LOG_SUCCESS;
	Log_SetTopicStatus(CH1_SnafsRecipe,LOG_SUCCESS);
	B_LogEntry(CH1_SnafsRecipe,"Snaf war sehr zufrieden, als ich ihm die Zutaten übergab.");
	if(Snaf_FreeMBRagout == TRUE)
	{
		B_LogEntry(CH1_SnafsRecipe,"Ab jetzt kann ich jeden Tag Fleischwanzen-Ragout bei ihm essen.");
	};
	B_GiveXP(100);
	AI_StopProcessInfos(self);
};


var int Snaf_RagoutDay;

instance DIA_Snaf_AfterSuccess(C_Info)
{
	npc = VLK_581_Snaf;
	nr = 2;
	condition = DIA_Snaf_AfterSuccess_Condition;
	information = DIA_Snaf_AfterSuccess_Info;
	permanent = 1;
	description = "Du hast gesagt, ich kann soviel von dem Eintopf haben, wie ich will...";
};


func int DIA_Snaf_AfterSuccess_Condition()
{
	if((Snaf_Zutaten == LOG_SUCCESS) && (Snaf_FreeMBRagout == TRUE))
	{
		return 1;
	};
};

func void DIA_Snaf_AfterSuccess_Info()
{
	AI_Output(other,self,"DIA_Snaf_AfterSuccess_15_00");	//Du hast gesagt, ich kann so viel von den Eintopf haben, wie ich will ...
	if(Snaf_RagoutDay != Wld_GetDay())
	{
		AI_Output(self,other,"DIA_Snaf_AfterSuccess_01_01");	//Und das stimmt auch. Hier, nimm 3 Portionen!
		CreateInvItems(self,ItFoMeatbugragout,3);
		B_GiveInvItems(self,other,ItFoMeatbugragout,3);
		Snaf_RagoutDay = Wld_GetDay();
	}
	else
	{
		AI_Output(self,other,"DIA_Snaf_AfterSuccess_01_02");	//Klar! Heute ist aber alles schon auf. Komm morgen wieder!
	};
};


instance DIA_Snaf_WhereMeatbugs(C_Info)
{
	npc = VLK_581_Snaf;
	nr = 3;
	condition = DIA_Snaf_WhereMeatbugs_Condition;
	information = DIA_Snaf_WhereMeatbugs_Info;
	permanent = 0;
	description = "Wo finde ich Fleischwanzen?";
};


func int DIA_Snaf_WhereMeatbugs_Condition()
{
	if(Snaf_Zutaten == LOG_RUNNING)
	{
		return 1;
	};
};

func void DIA_Snaf_WhereMeatbugs_Info()
{
	AI_Output(other,self,"DIA_Snaf_WhereMeatbugs_15_00");	//Wo finde ich Fleischwanzen?
	AI_Output(self,other,"DIA_Snaf_WhereMeatbugs_01_01");	//Überall da, wo Müll rumliegt. An der Burgmauer gibt es einige verlassene Hütten, da solltest du welche finden.
	AI_Output(self,other,"DIA_Snaf_WhereMeatbugs_01_02");	//Lass dich von ihrem fiesen Aussehen nicht täuschen. Gekocht sind sie lecker.
	B_LogEntry(CH1_SnafsRecipe,"Fleischwanzen gibt es bei den verlassenen Hütten an der Burgmauer.");
};


instance DIA_Snaf_WhereMushrooms(C_Info)
{
	npc = VLK_581_Snaf;
	nr = 4;
	condition = DIA_Snaf_WhereMushrooms_Condition;
	information = DIA_Snaf_WhereMushrooms_Info;
	permanent = 0;
	description = "Wo finde ich Höllenpilze?";
};


func int DIA_Snaf_WhereMushrooms_Condition()
{
	if(Snaf_Zutaten == LOG_RUNNING)
	{
		return 1;
	};
};

func void DIA_Snaf_WhereMushrooms_Info()
{
	AI_Output(other,self,"DIA_Snaf_WhereMushrooms_15_00");	//Wo finde ich Höllenpilze?
	AI_Output(self,other,"DIA_Snaf_WhereMushrooms_01_01");	//Wenn du aus dem Südtor rausgehst - das ist der umgestürzte Turm - findest du direkt vor dir eine Ebene, auf der Pilze wachsen.
	B_LogEntry(CH1_SnafsRecipe,"Höllenpilze gibt es auf der Ebene vor dem umgestürzten Turm, dem Südtor.");
};


instance DIA_Snaf_WhereNek(C_Info)
{
	npc = VLK_581_Snaf;
	nr = 5;
	condition = DIA_Snaf_WhereNek_Condition;
	information = DIA_Snaf_WhereNek_Info;
	permanent = 0;
	description = "Wer war der Typ, den du vor mir losgeschickt hast?";
};


func int DIA_Snaf_WhereNek_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Snaf_Zutaten) && (Sly_LostNek == LOG_RUNNING))
	{
		return 1;
	};
};

func void DIA_Snaf_WhereNek_Info()
{
	AI_Output(other,self,"DIA_Snaf_WhereNek_15_00");	//Wer war der Typ, den du vor mir losgeschickt hast?
	AI_Output(self,other,"DIA_Snaf_WhereNek_01_01");	//Sein Name war Nek. Er war ziemlich unzufrieden hier - ich denke, er ist jetzt im Neuen Lager.
	AI_Output(self,other,"DIA_Snaf_WhereNek_01_02");	//Hab ihn Pilze suchen geschickt - aber er kam nicht wieder ...
	B_LogEntry(CH1_LostNek,"Der Koch Snaf hat Nek zum letzten Mal gesehen, als er Pilze pflücken ging.");
};


instance DIA_SNAF_TEACH(C_Info)
{
	npc = VLK_581_Snaf;
	nr = 5;
	condition = dia_snaf_teach_condition;
	information = dia_snaf_teach_info;
	permanent = 0;
	description = "Kannst du mir auch beibringen zu kochen?";
};


func int dia_snaf_teach_condition()
{
	if(Snaf_Zutaten == LOG_SUCCESS)
	{
		return 1;
	};
};

func void dia_snaf_teach_info()
{
	AI_Output(other,self,"DIA_Snaf_teach_15_00");	//Kannst du mir auch beibringen zu kochen?
	AI_Output(self,other,"DIA_Snaf_teach_01_01");	//Ich werde dir mein Rezept zur Zubereitung von meinem Fleischwanzenragout beibringen.
	AI_Output(self,other,"DIA_Snaf_teach_01_02");	//Immerhin hast du mir die Zutaten dafür gebracht.
	Log_CreateTopic(GE_TeacherOC,LOG_NOTE);
	B_LogEntry(GE_TeacherOC,"Der Koch Snaf, im Aussenring des alten Lagers, kann mir beibringen zu kochen.");
};


instance DIA_SNAF_LEARN(C_Info)
{
	npc = VLK_581_Snaf;
	nr = 3;
	condition = dia_snaf_learn_condition;
	information = dia_snaf_learn_info;
	permanent = 1;
	description = "Fleischwanzenragout (Kosten: 1 Lernpunkt)";
};


func int dia_snaf_learn_condition()
{
	if((Snaf_Zutaten == LOG_SUCCESS) && Npc_KnowsInfo(hero,dia_snaf_teach) && (KNOWS_MEATBUGRAGOUT == FALSE))
	{
		return 1;
	};
};

func void dia_snaf_learn_info()
{
	AI_Output(other,self,"DIA_Snaf_Learn_15_00");	//Bring mir bei wie ich Fleischwanzenragout koche.
	if(hero.lp >= 1)
	{
		hero.lp = hero.lp - 1;
		AI_Output(self,other,"DIA_Snaf_Learn_12_01");	//Du fängst an, indem du das Wasser erst einmal zum kochen bringst.
		AI_Output(self,other,"DIA_Snaf_Learn_12_02");	//Sobald es kocht, gibst du die Höllenpilze in den Topf. Von da an ist wichtig, dass du immer schön umrührst.
		AI_Output(self,other,"DIA_Snaf_Learn_12_03");	//Nach einer Weile gibst du dann das Wanzenfleisch hinzu. Das muss aber immer nach den Höllenpilzen in den Topf, da es sonst schnell bei langem Kochen den Geschmack verliert.
		AI_Output(self,other,"DIA_Snaf_Learn_12_04");	//Du wirst es riechen, sobald es fertig ist.
		Log_CreateTopic(GE_COOK,LOG_NOTE);
		B_LogEntry(GE_COOK,"Ab jetzt kann ich Fleischwanzenragout kochen.");
		B_LogEntry(GE_COOK,"Die Zutaten sind: 2 Stücke Wanzenfleisch und 4 Höllenpilze. ");
		KNOWS_MEATBUGRAGOUT = TRUE;
		PrintScreen("Lerne: Fleischwanzenragout",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
	}
	else
	{
		PrintScreen("Zu wenig Lernpunkte!",-1,-1,"FONT_OLD_20_WHITE.TGA",1);
		B_Say(self,other,"$NOLEARNNOPOINTS");
	};
};

