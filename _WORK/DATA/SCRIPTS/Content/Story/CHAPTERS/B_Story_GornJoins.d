
func void B_Story_GornJoins()
{
	var C_Npc gorn;
	CreateInvItem(hero,ItKe_Freemine);
	Wld_InsertNpc(Razor,"OW_PATH_3001_MOVE");
	Wld_InsertNpc(Razor,"OW_PATH_3001_MOVE2");
	Wld_InsertNpc(Razor,"OW_PATH_3001_MOVE3");
	Wld_InsertNpc(Razor,"OW_PATH_3001_MOVE4");
	gorn = Hlp_GetNpc(PC_Fighter);
	Npc_ExchangeRoutine(gorn,"FollowToFMC");
	B_GiveXP(XP_GornJoins);
	B_LogEntry(CH4_UluMulu,"Gorn und ich sollen in einer verdeckten Operation, die R�ckeroberung der Freien Mine bewerkstelligen. Da� sich auch Ur-Shaks Ork-Freund dort befindet ist eine gl�ckliche F�gung des Schicksals.");
	gorn.aivar[AIV_PARTYMEMBER] = TRUE;
	Gorn_JoinedForFM = TRUE;
};
