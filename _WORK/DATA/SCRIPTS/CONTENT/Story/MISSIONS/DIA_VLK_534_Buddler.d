
instance DIA_Vlk_534_Exit(C_Info)
{
	npc = VLK_534_Buddler;
	nr = 999;
	condition = DIA_Vlk_534_Exit_Condition;
	information = DIA_Vlk_534_Exit_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Vlk_534_Exit_Condition()
{
	return 1;
};

func void DIA_Vlk_534_Exit_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Vlk_534_LeaveMe(C_Info)
{
	npc = VLK_534_Buddler;
	nr = 1;
	condition = DIA_Vlk_534_LeaveMe_Condition;
	information = DIA_Vlk_534_LeaveMe_Info;
	permanent = 0;
	description = "Warum bist du hier und nicht im Lager?";
};


func int DIA_Vlk_534_LeaveMe_Condition()
{
	return 1;
};

func void DIA_Vlk_534_LeaveMe_Info()
{
	AI_Output(other,self,"DIA_Vlk_534_LeaveMe_15_00");	//Warum bist du hier und nicht im Lager?
	AI_Output(self,other,"DIA_Vlk_534_LeaveMe_02_01");	//Ich warte darauf, dass ein Kumpel von mir aus der Mine kommt. Er schuldet mit noch Erz.
	AI_Output(self,other,"DIA_Vlk_534_LeaveMe_02_02");	//Ohne das Erz kann ich mich nicht im Lager sehen lassen - sonst kann ich den Gardisten kein Schutzgeld zahlen und dann kann die Sache für einen ziemlich unangenehm werden.
};


var int erz_schulden_day;

instance DIA_VLK_534_HELP(C_Info)
{
	npc = VLK_534_Buddler;
	nr = 1;
	condition = dia_vlk_534_help_condition;
	information = dia_vlk_534_help_info;
	permanent = 0;
	description = "Kann ich dir helfen?";
};


func int dia_vlk_534_help_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Vlk_534_LeaveMe))
	{
		return 1;
	};
};

func void dia_vlk_534_help_info()
{
	AI_Output(other,self,"DIA_Vlk_534_Help_15_00");	//Dein Kumpel schuldet dir Erz? Kann ich dir bei der Sache helfen?
	AI_Output(self,other,"DIA_Vlk_534_Help_02_01");	//Kannst du. Wenn du in der Alten Mine vorbeikommst, sieh dich nach einem Buddler namens Garp um. Er schuldet mir 30 Brocken Erz.
	AI_Output(self,other,"DIA_Vlk_534_Help_02_02");	//Sag ihm das ich dich geschickt habe und das ich mein Erz wiederhaben möchte. Dann wird er dir mein Erz geben.
	AI_Output(self,other,"DIA_Vlk_534_Help_02_03");	//Wenn du mit meinem Erz durchbrennst und wir uns nochmal sehen, bist du dran, also denk gar nicht erst an sowas.
	AI_StopProcessInfos(self);
	ERZ_SCHULDEN = LOG_RUNNING;
	Log_CreateTopic(CH1_SCHULDEN,LOG_MISSION);
	Log_SetTopicStatus(CH1_SCHULDEN,LOG_RUNNING);
	B_LogEntry(CH1_SCHULDEN,"Einer der Buddler, die nicht weit vom Tor des Alten Lagers sitzen, bat mich sein Erz zu beschaffen. Ein Buddler namens Garp, der in der Mine arbeitet, schuldet ihm 30 Erz. Sobald ich das Erz hab, soll ich es zu ihm zurückbringen.");
	ERZ_SCHULDEN_DAY = Wld_GetDay();
};


instance DIA_VLK_534_BETRAYED(C_Info)
{
	npc = VLK_534_Buddler;
	nr = 1;
	condition = dia_vlk_534_betrayed_condition;
	information = dia_vlk_534_betrayed_info;
	permanent = 0;
	important = 1;
};


func int dia_vlk_534_betrayed_condition()
{
	if((ERZ_SCHULDEN == LOG_RUNNING) && (ERZ_SCHULDEN_DAY <= (Wld_GetDay() - 7)))
	{
		return 1;
	};
};

func void dia_vlk_534_betrayed_info()
{
	AI_Output(self,other,"DIA_Vlk_534_Betrayed_15_00");	//Da bist du Mistkerl ja!
	AI_Output(self,other,"DIA_Vlk_534_Betrayed_02_01");	//Es ist nun schon einige Zeit her, wo ich dir gesagt das du mir mein Erz beschaffen sollst.
	AI_Output(self,other,"DIA_Vlk_534_Betrayed_02_02");	//Hast wohl gedacht du könntest einfach damit durchbrennen was? Na warte, jetzt bist du dran!
	ERZ_SCHULDEN = LOG_FAILED;
	Log_SetTopicStatus(CH1_SCHULDEN,LOG_FAILED);
	B_LogEntry(CH1_SCHULDEN,"Der Buddler der von mir verlangt hat, dass ich ihm sein Erz wiederbeschaffe, war nicht begeistert davon, dass ich mit seinem Erz durchgebrannt bin.");
	AI_StopProcessInfos(self);
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_Attack,1,"");
};


instance DIA_VLK_534_ERZ(C_Info)
{
	npc = VLK_534_Buddler;
	nr = 1;
	condition = dia_vlk_534_erz_condition;
	information = dia_vlk_534_erz_info;
	permanent = 1;
	description = "Ich hab' dein Erz.";
};


func int dia_vlk_534_erz_condition()
{
	if(ERZ_SCHULDEN == LOG_RUNNING)
	{
		return 1;
	};
};

func void dia_vlk_534_erz_info()
{
	var int zufallsbelohnung;
	if(Npc_HasItems(other,ItMiNugget) >= 30)
	{
		AI_Output(other,self,"DIA_Vlk_534_Erz_15_00");	//Ich hab' dein Erz.
		AI_Output(self,other,"DIA_Vlk_534_Erz_02_01");	//Danke, du hast was gut bei mir.
		AI_Output(self,other,"DIA_Vlk_534_Erz_02_02");	//Hier, du bekommst sogar eine Belohnung für deine Hilfe.
		B_GiveInvItems(other,self,ItMiNugget,30);
		zufallsbelohnung = Hlp_Random(100);
		if(zufallsbelohnung >= 75)
		{
			CreateInvItems(self,ItAt_Claws_01,2);
			B_GiveInvItems(self,other,ItAt_Claws_01,2);
		}
		else if(zufallsbelohnung >= 60)
		{
			CreateInvItems(self,ItMw_1H_Poker_01,1);
			B_GiveInvItems(self,other,ItMw_1H_Poker_01,1);
		}
		else if(zufallsbelohnung >= 50)
		{
			CreateInvItem(self,ItMi_Stuff_OldCoin_01);
			B_GiveInvItems(self,hero,ItMi_Stuff_OldCoin_01,2);
		}
		else if(zufallsbelohnung >= 40)
		{
			CreateInvItems(self,ItFoBeer,3);
			B_GiveInvItems(self,other,ItFoBeer,3);
		}
		else if(zufallsbelohnung >= 30)
		{
			CreateInvItems(self,ItFoLoaf,2);
			B_GiveInvItems(self,other,ItFoLoaf,2);
		}
		else if(zufallsbelohnung >= 20)
		{
			CreateInvItems(self,ItMiNugget,10);
			B_GiveInvItems(self,other,ItMiNugget,10);
		}
		else if(zufallsbelohnung >= 10)
		{
			CreateInvItems(self,ItMiSwordraw,1);
			B_GiveInvItems(self,other,ItMiSwordraw,1);
		};
		ERZ_SCHULDEN = LOG_SUCCESS;
		Log_SetTopicStatus(CH1_SCHULDEN,LOG_SUCCESS);
		B_LogEntry(CH1_SCHULDEN,"Ich konnte dem Buddler sein Erz wieder beschaffen. Er gab mir etwas nützliches im Gegenzug für meine Hilfe.");
		B_GiveXP(XP_ERZSCHULDEN);
		dia_vlk_534_erz.permanent = 0;
		Npc_ExchangeRoutine(self,"ALTERNATIVE");
	}
	else
	{
		AI_Output(other,self,"DIA_Vlk_534_Erz_15_00");	//Ich hab' dein Erz.
		AI_Output(self,other,"DIA_Vlk_534_Erz_15_01");	//Das sind aber keine 30 Erz. Ich hoffe du hast den Rest den Rest nicht versoffen.
		AI_StopProcessInfos(self);
	};
};

