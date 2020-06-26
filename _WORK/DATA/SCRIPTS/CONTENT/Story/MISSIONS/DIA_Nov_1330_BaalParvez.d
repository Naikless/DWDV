
instance DIA_BaalParvez_EXIT(C_Info)
{
	npc = Nov_1330_BaalParvez;
	nr = 999;
	condition = DIA_BaalParvez_EXIT_Condition;
	information = DIA_BaalParvez_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_BaalParvez_EXIT_Condition()
{
	return 1;
};

func void DIA_BaalParvez_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BaalParvez_Greet(C_Info)
{
	npc = Nov_1330_BaalParvez;
	nr = 1;
	condition = DIA_BaalParvez_Greet_Condition;
	information = DIA_BaalParvez_Greet_Info;
	permanent = 0;
	important = 1;
};


func int DIA_BaalParvez_Greet_Condition()
{
	if(Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist)
	{
		return 1;
	};
};

func void DIA_BaalParvez_Greet_Info()
{
	AI_Output(self,other,"DIA_BaalParvez_Greet_10_00");	//Der Schl�fer sei mit dir, Fremder!
	AI_Output(self,other,"DIA_BaalParvez_Greet_10_01");	//Ich bin hier, um dich auf den rechten Weg zu f�hren.
};


instance DIA_BaalParvez_RightWay(C_Info)
{
	npc = Nov_1330_BaalParvez;
	nr = 1;
	condition = DIA_BaalParvez_RightWay_Condition;
	information = DIA_BaalParvez_RightWay_Info;
	permanent = 0;
	description = "Und was ist der rechte Weg?";
};


func int DIA_BaalParvez_RightWay_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_BaalParvez_Greet))
	{
		return 1;
	};
};

func void DIA_BaalParvez_RightWay_Info()
{
	AI_Output(other,self,"DIA_BaalParvez_RightWay_15_00");	//Und was ist der rechte Weg?
	AI_Output(self,other,"DIA_BaalParvez_RightWay_10_01");	//Der Weg des Schl�fers. Er allein hat die Macht, uns von hier zu befreien.
	AI_Output(self,other,"DIA_BaalParvez_RightWay_10_02");	//Im unserem Lager bereiten die Gurus eine gro�e Beschw�rung vor - sie wollen mit dem Schl�fer in Kontakt treten.
	AI_Output(self,other,"DIA_BaalParvez_RightWay_10_03");	//Bisher hat er nur durch Visionen zu uns gesprochen - aber jetzt ist die Zeit gekommen, mit ihm Kontakt aufzunehmen.
	AI_Output(self,other,"DIA_BaalParvez_RightWay_10_04");	//Wir brauchen dazu so viele Anh�nger wie m�glich. Durch unsere geb�ndelte geistige Kraft werden wir zu ihm durchdringen.
	AI_Output(self,other,"DIA_BaalParvez_RightWay_10_05");	//Unser Lager liegt etwas weiter entfernt in den S�mpfen - Ich kann dich aber hinbringen, falls du es w�nschst.
};


instance DIA_BaalParvez_MyAdvantage(C_Info)
{
	npc = Nov_1330_BaalParvez;
	nr = 1;
	condition = DIA_BaalParvez_MyAdvantage_Condition;
	information = DIA_BaalParvez_MyAdvantage_Info;
	permanent = 0;
	description = "Was h�tte ich davon, mich euch anzuschlie�en?";
};


func int DIA_BaalParvez_MyAdvantage_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_BaalParvez_RightWay))
	{
		return 1;
	};
};

func void DIA_BaalParvez_MyAdvantage_Info()
{
	AI_Output(other,self,"DIA_BaalParvez_MyAdvantage_15_00");	//Was h�tte ich davon, mich euch anzuschlie�en?
	AI_Output(self,other,"DIA_BaalParvez_MyAdvantage_10_01");	//Vielleicht bist du einer der Auserw�hlten, denen der Schl�fer die Gabe der Magie verleiht.
	AI_Output(self,other,"DIA_BaalParvez_MyAdvantage_10_02");	//Oder du erreichst die h�chsten Ehren und wirst zum Templer berufen. Nur die besten K�mpfer unter uns d�rfen diese Position bekleiden.
	AI_Output(self,other,"DIA_BaalParvez_MyAdvantage_10_03");	//Wenn der Schl�fer mit dir ist, kannst du sogar beides kombinieren - die besten unter den Templern haben n�mlich auch die Gabe der Magie.
	AI_Output(self,other,"DIA_BaalParvez_MyAdvantage_10_04");	//Du siehst, in unserer Bruderschaft gibt es viele M�glichkeiten f�r dich.
	AI_Output(self,other,"DIA_BaalParvez_MyAdvantage_10_05");	//�berzeuge dich selbst davon, bevor du dich vorschnell f�r ein anderes Lager entscheidest!
};


instance DIA_BaalParvez_Sleeper(C_Info)
{
	npc = Nov_1330_BaalParvez;
	nr = 2;
	condition = DIA_BaalParvez_Sleeper_Condition;
	information = DIA_BaalParvez_Sleeper_Info;
	permanent = 0;
	description = "Wer ist der Schl�fer?";
};


func int DIA_BaalParvez_Sleeper_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_BaalParvez_Greet))
	{
		return 1;
	};
};

func void DIA_BaalParvez_Sleeper_Info()
{
	AI_Output(other,self,"DIA_BaalParvez_Sleeper_15_00");	//Wer ist der Schl�fer?
	AI_Output(self,other,"DIA_BaalParvez_Sleeper_10_01");	//Der Schl�fer spricht zu uns durch unsere Tr�ume und Visionen.
	AI_Output(self,other,"DIA_BaalParvez_Sleeper_10_02");	//Seit er vor f�nf Jahren das erste Mal mit Y'Berion in Kontakt trat, hat er uns geleitet.
	AI_Output(self,other,"DIA_BaalParvez_Sleeper_10_03");	//Alle Anh�nger der Bruderschaft haben dem Glauben an die drei G�tter abgeschworen. Wir bitten nur noch den Schl�fer um Erl�sung.
	AI_Output(other,self,"DIA_BaalParvez_Sleeper_15_04");	//Erl�sung wovon?
	AI_Output(self,other,"DIA_BaalParvez_Sleeper_10_05");	//Na, von diesem gottverdammten Ort hier! Der Schl�fer wird uns den Weg in die Freiheit weisen!
};


instance DIA_BaalParvez_SleeperSaid(C_Info)
{
	npc = Nov_1330_BaalParvez;
	nr = 2;
	condition = DIA_BaalParvez_SleeperSaid_Condition;
	information = DIA_BaalParvez_SleeperSaid_Info;
	permanent = 0;
	description = "Was hat euch der Schl�fer gesagt?";
};


func int DIA_BaalParvez_SleeperSaid_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_BaalParvez_Sleeper))
	{
		return 1;
	};
};

func void DIA_BaalParvez_SleeperSaid_Info()
{
	AI_Output(other,self,"DIA_BaalParvez_SleeperSaid_15_00");	//Was hat euch der Schl�fer gesagt?
	AI_Output(self,other,"DIA_BaalParvez_SleeperSaid_10_01");	//Er hat uns in den Sumpf gef�hrt, zu den alten Tempelruinen. Dort haben wir unser Lager errichtet.
	AI_Output(self,other,"DIA_BaalParvez_SleeperSaid_10_02");	//Er hat uns die Unabh�ngigkeit gegeben - keiner von uns muss mehr in den Minen schuften.
	AI_Output(self,other,"DIA_BaalParvez_SleeperSaid_10_03");	//Er hat uns die Wirkung des Sumpfkrauts gezeigt. Wir verkaufen es an die anderen Lager und bekommen daf�r alles, was wir brauchen.
	AI_Output(self,other,"DIA_BaalParvez_SleeperSaid_10_04");	//Und er gab einigen von uns die Gabe der Magie. Einer alten, m�chtigen Magie, verschieden von der, die die Magier des Reiches anwenden.
};


instance DIA_BaalParvez_PSIMagic(C_Info)
{
	npc = Nov_1330_BaalParvez;
	nr = 4;
	condition = DIA_BaalParvez_PSIMagic_Condition;
	information = DIA_BaalParvez_PSIMagic_Info;
	permanent = 0;
	description = "Erz�hl mir von der Magie des Schl�fers.";
};


func int DIA_BaalParvez_PSIMagic_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_BaalParvez_SleeperSaid))
	{
		return 1;
	};
};

func void DIA_BaalParvez_PSIMagic_Info()
{
	AI_Output(other,self,"DIA_BaalParvez_PSIMagic_15_00");	//Erz�hl mir von der Magie des Schl�fers.
	AI_Output(self,other,"DIA_BaalParvez_PSIMagic_10_01");	//Diese Gabe verleiht die F�higkeit, Dinge mit der Kraft deines Willens zu kontrollieren.
	AI_Output(self,other,"DIA_BaalParvez_PSIMagic_10_02");	//Nur die Gurus unserer Bruderschaft sind in die Geheimnisse dieser Magie eingeweiht.
};


var int BaalParvez_GotoPSI_Day;

instance DIA_BaalParvez_GotoPSI(C_Info)
{
	npc = Nov_1330_BaalParvez;
	nr = 800;
	condition = DIA_BaalParvez_GotoPSI_Condition;
	information = DIA_BaalParvez_GotoPSI_Info;
	permanent = 1;
	description = "Bring mich zu eurem Lager. Das will ich mir ansehen!";
};


func int DIA_BaalParvez_GotoPSI_Condition()
{
	if((Npc_RefuseTalk(self) == FALSE) && Npc_KnowsInfo(hero,DIA_BaalParvez_RightWay) && (Npc_GetDistToWP(self,"PATH_OC_PSI_18") > 5000) && !Npc_KnowsInfo(hero,DIA_BaalParvez_AtPSI))
	{
		return 1;
	};
};

func void DIA_BaalParvez_GotoPSI_Info()
{
	AI_Output(other,self,"DIA_BaalParvez_GotoPSI_15_00");	//Bring mich zu eurem Lager. Das will ich mir ansehen!
	if(Psi_Walk == 0)
	{
		if(Npc_GetTrueGuild(hero) == GIL_None)
		{
			Log_CreateTopic(CH1_JoinPsi,LOG_MISSION);
			Log_SetTopicStatus(CH1_JoinPsi,LOG_RUNNING);
		};
		B_LogEntry(CH1_JoinPsi,"Baal Parvez, ein Missionar der Bruderschaft sucht im Alten Lager nach neuen Anh�ngern f�r ihren Glauben an den SCHL�FER! Er bot mir an, mich zum Sumpflager, der Heimat der Bruderschaft zu geleiten.");
		Psi_Walk = 1;
	};
	AI_Output(self,other,"DIA_BaalParvez_GotoPSI_10_01");	//Sehr gut! Ich werde vorangehen. Folge mir!
	BaalParvez_GotoPSI_Day = Wld_GetDay();
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_SetRefuseTalk(self,300);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"GUIDE");
};


instance DIA_BaalParvez_AtPSI(C_Info)
{
	npc = Nov_1330_BaalParvez;
	nr = 1;
	condition = DIA_BaalParvez_AtPSI_Condition;
	information = DIA_BaalParvez_AtPSI_Info;
	permanent = 0;
	important = 1;
};


func int DIA_BaalParvez_AtPSI_Condition()
{
	if(Hlp_StrCmp(Npc_GetNearestWP(self),"PATH_OC_PSI_18"))
	{
		return 1;
	};
};

func void DIA_BaalParvez_AtPSI_Info()
{
	var C_Npc Kalom;
	if(BaalParvez_GotoPSI_Day > (Wld_GetDay() - 2))
	{
		AI_Output(self,other,"DIA_BaalParvez_AtPSI_10_00");	//Wir sind angekommen. Dort unten liegt das Lager der Bruderschaft.
	}
	else
	{
		AI_Output(self,other,"DIA_BaalParvez_AtPSI_LATE_10_00");	//Du hast dir viel Zeit gelassen, Bruder! Da unten siehst du das Lager.
	};
	AI_Output(self,other,"DIA_BaalParvez_AtPSI_10_01");	//Geh durch das Tor und rede mit meinen Br�dern. Ich bin sicher, dass du den Weg nicht umsonst gemacht hast.
	AI_Output(self,other,"DIA_BaalParvez_AtPSI_10_02");	//Frag nach Cor Kalom. Er hat die Aufsicht �ber die Novizen und die Lehrer.
	AI_Output(self,other,"DIA_BaalParvez_AtPSI_10_03");	//Ich gehe zur�ck ins alte Lager - es gibt noch viele Unwissende, die auf den richtigen Weg gebracht werden m�ssen.
	AI_Output(other,self,"DIA_BaalParvez_AtPSI_15_04");	//Viel Gl�ck.
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	B_LogEntry(CH1_JoinPsi,"Das Sumpflager erstreckt sich unter mir. Mein Wegbegleiter empfahl mir, mit dem Guru Cor Kalom zu sprechen. Er ist der Aufseher �ber die Novizen und Lehrer.");
	B_GiveXP(XP_ArrivedAtPsiCamp);
	Kalom = Hlp_GetNpc(GUR_1201_CorKalom);
	Kalom.aivar[AIV_FINDABLE] = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
	Npc_SetPermAttitude(self,ATT_FRIENDLY);
};


instance NOV_1330_BAALPARVEZ_WELCOME(C_Info)
{
	npc = Nov_1330_BaalParvez;
	condition = nov_1330_baalparvez_welcome_condition;
	information = nov_1330_baalparvez_welcome_info;
	important = 1;
	permanent = 0;
};


func int nov_1330_baalparvez_welcome_condition()
{
	if(Npc_GetTrueGuild(hero) == GIL_GUR)
	{
		return TRUE;
	};
};

func void nov_1330_baalparvez_welcome_info()
{
	AI_Output(self,other,"Nov_1305_Parvez_WELCOME_Info_08_01");	//Wie es scheint, hast du den rechten Weg gefunden? Der Schl�fer hat dich zurecht erw�hlt, ein Guru zu sein.
	AI_StopProcessInfos(self);
};

