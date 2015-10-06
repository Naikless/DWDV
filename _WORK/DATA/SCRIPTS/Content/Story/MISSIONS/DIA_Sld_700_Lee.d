
instance Sld_700_Lee_Exit(C_Info)
{
	npc = Sld_700_Lee;
	nr = 999;
	condition = Sld_700_Lee_Exit_Condition;
	information = Sld_700_Lee_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int Sld_700_Lee_Exit_Condition()
{
	return TRUE;
};

func void Sld_700_Lee_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance Sld_700_Lee_Greet(C_Info)
{
	npc = Sld_700_Lee;
	nr = 1;
	condition = Sld_700_Lee_Greet_Condition;
	information = Sld_700_Lee_Greet_Info;
	permanent = 0;
	description = "Du bist der Chef der S�ldner, richtig?";
};


func int Sld_700_Lee_Greet_Condition()
{
	return 1;
};

func void Sld_700_Lee_Greet_Info()
{
	AI_Output(other,self,"DIA_Lee_Greet_15_00");	//Du bist der Chef der S�ldner, richtig?
	AI_Output(self,other,"DIA_Lee_Greet_08_01");	//Das ist richtig, mein Junge!
};


instance Sld_700_Lee_Define(C_Info)
{
	npc = Sld_700_Lee;
	nr = 1;
	condition = Sld_700_Lee_Define_Condition;
	information = Sld_700_Lee_Define_Info;
	permanent = 0;
	description = "Was sind die Aufgaben eines S�ldners der Magier?";
};


func int Sld_700_Lee_Define_Condition()
{
	if(Npc_KnowsInfo(hero,Sld_700_Lee_Greet))
	{
		return 1;
	};
};

func void Sld_700_Lee_Define_Info()
{
	AI_Output(other,self,"DIA_Lee_Define_15_00");	//Was sind die Aufgaben eines S�ldners der Magier?
	AI_Output(self,other,"DIA_Lee_Define_08_01");	//Ganz einfach: Besch�tze das Erz - besch�tze die Magier.
	AI_Output(self,other,"DIA_Lee_Define_08_02");	//Manchmal haben die Magier aber auch eine besondere Aufgabe f�r einen von uns.
};


instance Sld_700_Lee_Mitmachen(C_Info)
{
	npc = Sld_700_Lee;
	nr = 2;
	condition = Sld_700_Lee_Mitmachen_Condition;
	information = Sld_700_Lee_Mitmachen_Info;
	permanent = 0;
	description = "Ich will bei euch mitmachen!";
};


func int Sld_700_Lee_Mitmachen_Condition()
{
	if(Npc_KnowsInfo(hero,Sld_700_Lee_Greet) && (Npc_GetTrueGuild(hero) == GIL_None) && (oldHeroGuild == 0))
	{
		return 1;
	};
};

func void Sld_700_Lee_Mitmachen_Info()
{
	AI_Output(other,self,"DIA_Lee_Mitmachen_15_00");	//Ich will bei euch mitmachen!
	AI_Output(self,other,"DIA_Lee_Mitmachen_08_01");	//Du hast Nerven! Denkst du, ich nehme direkt jeden, der hier reinkommt?
	AI_Output(self,other,"DIA_Lee_Mitmachen_08_02");	//Erst wenn du einige Zeit hier im Lager bist, kannst du einer von uns werden. Ich werde dich beobachten!
};


var int Lee_SldPossible;

instance Sld_700_Lee_NowReady(C_Info)
{
	npc = Sld_700_Lee;
	nr = 700;
	condition = Sld_700_Lee_NowReady_Condition;
	information = Sld_700_Lee_NowReady_Info;
	permanent = 1;
	description = "Ich will ein S�ldner der Magier werden - bin ich jetzt soweit?";
};


func int Sld_700_Lee_NowReady_Condition()
{
	if((Npc_GetTrueGuild(hero) == GIL_ORG) && (Npc_KnowsInfo(hero,Sld_700_Lee_Mitmachen) || (hero.level >= 10)))
	{
		return 1;
	};
};

func void Sld_700_Lee_NowReady_Info()
{
	AI_Output(other,self,"DIA_Lee_NowReady_15_00");	//Ich will ein S�ldner der Magier werden - bin ich jetzt soweit?
	if(CorKalom_BringMCQBalls == LOG_SUCCESS)
	{
		AI_Output(self,other,"Sld_700_Lee_BECOMESLD_Info_08_01");	//Deine Taten f�r die Bruderschaft in der Alten Mine haben gezeigt, das du einiges drauf hast. 
		AI_Output(self,other,"Sld_700_Lee_BECOMESLD_Info_08_02");	//Ich w�re bereit, dich in die Reihen der S�ldner aufzunehmen.
		if(hero.level < 10)
		{
			AI_Output(self,other,"Sld_700_Lee_BECOMESLD_Info_08_03");	//Aber du bist noch nicht bereit f�r die S�ldner. Sammle erst noch mehr Erfahrung, dann bist du dabei.
			AI_StopProcessInfos(self);
			B_PrintGuildCondition(10);
		}
		else if(hero.level >= 10)
		{
			AI_Output(self,other,"Sld_700_Lee_BECOMESLD_Info_08_04");	//Ich gebe dir eine Chance. Wie siehts aus?
			Lee_SldPossible = TRUE;
		};
	}
	else if(hero.level < 10)
	{
		AI_Output(self,other,"DIA_Lee_NowReady_08_01");	//Dir fehlt es noch an Erfahrung. Du mu�t deine F�higkeiten noch steigern.
		B_PrintGuildCondition(10);
	}
	else if(hero.level >= 10)
	{
		AI_Output(self,other,"Sld_700_Lee_BECOMESLD_Info_08_04");	//Ich gebe dir eine Chance. Wie siehts aus?
		Lee_SldPossible = TRUE;
	};
};


instance Sld_700_Lee_BECOMESLDNOW(C_Info)
{
	npc = Sld_700_Lee;
	condition = Sld_700_Lee_BECOMESLDNOW_Condition;
	information = Sld_700_Lee_BECOMESLDNOW_Info;
	important = 0;
	permanent = 0;
	description = "Ich will S�ldner werden!";
};


func int Sld_700_Lee_BECOMESLDNOW_Condition()
{
	if((Lee_SldPossible == TRUE) && (hero.level >= 10))
	{
		return TRUE;
	};
};

func void Sld_700_Lee_BECOMESLDNOW_Info()
{
	AI_Output(other,self,"Sld_700_Lee_BECOMESLDNOW_Info_15_01");	//Ich will S�ldner werden!
	AI_Output(self,other,"Sld_700_Lee_BECOMESLDNOW_Info_08_02");	//Eine gute Entscheidung. Du wirst sie nicht bereuen.
	AI_Output(self,other,"Sld_700_Lee_BECOMESLDNOW_Info_08_03");	//Sag mir eins, warum? Warum hast du dich uns angeschlossen und nicht dem Alten Lager oder der Bruderschaft?
	Log_CreateTopic(GE_BecomeMercenary,LOG_NOTE);
	B_LogEntry(GE_BecomeMercenary,"Lee hat mich bei den S�ldnern aufgenommen.");
	Info_ClearChoices(Sld_700_Lee_BECOMESLDNOW);
	Info_AddChoice(Sld_700_Lee_BECOMESLDNOW,"Die anderen Lager sind es nicht wert",Sld_700_Lee_BECOMESLDNOW_NOOTHER);
	Info_AddChoice(Sld_700_Lee_BECOMESLDNOW,"Ich wollte von Anfang an die Freiheit",Sld_700_Lee_BECOMESLDNOW_FREEDOM);
	Info_AddChoice(Sld_700_Lee_BECOMESLDNOW,"Es hat sich einfach so ergeben",Sld_700_Lee_BECOMESLDNOW_JUSTBECAUSE);
};

func void Sld_700_Lee_BECOMESLDNOW_NOOTHER()
{
	AI_Output(other,self,"Sld_700_Lee_BECOMESLDNOW_NOOTHER_15_01");	//Die anderen Lager sind es nicht wert.
	AI_Output(self,other,"Sld_700_Lee_BECOMESLDNOW_NOOTHER_08_02");	//Das einzige, was hier drin etwas wert ist, ist die Hoffnung auf Freiheit. Willkommen, S�LDNER!
	AI_Output(self,other,"Sld_700_Lee_CHANGESIDE_Info_08_05");	//Du kannst dir ab jetzt jeden Tag deinen Sold abholen. 10 Erz, wie ihn hier jeder S�ldner bekommt. Morgen gibt es den ersten.
	CreateInvItem(self,sld_armor_l);
	B_GiveInvItems(self,hero,sld_armor_l,1);
	AI_EquipBestArmor(hero);
	Npc_SetTrueGuild(hero,GIL_SLD);
	hero.guild = GIL_SLD;
	Mdl_ApplyOverlayMds(hero,"Humans_Militia.mds");
	AI_StopProcessInfos(self);
};

func void Sld_700_Lee_BECOMESLDNOW_FREEDOM()
{
	AI_Output(other,self,"Sld_700_Lee_BECOMESLDNOW_FREEDOM_15_01");	//Ich wollte von Anfang an die Freiheit.
	AI_Output(self,other,"Sld_700_Lee_BECOMESLDNOW_FREEDOM_08_02");	//Wir werden uns unsere Freiheit zur�ckholen. Willkommen, S�LDNER.
	AI_Output(self,other,"Sld_700_Lee_CHANGESIDE_Info_08_05");	//Du kannst dir ab jetzt jeden Tag deinen Sold abholen. 10 Erz, wie ihn hier jeder S�ldner bekommt. Morgen gibt es den ersten.
	CreateInvItem(self,sld_armor_l);
	B_GiveInvItems(self,hero,sld_armor_l,1);
	AI_EquipBestArmor(hero);
	Npc_SetTrueGuild(hero,GIL_SLD);
	hero.guild = GIL_SLD;
	Mdl_ApplyOverlayMds(hero,"Humans_Militia.mds");
	AI_StopProcessInfos(self);
};

func void Sld_700_Lee_BECOMESLDNOW_JUSTBECAUSE()
{
	AI_Output(other,self,"Sld_700_Lee_BECOMESLDNOW_JUSTBECAUSE_15_01");	//Es hat sich einfach so ergeben.
	AI_Output(self,other,"Sld_700_Lee_BECOMESLDNOW_JUSTBECAUSE_08_02");	//Hauptsache, es ergibt sich nicht, dass uns die Barriere f�r immer hier drin gefangen h�lt. Willkommen, S�LDNER.
	AI_Output(self,other,"Sld_700_Lee_CHANGESIDE_Info_08_05");	//Du kannst dir ab jetzt jeden Tag deinen Sold abholen. 10 Erz, wie ihn hier jeder S�ldner bekommt. Morgen gibt es den ersten.
	CreateInvItem(self,sld_armor_l);
	B_GiveInvItems(self,hero,sld_armor_l,1);
	AI_EquipBestArmor(hero);
	Npc_SetTrueGuild(hero,GIL_SLD);
	hero.guild = GIL_SLD;
	Mdl_ApplyOverlayMds(hero,"Humans_Militia.mds");
	AI_StopProcessInfos(self);
};


instance Sld_700_Lee_DAMNPAST(C_Info)
{
	npc = Sld_700_Lee;
	condition = Sld_700_Lee_DAMNPAST_Condition;
	information = Sld_700_Lee_DAMNPAST_Info;
	important = 1;
	permanent = 0;
};


func int Sld_700_Lee_DAMNPAST_Condition()
{
	if((Saturas_BringFoci == 5) && (Npc_GetDistToNpc(hero,self) < 1000) && (Npc_GetDistToWP(self,"NC_DAM") < 1000))
	{
		return TRUE;
	};
};

func void Sld_700_Lee_DAMNPAST_Info()
{
	var C_Npc Homer;
	AI_Output(self,other,"Sld_700_Lee_DAMNPAST_Info_08_01");	//Einst f�hrte ich ein anderes Leben.
	AI_Output(self,other,"Sld_700_Lee_DAMNPAST_Info_08_02");	//Ich z�hlte zu den besten Gener�len dieses Landes.
	AI_Output(self,other,"Sld_700_Lee_DAMNPAST_Info_08_03");	//Ich habe mein ganzes Leben lang f�r dieses Land gek�mpft.
	AI_Output(self,other,"Sld_700_Lee_DAMNPAST_Info_08_04");	//Den Adeligen war ich ein Dorn im Auge, denn der K�nig h�rte auf meinen Rat. Und sie sahen ihre schmutzigen Gesch�fte in Gefahr.
	AI_Output(self,other,"Sld_700_Lee_DAMNPAST_Info_08_05");	//Ich habe nicht mit ihrer Hinterh�ltigkeit gerechnet. Sie haben des K�nigs Frau benutzt, um mich zu kriegen.
	AI_Output(self,other,"Sld_700_Lee_DAMNPAST_Info_08_06");	//Der sinnlose Mord an ihr wurde mir angeh�ngt. K�nig Rhobar blieb keine Wahl.
	AI_Output(self,other,"Sld_700_Lee_DAMNPAST_Info_08_07");	//Meine Verdienste um das Land retteten mich vor dem Strick. Aber sie haben mir meine Freiheit genommen.
	AI_Output(self,other,"Sld_700_Lee_DAMNPAST_Info_08_08");	//Eines Tages werde ich wieder frei sein. Dann werde ich zur�ckkehren und ich werde Rache nehmen.
	AI_AlignToWP(self);
	AI_Output(self,other,"Sld_700_Lee_DAMNPAST_Info_08_09");	//Ich werde mich r�chen.
	Npc_ExchangeRoutine(self,"START");
	Homer = Hlp_GetNpc(BAU_935_Homer);
	Npc_ExchangeRoutine(Homer,"START");
	AI_ContinueRoutine(Homer);
};


instance Sld_700_Lee_FMTaken(C_Info)
{
	npc = Sld_700_Lee;
	nr = 1;
	condition = Sld_700_Lee_FMTaken_Condition;
	information = Sld_700_Lee_FMTaken_Info;
	permanent = 1;
	description = "Was sagst du zu der Sache mit der Mine?";
};


func int Sld_700_Lee_FMTaken_Condition()
{
	if(FMTaken)
	{
		return TRUE;
	};
};

func void Sld_700_Lee_FMTaken_Info()
{
	AI_Output(other,self,"DIA_Lee_FMTaken_15_00");	//Was sagst du zu der Sache mit der Mine?
	if(Lee_freeminereport == 0)
	{
		AI_Output(self,other,"DIA_Lee_FMTaken_08_01");	//Sie sind zu weit gegangen, daf�r werden sie b��en.
	}
	else
	{
		AI_Output(hero,self,"Info_Lee_now_freeminefree_15_01");	//Die Bedrohung d�rfte beendet sein!
		AI_Output(self,hero,"Sld_700_Lee_CHANGESIDE_Info_08_02");	//Du hast viel f�r unser Lager getan. M�nner wie dich kann ich gebrauchen.
		AI_Output(hero,self,"Info_FreemineOrc_EXIT_15_03");	//Ich danke dir. Ich werde mich jetzt wieder auf den Weg machen.
		AI_Output(hero,self,"Info_Exit_Info_15_01");	//Wir sehen uns.
		B_LogEntry(CH4_BannedFromOC,"Ich habe Lee �ber Gorns und mein Aufr�umen in der freien Mine informiert. Er zeigte sich sehr zufrieden.");
		B_GiveXP(500);
		Lee_freeminereport = 0;
	};
};


instance Sld_700_Lee_CHANGESIDE(C_Info)
{
	npc = Sld_700_Lee;
	condition = Sld_700_Lee_CHANGESIDE_Condition;
	information = Sld_700_Lee_CHANGESIDE_Info;
	important = 0;
	permanent = 0;
	description = "Das Alte Lager hat mich verbannt, ich m�chte mich euch anschlie�en!";
};


func int Sld_700_Lee_CHANGESIDE_Condition()
{
	if(Npc_KnowsInfo(hero,KDW_600_Saturas_GOTOLEE))
	{
		return TRUE;
	};
};

func void Sld_700_Lee_CHANGESIDE_Info()
{
	AI_Output(other,self,"Sld_700_Lee_CHANGESIDE_Info_15_01");	//Das Alte Lager hat mich verbannt, ich m�chte mich euch anschlie�en!
	AI_Output(self,other,"Sld_700_Lee_CHANGESIDE_Info_08_02");	//Du hast viel f�r unser Lager getan. M�nner wie dich kann ich gebrauchen.
	AI_Output(self,other,"Sld_700_Lee_CHANGESIDE_Info_08_03");	//Machen wir es kurz. Willkommen im Neuen Lager, S�LDNER!
	AI_Output(self,other,"Sld_700_Lee_CHANGESIDE_Info_08_04");	//Hier ist eine von unseren R�stungen. Gut, dass du bei uns bist.
	AI_Output(self,other,"Sld_700_Lee_CHANGESIDE_Info_08_05");	//Du kannst dir ab jetzt jeden Tag deinen Sold abholen. 10 Erz, wie ihn hier jeder S�ldner bekommt. Morgen gibt es den ersten.
	CreateInvItem(self,sld_armor_m);
	B_GiveInvItems(self,hero,sld_armor_m,1);
	Npc_GetInvItemBySlot(hero,INV_ARMOR,2);
	if(Hlp_GetInstanceID(item) == sld_armor_m)
	{
		AI_EquipArmor(hero,item);
	};
	Npc_SetTrueGuild(hero,GIL_SLD);
	hero.guild = GIL_SLD;
	Mdl_ApplyOverlayMds(hero,"Humans_Militia.mds");
	B_LogEntry(CH4_BannedFromOC,"Ich habe die Seiten gewechselt. Nachdem das alte Lager mich verbannt hat, habe ich mich nun den S�ldnern angeschlossen. Nun wieder zur�ck zu Saturas!");
	Log_CreateTopic(GE_TeacherNC,LOG_NOTE);
	B_LogEntry(GE_TeacherNC,"Lee kann mir den Kampf mit ZWEIH�NDIGEN Waffen beibringen. Au�erdem kann er mich lehren, meine ST�RKE und mein GESCHICK zu verbessern.");
};


instance Sld_700_Lee_ARMOR(C_Info)
{
	npc = Sld_700_Lee;
	condition = Sld_700_Lee_ARMOR_Condition;
	information = Sld_700_Lee_ARMOR_Info;
	important = 0;
	permanent = 1;
	description = "Ich brauche eine bessere R�stung";
};


func int Sld_700_Lee_ARMOR_Condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_SLD)
	{
		return TRUE;
	};
};

func void Sld_700_Lee_ARMOR_Info()
{
	AI_Output(other,self,"Sld_700_Lee_ARMOR_Info_15_01");	//Ich brauche eine bessere R�stung.
	AI_Output(self,other,"Sld_700_Lee_ARMOR_Info_08_02");	//Die R�stungen musst du dir erst verdienen. Au�erdem sind sie nicht ganz billig.
	Info_ClearChoices(Sld_700_Lee_ARMOR);
	Info_AddChoice(Sld_700_Lee_ARMOR,DIALOG_BACK,Sld_700_Lee_ARMOR_BACK);
	Info_AddChoice(Sld_700_Lee_ARMOR,B_BuildBuyArmorString(NAME_LeeMercs,VALUE_SLD_ARMOR_M),Sld_700_Lee_ARMOR_M);
	Info_AddChoice(Sld_700_Lee_ARMOR,B_BuildBuyArmorString(NAME_LeeHeavyMercs,VALUE_SLD_ARMOR_H),Sld_700_Lee_ARMOR_H);
};

func void Sld_700_Lee_ARMOR_BACK()
{
	Info_ClearChoices(Sld_700_Lee_ARMOR);
};

func void Sld_700_Lee_ARMOR_M()
{
	AI_Output(other,self,"Sld_700_Lee_ARMOR_M_Info_08_01");	//Ich m�chte die mittlere R�stung haben.
	if(Kapitel < 3)
	{
		AI_Output(self,other,"Sld_700_Lee_ARMOR_M_Info_08_02");	//Du bist noch nicht so weit, eine bessere R�stung zu tragen. Komm wieder, wenn du erfahrener geworden bist.
	}
	else if(Npc_HasItems(hero,ItMiNugget) < VALUE_SLD_ARMOR_M)
	{
		AI_Output(self,other,"Sld_700_Lee_ARMOR_M_Info_08_03");	//Ohne Erz gibt es auch keine R�stung.
	}
	else
	{
		AI_Output(self,other,"Sld_700_Lee_ARMOR_M_Info_08_04");	//Diese R�stung ist ein ordentliches St�ck Arbeit. Sie wird deinen K�rper gut sch�tzen.
		B_GiveInvItems(hero,self,ItMiNugget,VALUE_SLD_ARMOR_M);
		CreateInvItem(hero,sld_armor_m);
		CreateInvItem(self,ItAmArrow);
		B_GiveInvItems(self,hero,ItAmArrow,1);
		Npc_RemoveInvItem(hero,ItAmArrow);
	};
};

func void Sld_700_Lee_ARMOR_H()
{
	AI_Output(other,self,"Sld_700_Lee_ARMOR_H_Info_08_01");	//Gib mir die schwere R�stung.
	if(Kapitel < 4)
	{
		AI_Output(self,other,"Sld_700_Lee_ARMOR_H_Info_08_02");	//Du bist noch nicht so weit, die schwere R�stung zu tragen. Komm wieder, wenn du erfahrener geworden bist.
	}
	else if(Npc_HasItems(hero,ItMiNugget) < VALUE_SLD_ARMOR_H)
	{
		AI_Output(self,other,"Sld_700_Lee_ARMOR_H_Info_08_03");	//Ohne Erz gibt es auch keine R�stung.
	}
	else
	{
		AI_Output(self,other,"Sld_700_Lee_ARMOR_H_Info_08_04");	//Diese R�stung ist das Beste, was du in der Barriere bekommen kannst. Und, glaub mir, sie ist das Erz wert.
		B_GiveInvItems(hero,self,ItMiNugget,VALUE_SLD_ARMOR_H);
		CreateInvItem(hero,sld_armor_h);
		CreateInvItem(self,ItAmArrow);
		B_GiveInvItems(self,hero,ItAmArrow,1);
		Npc_RemoveInvItem(hero,ItAmArrow);
	};
};


instance Sld_700_Lee_Teach(C_Info)
{
	npc = Sld_700_Lee;
	nr = 10;
	condition = Sld_700_Lee_Teach_Condition;
	information = Sld_700_Lee_Teach_Info;
	permanent = 1;
	description = "Kannst du mir was beibringen?";
};


func int Sld_700_Lee_Teach_Condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_SLD)
	{
		return TRUE;
	};
};

func void Sld_700_Lee_Teach_Info()
{
	AI_Output(other,self,"Sld_700_Lee_Teach_15_00");	//Kannst du mir was beibringen?
	AI_Output(self,other,"Sld_700_Lee_Teach_08_01");	//Ich kann dir helfen, st�rker und geschickter zu werden.
	Info_ClearChoices(Sld_700_Lee_Teach);
	Info_AddChoice(Sld_700_Lee_Teach,DIALOG_BACK,Sld_700_Lee_Teach_BACK);
	Info_AddChoice(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnStrength_5,5 * LPCOST_ATTRIBUTE_STRENGTH,0),Sld_700_Lee_Teach_STR_5);
	Info_AddChoice(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0),Sld_700_Lee_Teach_STR_1);
	Info_AddChoice(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),Sld_700_Lee_Teach_DEX_5);
	Info_AddChoice(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),Sld_700_Lee_Teach_DEX_1);
};

func void Sld_700_Lee_Teach_BACK()
{
	Info_ClearChoices(Sld_700_Lee_Teach);
};

func void Sld_700_Lee_Teach_STR_1()
{
	B_BuyAttributePoints(other,ATR_STRENGTH,LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices(Sld_700_Lee_Teach);
	Info_AddChoice(Sld_700_Lee_Teach,DIALOG_BACK,Sld_700_Lee_Teach_BACK);
	Info_AddChoice(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnStrength_5,5 * LPCOST_ATTRIBUTE_STRENGTH,0),Sld_700_Lee_Teach_STR_5);
	Info_AddChoice(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0),Sld_700_Lee_Teach_STR_1);
	Info_AddChoice(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),Sld_700_Lee_Teach_DEX_5);
	Info_AddChoice(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),Sld_700_Lee_Teach_DEX_1);
};

func void Sld_700_Lee_Teach_STR_5()
{
	B_BuyAttributePoints(other,ATR_STRENGTH,5 * LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices(Sld_700_Lee_Teach);
	Info_AddChoice(Sld_700_Lee_Teach,DIALOG_BACK,Sld_700_Lee_Teach_BACK);
	Info_AddChoice(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnStrength_5,5 * LPCOST_ATTRIBUTE_STRENGTH,0),Sld_700_Lee_Teach_STR_5);
	Info_AddChoice(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0),Sld_700_Lee_Teach_STR_1);
	Info_AddChoice(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),Sld_700_Lee_Teach_DEX_5);
	Info_AddChoice(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),Sld_700_Lee_Teach_DEX_1);
};

func void Sld_700_Lee_Teach_DEX_1()
{
	B_BuyAttributePoints(other,ATR_DEXTERITY,LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices(Sld_700_Lee_Teach);
	Info_AddChoice(Sld_700_Lee_Teach,DIALOG_BACK,Sld_700_Lee_Teach_BACK);
	Info_AddChoice(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnStrength_5,5 * LPCOST_ATTRIBUTE_STRENGTH,0),Sld_700_Lee_Teach_STR_5);
	Info_AddChoice(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0),Sld_700_Lee_Teach_STR_1);
	Info_AddChoice(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),Sld_700_Lee_Teach_DEX_5);
	Info_AddChoice(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),Sld_700_Lee_Teach_DEX_1);
};

func void Sld_700_Lee_Teach_DEX_5()
{
	B_BuyAttributePoints(other,ATR_DEXTERITY,5 * LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices(Sld_700_Lee_Teach);
	Info_AddChoice(Sld_700_Lee_Teach,DIALOG_BACK,Sld_700_Lee_Teach_BACK);
	Info_AddChoice(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnStrength_5,5 * LPCOST_ATTRIBUTE_STRENGTH,0),Sld_700_Lee_Teach_STR_5);
	Info_AddChoice(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0),Sld_700_Lee_Teach_STR_1);
	Info_AddChoice(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),Sld_700_Lee_Teach_DEX_5);
	Info_AddChoice(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),Sld_700_Lee_Teach_DEX_1);
};


instance Sld_700_Lee_ZWEIHAND1(C_Info)
{
	npc = Sld_700_Lee;
	condition = Sld_700_Lee_ZWEIHAND1_Condition;
	information = Sld_700_Lee_ZWEIHAND1_Info;
	important = 0;
	permanent = 1;
	description = B_BuildLearnString(NAME_Learn2h_1,LPCOST_TALENT_2H_1,0);
};


func int Sld_700_Lee_ZWEIHAND1_Condition()
{
	if(((Npc_GetTalentSkill(hero,NPC_TALENT_1H) == 2) && (Npc_GetTalentSkill(hero,NPC_TALENT_2H) < 1) && (Npc_GetTrueGuild(hero) == GIL_SLD)) || ((Npc_GetTalentSkill(hero,NPC_TALENT_1H) == 2) && (Npc_GetTalentSkill(hero,NPC_TALENT_2H) < 1) && (Npc_GetTrueGuild(hero) == GIL_KDW)))
	{
		return TRUE;
	};
};

func void Sld_700_Lee_ZWEIHAND1_Info()
{
	AI_Output(other,self,"Sld_700_Lee_ZWEIHAND1_Info_15_01");	//Ich m�chte den Umgang mit Zweih�ndern lernen.
	if(B_GiveSkill(other,NPC_TALENT_2H,1,LPCOST_TALENT_2H_1))
	{
		AI_Output(self,other,"Sld_700_Lee_ZWEIHAND1_Info_08_02");	//Nun, dann gehen wir zuerst die Grundbegriffe durch.
		AI_Output(self,other,"Sld_700_Lee_ZWEIHAND1_Info_08_03");	//Halte das Schwert waagerecht. Um den Gegner mit einer gro�en Waffe anzugreifen, brauchst du viel Schwung.
		AI_Output(self,other,"Sld_700_Lee_ZWEIHAND1_Info_08_04");	//Hole mit der Waffe aus und schlage am besten direkt von oben. Meistens reicht das aus, um den Gegner zu Boden zu strecken.
		AI_Output(self,other,"Sld_700_Lee_ZWEIHAND1_Info_08_05");	//Nutze den Schwung, wenn die Waffe unten ist, um direkt wieder nach oben zu schlagen.
		AI_Output(self,other,"Sld_700_Lee_ZWEIHAND1_Info_08_06");	//Seitliche Schl�ge lassen sich ausgezeichnet mit einem Zweih�nder koordinieren. Damit h�ltst du dir die Gegner vom Hals.
		AI_Output(self,other,"Sld_700_Lee_ZWEIHAND1_Info_08_07");	//Das sollte erst einmal reichen. �be das!
		Sld_700_Lee_ZWEIHAND1.permanent = 0;
	};
};


instance Sld_700_Lee_ZWEIHAND2(C_Info)
{
	npc = Sld_700_Lee;
	condition = Sld_700_Lee_ZWEIHAND2_Condition;
	information = Sld_700_Lee_ZWEIHAND2_Info;
	important = 0;
	permanent = 1;
	description = B_BuildLearnString(NAME_Learn2h_2,LPCOST_TALENT_2H_2,0);
};


func int Sld_700_Lee_ZWEIHAND2_Condition()
{
	if((Npc_GetTalentSkill(hero,NPC_TALENT_2H) == 1) && (Npc_GetTrueGuild(hero) == GIL_SLD))
	{
		return TRUE;
	};
};

func void Sld_700_Lee_ZWEIHAND2_Info()
{
	AI_Output(other,self,"Sld_700_Lee_ZWEIHAND2_Info_15_01");	//Ich m�chte mehr �ber den zweih�ndigen Kampf lernen.
	if(B_GiveSkill(other,NPC_TALENT_2H,2,LPCOST_TALENT_2H_2))
	{
		AI_Output(self,other,"Sld_700_Lee_ZWEIHAND2_Info_08_02");	//�ndere zun�chst deine Grundhaltung. Halte das Schwert aufrecht, fasse den Griff mit beiden H�nden und halte es seitlich am K�rper.
		AI_Output(self,other,"Sld_700_Lee_ZWEIHAND2_Info_08_03");	//Schlage schnell von oben und lass die Klinge �ber deine Schulter gleiten. Nun hast du die M�glichkeit, einen schnellen Schlag nach rechts zu machen.
		AI_Output(self,other,"Sld_700_Lee_ZWEIHAND2_Info_08_04");	//Damit bietest du dem Gegner keine Chance, an dich ranzukommen.
		AI_Output(self,other,"Sld_700_Lee_ZWEIHAND2_Info_08_05");	//Sonst schlage wieder von links oben nach vorne, um so den Gegner zur�ckzutreiben.
		AI_Output(self,other,"Sld_700_Lee_ZWEIHAND2_Info_08_06");	//Eine schnelle K�rperdrehung verleiht deinem n�chsten Schlag die n�tige Wucht, um den Gegner zu Boden zu zwingen.
		AI_Output(self,other,"Sld_700_Lee_ZWEIHAND2_Info_08_07");	//Falls das nicht ausreichen sollte, dann nutze den �brigen Schwung, um die Klinge noch einmal tanzen zu lassen.
		AI_Output(self,other,"Sld_700_Lee_ZWEIHAND2_Info_08_08");	//Geh nach deinem Angriff in den Block und suche eine L�cke, damit du erneut zuschlagen kannst.
		AI_Output(self,other,"Sld_700_Lee_ZWEIHAND2_Info_08_09");	//Abwechslung in den Kampfbewegungen und Positionswechsel sind der Schl�ssel zum Sieg.
		Sld_700_Lee_ZWEIHAND2.permanent = 0;
	};
};


var int lee_soldday;

instance DIA_LEE_DAILYSOLD(C_Info)
{
	npc = Sld_700_Lee;
	nr = 3;
	condition = dia_lee_dailysold_condition;
	information = dia_lee_dailysold_info;
	permanent = 1;
	description = "Ich will meinen heutigen Sold.";
};


func int dia_lee_dailysold_condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_SLD)
	{
		return 1;
	};
};

func void dia_lee_dailysold_info()
{
	AI_Output(other,self,"DIA_Lee_DailySold_15_00");	//Ich will meinen heutigen Sold.
	if(LEE_SOLDDAY != Wld_GetDay())
	{
		AI_Output(self,other,"DIA_Lee_DailySold_05_01");	//Gut. Hier sind deine 10 Erz, wie sie jeder S�ldner bekommt.
		CreateInvItems(self,ItMiNugget,10);
		B_GiveInvItems(self,other,ItMiNugget,10);
		LEE_SOLDDAY = Wld_GetDay();
	}
	else
	{
		AI_Output(self,other,"DIA_Lee_DailySold_05_02");	//Heute gibt es nicht's mehr. Komm morgen wieder.
	};
};

