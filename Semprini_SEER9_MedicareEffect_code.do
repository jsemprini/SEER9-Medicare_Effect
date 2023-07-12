******SEER Data - 1975-2010, Regression Discontinuity "The Medicare Effect" by Jason Semprini*****
clear all

***Set working directory to SEER cancer case matrices for the following site: 1) oral cancer, 2) Digestive, 3) Respiratory, 4) Skin, 5) Genital, 6) Urinary, 7) Endocrine
foreach n of numlist 1/7{
	clear all
import delimited `n'.csv

rename v1 stage
rename v2 year
rename v3 statecounty
rename v4 sex
rename v5 age
rename v6 race

split age, p(" ")

drop age age2

destring(age1), force replace

rename age1 age

drop if stage=="Blank(s)"
drop if stage=="Unstaged"

gen distant=.
replace distant=0 if stage!=""
replace distant=1 if stage=="Distant" 
tab distant stage, missing

***estimates****
eststo: rdrobust distant age, all c(65)


eststo clear

clear all

}

***Set working directory to SEER case case matrix for the following site: 8) Female Breast***


foreach n of numlist 8{
	clear all
import delimited `n'.csv

rename v1 stage
rename v2 year
rename v3 statecounty
rename v4 sex
rename v5 age
rename v6 race

split age, p(" ")

drop age age2

destring(age1), force replace

rename age1 age

drop if stage=="Blank(s)"
drop if stage=="Unstaged"

gen distant=.
replace distant=0 if stage!=""
replace distant=1 if stage=="Distant" 
tab distant stage, missing

***estimates****
rdplot distant  age, c(65)
eststo: rdrobust distant age, all c(65)


clear all

}

