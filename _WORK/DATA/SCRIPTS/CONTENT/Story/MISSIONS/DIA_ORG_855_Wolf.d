
instance DIA_ORG_855_Wolf_Exit(C_Info)
{
	npc = ORG_855_Wolf;
	nr = 999;
	condition = DIA_ORG_855_Wolf_Exit_Condition;
	information = DIA_ORG_855_Wolf_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_ORG_855_Wolf_Exit_Condition()
{
	return TRUE;
};

func void DIA_ORG_855_Wolf_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Wolf_Hello(C_Info)
{
	npc = ORG_855_Wolf;
	nr = 1;
	condition = DIA_Wolf_Hello_Condition;
	information = DIA_Wolf_Hello_Info;
	permanent = 0;
	description = "Wer bist du?";
};


func int DIA_Wolf_Hello_Condition()
{
	return TRUE;
};

func void DIA_Wolf_Hello_Info()
{
	AI_Output(other,self,"DIA_Wolf_Hello_15_00");	//Wer bist du?
	AI_Output(self,other,"DIA_Wolf_Hello_09_01");	//Ich bin Wolf, der Rüstungsbauer.
	Log_CreateTopic(GE_TraderNC,LOG_NOTE);
	B_LogEntry(GE_TraderNC,"Wolf versorgt die Banditen mit RÜSTUNGEN. Er ist normalerweise vor seiner Hütte in der Großen Wohnhöhle zu finden.");
};


instance DIA_Wolf_GreetORG(C_Info)
{
	npc = ORG_855_Wolf;
	nr = 1;
	condition = DIA_Wolf_GreetORG_Condition;
	information = DIA_Wolf_GreetORG_Info;
	permanent = 0;
	important = 1;
};


func int DIA_Wolf_GreetORG_Condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_ORG)
	{
		return TRUE;
	};
};

func void DIA_Wolf_GreetORG_Info()
{
	AI_Output(self,other,"DIA_Wolf_GreetORG_09_00");	//Hey! Du bist jetzt einer von uns, Kleiner.
};


instance Org_855_Wolf_TRADE(C_Info)
{
	npc = ORG_855_Wolf;
	nr = 2;
	condition = Org_855_Wolf_TRADE_Condition;
	information = Org_855_Wolf_TRADE_Info;
	permanent = 0;
	description = "Handelst du noch mit was anderem?";
};


func int Org_855_Wolf_TRADE_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Wolf_Hello))
	{
		return TRUE;
	};
};

func void Org_855_Wolf_TRADE_Info()
{
	AI_Output(other,self,"Org_855_Wolf_TRADE_15_00");	//Handelst du noch mit was anderem?
	AI_Output(self,other,"Org_855_Wolf_TRADE_09_01");	//Ich kaufe Felle und Häute von den Jägern. Wenn du an so was rankommst, kauf' ich dir die Sachen ab.
};


instance ORG_855_WOLF_TRADENOW(C_Info)
{
	npc = ORG_855_Wolf;
	nr = 1;
	condition = org_855_wolf_tradenow_condition;
	information = org_855_wolf_tradenow_info;
	permanent = 1;
	description = "Zeig' mir deine Ware.";
	trade = 1;
};


func int org_855_wolf_tradenow_condition()
{
	if(Npc_KnowsInfo(hero,Org_855_Wolf_TRADE))
	{
		return TRUE;
	};
};

func void org_855_wolf_tradenow_info()
{
	AI_Output(other,self,"STT_336_cavalorn_TRADE_Info_15_01");	//Zeig' mir deine Ware.
};


instance Org_855_Wolf_WhereHunter(C_Info)
{
	npc = ORG_855_Wolf;
	nr = 3;
	condition = Org_855_Wolf_WhereHunter_Condition;
	information = Org_855_Wolf_WhereHunter_Info;
	permanent = 1;
	description = "Wie komme ich an Felle und Häute?";
};


func int Org_855_Wolf_WhereHunter_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Wolf_Hello))
	{
		return TRUE;
	};
};

func void Org_855_Wolf_WhereHunter_Info()
{
	AI_Output(other,self,"Org_855_Wolf_WhereHunter_15_00");	//Wie komme ich an Felle und Häute?
	AI_Output(self,other,"Org_855_Wolf_WhereHunter_10_01");	//Wenn du dem Pfad zum Alten Lager folgst, kommst du an einer alten Hütte vorbei. Die gehört Aidan.
	AI_Output(self,other,"Org_855_Wolf_WhereHunter_10_02");	//Er ist aber nicht immer da. Soweit ich weiß, treibt er sich oft weit im Osten der Kolonie herum.
	AI_Output(self,other,"Org_855_Wolf_WhereHunter_10_03");	//Er kann dir beibringen wie du Tieren das Fell abziehst.
	AI_Output(self,other,"Org_855_Wolf_WhereHunter_10_04");	//Drax und Ratford müssten auch irgendwo in der Kolonie herumtreiben. Drax ist ein erfahrener Jäger und kann dir sicher was beibringen.
	AI_Output(self,other,"Org_855_Wolf_WhereHunter_10_05");	//Gestath habe ich beim letzten mal auf dem Weg zur Freien Mine gesehen. Er hat dort irgendwo eine Lagerstelle.
	AI_Output(self,other,"Org_855_Wolf_WhereHunter_10_06");	//Achja und soweit ich weiß, haben die Räuber in den Bergen auch noch einen Jäger. Ich hab's allerdings nur gehört, keine Ahnung ob da was dran ist.
};


instance DIA_Wolf_SellArmor(C_Info)
{
	npc = ORG_855_Wolf;
	nr = 4;
	condition = DIA_Wolf_SellArmor_Condition;
	information = DIA_Wolf_SellArmor_Info;
	permanent = 1;
	description = "Ich suche eine bessere Rüstung.";
};


func int DIA_Wolf_SellArmor_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Wolf_Hello) && !Npc_KnowsInfo(hero,Info_Wolf_ARMORFINISHED))
	{
		return TRUE;
	};
};

func void DIA_Wolf_SellArmor_Info()
{
	AI_Output(other,self,"DIA_Wolf_SellArmor_15_00");	//Ich suche eine bessere Rüstung.
	if((Npc_GetTrueGuild(other) == GIL_ORG) || (Npc_GetTrueGuild(other) == GIL_SLD))
	{
		AI_Output(self,other,"DIA_Wolf_SellArmor_09_01");	//Jetzt, wo du einer von uns bist, kann ich dir eine verkaufen.
		Info_ClearChoices(DIA_Wolf_SellArmor);
		Info_AddChoice(DIA_Wolf_SellArmor,DIALOG_BACK,DIA_Wolf_SellArmor_BACK);
		Info_AddChoice(DIA_Wolf_SellArmor,B_BuildBuyArmorString(NAME_WolfBandits,VALUE_ORG_ARMOR_M),DIA_Wolf_SellArmor_M);
		Info_AddChoice(DIA_Wolf_SellArmor,B_BuildBuyArmorString(NAME_WolfHeavyBandits,VALUE_ORG_ARMOR_H),DIA_Wolf_SellArmor_H);
	}
	else
	{
		AI_Output(self,other,"DIA_Wolf_SellArmor_WRONGGUILD_09_00");	//Ich kann dir keine verkaufen. Lares reißt mir den Kopf ab, wenn ich unsere Rüstungen an Fremde verkaufe.
	};
};

func void DIA_Wolf_SellArmor_BACK()
{
	Info_ClearChoices(DIA_Wolf_SellArmor);
};

func void DIA_Wolf_SellArmor_M()
{
	AI_Output(other,self,"DIA_Wolf_SellArmor_M_15_01");	//Ich möchte die mittlere Rüstung haben.
	if(Npc_HasItems(hero,ItMiNugget) < VALUE_ORG_ARMOR_M)
	{
		AI_Output(self,other,"DIA_Wolf_SellArmor_M_09_02");	//Ohne Erz gibt es auch keine Rüstung.
	}
	else
	{
		AI_Output(self,other,"DIA_Wolf_SellArmor_M_09_03");	//Eine gute Rüstung.Noch nicht so gut, wie das, was ich trage, aber sie bietet ausreichend Schutz.
		B_GiveInvItems(hero,self,ItMiNugget,VALUE_ORG_ARMOR_M);
		CreateInvItem(hero,org_armor_m);
		CreateInvItem(self,ItAmArrow);
		B_GiveInvItems(self,hero,ItAmArrow,1);
		Npc_RemoveInvItem(hero,ItAmArrow);
	};
};

func void DIA_Wolf_SellArmor_H()
{
	AI_Output(other,self,"DIA_Wolf_SellArmor_H_15_01");	//Kannst du mir eine schwere Rüstung verkaufen?
	if(Npc_HasItems(hero,ItMiNugget) < VALUE_ORG_ARMOR_H)
	{
		AI_Output(self,other,"DIA_Wolf_SellArmor_H_09_02");	//Ohne Erz gibt es auch keine Rüstung.
	}
	else
	{
		AI_Output(self,other,"DIA_Wolf_SellArmor_H_09_03");	//Diese Rüstung wird dich vor allen Gefahren schützen! Ich trage sie auch und habe bisher überlebt. Nicht zuletzt dank der Rüstung.
		B_GiveInvItems(hero,self,ItMiNugget,VALUE_ORG_ARMOR_H);
		CreateInvItem(hero,org_armor_h);
		CreateInvItem(self,ItAmArrow);
		B_GiveInvItems(self,hero,ItAmArrow,1);
		Npc_RemoveInvItem(hero,ItAmArrow);
	};
};


instance ORG_855_Wolf_TRAINOFFER(C_Info)
{
	npc = ORG_855_Wolf;
	nr = 5;
	condition = ORG_855_Wolf_TRAINOFFER_Condition;
	information = ORG_855_Wolf_TRAINOFFER_Info;
	important = 0;
	permanent = 0;
	description = "Ich möchte den richtigen Umgang mit dem Bogen lernen.";
};


func int ORG_855_Wolf_TRAINOFFER_Condition()
{
	if((Npc_GetTalentSkill(hero,NPC_TALENT_BOW) != 2) && Npc_KnowsInfo(hero,DIA_Wolf_Hello))
	{
		return TRUE;
	};
};

func void ORG_855_Wolf_TRAINOFFER_Info()
{
	AI_Output(other,self,"ORG_855_Wolf_TRAINOFFER_Info_15_01");	//Ich möchte den richtigen Umgang mit dem Bogen lernen.
	AI_Output(self,other,"ORG_855_Wolf_TRAINOFFER_Info_09_02");	//Kann ich dir beibringen. Das ist aber keine Gefälligkeit, denn auch ich muss essen.
	AI_Output(other,self,"ORG_855_Wolf_TRAINOFFER_Info_15_03");	//Wie viel?
	AI_Output(self,other,"ORG_855_Wolf_TRAINOFFER_Info_09_04");	//Alles, was ich dir beibringe, kostet dich 50 Erz. Ich feilsche nicht.
	Log_CreateTopic(GE_TeacherNC,LOG_NOTE);
	B_LogEntry(GE_TeacherNC,"Wolf der Bandit kann mir den Umgang mit dem BOGEN beibringen.");
};


instance ORG_855_Wolf_TRAIN(C_Info)
{
	npc = ORG_855_Wolf;
	nr = 5;
	condition = ORG_855_Wolf_TRAIN_Condition;
	information = ORG_855_Wolf_TRAIN_Info;
	important = 0;
	permanent = 0;
	description = B_BuildLearnString(NAME_LearnBow_1,LPCOST_TALENT_BOW_1,50);
};


func int ORG_855_Wolf_TRAIN_Condition()
{
	if(Npc_KnowsInfo(hero,ORG_855_Wolf_TRAINOFFER) && (Npc_GetTalentSkill(hero,NPC_TALENT_BOW) == 0))
	{
		return TRUE;
	};
};

func void ORG_855_Wolf_TRAIN_Info()
{
	AI_Output(other,self,"ORG_855_Wolf_TRAIN_Info_15_01");	//Bring mir den Umgang mit dem Bogen bei.
	if(Npc_HasItems(hero,ItMiNugget) >= 50)
	{
		if(B_GiveSkill(hero,NPC_TALENT_BOW,1,LPCOST_TALENT_BOW_1))
		{
			AI_Output(self,other,"ORG_855_Wolf_TRAIN_Info_09_02");	//Deine Geschicklichkeit ist das Maß für einen Treffer. Je geschickter du wirst, umso genauer werden deine Pfeile ihr Ziel treffen.
			AI_Output(self,other,"ORG_855_Wolf_TRAIN_Info_09_03");	//Dein Talent bestimmt, auf welche Reichweite du dein Ziel noch triffst. Um ein guter Schütze zu werden, solltest du beides zu gleichen Teilen steigern.
			B_GiveInvItems(hero,self,ItMiNugget,50);
		};
	};
};


instance ORG_855_Wolf_TRAINAGAIN(C_Info)
{
	npc = ORG_855_Wolf;
	nr = 5;
	condition = ORG_855_Wolf_TRAINAGAIN_Condition;
	information = ORG_855_Wolf_TRAINAGAIN_Info;
	important = 0;
	permanent = 0;
	description = B_BuildLearnString(NAME_LearnBow_2,LPCOST_TALENT_BOW_2,50);
};


func int ORG_855_Wolf_TRAINAGAIN_Condition()
{
	if(Npc_KnowsInfo(hero,ORG_855_Wolf_TRAINOFFER) && (Npc_GetTalentSkill(hero,NPC_TALENT_BOW) == 1))
	{
		return TRUE;
	};
};

func void ORG_855_Wolf_TRAINAGAIN_Info()
{
	AI_Output(other,self,"ORG_855_Wolf_TRAINAGAIN_Info_15_01");	//Ich will mein Talent mit dem Bogen verbessern.
	if(Npc_HasItems(hero,ItMiNugget) >= 50)
	{
		if(B_GiveSkill(hero,NPC_TALENT_BOW,2,LPCOST_TALENT_BOW_2))
		{
			AI_Output(self,other,"ORG_855_Wolf_TRAINAGAIN_Info_09_02");	//Du bist jetzt schon ein guter Jäger. Erfahre nun das letzte Wissen.
			AI_Output(self,other,"ORG_855_Wolf_TRAINAGAIN_Info_09_03");	//Um ein Meisterschütze zu werden, musst du aufhören, einer sein zu wollen.
			AI_Output(self,other,"ORG_855_Wolf_TRAINAGAIN_Info_09_04");	//Erkenne das Gesetz von Auge, Spannkraft, Flugbahn und Ziel. Sei immer auf der Hut, sei immer bereit.
			AI_Output(self,other,"ORG_855_Wolf_TRAINAGAIN_Info_09_05");	//Die Technik beherrschst du schon lange zur Genüge. Geh einfach hin und wende dein Wissen und Können an.
			B_GiveInvItems(hero,self,ItMiNugget,50);
		};
	};
};


instance ORG_855_Wolf_Teach(C_Info)
{
	npc = ORG_855_Wolf;
	nr = 6;
	condition = ORG_855_Wolf_Teach_Condition;
	information = ORG_855_Wolf_Teach_Info;
	permanent = 1;
	description = "Kannst du mir was beibringen?";
};


func int ORG_855_Wolf_Teach_Condition()
{
	if((Npc_GetTrueGuild(hero) == GIL_ORG) || (Npc_GetTrueGuild(hero) == GIL_SLD))
	{
		return TRUE;
	};
};

func void ORG_855_Wolf_Teach_Info()
{
	AI_Output(other,self,"ORG_855_Wolf_Teach_15_00");	//Kannst du mir was beibringen?
	AI_Output(self,other,"ORG_855_Wolf_Teach_09_01");	//Deine Geschicklichkeit bestimmt den Jagderfolg.
	if(log_wolftrain == FALSE)
	{
		Log_CreateTopic(GE_TeacherNC,LOG_NOTE);
		B_LogEntry(GE_TeacherNC,"Wolf der Bandit, kann mir zeigen, wie ich mein GESCHICK verbessere.");
		log_wolftrain = TRUE;
	};
	Info_ClearChoices(ORG_855_Wolf_Teach);
	Info_AddChoice(ORG_855_Wolf_Teach,DIALOG_BACK,ORG_855_Wolf_Teach_BACK);
	Info_AddChoice(ORG_855_Wolf_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),ORG_855_Wolf_Teach_DEX_5);
	Info_AddChoice(ORG_855_Wolf_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),ORG_855_Wolf_Teach_DEX_1);
};

func void ORG_855_Wolf_Teach_BACK()
{
	Info_ClearChoices(ORG_855_Wolf_Teach);
};

func void ORG_855_Wolf_Teach_DEX_1()
{
	B_BuyAttributePoints(other,ATR_DEXTERITY,LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices(ORG_855_Wolf_Teach);
	Info_AddChoice(ORG_855_Wolf_Teach,DIALOG_BACK,ORG_855_Wolf_Teach_BACK);
	Info_AddChoice(ORG_855_Wolf_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),ORG_855_Wolf_Teach_DEX_5);
	Info_AddChoice(ORG_855_Wolf_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),ORG_855_Wolf_Teach_DEX_1);
};

func void ORG_855_Wolf_Teach_DEX_5()
{
	B_BuyAttributePoints(other,ATR_DEXTERITY,5 * LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices(ORG_855_Wolf_Teach);
	Info_AddChoice(ORG_855_Wolf_Teach,DIALOG_BACK,ORG_855_Wolf_Teach_BACK);
	Info_AddChoice(ORG_855_Wolf_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5 * LPCOST_ATTRIBUTE_DEXTERITY,0),ORG_855_Wolf_Teach_DEX_5);
	Info_AddChoice(ORG_855_Wolf_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),ORG_855_Wolf_Teach_DEX_1);
};


instance Org_855_Wolf_SELLBOW(C_Info)
{
	npc = ORG_855_Wolf;
	nr = 1;
	condition = Org_855_Wolf_SELLBOW_Condition;
	information = Org_855_Wolf_SELLBOW_Info;
	important = 0;
	permanent = 0;
	description = "Wo kann ich denn hier einen Bogen bekommen?";
};


func int Org_855_Wolf_SELLBOW_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Wolf_Hello))
	{
		return TRUE;
	};
};

func void Org_855_Wolf_SELLBOW_Info()
{
	AI_Output(other,self,"Org_855_Wolf_SELLBOW_Info_15_01");	//Wo kann ich denn hier einen Bogen bekommen?
	AI_Output(self,other,"Org_855_Wolf_SELLBOW_Info_09_02");	//Da bist du bei mir genau richtig. Für gutes Erz bekommst du gute Ware.
	Log_CreateTopic(GE_TraderNC,LOG_NOTE);
	B_LogEntry(GE_TraderNC,"Wolf, der Bandit, handelt mit BÖGEN.");
};


instance Info_Wolf_GOOD(C_Info)
{
	npc = ORG_855_Wolf;
	condition = Info_Wolf_GOOD_Condition;
	information = Info_Wolf_GOOD_Info;
	important = 0;
	permanent = 0;
	description = "Gorn sagt, du wolltest dringend mit mir sprechen?";
};


func int Info_Wolf_GOOD_Condition()
{
	if(Gorn_GotoWolf == TRUE)
	{
		return TRUE;
	};
};

func void Info_Wolf_GOOD_Info()
{
	AI_Output(hero,self,"Info_Wolf_GOOD_15_01");	//Gorn sagt, du wolltest dringend mit mir sprechen?
	AI_Output(self,hero,"Info_Wolf_GOOD_09_02");	//Gut, dass du vorher noch vorbeikommst!
	if(!Npc_KnowsInfo(hero,Info_Gorn_FMCENTRANCE))
	{
		AI_Output(hero,self,"Info_Wolf_GOOD_15_03");	//Vor was?
		AI_Output(self,hero,"Info_Wolf_GOOD_09_04");	//Vor eurem Besuch in der nicht mehr ganz so Freien Mine.
	};
};


instance Info_Wolf_SPEAK(C_Info)
{
	npc = ORG_855_Wolf;
	condition = Info_Wolf_SPEAK_Condition;
	information = Info_Wolf_SPEAK_Info;
	important = 0;
	permanent = 0;
	description = "Worum geht es?";
};


func int Info_Wolf_SPEAK_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Wolf_GOOD))
	{
		return TRUE;
	};
};

func void Info_Wolf_SPEAK_Info()
{
	AI_Output(hero,self,"Info_Wolf_SPEAK_15_01");	//Worum geht es?
	AI_Output(self,hero,"Info_Wolf_SPEAK_09_02");	//Ich hatte neulich eine Idee, wie wir völlig neue Rüstungen herstellen können.
	AI_Output(hero,self,"Info_Wolf_SPEAK_15_03");	//Aha, und wie?
	AI_Output(self,hero,"Info_Wolf_SPEAK_09_04");	//Das härteste Material, dass ich kenne, sind die Panzerplatten der Minecrawler.
	AI_Output(self,hero,"Info_Wolf_SPEAK_09_05");	//Nicht etwa die der kleinen, harmlosen Exemplare aus der jetzt verschütteten Mine von Gomez ...
	AI_Output(self,hero,"Info_Wolf_SPEAK_09_06");	//...NEEEEIN. Die nicht. In unserer Mine lebt eine wesentlich gefährlichere Unterart.
	AI_Output(self,hero,"Info_Wolf_SPEAK_09_07");	//Der Panzer dieser Biester ist fast nicht zu durchdringen!
	AI_Output(self,hero,"Info_Wolf_SPEAK_09_08");	//Wenn du mir einige dieser Panzerplatten bringen könntest, würde ich versuchen, daraus eine Rüstung herzustellen.
};


instance Info_Wolf_SKIN(C_Info)
{
	npc = ORG_855_Wolf;
	condition = Info_Wolf_SKIN_Condition;
	information = Info_Wolf_SKIN_Info;
	important = 0;
	permanent = 0;
	description = "Wie bekomme ich diese Platten von den Biestern ab?";
};


func int Info_Wolf_SKIN_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Wolf_SPEAK))
	{
		return TRUE;
	};
};

func void Info_Wolf_SKIN_Info()
{
	AI_Output(hero,self,"Info_Wolf_SKIN_15_01");	//Wie bekomme ich diese Platten von den Biestern ab?
	AI_Output(self,hero,"Info_Wolf_SKIN_09_02");	//Das ist relativ einfach. Die Rückenplatten sind nur an deren Rändern mit dem Körper verwachsen.
	AI_Output(self,hero,"Info_Wolf_SKIN_09_03");	//Nimm einfach ein Rasiermesser und schneide halbschräg an den Rändern entlang.
	AI_Output(hero,self,"Info_Wolf_SKIN_15_04");	//Okay, kapiert! Mal sehen, ob ich solche Panzerplatten finden kann.
	Knows_GetMCPlates = TRUE;
	PrintScreen("Lerne: Panzerplatten herausschneiden",-1,-1,"FONT_OLD_20_WHITE.TGA",3);
	Log_CreateTopic(CH4_MCPlateArmor,LOG_MISSION);
	Log_SetTopicStatus(CH4_MCPlateArmor,LOG_RUNNING);
	B_LogEntry(CH4_MCPlateArmor,"Der Bandit Wolf aus dem neuen Lager bot mir an, aus den Panzerplatten von Minecrawlern eine Rüstung anzufertigen. Er zeigte mir, wie man die Panzerplatten von toten Crawlern entfernt.");
	Log_CreateTopic(GE_AnimalTrophies,LOG_NOTE);
	B_LogEntry(GE_AnimalTrophies,"Wissen über Platten entfernen - Minecrawler - Krieger");
	AI_StopProcessInfos(self);
};


instance Info_Wolf_PROFIT(C_Info)
{
	npc = ORG_855_Wolf;
	condition = Info_Wolf_PROFIT_Condition;
	information = Info_Wolf_PROFIT_Info;
	important = 0;
	permanent = 0;
	description = "Und diese Information gibst du mir völlig uneigennützig?";
};


func int Info_Wolf_PROFIT_Condition()
{
	if(Npc_KnowsInfo(hero,Info_Wolf_SPEAK))
	{
		return TRUE;
	};
};

func void Info_Wolf_PROFIT_Info()
{
	AI_Output(hero,self,"Info_Wolf_PROFIT_15_01");	//Und diese Information gibst du mir völlig uneigennützig?
	AI_Output(self,hero,"Info_Wolf_PROFIT_09_02");	//Nicht ganz ... Wenn es mir gelingt, aus solchen Platten eine gute Rüstung zu zimmern, werde ich sehr schnell  ... sehr viel  ... Ach, lassen wird das!
};


instance Info_Wolf_MCPLATESFEW(C_Info)
{
	npc = ORG_855_Wolf;
	condition = Info_Wolf_MCPLATESFEW_Condition;
	information = Info_Wolf_MCPLATESFEW_Info;
	important = 0;
	permanent = 0;
	description = "Ich habe einige der Minecrawler-Panzerplatten eingesammelt!";
};


func int Info_Wolf_MCPLATESFEW_Condition()
{
	if(Knows_GetMCPlates && (Npc_HasItems(hero,ItAt_Crawler_02) > 0) && (Npc_HasItems(hero,ItAt_Crawler_02) < 15))
	{
		return TRUE;
	};
};

func void Info_Wolf_MCPLATESFEW_Info()
{
	AI_Output(hero,self,"Info_Wolf_MCPLATESFEW_15_01");	//Ich habe einige der Minecrawler-Panzerplatten eingesammelt!
	AI_Output(self,hero,"Info_Wolf_MCPLATESFEW_09_02");	//Zu wenig! Das reicht nicht für eine ganze Rüstung!
	AI_Output(self,hero,"Info_Wolf_MCPLATESFEW_09_03");	//Bring mir mehr von diesen Platten!
};


instance Info_Wolf_MCPLATESENOUGH(C_Info)
{
	npc = ORG_855_Wolf;
	condition = Info_Wolf_MCPLATESENOUGH_Condition;
	information = Info_Wolf_MCPLATESENOUGH_Info;
	important = 0;
	permanent = 0;
	description = "Ich habe jede Menge dieser Minecrawler-Panzerplatten eingesammelt!";
};


func int Info_Wolf_MCPLATESENOUGH_Condition()
{
	if(Knows_GetMCPlates && (Npc_HasItems(hero,ItAt_Crawler_02) >= 15))
	{
		return TRUE;
	};
};

func void Info_Wolf_MCPLATESENOUGH_Info()
{
	var int zufallsbelohnung;
	AI_Output(hero,self,"Info_Wolf_MCPLATESENOUGH_15_01");	//Ich habe jede Menge dieser Minecrawler-Panzerplatten eingesammelt!
	AI_Output(self,hero,"Info_Wolf_MCPLATESENOUGH_09_02");	//Fantastisch!!! Ich werde mich gleich an die Arbeit machen!
	if(Npc_GetTrueGuild(hero) == GIL_SLD)
	{
		AI_Output(hero,self,"Info_Wolf_MCPLATESENOUGH_15_03");	//Wie lange wirst du dafür brauchen?
		AI_Output(self,hero,"Info_Wolf_MCPLATESENOUGH_09_04");	//Ich habe nicht die geringste Ahnung. Das ist eine komplette Neuentwicklung, Mann!
		AI_Output(self,hero,"Info_Wolf_MCPLATESENOUGH_09_05");	//Schau einfach ab und zu bei mir rein, wenn du in der Nähe bist!
		MCPlatesDelivered = TRUE;
		B_LogEntry(CH4_MCPlateArmor,"Wolf hat 15 dieser Minecralwerplatten von mir erhalten. Er benötigt etwas Zeit und bat mich später wiederzukommen.");
		B_GiveXP(XP_DeliveredMCPlates);
		B_GiveInvItems(hero,self,ItAt_Crawler_02,15);
		AI_StopProcessInfos(self);
	}
	else if(Npc_GetTrueGuild(hero) != GIL_SLD)
	{
		AI_Output(self,hero,"Info_Wolf_MCPLATESENOUGH_19_01");	//Schade nur, dass du nicht zu uns gehört. Dann würde ich dir die Rüstung anfertigen.
		AI_Output(self,hero,"Info_Wolf_MCPLATESENOUGH_19_02");	//Als Lagerfremder, musst du leider ohne auskommen.
		AI_Output(self,hero,"Info_Wolf_MCPLATESENOUGH_19_03");	//Ich hab' sogar schon einen Kunden aus dem Lager, der sich für eine solche Rüstung interessiert.
		AI_Output(self,hero,"Info_Wolf_MCPLATESENOUGH_19_04");	//Aber ich hab' trotzdem was für dich. Deine Arbeit soll ja nicht umsonst gewesen sein. Hier nimm!
		Log_SetTopicStatus(CH4_MCPlateArmor,LOG_SUCCESS);
		B_LogEntry(CH4_MCPlateArmor,"Nachdem ich Wolf 15 Minecrawlerplatten gebracht hatte, erklärte er mir, dass er die Rüstung nur für Lagerangehörige bauen würde. Somit muss ich also ohne auskommen. Stattdessen bekam ich einen wertvollen Trank.");
		B_GiveXP(XP_GORPSIPLATEARMOR);
		Mdl_SetVisualBody(org_5033_gestath,"hum_body_Naked0",0,3,"Hum_Head_Psionic",12,0,crw_armor_h);
		Npc_RemoveInvItem(org_5033_gestath,ItRw_Bow_Long_01);
		Npc_RemoveInvItem(org_5033_gestath,ItMw_1H_Mace_War_02);
		CreateInvItems(org_5033_gestath,ItMw_2H_Sword_Heavy_02,1);
		AI_EquipBestMeleeWeapon(org_5033_gestath);
		AI_EquipBestArmor(org_5033_gestath);
		B_GiveInvItems(hero,self,ItAt_Crawler_02,15);
		MCPlatesDelivered = TRUE;
		zufallsbelohnung = Hlp_Random(100);
		if(zufallsbelohnung >= 75)
		{
			CreateInvItem(self,ItFo_Potion_Dex_03);
			B_GiveInvItems(self,hero,ItFo_Potion_Dex_03,1);
		}
		else if(zufallsbelohnung >= 50)
		{
			CreateInvItem(self,ItFo_Potion_Strength_03);
			B_GiveInvItems(self,hero,ItFo_Potion_Strength_03,1);
		}
		else if(zufallsbelohnung >= 25)
		{
			CreateInvItem(self,ItFo_Potion_Health_Perma_03);
			B_GiveInvItems(self,hero,ItFo_Potion_Health_Perma_03,1);
		};
		AI_StopProcessInfos(self);
	};
};


instance Info_Wolf_ARMORINWORK(C_Info)
{
	npc = ORG_855_Wolf;
	condition = Info_Wolf_ARMORINWORK_Condition;
	information = Info_Wolf_ARMORINWORK_Info;
	important = 0;
	permanent = 1;
	description = "Wie weit bist du mit der Rüstung?";
};


func int Info_Wolf_ARMORINWORK_Condition()
{
	if((MCPlatesDelivered == TRUE) && (FreemineOrc_LookingUlumulu != LOG_SUCCESS) && (Npc_GetTrueGuild(hero) == GIL_SLD))
	{
		return TRUE;
	};
};

func void Info_Wolf_ARMORINWORK_Info()
{
	AI_Output(hero,self,"Info_Wolf_ARMORINWORK_15_01");	//Wie weit bist du mit der Rüstung?
	AI_Output(self,hero,"Info_Wolf_ARMORINWORK_09_02");	//Dauert noch, Mann! Diese Platten sind verdammt harter Tobak. Ich habe noch keinen Weg gefunden, sie aneinander zu befestigen!
	AI_Output(self,hero,"Info_Wolf_ARMORINWORK_09_03");	//Gib mir noch etwas Zeit, ich bekomme das schon hin!
	AI_StopProcessInfos(self);
};


instance Info_Wolf_ARMORFINISHED(C_Info)
{
	npc = ORG_855_Wolf;
	condition = Info_Wolf_ARMORFINISHED_Condition;
	information = Info_Wolf_ARMORFINISHED_Info;
	important = 0;
	permanent = 0;
	description = "Wie weit bist du mit der Rüstung? ";
};


func int Info_Wolf_ARMORFINISHED_Condition()
{
	if((MCPlatesDelivered == TRUE) && (FreemineOrc_LookingUlumulu == LOG_SUCCESS) && (Npc_GetTrueGuild(hero) == GIL_SLD))
	{
		return TRUE;
	};
};

func void Info_Wolf_ARMORFINISHED_Info()
{
	AI_Output(hero,self,"Info_Wolf_ARMORFINISHED_15_01");	//Wie weit bist du mit der Rüstung?
	AI_Output(self,hero,"Info_Wolf_ARMORFINISHED_09_02");	//Ich habe endlich einen Weg gefunden, diese üblen Panzerplatten aneinander zu befestigen!
	AI_Output(hero,self,"Info_Wolf_ARMORFINISHED_15_03");	//Das heißt, die Rüstung ist fertig?
	AI_Output(self,hero,"Info_Wolf_ARMORFINISHED_09_04");	//Ja, Mann. Hier ist sie. Scheint tatsächlich noch härter zu sein als alles, was in unserem Lager so getragen wird.
	AI_Output(hero,self,"Info_Wolf_ARMORFINISHED_15_05");	//Danke, du hast was gut bei mir!
	AI_Output(self,hero,"Info_Wolf_ARMORFINISHED_09_06");	//Ach, ist schon in Ordnung! Ich komme schon auf meine Kosten!
	B_LogEntry(CH4_MCPlateArmor,"Die Rüstung ist fertig. Ein ausgezeichnetes Stück Arbeit und der beste Rüstungsschutz, den ich bisher gesehen habe.");
	Log_SetTopicStatus(CH4_MCPlateArmor,LOG_SUCCESS);
	B_GiveXP(XP_GorMCPlateArmor);
	CreateInvItem(self,crw_armor_h);
	B_GiveInvItems(self,hero,crw_armor_h,1);
};


instance INFO_WOLF_CRAFT(C_Info)
{
	npc = ORG_855_Wolf;
	nr = 9;
	condition = info_wolf_craft_condition;
	information = info_wolf_craft_info;
	important = 0;
	permanent = 0;
	description = "Kannst du mir eine Rüstung bauen?";
};


func int info_wolf_craft_condition()
{
	if(Npc_KnowsInfo(hero,dia_gestath_armor))
	{
		return TRUE;
	};
};

func void info_wolf_craft_info()
{
	AI_Output(hero,self,"Info_Wolf_CRAFT_15_01");	//Kannst du mir eine Rüstung bauen?
	AI_Output(self,hero,"Info_Wolf_CRAFT_09_02");	//Könnte ich tun, allerdings hab' ich nicht genug Sachen dafür da um dir eine zu bauen.
	AI_Output(hero,self,"Info_Wolf_CRAFT_09_03");	//Was wenn ich dir die Sachen besorge?
	AI_Output(self,hero,"Info_Wolf_CRAFT_09_04");	//Das wär' was anderes. Allerdings solltest du dich mit der Jagd auskennen, weil ich Felle, Häute und weitere Sachen dafür benötige.
	AI_Output(self,hero,"Info_Wolf_CRAFT_09_05");	//Umsonst gibt es die natürlich nicht, ich muss ja auch auf meine Kosten kommen.
	Log_CreateTopic(GE_TraderNC,LOG_NOTE);
	B_LogEntry(GE_TraderNC,"Wenn ich Wolf Teile für Rüstungen bringe, kann er mir daraus welche herstellen.");
};


instance INFO_WOLF_CRAFT_WHICH(C_Info)
{
	npc = ORG_855_Wolf;
	nr = 9;
	condition = info_wolf_craft_which_condition;
	information = info_wolf_craft_which_info;
	important = 0;
	permanent = 1;
	description = "Welche Rüstung kannst du mir bauen?";
};


func int info_wolf_craft_which_condition()
{
	if(Npc_KnowsInfo(hero,info_wolf_craft))
	{
		return TRUE;
	};
};

func void info_wolf_craft_which_info()
{
	AI_Output(hero,self,"Info_Wolf_CRAFT_WHICH_15_01");	//Welche Rüstung kannst du mir bauen?
	AI_Output(self,hero,"Info_Wolf_CRAFT_WHICH_09_02");	//Such' dir eine aus.
	Info_ClearChoices(info_wolf_craft_which);
	Info_AddChoice(info_wolf_craft_which,DIALOG_BACK,info_wolf_craft_which_back);
	Info_AddChoice(info_wolf_craft_which,"Wolfsfellrüstung (4 Wolfsfelle, 3 Zähne, 2 Krallen, 600 Erz)",info_wolf_craft_which_wolf);
	Info_AddChoice(info_wolf_craft_which,"Lurkerhautrüstung (5 Lurkerhäute, 2 Zähne, 2 Krallen, 800 Erz)",info_wolf_craft_which_lurker);
	if(Kapitel > 1)
	{
		Info_AddChoice(info_wolf_craft_which,"Orkhundfellrüstung (7 Orkhundfelle, 6 Zähne, 4 Krallen, 1250 Erz)",info_wolf_craft_which_orc);
	};
	if(Kapitel > 2)
	{
		Info_AddChoice(info_wolf_craft_which,"Sumpfhaihautrüstung (6 Sumpfhaihäute, 5 Sumpfhaizähne, 2 Krallen, 1700 Erz)",info_wolf_craft_which_shark);
	};
	if(Kapitel > 3)
	{
		Info_AddChoice(info_wolf_craft_which,"Trollfellrüstung (2 Trollfelle, 4 Trollhauer, 4 Krallen, 2050 Erz)",info_wolf_craft_which_troll);
	};
};

func void info_wolf_craft_which_back()
{
	Info_ClearChoices(info_wolf_craft_which);
};

func void info_wolf_craft_which_wolf()
{
	AI_Output(other,self,",	Info_Wolf_CRAFT_WHICH_Wolf_13_01");	//Ich möchte eine Wolfsfellrüstung.
	if((Npc_HasItems(other,ItAt_Wolf_01) >= 4) && (Npc_HasItems(other,ItAt_Claws_01) >= 2) && (Npc_HasItems(other,ItAt_Teeth_01) >= 3) && (Npc_HasItems(hero,ItMiNugget) >= VALUE_NON_ARMOR_K))
	{
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_Wolf_16_02");	//Sehr gut. Damit kann ich gut was anfangen.
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_Wolf_15_04");	//Ich hab' noch eine Rüstung da, die kann ich dir im Austausch für das Material geben.
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_Wolf_15_05");	//Viel spaß damit!
		B_GiveInvItems(other,self,ItAt_Wolf_01,4);
		B_GiveInvItems(other,self,ItAt_Claws_01,2);
		B_GiveInvItems(other,self,ItAt_Teeth_01,3);
		B_GiveInvItems(hero,self,ItMiNugget,VALUE_NON_ARMOR_K);
		CreateInvItem(hero,non_armor_l);
		CreateInvItem(self,ItAmArrow);
		B_GiveInvItems(self,hero,ItAmArrow,1);
		Npc_RemoveInvItem(hero,ItAmArrow);
		AI_EquipBestArmor(hero);
		Info_ClearChoices(info_wolf_craft_which);
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_Wolf_15_02");	//Du hast nicht genügend Material. Komm wieder wenn du mehr hast.
		AI_StopProcessInfos(self);
		Info_ClearChoices(info_wolf_craft_which);
	};
};

func void info_wolf_craft_which_orc()
{
	AI_Output(other,self,",	Info_Wolf_CRAFT_WHICH_Orc_12_01");	//Ich möchte eine Orkhundfellrüstung.
	if((Npc_HasItems(other,ItAt_Wolf_02) >= 7) && (Npc_HasItems(other,ItAt_Claws_01) >= 6) && (Npc_HasItems(other,ItAt_Teeth_01) >= 4) && (Npc_HasItems(hero,ItMiNugget) >= VALUE_NON_ARMOR_N))
	{
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_Wolf_16_02");	//Sehr gut. Damit kann ich gut was anfangen.
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_Wolf_15_04");	//Ich hab' noch eine Rüstung da, die kann ich dir im Austausch für das Material geben.
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_Wolf_15_05");	//Viel spaß damit!
		B_GiveInvItems(other,self,ItAt_Wolf_02,7);
		B_GiveInvItems(other,self,ItAt_Claws_01,6);
		B_GiveInvItems(other,self,ItAt_Teeth_01,4);
		B_GiveInvItems(hero,self,ItMiNugget,VALUE_NON_ARMOR_N);
		CreateInvItem(hero,non_armor_n);
		CreateInvItem(self,ItAmArrow);
		B_GiveInvItems(self,hero,ItAmArrow,1);
		Npc_RemoveInvItem(hero,ItAmArrow);
		AI_EquipBestArmor(hero);
		Info_ClearChoices(info_wolf_craft_which);
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_Wolf_15_02");	//Du hast nicht genügend Material. Komm wieder wenn du mehr hast.
		AI_StopProcessInfos(self);
		Info_ClearChoices(info_wolf_craft_which);
	};
};

func void info_wolf_craft_which_shark()
{
	AI_Output(other,self,",	Info_Wolf_CRAFT_WHICH_Wolf_34_01");	//Ich möchte eine Sumpfhaihautrüstung.
	if((Npc_HasItems(other,ItAt_Swampshark_01) >= 4) && (Npc_HasItems(other,ItAt_Claws_01) >= 2) && (Npc_HasItems(other,ItAt_Swampshark_02) >= 3) && (Npc_HasItems(hero,ItMiNugget) >= VALUE_NON_ARMOR_L))
	{
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_Shark_16_02");	//Sehr gut. Damit kann ich gut was anfangen.
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_Wolf_15_04");	//Ich hab' noch eine Rüstung da, die kann ich dir im Austausch für das Material geben.
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_Wolf_15_05");	//Viel spaß damit!
		B_GiveInvItems(other,self,ItAt_Swampshark_01,5);
		B_GiveInvItems(other,self,ItAt_Claws_01,2);
		B_GiveInvItems(other,self,ItAt_Swampshark_02,5);
		B_GiveInvItems(hero,self,ItMiNugget,VALUE_NON_ARMOR_L);
		CreateInvItem(hero,non_armor_k);
		CreateInvItem(self,ItAmArrow);
		B_GiveInvItems(self,hero,ItAmArrow,1);
		Npc_RemoveInvItem(hero,ItAmArrow);
		AI_EquipBestArmor(hero);
		Info_ClearChoices(info_wolf_craft_which);
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_Wolf_15_02");	//Du hast nicht genügend Material. Komm wieder wenn du mehr hast.
		AI_StopProcessInfos(self);
		Info_ClearChoices(info_wolf_craft_which);
	};
};

func void info_wolf_craft_which_lurker()
{
	AI_Output(other,self,",	Info_Wolf_CRAFT_WHICH_Lurker_34_01");	//Ich möchte eine Lurkerhautrüstung.
	if((Npc_HasItems(other,ItAt_Lurker_02) >= 5) && (Npc_HasItems(other,ItAt_Claws_01) >= 2) && (Npc_HasItems(other,ItAt_Teeth_01) >= 2) && (Npc_HasItems(hero,ItMiNugget) >= VALUE_NON_ARMOR_U))
	{
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_Lurker_16_02");	//Sehr gut. Damit kann ich gut was anfangen.
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_Lurker_15_04");	//Ich hab' noch eine Rüstung da, die kann ich dir im Austausch für das Material geben.
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_Lurker_15_05");	//Viel spaß damit!
		B_GiveInvItems(other,self,ItAt_Lurker_02,5);
		B_GiveInvItems(other,self,ItAt_Claws_01,2);
		B_GiveInvItems(other,self,ItAt_Teeth_01,2);
		B_GiveInvItems(hero,self,ItMiNugget,VALUE_NON_ARMOR_U);
		CreateInvItem(hero,non_armor_u);
		CreateInvItem(self,ItAmArrow);
		B_GiveInvItems(self,hero,ItAmArrow,1);
		Npc_RemoveInvItem(hero,ItAmArrow);
		AI_EquipBestArmor(hero);
		Info_ClearChoices(info_wolf_craft_which);
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_Lurker_15_02");	//Du hast nicht genügend Material. Komm wieder wenn du mehr hast.
		AI_StopProcessInfos(self);
		Info_ClearChoices(info_wolf_craft_which);
	};
};

func void info_wolf_craft_which_troll()
{
	AI_Output(other,self,",	Info_Wolf_CRAFT_WHICH_Troll_34_01");	//Ich möchte eine Trollfellrüstung.
	if((Npc_HasItems(other,ItAt_Troll_01) >= 2) && (Npc_HasItems(other,ItAt_Claws_01) >= 4) && (Npc_HasItems(other,ItAt_Troll_02) >= 4) && (Npc_HasItems(hero,ItMiNugget) >= VALUE_NON_ARMOR_W))
	{
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_Troll_16_02");	//Sehr gut. Damit kann ich gut was anfangen.
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_Troll_15_04");	//Ich hab' noch eine Rüstung da, die kann ich dir im Austausch für das Material geben.
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_Troll_15_05");	//Viel spaß damit!
		B_GiveInvItems(other,self,ItAt_Troll_01,2);
		B_GiveInvItems(other,self,ItAt_Claws_01,4);
		B_GiveInvItems(other,self,ItAt_Troll_02,4);
		B_GiveInvItems(hero,self,ItMiNugget,VALUE_NON_ARMOR_W);
		CreateInvItem(hero,non_armor_p);
		CreateInvItem(self,ItAmArrow);
		B_GiveInvItems(self,hero,ItAmArrow,1);
		Npc_RemoveInvItem(hero,ItAmArrow);
		AI_EquipBestArmor(hero);
		Info_ClearChoices(info_wolf_craft_which);
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_Troll_15_02");	//Du hast nicht genügend Material. Komm wieder wenn du mehr hast.
		AI_StopProcessInfos(self);
		Info_ClearChoices(info_wolf_craft_which);
	};
};


instance INFO_WOLF_CRAFT_WHICH_IMPROVE(C_Info)
{
	npc = ORG_855_Wolf;
	nr = 9;
	condition = info_wolf_craft_which_improve_condition;
	information = info_wolf_craft_which_improve_info;
	important = 0;
	permanent = 1;
	description = "Verbesserst du auch Rüstungen?";
};


func int info_wolf_craft_which_improve_condition()
{
	if(((Npc_GetTrueGuild(hero) == GIL_ORG) && Npc_KnowsInfo(hero,DIA_Wolf_Hello)) || ((Npc_GetTrueGuild(hero) == GIL_SLD) && Npc_KnowsInfo(hero,DIA_Wolf_Hello)) || ((Npc_GetTrueGuild(hero) == GIL_KDW) && Npc_KnowsInfo(hero,DIA_Wolf_Hello)))
	{
		return TRUE;
	};
};

func void info_wolf_craft_which_improve_info()
{
	AI_Output(hero,self,"Info_Wolf_CRAFT_WHICH_IMPROVE_15_01");	//Verbesserst du auch Rüstungen?
	AI_Output(self,hero,"Info_Wolf_CRAFT_WHICH_IMPROVE_09_02");	//Klar. Du musst mir nur eine Rüstung mitbringen die dafür geeignet ist und genügen Erz in der Tasche haben.
	Info_ClearChoices(info_wolf_craft_which_improve);
	Info_AddChoice(info_wolf_craft_which_improve,DIALOG_BACK,info_wolf_craft_which_improve_back);
	if(Npc_HasItems(other,org_armor_l) >= 1)
	{
		Info_AddChoice(info_wolf_craft_which_improve,"Verbesserte leichte Banditenkleidung (375 Erz)",info_wolf_craft_which_improve_orgl);
	};
	if(Npc_HasItems(other,org_armor_m) >= 1)
	{
		Info_AddChoice(info_wolf_craft_which_improve,"Verbesserte Banditenkleidung (525 Erz)",info_wolf_craft_which_improve_orgm);
	};
	if(Npc_HasItems(other,org_armor_h) >= 1)
	{
		Info_AddChoice(info_wolf_craft_which_improve,"Verbesserte schwere Banditenkleidung (600 Erz)",info_wolf_craft_which_improve_orgh);
	};
	if(Npc_HasItems(other,sld_armor_l) >= 1)
	{
		Info_AddChoice(info_wolf_craft_which_improve,"Verbesserte leichte Söldnerrüstung (675 Erz)",info_wolf_craft_which_improve_sldl);
	};
	if(Npc_HasItems(other,sld_armor_m) >= 1)
	{
		Info_AddChoice(info_wolf_craft_which_improve,"Verbesserte Söldnerrüstung (825 Erz)",info_wolf_craft_which_improve_sldm);
	};
	if(Npc_HasItems(other,sld_armor_h) >= 1)
	{
		Info_AddChoice(info_wolf_craft_which_improve,"Verbesserte schwere Söldnerrüstung (1050 Erz)",info_wolf_craft_which_improve_sldh);
	};
	if(Npc_HasItems(other,kdw_armor_l) >= 1)
	{
		Info_AddChoice(info_wolf_craft_which_improve,"Verbesserte Wasserrobe (975 Erz)",info_wolf_craft_which_improve_kdwl);
	};
};

func void info_wolf_craft_which_improve_back()
{
	Info_ClearChoices(info_wolf_craft_which_improve);
};

func void info_wolf_craft_which_improve_orgl()
{
	AI_Output(other,self,",	Info_Wolf_CRAFT_WHICH_IMPROVE_Wolf_13_01");	//Hier ist die Rüstung.
	if((Npc_HasItems(other,org_armor_l) >= 1) && (Npc_HasItems(hero,ItMiNugget) >= 375))
	{
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_IMPROVE_Wolf_16_02");	//Alles klar, damit kann ich was anfangen, denke ich.
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_IMPROVE_Wolf_15_04");	//Einen Moment.
		AI_UnequipArmor(hero);
		B_GiveInvItems(hero,self,org_armor_l,1);
		B_GiveInvItems(hero,self,ItMiNugget,375);
		Npc_RemoveInvItem(self,org_armor_l);
		CreateInvItem(self,org_armor_l_upgrade);
		B_GiveInvItems(self,hero,org_armor_l_upgrade,1);
		AI_EquipBestArmor(hero);
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_IMPROVE_Wolf_15_05");	//So, hier ist deine Rüstung. Hoffentlich leistet sie dir gute Dienste!
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_IMPROVE_Wolf_15_02");	//Du hast nicht genügend Erz. Komm' wieder wenn du mehr Erz dabei hast.
		AI_StopProcessInfos(self);
		Info_ClearChoices(info_wolf_craft_which_improve);
	};
};

func void info_wolf_craft_which_improve_orgm()
{
	AI_Output(other,self,",	Info_Wolf_CRAFT_WHICH_IMPROVE_Wolf_13_01");	//Hier ist die Rüstung.
	if((Npc_HasItems(other,org_armor_m) >= 1) && (Npc_HasItems(hero,ItMiNugget) >= 525))
	{
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_IMPROVE_Wolf_16_02");	//Alles klar, damit kann ich was anfangen, denke ich.
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_IMPROVE_Wolf_15_04");	//Einen Moment.
		AI_UnequipArmor(hero);
		B_GiveInvItems(hero,self,org_armor_m,1);
		B_GiveInvItems(hero,self,ItMiNugget,525);
		Npc_RemoveInvItem(self,org_armor_m);
		CreateInvItem(self,org_armor_m_upgrade);
		B_GiveInvItems(self,hero,org_armor_m_upgrade,1);
		AI_EquipBestArmor(hero);
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_IMPROVE_Wolf_15_05");	//So, hier ist deine Rüstung. Hoffentlich leistet sie dir gute Dienste!
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_IMPROVE_Wolf_15_02");	//Du hast nicht genügend Erz. Komm' wieder wenn du mehr Erz dabei hast.
		AI_StopProcessInfos(self);
		Info_ClearChoices(info_wolf_craft_which_improve);
	};
};

func void info_wolf_craft_which_improve_orgh()
{
	AI_Output(other,self,",	Info_Wolf_CRAFT_WHICH_IMPROVEWolf_13_01");	//Hier ist die Rüstung.
	if((Npc_HasItems(other,org_armor_h) >= 1) && (Npc_HasItems(hero,ItMiNugget) >= 600))
	{
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_IMPROVE_Wolf_16_02");	//Alles klar, damit kann ich was anfangen, denke ich.
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_IMPROVE_Wolf_15_04");	//Einen Moment.
		B_GiveInvItems(hero,self,ItMiNugget,600);
		Npc_RemoveInvItem(hero,org_armor_h);
		CreateInvItem(hero,org_armor_h_upgrade);
		AI_EquipBestArmor(hero);
		CreateInvItem(self,ItAmArrow);
		B_GiveInvItems(self,hero,ItAmArrow,1);
		Npc_RemoveInvItem(hero,ItAmArrow);
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_IMPROVE_Wolf_15_05");	//So, hier ist deine Rüstung. Hoffentlich leistet sie dir gute Dienste!
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_IMPROVE_IMPROVE_Wolf_15_02");	//Du hast nicht genügend Erz. Komm' wieder wenn du mehr Erz dabei hast.
		AI_StopProcessInfos(self);
		Info_ClearChoices(info_wolf_craft_which_improve);
	};
};

func void info_wolf_craft_which_improve_sldl()
{
	AI_Output(other,self,",	Info_Wolf_CRAFT_WHICH_IMPROVE_Wolf_13_01");	//Hier ist die Rüstung.
	if((Npc_HasItems(other,sld_armor_l) >= 1) && (Npc_HasItems(hero,ItMiNugget) >= 675))
	{
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_IMPROVE_Wolf_16_02");	//Alles klar, damit kann ich was anfangen, denke ich.
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_IMPROVE_Wolf_15_04");	//Einen Moment.
		AI_UnequipArmor(hero);
		B_GiveInvItems(hero,self,sld_armor_l,1);
		B_GiveInvItems(hero,self,ItMiNugget,675);
		Npc_RemoveInvItem(self,sld_armor_l);
		CreateInvItem(self,sld_armor_l_upgrade);
		B_GiveInvItems(self,hero,sld_armor_l_upgrade,1);
		AI_EquipBestArmor(hero);
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_IMPROVE_Wolf_15_05");	//So, hier ist deine Rüstung. Hoffentlich leistet sie dir gute Dienste!
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_IMPROVE_Wolf_15_02");	//Du hast nicht genügend Erz. Komm' wieder wenn du mehr Erz dabei hast.
		AI_StopProcessInfos(self);
		Info_ClearChoices(info_wolf_craft_which_improve);
	};
};

func void info_wolf_craft_which_improve_sldm()
{
	AI_Output(other,self,",	Info_Wolf_CRAFT_WHICH_IMPROVE_Wolf_13_01");	//Hier ist die Rüstung.
	if((Npc_HasItems(other,sld_armor_m) >= 1) && (Npc_HasItems(hero,ItMiNugget) >= 825))
	{
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_IMPROVE_Wolf_16_02");	//Alles klar, damit kann ich was anfangen, denke ich.
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_IMPROVE_Wolf_15_04");	//Einen Moment.
		AI_UnequipArmor(hero);
		B_GiveInvItems(hero,self,sld_armor_m,1);
		B_GiveInvItems(hero,self,ItMiNugget,825);
		Npc_RemoveInvItem(self,sld_armor_m);
		CreateInvItem(self,sld_armor_m_upgrade);
		B_GiveInvItems(self,hero,sld_armor_m_upgrade,1);
		AI_EquipBestArmor(hero);
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_IMPROVE_Wolf_15_05");	//So, hier ist deine Rüstung. Hoffentlich leistet sie dir gute Dienste!
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_Wolf_IMPROVE_15_02");	//Du hast nicht genügend Erz. Komm' wieder wenn du mehr Erz dabei hast.
		AI_StopProcessInfos(self);
		Info_ClearChoices(info_wolf_craft_which_improve);
	};
};

func void info_wolf_craft_which_improve_sldh()
{
	AI_Output(other,self,",	Info_Wolf_CRAFT_WHICH_IMPROVE_Wolf_13_01");	//Hier ist die Rüstung.
	if((Npc_HasItems(other,sld_armor_h) >= 1) && (Npc_HasItems(hero,ItMiNugget) >= 1050))
	{
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_IMPROVE_Wolf_16_02");	//Alles klar, damit kann ich was anfangen, denke ich.
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_IMPROVE_Wolf_15_04");	//Einen Moment.
		AI_UnequipArmor(hero);
		B_GiveInvItems(hero,self,sld_armor_h,1);
		B_GiveInvItems(hero,self,ItMiNugget,1050);
		Npc_RemoveInvItem(self,sld_armor_h);
		CreateInvItem(self,sld_armor_h_upgrade);
		B_GiveInvItems(self,hero,sld_armor_h_upgrade,1);
		AI_EquipBestArmor(hero);
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_IMPROVE_Wolf_15_05");	//So, hier ist deine Rüstung. Hoffentlich leistet sie dir gute Dienste!
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_IMPROVE_Wolf_15_02");	//Du hast nicht genügend Erz. Komm' wieder wenn du mehr Erz dabei hast.
		AI_StopProcessInfos(self);
		Info_ClearChoices(info_wolf_craft_which_improve);
	};
};

func void info_wolf_craft_which_improve_kdwl()
{
	AI_Output(other,self,",	Info_Wolf_CRAFT_WHICH_IMPROVE_Wolf_13_01");	//Hier ist die Rüstung.
	if((Npc_HasItems(other,kdw_armor_l) >= 1) && (Npc_HasItems(hero,ItMiNugget) >= 975))
	{
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_IMPROVE_Wolf_16_02");	//Alles klar, damit kann ich was anfangen, denke ich.
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_IMPROVE_Wolf_15_04");	//Einen Moment.
		AI_UnequipArmor(hero);
		B_GiveInvItems(hero,self,kdw_armor_l,1);
		B_GiveInvItems(hero,self,ItMiNugget,975);
		Npc_RemoveInvItem(self,kdw_armor_l);
		CreateInvItem(self,kdw_armor_l_upgrade);
		B_GiveInvItems(self,hero,kdw_armor_l_upgrade,1);
		AI_EquipBestArmor(hero);
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_IMPROVE_Wolf_15_05");	//So, hier ist deine Rüstung. Hoffentlich leistet sie dir gute Dienste!
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,",	Info_Wolf_CRAFT_WHICH_IMPROVE_Wolf_15_02");	//Du hast nicht genügend Erz. Komm' wieder wenn du mehr Erz dabei hast.
		AI_StopProcessInfos(self);
		Info_ClearChoices(info_wolf_craft_which_improve);
	};
};


instance DIA_WOLF_GREETSLD(C_Info)
{
	npc = ORG_855_Wolf;
	nr = 1;
	condition = dia_wolf_greetsld_condition;
	information = dia_wolf_greetsld_info;
	permanent = 1;
	important = 0;
	description = "Du gehörst jetzt zu Lee?";
};


func int dia_wolf_greetsld_condition()
{
	if(Npc_GetTrueGuild(self) == GIL_SLD)
	{
		return TRUE;
	};
};

func void dia_wolf_greetsld_info()
{
	AI_Output(other,self,"DIA_Wolf_GreetSLD_09_00");	//Du gehörst jetzt zu Lee?
	AI_Output(self,other,"DIA_Wolf_GreetSLD_09_01");	//Lee hat davon gehört, wie ich den Jungs ihre zerbeulten Rüstungen immer wieder zusammengeschustert habe.
	AI_Output(self,other,"DIA_Wolf_GreetSLD_09_02");	//Außerdem war er beeindruckt davon, aus was für Material ich Rüstungen herstellen kann.
	AI_Output(self,other,"DIA_Wolf_GreetSLD_09_03");	//Daraufhin sagte er mir, dass ich bereit wäre Söldner der Magier zu werden.
};


instance DIA_WOLF_SELLFUR(C_Info)
{
	npc = ORG_855_Wolf;
	nr = 600;
	condition = dia_wolf_sellfur_condition;
	information = dia_wolf_sellfur_info;
	permanent = 1;
	description = "Ich hab' hier ein paar Felle für dich...";
};


func int dia_wolf_sellfur_condition()
{
	if(Npc_KnowsInfo(hero,Org_855_Wolf_TRADE))
	{
		return TRUE;
	};
};

func void dia_wolf_sellfur_info()
{
	AI_Output(other,self,"DIA_wolf_SellFur_15_00");	//Ich hab' hier ein paar Felle für dich...
	if((Npc_HasItems(other,ItAt_Wolf_01) > 0) || (Npc_HasItems(other,ItAt_Wolf_02) > 0) || (Npc_HasItems(other,ItAt_Shadow_01) > 0) || (Npc_HasItems(other,ItAt_Troll_01) > 0) || (Npc_HasItems(other,ItAt_Swampshark_01) > 0) || (Npc_HasItems(other,ItAt_Lurker_02) > 0))
	{
		if(Npc_HasItems(other,ItAt_Wolf_01) > 0)
		{
			AI_Output(self,other,"DIA_wolf_SellFur_11_01");	//Wolfsfell? Das kann ich gut gebrauchen.
			B_GiveInvItems(self,other,ItMiNugget,Npc_HasItems(other,ItAt_Wolf_01) * Value_Wolfsfell);
			B_GiveInvItems(other,self,ItAt_Wolf_01,Npc_HasItems(other,ItAt_Wolf_01));
		};
		if(Npc_HasItems(other,ItAt_Wolf_02) > 0)
		{
			AI_Output(self,other,"DIA_wolf_SellFur_11_02");	//Ork-Hund Fell? Nicht schlecht, die Biester sind ziemlich zäh.
			B_GiveInvItems(self,other,ItMiNugget,Npc_HasItems(other,ItAt_Wolf_02) * Value_Orkhundfell);
			B_GiveInvItems(other,self,ItAt_Wolf_02,Npc_HasItems(other,ItAt_Wolf_02));
		};
		if(Npc_HasItems(other,ItAt_Shadow_01) > 0)
		{
			AI_Output(self,other,"DIA_wolf_SellFur_11_03");	//Du hast einen Schattenläufer erledigt? Die Viecher lassen sich nicht oft in dieser Gegend blicken.
			B_GiveInvItems(self,other,ItMiNugget,Npc_HasItems(other,ItAt_Shadow_01) * Value_Shadowbeastfell);
			B_GiveInvItems(other,self,ItAt_Shadow_01,Npc_HasItems(other,ItAt_Shadow_01));
		};
		if(Npc_HasItems(other,ItAt_Lurker_02) > 0)
		{
			AI_Output(self,other,"DIA_wolf_SellFur_11_04");	//Die Haut eines Lurkers, damit lässt sich gut arbeiten.
			B_GiveInvItems(self,other,ItMiNugget,Npc_HasItems(other,ItAt_Lurker_02) * Value_Lurkerhaut);
			B_GiveInvItems(other,self,ItAt_Lurker_02,Npc_HasItems(other,ItAt_Lurker_02));
		};
		if(Npc_HasItems(other,ItAt_Swampshark_01) > 0)
		{
			AI_Output(self,other,"DIA_wolf_SellFur_11_05");	//Sumpfhaihaut? Bist wohl durch die Sümpfe der Sektenspinner gezogen, was?
			B_GiveInvItems(self,other,ItMiNugget,Npc_HasItems(other,ItAt_Swampshark_01) * Value_Sumpfhaihaut);
			B_GiveInvItems(other,self,ItAt_Swampshark_01,Npc_HasItems(other,ItAt_Swampshark_01));
		};
		if(Npc_HasItems(other,ItAt_Troll_01) > 0)
		{
			AI_Output(self,other,"DIA_wolf_SellFur_11_06");	//Was ist das denn für ein Fell?
			AI_Output(other,self,"DIA_wolf_SellFur_11_07");	//Das ist das Fell eines Trolls.
			AI_Output(self,other,"DIA_wolf_SellFur_11_08");	//Ein Troll? Bisher hab' ich nur Geschichten über die Viecher gehört.
			B_GiveInvItems(self,other,ItMiNugget,Npc_HasItems(other,ItAt_Troll_01) * Value_Trollfell);
			B_GiveInvItems(other,self,ItAt_Troll_01,Npc_HasItems(other,ItAt_Troll_01));
		};
		AI_Output(self,other,"DIA_wolf_SellFur_11_09");	//Hast ordentlich Beute gemacht. Wenn du mehr hast, du weißt an wen du dich wenden kannst.
	}
	else
	{
		AI_Output(self,other,"DIA_wolf_SellFur_11_10");	//Ich seh' aber weder Felle noch Häute. Komm wieder wenn du was für mich dabei hast.
	};
};

