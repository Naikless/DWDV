
instance MUSICSYSCONFIG(C_MUSICSYS_CFG)
{
	volume = 1;
	bitresolution = 16;
	globalreverbenabled = 1;
	samplerate = 44100;
	numchannels = 16;
	reverbbuffersize = 262144;
};

instance JINGLEFOUNDITEM(C_MUSICJINGLE_DEF)
{
	name = "E-Positive 2";
	transsubtype = TRANSITION_SUB_TYPE_BEAT;
};

instance JINGLELEVELGAIN(C_MUSICJINGLE_DEF)
{
	name = "E-Positive 1";
	transsubtype = TRANSITION_SUB_TYPE_MEASURE;
};

instance JINGLEKILLEDFOE(C_MUSICJINGLE_DEF)
{
	name = "E-Positive 2";
	transsubtype = TRANSITION_SUB_TYPE_BEAT;
};

instance JINGLELEARNTALENT(C_MUSICJINGLE_DEF)
{
	name = "E-Positive 1";
	transsubtype = TRANSITION_SUB_TYPE_BEAT;
};

instance SYS_MENU(C_MUSICTHEME_DEF)
{
	file = "menu.sgt";
	transtype = TRANSITION_TYPE_NONE;
	transsubtype = TRANSITION_SUB_TYPE_BEAT;
	reverbmix = -10;
	reverbtime = 8500;
};

instance SYS_LOADING(C_MUSICTHEME_DEF)
{
	file = "menu.sgt";
	transtype = TRANSITION_TYPE_NONE;
	transsubtype = TRANSITION_SUB_TYPE_BEAT;
	reverbmix = -12;
	reverbtime = 8500;
};

instance DEF_DAY_STD(C_MUSICTHEME_DEF)
{
	file = "ow_day_std.sgt";
};

instance DEF_DAY_THR(C_MUSICTHEME_DEF)
{
	file = "cam_day_thr.sgt";
};

instance DEF_DAY_FGT(C_MUSICTHEME_DEF)
{
	file = "cam_day_fgt.sgt";
};

instance DEF_NGT_STD(C_MUSICTHEME_DEF)
{
	file = "cam_ngt_std.sgt";
};

instance DEF_NGT_THR(C_MUSICTHEME_DEF)
{
	file = "cam_ngt_std.sgt";
};

instance DEF_NGT_FGT(C_MUSICTHEME_DEF)
{
	file = "cam_day_fgt.sgt";
};

instance OC_DAY_STD(C_MUSICTHEME_DEF)
{
	file = "oc_day_std.sgt";
	transtype = TRANSITION_TYPE_BREAK;
	transsubtype = TRANSITION_SUB_TYPE_MEASURE;
};

instance OC_DAY_THR(C_MUSICTHEME_DEF)
{
	file = "oc_day_std.sgt";
	transtype = TRANSITION_TYPE_BREAK;
	transsubtype = TRANSITION_SUB_TYPE_MEASURE;
};

instance OC_DAY_FGT(C_MUSICTHEME_DEF)
{
	file = "oc_day_fgt.sgt";
	transtype = TRANSITION_TYPE_FILL;
	transsubtype = TRANSITION_SUB_TYPE_MEASURE;
};

instance OC_NGT_STD(C_MUSICTHEME_DEF)
{
	file = "cam_ngt_std.sgt";
};

instance OC_NGT_THR(C_MUSICTHEME_DEF)
{
	file = "cam_ngt_thr.sgt";
};

instance OC_NGT_FGT(C_MUSICTHEME_DEF)
{
	file = "oc_day_fgt.sgt";
	transtype = TRANSITION_TYPE_FILL;
	transsubtype = TRANSITION_SUB_TYPE_MEASURE;
};

instance ARE_DAY_STD(C_MUSICTHEME_DEF)
{
	file = "foc_day_std.sgt";
};

instance ARE_DAY_THR(C_MUSICTHEME_DEF)
{
	file = "foc_day_std.sgt";
};

instance ARE_DAY_FGT(C_MUSICTHEME_DEF)
{
	file = "oc_day_fgt.sgt";
	transtype = TRANSITION_TYPE_FILL;
	transsubtype = TRANSITION_SUB_TYPE_MEASURE;
};

instance IE_DAY_STD(C_MUSICTHEME_DEF)
{
	file = "oc_day_std.sgt";
};

instance IE_NGT_STD(C_MUSICTHEME_DEF)
{
	file = "cam_ngt_std.sgt";
};

instance IE_DAY_THR(C_MUSICTHEME_DEF)
{
	file = "oc_day_std.sgt";
};

instance IE_DAY_FGT(C_MUSICTHEME_DEF)
{
	file = "oc_day_fgt.sgt";
};

instance NCO_DAY_STD(C_MUSICTHEME_DEF)
{
	file = "cam_day_std.sgt";
	transtype = TRANSITION_TYPE_BREAK;
	transsubtype = TRANSITION_SUB_TYPE_MEASURE;
};

instance NCO_DAY_THR(C_MUSICTHEME_DEF)
{
	file = "cam_day_thr.sgt";
	transtype = TRANSITION_TYPE_BREAK;
	transsubtype = TRANSITION_SUB_TYPE_MEASURE;
};

instance NCO_DAY_FGT(C_MUSICTHEME_DEF)
{
	file = "cam_day_fgt.sgt";
	transtype = TRANSITION_TYPE_FILL;
	transsubtype = TRANSITION_SUB_TYPE_MEASURE;
};

instance NCO_NGT_STD(C_MUSICTHEME_DEF)
{
	file = "cam_ngt_std.sgt";
};

instance NCO_NGT_THR(C_MUSICTHEME_DEF)
{
	file = "cam_ngt_std.sgt";
};

instance NCO_NGT_FGT(C_MUSICTHEME_DEF)
{
	file = "cam_ngt_std.sgt";
};

instance NCI_DAY_STD(C_MUSICTHEME_DEF)
{
	file = "nci_day_std.sgt";
	transtype = TRANSITION_TYPE_BREAK;
	transsubtype = TRANSITION_SUB_TYPE_MEASURE;
};

instance NCI_DAY_THR(C_MUSICTHEME_DEF)
{
	file = "nci_day_std.sgt";
	transtype = TRANSITION_TYPE_BREAK;
	transsubtype = TRANSITION_SUB_TYPE_MEASURE;
};

instance NCI_DAY_FGT(C_MUSICTHEME_DEF)
{
	file = "nci_day_fgt.sgt";
	transtype = TRANSITION_TYPE_FILL;
	transsubtype = TRANSITION_SUB_TYPE_MEASURE;
};

instance NCI_NGT_STD(C_MUSICTHEME_DEF)
{
	file = "nci_day_std.sgt";
};

instance NCI_NGT_THR(C_MUSICTHEME_DEF)
{
	file = "nci_day_std.sgt";
};

instance NCI_NGT_FGT(C_MUSICTHEME_DEF)
{
	file = "nci_day_fgt.sgt";
	transtype = TRANSITION_TYPE_FILL;
	transsubtype = TRANSITION_SUB_TYPE_MEASURE;
};

instance PSI_DAY_STD(C_MUSICTHEME_DEF)
{
	file = "psi_day_std.sgt";
	transtype = TRANSITION_TYPE_BREAK;
	transsubtype = TRANSITION_SUB_TYPE_MEASURE;
};

instance PSI_DAY_THR(C_MUSICTHEME_DEF)
{
	file = "psi_day_thr.sgt";
	transtype = TRANSITION_TYPE_BREAK;
	transsubtype = TRANSITION_SUB_TYPE_MEASURE;
};

instance PSI_DAY_FGT(C_MUSICTHEME_DEF)
{
	file = "psi_day_fgt.sgt";
	transtype = TRANSITION_TYPE_FILL;
	transsubtype = TRANSITION_SUB_TYPE_MEASURE;
};

instance PSI_NGT_STD(C_MUSICTHEME_DEF)
{
	file = "psi_ngt_std.sgt";
};

instance PSI_NGT_THR(C_MUSICTHEME_DEF)
{
	file = "psi_ngt_std.sgt";
};

instance PSI_NGT_FGT(C_MUSICTHEME_DEF)
{
	file = "psi_day_fgt.sgt";
};

instance OW_DAY_STD(C_MUSICTHEME_DEF)
{
	file = "ow_day_std.sgt";
};

instance OW_DAY_THR(C_MUSICTHEME_DEF)
{
	file = "ow_day_std.sgt";
};

instance OW_DAY_FGT(C_MUSICTHEME_DEF)
{
	file = "ow_day_std.sgt";
};

instance OW_NGT_STD(C_MUSICTHEME_DEF)
{
	file = "ow_day_std.sgt";
};

instance OW_NGT_THR(C_MUSICTHEME_DEF)
{
	file = "ow_day_std.sgt";
};

instance OW_NGT_FGT(C_MUSICTHEME_DEF)
{
	file = "ow_day_std.sgt";
};

instance STA_DAY_STD(C_MUSICTHEME_DEF)
{
	file = "ban_day_std.sgt";
};

instance BEA_DAY_STD(C_MUSICTHEME_DEF)
{
	file = "ow_day_std.sgt";
};

instance BEA_NGT_STD(C_MUSICTHEME_DEF)
{
	file = "ow_day_std.sgt";
};

instance BAN_DAY_STD(C_MUSICTHEME_DEF)
{
	file = "ban_day_std.sgt";
};

instance CAM_DAY_STD(C_MUSICTHEME_DEF)
{
	file = "cam_day_std.sgt";
};

instance CAS_DAY_STD(C_MUSICTHEME_DEF)
{
	file = "cam_day_thr.sgt";
};

instance CAS_NGT_STD(C_MUSICTHEME_DEF)
{
	file = "cam_ngt_std.sgt";
};

instance DT_DAY_STD(C_MUSICTHEME_DEF)
{
	file = "cam_day_thr.sgt";
};

instance DT_NGT_STD(C_MUSICTHEME_DEF)
{
	file = "cam_ngt_std.sgt";
};

instance FC_DAY_STD(C_MUSICTHEME_DEF)
{
	file = "ban_day_std.sgt";
};

instance FC_NGT_STD(C_MUSICTHEME_DEF)
{
	file = "ban_day_std.sgt";
};

instance FOC_DAY_STD(C_MUSICTHEME_DEF)
{
	file = "FOC_day_std.sgt";
};

instance FOC_DAY_THR(C_MUSICTHEME_DEF)
{
	file = "FOC_day_std.sgt";
};

instance FOC_NGT_STD(C_MUSICTHEME_DEF)
{
	file = "FOC_day_std.sgt";
};

instance FOC_NGT_THR(C_MUSICTHEME_DEF)
{
	file = "FOC_day_std.sgt";
};

instance OGR_DAY_STD(C_MUSICTHEME_DEF)
{
	file = "foc_day_std.sgt";
};

instance OGR_NGT_STD(C_MUSICTHEME_DEF)
{
	file = "foc_day_std.sgt";
};

instance OL1_DAY_STD(C_MUSICTHEME_DEF)
{
	file = "ban_day_std.sgt";
};

instance OL1_NGT_STD(C_MUSICTHEME_DEF)
{
	file = "cam_ngt_std.sgt";
};

instance OME_DAY_STD(C_MUSICTHEME_DEF)
{
	file = "cam_day_thr.sgt";
};

instance OME_NGT_STD(C_MUSICTHEME_DEF)
{
	file = "cam_ngt_std.sgt";
};

instance ORC_DAY_STD(C_MUSICTHEME_DEF)
{
	file = "orc_day_std.sgt";
	transtype = TRANSITION_TYPE_BREAK;
	transsubtype = TRANSITION_SUB_TYPE_MEASURE;
};

instance ORC_DAY_THR(C_MUSICTHEME_DEF)
{
	file = "orc_day_std.sgt";
	transtype = TRANSITION_TYPE_BREAK;
	transsubtype = TRANSITION_SUB_TYPE_MEASURE;
};

instance ORC_DAY_FGT(C_MUSICTHEME_DEF)
{
	file = "oc_day_fgt.sgt";
	transtype = TRANSITION_TYPE_FILL;
	transsubtype = TRANSITION_SUB_TYPE_MEASURE;
};

instance ORC_NGT_STD(C_MUSICTHEME_DEF)
{
	file = "orc_day_std.sgt";
};

instance ORC_NGT_THR(C_MUSICTHEME_DEF)
{
	file = "orc_day_std.sgt";
};

instance ORC_NGT_FGT(C_MUSICTHEME_DEF)
{
	file = "oc_day_fgt.sgt";
};

instance OR_DAY_STD(C_MUSICTHEME_DEF)
{
	file = "ban_day_std.sgt";
};

instance OR_DAY_THR(C_MUSICTHEME_DEF)
{
	file = "ban_day_std.sgt";
};

instance OR_DAY_FGT(C_MUSICTHEME_DEF)
{
	file = "oc_day_fgt.sgt";
};

instance OR_NGT_STD(C_MUSICTHEME_DEF)
{
	file = "cam_ngt_std.sgt";
};

instance OR_NGT_THR(C_MUSICTHEME_DEF)
{
	file = "cam_ngt_std.sgt";
};

instance OR_NGT_FGT(C_MUSICTHEME_DEF)
{
	file = "cam_ngt_std.sgt";
};

instance PDN_DAY_STD(C_MUSICTHEME_DEF)
{
	file = "ow_day_std.sgt";
};

instance PDN_NGT_STD(C_MUSICTHEME_DEF)
{
	file = "cam_ngt_std.sgt";
};

instance PIR_DAY_STD(C_MUSICTHEME_DEF)
{
	file = "ban_day_std.sgt";
};

instance STO_DAY_STD(C_MUSICTHEME_DEF)
{
	file = "foc_day_std.sgt";
};

instance STO_NGT_STD(C_MUSICTHEME_DEF)
{
	file = "foc_day_std.sgt";
};

instance TA_DAY_STD(C_MUSICTHEME_DEF)
{
	file = "ow_day_std.sgt";
};

instance TA_NGT_STD(C_MUSICTHEME_DEF)
{
	file = "cam_ngt_std.sgt";
};

instance TD_DAY_STD(C_MUSICTHEME_DEF)
{
	file = "ow_day_std.sgt";
};

instance TD_NGT_STD(C_MUSICTHEME_DEF)
{
	file = "cam_ngt_std.sgt";
};

instance TRU_DAY_STD(C_MUSICTHEME_DEF)
{
	file = "ow_day_std.sgt";
};

instance TRU_NGT_STD(C_MUSICTHEME_DEF)
{
	file = "cam_ngt_std.sgt";
};

instance TPL_DAY_STD(C_MUSICTHEME_DEF)
{
	file = "ogy_day_std.sgt";
};

instance TPL_DAY_THR(C_MUSICTHEME_DEF)
{
	file = "ogy_day_std.sgt";
};

instance TPL_DAY_FGT(C_MUSICTHEME_DEF)
{
	file = "ogy_day_fgt.sgt";
};

instance TPL_NGT_STD(C_MUSICTHEME_DEF)
{
	file = "ogy_day_std.sgt";
};

instance KAT_DAY_STD(C_MUSICTHEME_DEF)
{
	file = "ogy_day_std.sgt";
};

instance KAT_DAY_THR(C_MUSICTHEME_DEF)
{
	file = "ogy_day_std.sgt";
};

instance KAT_DAY_FGT(C_MUSICTHEME_DEF)
{
	file = "ogy_day_fgt.sgt";
};

instance KAT_NGT_STD(C_MUSICTHEME_DEF)
{
	file = "ogy_day_std.sgt";
};

instance SPL_DAY_STD(C_MUSICTHEME_DEF)
{
	file = "ogy_day_std.sgt";
};

instance SPL_DAY_THR(C_MUSICTHEME_DEF)
{
	file = "ogy_day_std.sgt";
};

instance SPL_DAY_FGT(C_MUSICTHEME_DEF)
{
	file = "ogy_day_fgt.sgt";
};

instance SPL_NGT_STD(C_MUSICTHEME_DEF)
{
	file = "ogy_day_std.sgt";
};

instance FRM_DAY_STD(C_MUSICTHEME_DEF)
{
	file = "olm_day_std.sgt";
	transtype = TRANSITION_TYPE_BREAK;
	transsubtype = TRANSITION_SUB_TYPE_MEASURE;
};

instance FRM_DAY_THR(C_MUSICTHEME_DEF)
{
	file = "olm_day_thr.sgt";
	transtype = TRANSITION_TYPE_BREAK;
	transsubtype = TRANSITION_SUB_TYPE_MEASURE;
};

instance FRM_DAY_FGT(C_MUSICTHEME_DEF)
{
	file = "olm_day_fgt.sgt";
	transtype = TRANSITION_TYPE_FILL;
	transsubtype = TRANSITION_SUB_TYPE_MEASURE;
};

instance FRM_NGT_STD(C_MUSICTHEME_DEF)
{
	file = "olm_day_std.sgt";
	transtype = TRANSITION_TYPE_BREAK;
	transsubtype = TRANSITION_SUB_TYPE_MEASURE;
};

instance OLM_DAY_STD(C_MUSICTHEME_DEF)
{
	file = "olm_day_std.sgt";
	transtype = TRANSITION_TYPE_BREAK;
	transsubtype = TRANSITION_SUB_TYPE_MEASURE;
};

instance OLM_NGT_STD(C_MUSICTHEME_DEF)
{
	file = "olm_day_std.sgt";
	transtype = TRANSITION_TYPE_BREAK;
	transsubtype = TRANSITION_SUB_TYPE_MEASURE;
};

instance OLM_DAY_THR(C_MUSICTHEME_DEF)
{
	file = "olm_day_thr.sgt";
	transtype = TRANSITION_TYPE_BREAK;
	transsubtype = TRANSITION_SUB_TYPE_MEASURE;
};

instance OLM_DAY_FGT(C_MUSICTHEME_DEF)
{
	file = "olm_day_fgt.sgt";
	transtype = TRANSITION_TYPE_FILL;
	transsubtype = TRANSITION_SUB_TYPE_MEASURE;
};

instance OGY_DAY_STD(C_MUSICTHEME_DEF)
{
	file = "ogy_day_std.sgt";
};

instance OGY_DAY_THR(C_MUSICTHEME_DEF)
{
	file = "ogy_day_std.sgt";
};

instance OGY_DAY_FGT(C_MUSICTHEME_DEF)
{
	file = "ogy_day_fgt.sgt";
};

instance OGY_NGT_STD(C_MUSICTHEME_DEF)
{
	file = "ogy_day_std.sgt";
};

