
instance DIA_Torlof_EXIT(C_Info)
{
	npc = SLD_737_Torlof;
	nr = 999;
	condition = DIA_Torlof_EXIT_Condition;
	information = DIA_Torlof_EXIT_Info;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int DIA_Torlof_EXIT_Condition()
{
	return 1;
};

func void DIA_Torlof_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Torlof_Hallo(C_Info)
{
	npc = SLD_737_Torlof;
	nr = 1;
	condition = DIA_Torlof_Hallo_Condition;
	information = DIA_Torlof_Hallo_Info;
	permanent = 0;
	description = "Wer bist du?";
};


func int DIA_Torlof_Hallo_Condition()
{
	return 1;
};

func void DIA_Torlof_Hallo_Info()
{
	AI_Output(other,self,"DIA_Torlof_Hallo_15_00");	//Wer bist du?
	AI_Output(self,other,"DIA_Torlof_Hallo_04_01");	//Ich bin Torlof.
	AI_Output(self,other,"DIA_Torlof_Hallo_04_02");	//Hab als Maat auf einem der königlichen Kriegsschiffe bei ner Meuterei mitgemacht. 
	AI_Output(self,other,"DIA_Torlof_Hallo_04_03");	//Kam nicht so gut an. Der größte Teil der Mannschaft war auf der Seite des Käptn's.
	AI_Output(self,other,"DIA_Torlof_Hallo_04_04");	//Seitdem bin ich hier.
};


instance DIA_Torlof_Mitmachen(C_Info)
{
	npc = SLD_737_Torlof;
	nr = 2;
	condition = DIA_Torlof_Mitmachen_Condition;
	information = DIA_Torlof_Mitmachen_Info;
	permanent = 1;
	description = "Ich will bei euch mitmachen.";
};


func int DIA_Torlof_Mitmachen_Condition()
{
	if((Npc_GetTrueGuild(hero) == GIL_None) || (Npc_GetTrueGuild(hero) == GIL_ORG))
	{
		return 1;
	};
};

func void DIA_Torlof_Mitmachen_Info()
{
	AI_Output(other,self,"DIA_Torlof_Mitmachen_15_00");	//Ich will bei euch mitmachen.
	AI_Output(self,other,"DIA_Torlof_Mitmachen_04_01");	//Bevor du nicht einiges auf'm Kasten hast, wird Lee dich nicht nehmen, das sag ich dir gleich.
	AI_Output(self,other,"DIA_Torlof_Mitmachen_04_02");	//Und bis du besser bist, solltest du dich mit Lares und seinen Jungs gut stellen.
	AI_Output(self,other,"DIA_Torlof_Mitmachen_04_03");	//Wenn du nen Tipp willst, Junge: Klau was wichtiges aus dem Alten Lager oder der Alten Mine.
	AI_Output(self,other,"DIA_Torlof_Mitmachen_04_04");	//Wenn die Jungs hier merken, dass du gegen Gomez bist, hast du hier keine Probleme mehr.
	AI_Output(other,self,"DIA_Torlof_Mitmachen_15_05");	//Und wie stelle ich das an?
	AI_Output(self,other,"DIA_Torlof_Mitmachen_04_06");	//Du mußt ihr VERTRAUEN gewinnen - und dann haust du sie über's Ohr!
};

