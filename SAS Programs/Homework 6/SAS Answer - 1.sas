TITLE "V506 HOMEWORK06 PART 2 - JIVITESH POOJARY AND QIWEN ZHU";

DATA V506.MFtemp;
	SET V506.Mutualfund;
RUN;

PROC REG ;
	MODEL EXP_RTRN = SD_RTRN/ ALPHA=0.01;
RUN;

DATA V506.MFtemp2;
	SET V506.MFtemp;
	LNSD_RTRN = LOG(SD_RTRN);
RUN;

PROC REG ;
	MODEL EXP_RTRN = LNSD_RTRN/ ALPHA=0.01;
RUN;
