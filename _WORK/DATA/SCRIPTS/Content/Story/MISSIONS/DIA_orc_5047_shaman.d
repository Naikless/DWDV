
instance INFO_SHAMAN(C_Info)
{
	npc = orc_5047_shaman;
	nr = 1;
	condition = info_shaman_condition;
	information = info_shaman_info;
	permanent = 0;
	important = 1;
};


func int info_shaman_condition()
{
	return TRUE;
};

func void info_shaman_info()
{
	B_SelectWeapon(self,other);
	AI_SetWalkMode(self,NPC_WALK);
	AI_GotoNpc(self,other);
	AI_Output(self,other,"Info_Shaman_17_01");	//Ich Kar-Nakh.
	AI_Output(self,other,"Info_Shaman_17_02");	//Was du hier tun an heiligem Ort? Du entweiht haben unser Heiligtum!
	AI_Output(self,other,"Info_Shaman_17_03");	//KRUSHAK dich bestrafen werden dafür!
	AI_Output(self,other,"Info_Shaman_17_04");	//Machen dich bereit zum sterben Mensch!
	B_LogEntry(ARTEFACTS,"Kar-Nakh, ein Ork-Schamane hat sich mir in den Weg gestellt und versucht mich aufzuhalten. Er meinte das ich ihre Kultstätte entweiht habe.");
	AI_StopProcessInfos(self);
	Npc_SetAttitude(self,ATT_HOSTILE);
	Npc_SetTempAttitude(self,ATT_HOSTILE);
};

