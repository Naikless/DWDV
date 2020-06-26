
instance DIA_Balor_Exit(C_Info)
{
	npc = NOV_1304_Balor;
	nr = 999;
	condition = DIA_Viran_Exit_Condition;
	information = DIA_Viran_Exit_Info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Balor_Exit_Condition()
{
	return TRUE;
};

func void DIA_Balor_Exit_Info()
{
	AI_StopProcessInfos(self);
};


var int Balor_BotenDay;

instance DIA_Balor_FetchWeed(C_Info)
{
	npc = NOV_1304_Balor;
	nr = 1;
	condition = DIA_Balor_FetchWeed_Condition;
	information = DIA_Balor_FetchWeed_Info;
	permanent = 0;
	description = "Baal Orun schickt mich. Ich soll hier alles Sumpfkraut abholen.";
};


func int DIA_Balor_FetchWeed_Condition()
{
	if(BaalOrun_FetchWeed == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Balor_FetchWeed_Info()
{
	AI_Output(other,self,"DIA_Balor_FetchWeed_15_00");	//Baal Orun schickt mich. Ich soll hier alles Sumpfkraut abholen.
	AI_Output(self,other,"DIA_Balor_FetchWeed_01_01");	//Gut. Dann muss ich nicht selber laufen. Hier, nimm.
	AI_Output(self,other,"DIA_Balor_FetchWeed_01_02");	//Vergiss nicht, zu Viran auf der anderen Seite vom Sumpf zu gehen, wenn du nicht schon da warst.
	AI_Output(self,other,"DIA_Balor_FetchWeed_01_03");	//Sonst könnte deine Lieferung ein bisschen mickrig ausfallen, und alle würden denken, du hast die Hälfte verhökert, hee, hee.
	B_GiveInvItems(self,other,ItMi_Plants_Swampherb_01,50);
	B_LogEntry(CH1_DeliverWeed,"Balor übergab mir seine heutige Sumpfkrauternte für Cor Kalom.");
	B_GiveXP(XP_WeedFromBalor);
	if(!Npc_KnowsInfo(hero,DIA_Viran_What) && !Npc_KnowsInfo(hero,DIA_Viran_FetchWeed))
	{
		B_LogEntry(CH1_DeliverWeed,"Laut Balor scheint es noch eine zweite Sammlergruppe zu geben, die auf der anderen Seite des Sumpfes arbeiten. Da ich Baal Orun keine Fragen stellen durfte, muss ich jetzt wohl oder übel diesen verdammten Sumpf nach der anderen Gruppe absuchen.");
	};
	Balor_BotenDay = Wld_GetDay();
};


var int Balor_PlayerCheating;

instance DIA_Balor_SellUnder(C_Info)
{
	npc = NOV_1304_Balor;
	nr = 1;
	condition = DIA_Balor_SellUnder_Condition;
	information = DIA_Balor_SellUnder_Info;
	permanent = 0;
	description = "Wem sollte ich das Kraut denn schon verhökern?";
};


func int DIA_Balor_SellUnder_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Balor_FetchWeed))
	{
		return TRUE;
	};
};

func void DIA_Balor_SellUnder_Info()
{
	AI_Output(other,self,"DIA_Balor_SellUnder_15_00");	//Wem sollte ich das Kraut denn schon verhökern?
	AI_Output(self,other,"DIA_Balor_SellUnder_01_01");	//Oha! Ich habe dich auf Ideen gebracht, häh?
	Info_ClearChoices(DIA_Balor_SellUnder);
	Info_AddChoice(DIA_Balor_SellUnder,"Vergiß es, war nur so'n Gedanke.",DIA_Balor_SellUnder_ForgetIt);
	Info_AddChoice(DIA_Balor_SellUnder,"Wenn du einen Abnehmer weißt - wir könnten Halbe-Halbe machen.",DIA_Balor_SellUnder_HalfHalf);
	Info_AddChoice(DIA_Balor_SellUnder,"Nein - sag mal - an wen?",DIA_Balor_SellUnder_ComeOn);
};

func void DIA_Balor_SellUnder_ForgetIt()
{
	AI_Output(other,self,"DIA_Balor_SellUnder_ForgetIt_15_00");	//Vergiss es, war nur so'n Gedanke.
	Info_ClearChoices(DIA_Balor_SellUnder);
};

func void DIA_Balor_SellUnder_HalfHalf()
{
	AI_Output(other,self,"DIA_Balor_SellUnder_HalfHalf_15_00");	//Wenn du einen Abnehmer weißt - wir könnten Halbe-Halbe machen.
	AI_Output(self,other,"DIA_Balor_SellUnder_HalfHalf_01_01");	//Nun, ich wüsste da jemanden im Neuen Lager, den würde so 'ne Menge Kraut schon interessieren ...
	AI_Output(self,other,"DIA_Balor_SellUnder_HalfHalf_01_02");	//Aber wenn dich die Gurus dabei erwischen, machen sie Sumpfhaifutter aus dir! Ich weiß von nichts, klar?!
	Balor_PlayerCheating = TRUE;
	Info_ClearChoices(DIA_Balor_SellUnder);
};

func void DIA_Balor_SellUnder_ComeOn()
{
	AI_Output(other,self,"DIA_Balor_SellUnder_ComeOn_15_00");	//Nein - sag mal - an wen?
	AI_Output(self,other,"DIA_Balor_SellUnder_ComeOn_01_01");	//Du hast doch was vor! Ich sage dir: Wenn das Kraut nicht bei Cor Kalom ankommt, kriegen wir beide mächtigen Ärger!
};


var int Balor_TellsNCDealer;

instance DIA_Balor_TellDealer(C_Info)
{
	npc = NOV_1304_Balor;
	nr = 1;
	condition = DIA_Balor_TellDealer_Condition;
	information = DIA_Balor_TellDealer_Info;
	permanent = 1;
	description = "Okay - wer ist der Abnehmer im Neuen Lager?";
};


func int DIA_Balor_TellDealer_Condition()
{
	if((Balor_PlayerCheating == TRUE) && (Balor_TellsNCDealer == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Balor_TellDealer_Info()
{
	AI_Output(other,self,"DIA_Balor_TellDealer_15_00");	//Okay - wer ist der Abnehmer im Neuen Lager?
	AI_Output(self,other,"DIA_Balor_TellDealer_01_01");	//Ich verrat dir den Namen und du bist mit dem Kraut über alle Berge - so läuft das nicht!
	AI_Output(self,other,"DIA_Balor_TellDealer_01_02");	//Ich will 50 Erz Vorschuss sehen. Dann sehen wir weiter.
	Info_ClearChoices(DIA_Balor_TellDealer);
	Info_AddChoice(DIA_Balor_TellDealer,"Vergiß es.",DIA_Balor_TellDealer_ForgetIt);
	Info_AddChoice(DIA_Balor_TellDealer,"50 sind fair - hier, nimm.",DIA_Balor_TellDealer_Pay);
};

func void DIA_Balor_TellDealer_Pay()
{
	AI_Output(other,self,"DIA_Balor_TellDealer_Pay_15_00");	//50 sind fair - hier, nimm.
	if(Npc_HasItems(other,ItMiNugget) >= 50)
	{
		AI_Output(self,other,"DIA_Balor_TellDealer_Pay_01_01");	//Gut... Hör zu. Sein Name ist Cipher. Du findest ihn meistens in der Kneipe auf dem See.
		AI_Output(self,other,"DIA_Balor_TellDealer_Pay_01_02");	//Sei vorsichtig und lass dich nicht über's Ohr hauen.
		Info_ClearChoices(DIA_Balor_TellDealer);
		B_GiveInvItems(other,self,ItMiNugget,50);
		Balor_TellsNCDealer = TRUE;
		B_LogEntry(CH1_DeliverWeed,"Balor erwähnte einen Mann namens Cipher, der ein dankbarer Käufer für die Sumpfkrauternte wäre. Ich finde ihn in der Kneipe auf dem See des Neuen Lagers. Allerdings würde mir das gewaltigen Ärger mit den Gurus einbringen.");
		B_GiveXP(XP_BalorNamedCipher);
		Log_CreateTopic(GE_TraderNC,LOG_NOTE);
		B_LogEntry(GE_TraderNC,"Cipher kauft und verkauft Waren aller Art in der Kneipe auf dem See. Er ist besonders an größeren Lieferungen Sumpfkraut interessiert.");
	}
	else
	{
		AI_Output(self,other,"DIA_Balor_TellDealer_Pay_NoOre_01_00");	//Ich sehe keine 50. Ich will 50 und keinen Brocken weniger, klar?
		Info_ClearChoices(DIA_Balor_TellDealer);
	};
};

func void DIA_Balor_TellDealer_ForgetIt()
{
	AI_Output(other,self,"DIA_Balor_TellDealer_ForgetIt_15_00");	//Vergiss es.
	AI_Output(self,other,"DIA_Balor_TellDealer_ForgetIt_01_01");	//Denk bloß nicht, du könntest einfach ins Neue Lager spazieren und es irgendwem andrehen! Wenn du den richtigen Namen nicht kennst, wirst du es nie los.
	AI_Output(self,other,"DIA_Balor_TellDealer_ForgetIt_01_02");	//Es sei denn, du lässt dir von einem Banditen über die Rübe hauen.
	Info_ClearChoices(DIA_Balor_TellDealer);
};


instance DIA_Balor_RipOff(C_Info)
{
	npc = NOV_1304_Balor;
	nr = 5;
	condition = DIA_Balor_RipOff_Condition;
	information = DIA_Balor_RipOff_Info;
	permanent = 0;
	description = "Ich soll nochmal alles Kraut zu Cor Kalom bringen.";
};


func int DIA_Balor_RipOff_Condition()
{
	if((Balor_BotenDay <= (Wld_GetDay() - 6)) && Npc_KnowsInfo(hero,DIA_Balor_FetchWeed))
	{
		return TRUE;
	};
};

func void DIA_Balor_RipOff_Info()
{
	AI_Output(other,self,"DIA_Balor_RipOff_15_00");	//Da bin ich wieder. Ich soll die nächste Ladung abholen.
	if(Balor_PlayerCheating == TRUE)
	{
		AI_Output(self,other,"DIA_Balor_RipOff_01_01");	//Na klar! Und sie wieder ans Neue Lager verhökern!
		AI_Output(self,other,"DIA_Balor_RipOff_01_02");	//Ich will 50 Erz sehen - mein üblicher Vorschuss.
	}
	else
	{
		AI_Output(self,other,"DIA_Balor_RipOff_01_03");	//Du schon wieder? Na gut, hier nimm, aber mach keine Dummheiten damit, klar?
		AI_Output(other,self,"DIA_Balor_RipOff_15_04");	//Würde ich nie wagen.
		CreateInvItems(self,ItMi_Plants_Swampherb_01,50);
		B_GiveInvItems(self,hero,ItMi_Plants_Swampherb_01,50);
	};
};


instance DIA_Balor_Perm(C_Info)
{
	npc = NOV_1304_Balor;
	nr = 1;
	condition = DIA_Balor_Perm_Condition;
	information = DIA_Balor_Perm_Info;
	permanent = 1;
	description = "Immer tüchtig weitersammeln!";
};


func int DIA_Balor_Perm_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Balor_FetchWeed))
	{
		return TRUE;
	};
};

func void DIA_Balor_Perm_Info()
{
	AI_Output(other,self,"DIA_Balor_Perm_15_00");	//Immer tüchtig weitersammeln!
	AI_Output(self,other,"DIA_Balor_Perm_01_01");	//Na klar, was denkst du denn, was ich hier mache? Mir die Eier schaukeln?
};


instance DIA_BALOR_HELP(C_Info)
{
	npc = NOV_1304_Balor;
	nr = 2;
	condition = dia_balor_help_condition;
	information = dia_balor_help_info;
	permanent = 0;
	description = "Kann ich dir irgendwie helfen?";
};


func int dia_balor_help_condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_NOV)
	{
		return TRUE;
	};
};

func void dia_balor_help_info()
{
	AI_Output(other,self,"DIA_Balor_Help_15_00");	//Kann ich dir irgendwie helfen?
	AI_Output(self,other,"DIA_Balor_Help_01_01");	//Wenn du mich schon so fragst, ja das kannst du.
	AI_Output(self,other,"DIA_Balor_Help_01_02");	//Die Jungs auf den Feldern bräuchten noch Hilfe beim Sumpfkraut sammeln.
	Info_ClearChoices(dia_balor_help);
	Info_AddChoice(dia_balor_help,"Vergiß es.",dia_balor_help_forget);
	Info_AddChoice(dia_balor_help,"Dann mach ich mich mal an die Arbeit.",dia_balor_help_okay);
};

func void dia_balor_help_forget()
{
	AI_Output(other,self,"DIA_Balor_Forget_15_00");	//Vergiß es.
	AI_Output(self,other,"DIA_Balor_Forget_01_01");	//Dann geh' mir nicht auf den Sack und lass uns in Ruhe weiterarbeiten.
	AI_StopProcessInfos(self);
};

func void dia_balor_help_okay()
{
	AI_Output(other,self,"DIA_Balor_Okay_15_00");	//Dann mach ich mich mal an die Arbeit.
	AI_Output(self,other,"DIA_Balor_Okay_01_01");	//Gut. Wir brauchen noch 10 Pflanzen, bis wir das Zeug zu Cor Kalom schicken können.
	AI_Output(self,other,"DIA_Balor_Okay_01_02");	//Geh' einfach auf die Felder, da sollte noch genug zu sammeln sein.
	BALOR_WEED = LOG_RUNNING;
	Log_CreateTopic(CH2_BALORWEED,LOG_MISSION);
	Log_SetTopicStatus(CH2_BALORWEED,LOG_RUNNING);
	B_LogEntry(CH2_BALORWEED,"Balor bat mich ihm und den anderen Sammlern zu helfen. Vielleicht springt ja was für mich dabei raus.");
	AI_StopProcessInfos(self);
};


instance DIA_BALOR_GOTWEED(C_Info)
{
	npc = NOV_1304_Balor;
	nr = 3;
	condition = dia_balor_gotweed_condition;
	information = dia_balor_gotweed_info;
	permanent = 1;
	description = "Ich hab' das restliche Kraut.";
};


func int dia_balor_gotweed_condition()
{
	if(Npc_KnowsInfo(hero,dia_balor_help) && (BALOR_WEED == LOG_RUNNING) && (Npc_GetTrueGuild(hero) == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_balor_gotweed_info()
{
	if(Npc_HasItems(hero,ItMi_Plants_Swampherb_01) >= 10)
	{
		AI_Output(other,self,"DIA_Balor_GotWeed_15_00");	//Ich hab' das restliche Kraut.
		AI_Output(self,other,"DIA_Balor_GotWeed_01_01");	//Alles klar, gib' her.
		AI_Output(self,other,"DIA_Balor_GotWeed_01_02");	//Ich denke, ab jetzt kommen wir hier alleine klar.
		AI_Output(self,other,"DIA_Balor_GotWeed_01_03");	//Hier hast du 10 Erz. Kannst dir ja 'nen Stängel dafür kaufen.
		B_GiveInvItems(hero,self,ItMi_Plants_Swampherb_01,10);
		BALOR_WEED = LOG_SUCCESS;
		Log_SetTopicStatus(CH2_BALORWEED,LOG_SUCCESS);
		B_LogEntry(CH2_BALORWEED,"Balor gab mir 10 Erz als Belohnung dafür, dass ich auf den Feldern ausgeholfen habe. Immerhin besser als nichts.");
		B_GiveXP(XP_BALORWEED);
		B_GiveInvItems(self,other,ItMiNugget,10);
	}
	else
	{
		AI_Output(other,self,"DIA_Balor_GotWeed_15_01");	//Ich hab' das restliche Kraut.
		AI_Output(self,other,"DIA_Balor_GotWeed_01_04");	//Kannst du nicht zählen? Das sind keine zehn Pflanzen.
	};
};


instance DIA_BALOR_PAYMENT(C_Info)
{
	npc = NOV_1304_Balor;
	nr = 1;
	condition = dia_balor_payment_condition;
	information = dia_balor_payment_info;
	permanent = 1;
	description = "Ich hab' deine Bezahlung.";
};


func int dia_balor_payment_condition()
{
	if(CIPHER_PAYMENT == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_balor_payment_info()
{
	if(Npc_HasItems(hero,ItMiNugget) >= 50)
	{
		AI_Output(other,self,"DIA_Balor_Payment_15_00");	//Cipher hat mir deine Bezahlung mitgegeben.
		AI_Output(self,other,"DIA_Balor_Payment_01_01");	//Mann, nicht so laut.
		AI_Output(self,other,"DIA_Balor_Payment_01_02");	//Gib her'. So und jetzt tun wir einfach so als ob das Gespräch niemals stattgefunden hätte.
		B_GiveInvItems(hero,self,ItMiNugget,50);
		CIPHER_PAYMENT = LOG_SUCCESS;
		Log_SetTopicStatus(CH1_CIPHERDELIEVERED,LOG_SUCCESS);
		B_LogEntry(CH1_CIPHERDELIEVERED,"Balor hat seine Bezahlung erhalten und er bat darum zu vergessen, dass er jemals mit mir darüber gesprochen hat.");
		B_GiveXP(XP_CIPHERPAYED);
	}
	else
	{
		AI_Output(other,self,"DIA_Balor_Payment_15_01");	//Cipher hat mir deine Bezahlung mitgegeben.
		AI_Output(self,other,"DIA_Balor_Payment_01_04");	//Wo ist denn der Rest? Das sind keine 50 Erz? Komm' wieder wenn du den Rest dabei hast.
	};
};

