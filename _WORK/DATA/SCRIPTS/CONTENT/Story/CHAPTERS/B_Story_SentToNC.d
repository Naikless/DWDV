
func void B_Story_SentToNC()
{
	var C_Npc angar;
	var C_Npc YBerion;
	var C_Npc gorn;
	angar = Hlp_GetNpc(GUR_1202_CorAngar);
	Npc_ExchangeRoutine(angar,"start");
	YBerion = Hlp_GetNpc(GUR_1200_YBerion);
	Npc_ExchangeRoutine(YBerion,"dead");
	gorn = Hlp_GetNpc(PC_Fighter);
	PrintDebugNpc(PD_MISSION,gorn.name);
	Npc_ExchangeRoutine(gorn,"NCWAIT");
	AI_ContinueRoutine(gorn);
	Log_CreateTopic(CH3_EscapePlanNC,LOG_MISSION);
	Log_SetTopicStatus(CH3_EscapePlanNC,LOG_RUNNING);
	B_LogEntry(CH3_EscapePlanNC,"Y'Berion, der geistige Vater der Bruderschaft ist tot! Möge seine Seele in Frieden ruhen. In seinen letzten Worten legte er alle Hoffnungen auf ein Entkommen aus der Barriere in die Hände der Magier vom Kreis des Wassers.");
	B_LogEntry(CH3_EscapePlanNC,"Mein Entschluß steht fest. Ich werde mich ins Neue Lager begeben, um den Ausbruchsplan der Wassermagier zu unterstützen. Cor-Angar übergab mir den Schlüssel zur Truhe in Cor-Kaloms Alchemielabor. Darin sollen sich sowohl der Fokusstein als auch der Almanach aus meinen bisherigen Missionen für die Bruderschaft befinden. Cor-Angar glaubt, daß die Magier aus dem Neuen Lager diese beiden Artefakte für ihren Plan benötigen werden.");
	CreateInvItem(self,ItArRuneTeleport5);
	B_GiveInvItems(self,hero,ItArRuneTeleport5,1);
	CorAngar_SendToNC = TRUE;
};

