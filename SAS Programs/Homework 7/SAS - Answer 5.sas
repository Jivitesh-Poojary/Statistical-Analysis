TITLE "V506 HOMEWORK07 - JIVITESH POOJARY AND QIWEN ZHU";

PROC UNIVARIATE DATA=V506.Gss_2;
	VAR MAEDUC TVHOURS PARTYID SMOKE;
RUN;

DATA V506.Gtemp;
	SET v506.Gss_2;
	IF MAEDUC = 97 THEN MAEDUC =".";
	IF MAEDUC = 98 THEN MAEDUC =".";
	IF MAEDUC = 99 THEN MAEDUC =".";
	IF TVHOURS = 98 THEN TVHOURS =".";
	IF TVHOURS = 99 THEN TVHOURS =".";
	IF PARTYID = 9 THEN PARTYID =".";

	IF SMOKE = 1 THEN DSMOKE = 1;
	ELSE IF SMOKE =2 THEN DSMOKE = 0;
	ELSE DSMOKE =".";

	IF PARTYID = 0 THEN LEANDEM = 1;
	IF PARTYID = 1 THEN LEANDEM = 1;
	IF PARTYID = 2 THEN LEANDEM = 1;
	IF PARTYID = 3 THEN LEANDEM = 1;
	IF PARTYID = 4 THEN LEANDEM = 0;
	IF PARTYID = 5 THEN LEANDEM = 0;
	IF PARTYID = 6 THEN LEANDEM = 0;

	IF PARTYID = 3 THEN INDEP = 1;
	ELSE INDEP = 0;
RUN;

PROC UNIVARIATE DATA=V506.GTemp;
	VAR MAEDUC TVHOURS PARTYID SMOKE;
RUN;

PROC REG;
	MODEL HEALTH = DSMOKE EDUC PAEDUC MAEDUC CLASS AGE HAPPY REALINC TVHOURS SEXFREQ PARTYID LEANDEM INDEP/STB VIF;
RUN;

PROC REG;
	MODEL HEALTH = DSMOKE EDUC PAEDUC AGE HAPPY REALINC TVHOURS SEXFREQ INDEP/STB VIF;
RUN;

PROC REG;
	MODEL HEALTH = DSMOKE EDUC PAEDUC HAPPY REALINC TVHOURS SEXFREQ INDEP/STB VIF;
RUN;

PROC REG;
	MODEL HEALTH = DSMOKE EDUC PAEDUC HAPPY TVHOURS SEXFREQ INDEP/STB VIF;
RUN;

PROC REG;
	MODEL HEALTH = DSMOKE EDUC HAPPY TVHOURS SEXFREQ INDEP/STB VIF;
RUN;

PROC REG;
	MODEL HEALTH = DSMOKE EDUC HAPPY TVHOURS SEXFREQ/STB VIF;
RUN;

PROC CORR;
	VAR HEALTH DSMOKE EDUC PAEDUC MAEDUC CLASS AGE HAPPY REALINC TVHOURS SEXFREQ PARTYID LEANDEM INDEP;
RUN;
