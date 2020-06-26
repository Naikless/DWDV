
instance INFO_GRD_5037_GARAZ_EXIT(C_Info)
{
	npc = grd_5037_garaz;
	nr = 999;
	condition = info_grd_5037_garaz_exit_condition;
	information = info_grd_5037_garaz_exit_info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int info_grd_5037_garaz_exit_condition()
{
	return 1;
};

func void info_grd_5037_garaz_exit_info()
{
	AI_StopProcessInfos(self);
};


instance INFO_GRD_5037_GARAZ_SIEHTSAUS(C_Info)
{
	npc = grd_5037_garaz;
	nr = 1;
	condition = info_grd_5037_garaz_siehtsaus_condition;
	information = info_grd_5037_garaz_siehtsaus_info;
	permanent = 0;
	description = "Wie sieht's aus?";
};


func int info_grd_5037_garaz_siehtsaus_condition()
{
	return 1;
};

func void info_grd_5037_garaz_siehtsaus_info()
{
	AI_Output(other,self,"Info_Grd_5037_Garaz_SiehtsAus_15_00");	//Wie sieht's aus?
	AI_Output(self,other,"Info_Grd_5037_Garaz_SiehtsAus_06_01");	//Wie soll's schon aussehen? Ich steh' mir hier den ganzen Tag die Beine in den Boden, während es sich die Jungs in der Burg gut gehen lassen.
	AI_Output(self,other,"Info_Grd_5037_Garaz_SiehtsAus_05_02");	//Wir brauchen jemanden, der sich um die Vorräte der Alten Mine kümmert, haben sie gesagt. Garaz, du bist unser Mann, haben sie gesagt.
	AI_Output(self,other,"Info_Grd_5037_Garaz_SiehtsAus_07_02");	//Jedes mal bleibt die Drecksarbeit an mir hängen.
	AI_Output(self,other,"Info_Grd_5037_Garaz_SiehtsAus_06_03");	//SO sieht's aus.
};


instance INFO_GRD_5037_GARAZ_TRUHE(C_Info)
{
	npc = grd_5037_garaz;
	nr = 1;
	condition = info_grd_5037_garaz_truhe_condition;
	information = info_grd_5037_garaz_truhe_info;
	permanent = 0;
	description = "Was ist mit den Truhen hinter dir?";
};


func int info_grd_5037_garaz_truhe_condition()
{
	if(Npc_KnowsInfo(hero,info_grd_5037_garaz_siehtsaus))
	{
		return 1;
	};
};

func void info_grd_5037_garaz_truhe_info()
{
	AI_Output(other,self,"Info_Grd_5037_Garaz_Truhe_15_00");	//Was ist mit den Truhen hinter dir?
	AI_Output(self,other,"Info_Grd_5037_Garaz_Truhe_06_01");	//Was soll damit sein?
	AI_Output(other,self,"Info_Grd_5037_Garaz_Truhe_06_02");	//Was ist da drin?
	AI_Output(self,other,"Info_Grd_5037_Garaz_Truhe_06_03");	//Glaub' nicht, dass dich das was angeht.
};


var int garaz_bier;

instance INFO_GRD_5037_GARAZ_AUSGEBEN(C_Info)
{
	npc = grd_5037_garaz;
	nr = 1;
	condition = info_grd_5037_garaz_ausgeben_condition;
	information = info_grd_5037_garaz_ausgeben_info;
	permanent = 1;
	description = "Hier, das Bier geht auf mich.";
};


func int info_grd_5037_garaz_ausgeben_condition()
{
	if(Npc_KnowsInfo(hero,info_grd_5037_garaz_truhe) && (GARAZ_BIER == FALSE))
	{
		return 1;
	};
};

func void info_grd_5037_garaz_ausgeben_info()
{
	if(Npc_HasItems(other,ItFoBeer) > 0)
	{
		B_GiveInvItems(other,self,ItFoBeer,1);
		AI_Output(other,self,"Grd_5037_Garaz_ausgeben_15_00");	//Hier, das Bier geht auf mich.
		AI_UseItem(self,ItFoBeer);
		AI_Output(self,other,"Grd_5037_Garaz_ausgeben_06_01");	//Das hab ich jetzt gebraucht. Den ganzen Tag rumstehen macht durstig, dass sag' ich dir.
		AI_Output(other,self,"Grd_5037_Garaz_ausgeben_06_02");	//Du wolltest mir erzählen was in den Truhen ist.
		AI_Output(self,other,"Grd_5037_Garaz_ausgeben_06_03");	//Ach ja, in den Truhen befinden sich Vorräte, die mit dem Konvoi gekommen sind und für die Gardisten im Lager und in der Mine sind.
		AI_Output(self,other,"Grd_5037_Garaz_ausgeben_06_04");	//Das ist alles, was es darüber zu erzählen gibt.
		GARAZ_BIER = TRUE;
	}
	else
	{
		AI_Output(other,self,"Grd_5037_Garaz_ausgeben_KEIN_BIER_15_00");	//Hier, das Bier geht auf mich.
		AI_Output(self,other,"Grd_5037_Garaz_ausgeben_KEIN_BIER_06_01");	//Wo? Ich seh' da kein Bier?
		AI_Output(self,other,"Grd_5037_Garaz_ausgeben_KEIN_BIER_06_02");	//Besorg' dir was, dann sehen wir weiter.
	};
};


instance INFO_GRD_5037_GARAZ_TAX(C_Info)
{
	npc = grd_5037_garaz;
	nr = 1;
	condition = info_grd_5037_garaz_tax_condition;
	information = info_grd_5037_garaz_tax_info;
	permanent = 0;
	description = "Du sammelst Zoll von Buddlern ein?";
};


func int info_grd_5037_garaz_tax_condition()
{
	if((ERZ_SCHULDEN == LOG_RUNNING) && Npc_KnowsInfo(hero,vlk_587_garp_typ))
	{
		return 1;
	};
};

func void info_grd_5037_garaz_tax_info()
{
	AI_Output(other,self,"Info_Grd_5037_Garaz_Tax_15_00");	//Ich hab' gehört, du sammelst Durchgangszoll von Buddlern ein?
	AI_Output(self,other,"Info_Grd_5037_Garaz_Tax_06_01");	//Das kann schon sein, aber ich wüsste nicht das dich das was angeht.
	AI_Output(self,other,"Info_Grd_5037_Garaz_Tax_07_02");	//Brauchst dir gar keine Hoffnungen machen. Ich hab' das Erz nicht bei mir. Es ist in meiner Truhe und ohne den Schlüssel bekommst du die nicht auf.
	AI_Output(self,other,"Info_Grd_5037_Garaz_Tax_06_03");	//Und den hab' ich immer bei mir.
	B_LogEntry(CH1_SCHULDEN,"Sieht so aus, als müsste ich mir was überlegen, wie ich an den Schlüssel von Garaz rankomme, damit ich an seine Truhe kann. Vielleicht sollte ich mal mit Miguel reden, wie Garp erwähnt hatte.");
};


var int garaz_wein;

instance INFO_GRD_5037_GARAZ_WEINAUSGEBEN(C_Info)
{
	npc = grd_5037_garaz;
	nr = 1;
	condition = info_grd_5037_garaz_weinausgeben_condition;
	information = info_grd_5037_garaz_weinausgeben_info;
	permanent = 1;
	description = "Wie wär's mit einem Wein?";
};


func int info_grd_5037_garaz_weinausgeben_condition()
{
	if(Npc_KnowsInfo(hero,stt_5036_miguel_garaz) && (GARAZ_WEIN == FALSE))
	{
		return 1;
	};
};

func void info_grd_5037_garaz_weinausgeben_info()
{
	if(Npc_HasItems(other,ItFoWine) > 0)
	{
		B_GiveInvItems(other,self,ItFoWine,1);
		AI_Output(other,self,"Grd_5037_Garaz_WeinAusgeben_15_00");	//Wie wär's mit einem Wein?
		AI_UseItem(self,ItFoWine);
		Mdl_ApplyOverlayMdsTimed(self,"HUMANS_DRUNKEN.MDS",Time_Haste3);
		AI_Output(self,other,"Grd_5037_Garaz_WeinAusgeben_06_01");	//Dasss Zeug ist guuuut, mein Jungeee.
		AI_Output(self,other,"Grd_5037_Garaz_WeinAusgeben_06_02");	//Biiin dir wohl waaas schuldiig.
		AI_Output(other,self,"Grd_5037_Garaz_WeinAusgeben_06_03");	//Ich müsste mir mal deinen Schlüssel ausleihen.
		AI_Output(self,other,"Grd_5037_Garaz_WeinAusgeben_06_04");	//Aber natüüürlich. Hier, niiiimm ruhig. Braaauch ich niiicht.
		B_GiveInvItems(self,other,itke_omcamp_01,1);
		B_LogEntry(CH1_SCHULDEN,"Es hat funktioniert, Garaz gab mir seinen Schlüssel, den ich brauche um damit seine Truhe zu öffnen. Damit komme ich jetzt an das Erz des Buddlers ran.");
		GARAZ_WEIN = TRUE;
	}
	else
	{
		AI_Output(other,self,"Grd_5037_Garaz_ausgeben_KEIN_WeinAusgeben_15_00");	//Wie wär's mit einem Wein?
		AI_Output(self,other,"Grd_5037_Garaz_ausgeben_KEIN_WeinAusgeben_06_01");	//Besorg' dir erstmal welchen, bevor du mich versuchst zu verarschen.
	};
};

