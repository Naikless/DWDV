
func void B_Story_GotUluMulu()
{
	CreateInvItem(hero,UluMulu);
	B_LogEntry(CH4_UluMulu,"Es ist vollbracht. Tarrok hat von mir alle vier Bestandteile erhalten und baute mir daraus ein Ulu-Mulu. Ich will hoffen, dass es von den Orks in der Stadt �ber dem Schl�fer-Tempel auch wirklich respektiert wird.");
	Log_SetTopicStatus(CH4_UluMulu,LOG_SUCCESS);
	B_GiveXP(XP_GotUluMulu);
	FreemineOrc_LookingUlumulu = LOG_SUCCESS;
};

