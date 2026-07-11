
********************************************************************************
* Author       : MD Salek Miah, Md Jamal uddin
* Affiliation  : Department of Statistics, Shahjalal University of Science and Technology (SUST), Sylhet, Bangladesh
* Date         : 2025-05-17
* Project      : Spatial Analysis of Anxiety and Depression in Women 15-49 years
* Description  : Data preparation, variable recoding, and association testing using DHS variables
********************************************************************************

/*
*******************************************************************************
* STATA DO FILE: Mental Health Analysis using BDHS 2022
* Title: Association between Internet usage, ICT use and Ownership and mental health (anxiety and depression) among ever-married women in Bangladesh.
 1. Research Objectives
   - To examine association between Internet use , ICT ownership and usage  and mental health outcomes (anxiety and depression) among ever-married women in Bangladesh
   

*****************************************************************************
*-----------------------------------------------------------------------------
* Research Question***********************************************************
*-----------------------------------------------------------------------------
 2. Research Questions
   - Is there a statistically significant association between Internet use , ICT ownership and usage  and mental health outcomes (anxiety and depression) among ever-married women in Bangladesh?
   
  
*---------------------------------------------------------
*---------------------------------------------------------
*Methodology
/*********************************************************************************
* Study: Association between Media Exposure and Mental Health (PHQ-9 & GAD-7)
* Dataset: BDHS 2022 Individual Recode (IR file)
* Outcome: Depression (PHQ-9 ≥10), Anxiety (GAD-7 ≥10)
* Exposure: 
* Confounders: Sociodemographic, reproductive, empowerment, health variables
* Chi2 test the confounder with outcome variable then if significant it adds in models but same insignificant variales add in models fo face validity just
* using Dagity 
********************************************************************************/*
*---------------------------------------------------------
*----------------------------------------------------------
*/

************************************************************




clear all
set more off
set maxvar 32767
 
use "D:\Research\Saudi\new idea\dataset\BDHS2022_evermarried_depression_anxiety_analysis.dta"

**********************************************************
 *--------------------------------------------------------
 * Outcome:
 *--------------------------------------------------------
 *******************************************************
*******************************************************
***************************************************************
* Create binary depression and anxiety variables (publication standard)
***************************************************************

* Depression: PHQ-9 score (mth22)
gen depression_cat = .
replace depression_cat = 1 if mth22 >= 10 & mth22 <= 27
replace depression_cat = 0 if mth22 < 10 & !missing(mth22)

* Anxiety: GAD-7 score (mth24)
gen anxiety_cat = .
replace anxiety_cat = 1 if mth24 >= 10 & mth24 <= 21
replace anxiety_cat = 0 if mth24 < 10 & !missing(mth24)

* Label definitions and application
label define yesno 0 "No" 1 "Yes"
label values depression_cat yesno
label values anxiety_cat yesno

label variable depression_cat "Depression (PHQ-9 ≥10 = Yes)"
label variable anxiety_cat "Anxiety (GAD-7 ≥10 = Yes)"

* Tabulate
tabulate depression_cat, missing
tabulate anxiety_cat, missing



drop if missing(depression_cat)
drop if missing(anxiety_cat)
*******************************************************
* 3. Optional Checks and Summaries
*******************************************************
histogram phq9_score, normal
histogram gad7_score, normal

**********************************************************************
*****-------------------------------------------------------------------
*Exposures 1: Internet uses 
*------------------------------------------------------------------------
***************************************************************************
generate internet_status = .
replace internet_status = 0 if inlist(internet_freq, 0, 1, 2)
replace internet_status = 1 if inlist(internet_freq, 3, 4)
label define internet_status_lbl 0 "No user" 1 "User"
label values internet_status internet_status_lbl
tab internet_status

**********************************************************************
*****-------------------------------------------------------------------
*Exposures 2: ICT Ownership and usages
*------------------------------------------------------------------------
***************************************************************************
* Frequency Checks


**************************************************************
* Traditional & Digital Media Exposure
**************************************************************

tab v121     // TV ownership
tab v120     // Radio ownership
tab v169a    // Mobile phone ownership
tab v169c    // Smartphone ownership

tab v157     // Newspaper frequency
tab v158     // Radio frequency
tab v159     // TV frequency





/*
*----------------------------------------------------------
* Step 1: Drop non-de jure residents and missing values
*----------------------------------------------------------
drop if v121 == 9 | v120 == 9 | v153 == 9 | v169a == 9
drop if v157 == . | v158 == . | v159 == .

*----------------------------------------------------------
* Step 2: Generate Binary ICT Ownership Variables
*----------------------------------------------------------

* Television
gen tv = .
replace tv = 1 if v121 == 1
replace tv = 0 if v121 == 0

* Radio
gen radio = .
replace radio = 1 if v120 == 1
replace radio = 0 if v120 == 0

* Mobile phone
gen mobile = .
replace mobile = 1 if v169a == 1
replace mobile = 0 if v169a == 0

* Smartphone
gen smartphone = .
replace smartphone = 1 if v169c == 1
replace smartphone = 0 if v169c == 0
replace smartphone = 0 if mobile == 0 & smartphone == .   // Non-owners = 0

*----------------------------------------------------------
* Step 3: Create ICT Ownership Index (0 to 4)
*----------------------------------------------------------
gen ict_ownership = tv + radio + mobile + smartphone
label variable ict_ownership "ICT Ownership Index (0–4)"

* Optional: Categorize ICT ownership
gen ownership_level = .
replace ownership_level = 0 if ict_ownership == 0
replace ownership_level = 1 if ict_ownership >= 1 & ict_ownership <= 2
replace ownership_level = 2 if ict_ownership > 2
label define own_lbl 0 "None" 1 "Moderate" 2 "High"
label values ownership_level own_lbl

tab ownership_level
*----------------------------------------------------------
* Step 4: Recode Media Usage Variables (0 = None, 1 = <1/week, 2 = ≥1/week)
*----------------------------------------------------------

* Newspaper
recode v157 (0 = 0 "Not at all") (1 = 1 "Less than once/week") (2 = 2 "At least once/week"), gen(news_use)

* Radio
recode v158 (0 = 0 "Not at all") (1 = 1 "Less than once/week") (2 = 2 "At least once/week"), gen(radio_use)

* TV
recode v159 (0 = 0 "Not at all") (1 = 1 "Less than once/week") (2 = 2 "At least once/week"), gen(tv_use)

*----------------------------------------------------------
* Step 5: Create ICT Usage Index (0 to 6)
*----------------------------------------------------------
gen ict_usage = news_use + radio_use + tv_use
label variable ict_usage "ICT Media Usage Index (0–6)"

* Optional: Categorize ICT usage
gen usage_level = .
replace usage_level = 0 if ict_usage == 0
replace usage_level = 1 if ict_usage >= 1 & ict_usage <= 2
replace usage_level = 2 if ict_usage > 2
label define usage 0 "No use" 1 "Moderate use" 2 "High use"
label values usage_level usage


tab usage_level
*/
*----------------------------------------------------------
* Step 1: Drop non-de jure residents and missing values
*----------------------------------------------------------
drop if v121 == 9 | v120 == 9 | v153 == 9 | v169a == 9
drop if v157 == . | v158 == . | v159 == .

*----------------------------------------------------------
* Step 2: Generate Binary ICT Ownership Variables
*----------------------------------------------------------

* Television
gen tv = .
replace tv = 1 if v121 == 1
replace tv = 0 if v121 == 0

* Radio
gen radio = .
replace radio = 1 if v120 == 1
replace radio = 0 if v120 == 0

* Mobile phone
gen mobile = .
replace mobile = 1 if v169a == 1
replace mobile = 0 if v169a == 0

* Smartphone
gen smartphone = .
replace smartphone = 1 if v169c == 1
replace smartphone = 0 if v169c == 0
replace smartphone = 0 if mobile == 0 & smartphone == .

*----------------------------------------------------------
* Step 3: Create Binary ICT Ownership Variable
*----------------------------------------------------------
gen ict_ownership = tv + radio + mobile + smartphone
label variable ict_ownership "ICT Ownership Count (0–4)"

gen ownership_level = .
replace ownership_level = 0 if ict_ownership == 0
replace ownership_level = 1 if ict_ownership >= 1
label define owner_level 0 "No ownership" 1 "Any ownership"
label values ownership_level owner

tab ownership_level

*----------------------------------------------------------
* Step 4: Recode Media Usage to Binary: 0 = No use, 1 = Use
*----------------------------------------------------------

* Newspaper
gen news_use = .
replace news_use = 0 if v157 == 0 | v157 == 1
replace news_use = 1 if v157 == 2
label define news_lbl 0 "No use" 1 "Use"
label values news_use news_lbl

* Radio
gen radio_use = .
replace radio_use = 0 if v158 == 0 | v158 == 1
replace radio_use = 1 if v158 == 2
label define radio_lbl 0 "No use" 1 "Use"
label values radio_use radio_lbl

* TV
gen tv_use = .
replace tv_use = 0 if v159 == 0 | v159 == 1
replace tv_use = 1 if v159 == 2
label define tv_lbl 0 "No use" 1 "Use"
label values tv_use tv_lbl

*----------------------------------------------------------
* Step 5: Create Binary ICT Media Usage Variable
*----------------------------------------------------------
gen ict_usage = news_use + radio_use + tv_use
label variable ict_usage "ICT Media Usage Count (0–3)"

gen usage_level = .
replace usage_level = 0 if ict_usage == 0
replace usage_level = 1 if ict_usage >= 1
label define usage_level 0 "No use" 1 "Users"
label values usage_level usage_bin

tab usage_level










*******************************************************************************
********************************************************************************
* SECTION : CONFOUNDERS
********************************************************************************
*******************************************************************************
* Frequences

**************************************************************
* Sociodemographic Variables
**************************************************************

tab v128     // Interviewer's observation of respondent's weight
tab v012     // Respondent's age
tab v106     // Respondent's education
tab v501     // Marital status
tab v218     // Number of living children
tab v213     // Currently pregnant
tab v504     // Relationship to household head
tab v406     // Age at first birth
tab v503     // Number of unions
tab v216     // Age at first cohabitation
tab s1115a   // Woman's age at 1st menses
tab v636     // Media exposure index (derived)
tab v621     // Frequency of reading newspaper
tab v745a    // Husband/partner education
tab v743a    // Partner controls where she can go
tab v743b    // Partner controls contact with family
tab v743f    // Partner controls money use
tab s111a    // Women's empowerment indicator
tab v632     // Decision on health care
tab v743d    // Decision on large purchases
tab v745a    // Partner's highest education


**************************************************************
* Intimate Partner Violence (IPV) Variables — Full
**************************************************************

tab v744a    // Ever been pushed/shaken/slapped
tab v744b    // Ever been punched/hit
tab v744c    // Ever been kicked/dragged/beaten
tab v744d    // Ever been strangled/burned/threatened
tab v744e    // Ever been forced into sexual acts

**************************************************************
* Household & Wealth Indicators
**************************************************************

tab v150     // Ethnicity
tab v025, mis // Place of residence (urban/rural)
tab v024, mis // Region/division
tab v130     // Religion
tab v190, mis // Wealth index
tab v136, mis // Household size
tab v151, mis // Sex of household head
tab v714     // Currently working
tab s115_1   // Father's education









*** 1. INDIVIDUAL-LEVEL SOCIODEMOGRAPHIC VARIABLES ***
* Age Group recoding and labeling with missing handling

gen women_age = .
replace women_age = 1 if inrange(v012, 15, 19)
replace women_age = 2 if inrange(v012, 20, 24)
replace women_age = 3 if inrange(v012, 25, 29)
replace women_age = 4 if inrange(v012, 30, 34)
replace women_age = 5 if inrange(v012, 35, 39)
replace women_age = 6 if inrange(v012, 40, 44)
replace women_age = 7 if inrange(v012, 45, 49)

label define agegroup 1 "15–19" 2 "20–24" 3 "25–29" 4 "30–34" 5 "35–39" 6 "40–44" 7 "45–49", replace
label values women_age agegroup

tab women_age


* Woman's Education
gen education_woman = .
replace education_woman = 0 if v106 <= 1
replace education_woman = 1 if v106 == 2
replace education_woman = 2 if v106 >= 3
label define edu_lbl 0 "No/Primary" 1 "Secondary Incomplete" 2 "Secondary+"
label values education_woman edu_lbl

tab education_woman




* Number of Living Children with missing handling
tab v128
gen num_children = .
replace num_children = 0 if v218 == 0
replace num_children = 1 if inrange(v218, 1, 2)
replace num_children = 2 if v218 >= 3 & v218 != .

label define child_lbl 0 "None" 1 "1–2" 2 "3+", replace
label values num_children child_lbl

tab num_children




* Recode v213 to a new variable called currently_pregnant
tab v213

gen currently_pregnant = .
replace currently_pregnant = 0 if v213 == 0    // no or unsure
replace currently_pregnant = 1 if v213 == 1    // yes

* Label the new variable
label define preg_lbl 0 "No or unsure" 1 "Yes"
label values currently_pregnant preg_lbl

* Add a variable label
label variable currently_pregnant "Currently pregnant status"


tab currently_pregnant


* Recode v504 to a new variable called residing_with

tab v504
gen residing_status = .
replace residing_status = 1 if v504 == 1
replace residing_status = 0 if inlist(v504, 2, 3)

label define residing_status_lbl 0 "Not residing with husband/partner" 1 "Residing with husband/partner"
label values residing_status residing_status_lbl
label variable residing_status "Current residence status with husband/partner"

tab residing_status


 tab v406 // abstainng
 

 
* Create binary variable: 1 = Yes, 0 = No
gen currently_abstaining = .
replace currently_abstaining = 1 if v406 == 1
replace currently_abstaining = 0 if v406 == 0

* Define and assign value labels
label define abstain_lbl 0 "No" 1 "Yes"
label values currently_abstaining abstain_lbl

* Label the variable for publication
label variable currently_abstaining "Currently abstaining from sexual intercourse (Yes=1, No=0)"

* Check the result
tab currently_abstaining
 
 tab v503 // কয়বার বিবাহ/দাম্পত্য সম্পর্ক

* Create a binary variable: 0 = once, 1 = more than once
gen number_of_unions = .
replace number_of_unions = 0 if v503 == 1
replace number_of_unions = 1 if v503 > 1

* Define value labels
label define union_lbl 0 "Once" 1 "More than once"

* Assign value labels
label values number_of_unions union_lbl

* Label the variable for publication
label variable number_of_unions "Number of marital unions (Once = 0, More than once = 1)"

* Tabulate to confirm
tab number_of_unions

 
 
 
 
 
 
 

* Generate a new variable menstruated_last6wks
gen menstruated_last6wks = .
replace menstruated_last6wks = 1 if v216 == 1   // yes
replace menstruated_last6wks = 0 if v216 == 0   // no

* Label the new variable values
label define menses_lbl 0 "No" 1 "Yes"
label values menstruated_last6wks menses_lbl

* Label the variable
label variable menstruated_last6wks "Menstruated in last six weeks"

* Check the recoded variable with a tabulation
tab menstruated_last6wks




* Generate binary variable: 1 = Yes, 0 = No
gen has_health_card = .
replace has_health_card = 1 if s1115a == 1
replace has_health_card = 0 if s1115a == 0

* Define and apply value labels
label define healthcard_lbl 0 "No" 1 "Yes"
label values has_health_card healthcard_lbl

* Label the variable clearly for publication
label variable has_health_card "Possesses a free/subsidized health care services card (Yes=1, No=0)"

* Check the result
tab has_health_card


* pregnent
rename v636 pressure_to_pregnant

tab pressure_to_pregnant

*Empowerment Index
gen emp_health = inlist(v743a, 1, 2)   // respondent alone or joint
gen emp_purchase = inlist(v743b, 1, 2)
gen emp_money = inlist(v743f, 1, 2)
gen emp_visit = inlist(v743d, 1, 2)
gen emp_fp = inlist(v632, 1, 3)        // respondent or joint decision

* Composite empowerment score
gen emp_score = emp_health + emp_purchase + emp_money + emp_visit + emp_fp



gen emp_level = .
replace emp_level = 0 if emp_score <= 2   // No
replace emp_level = 1 if emp_score >= 3   // Yes
label define emp_lbl 0 "No" 1 "Yes"
label values emp_level emp_lbl

tab emp_level // Yes" (empowered) ,"No" (not empowered)












 tab v621 // husband desire for children

* Drop existing if necessary
capture drop husb_pref_more_same

* Generate and label
gen husb_pref_more_same = .
replace husb_pref_more_same = 1 if inlist(v621, 1, 2)
replace husb_pref_more_same = 0 if v621 == 3

label define husb_pref_lbl 0 "No: husband wants fewer" 1 "Yes: same or more"
label values husb_pref_more_same husb_pref_lbl
label variable husb_pref_more_same "Husband's fertility preference: same/more = 1, fewer = 0"

* Summary table
tab husb_pref_more_same





tab v632 // decision maker for using contraception


gen contracept_decision = .
replace contracept_decision = 1 if inlist(v632, 1, 3)     // respondent or joint decision
replace contracept_decision = 0 if inlist(v632, 2, 4, 6)  // husband/partner, someone else, other
label define contraceptision_lbl 0 "Husband/Other" 1 "Respondent/Joint"
label values contracept_decision contraceptision_lbl
tab contracept_decision









* IPV
 tab v744a
 tab v744b
 tab v744c
 tab v744d
 tab v744e
 
 * Recode "don't know" (usually coded as 2) to missing for each IPV justification question
foreach var in v744a v744b v744c v744d v744e {
    replace `var' = . if `var' == 2
}

* Generate IPV justification binary variable:
* 1 = Justifies beating in at least one condition
* 0 = Does NOT justify beating in any condition
gen ipv_justified = 0
replace ipv_justified = 1 if v744a == 1 | v744b == 1 | v744c == 1 | v744d == 1 | v744e == 1

* Label the variable for publication
label define ipv_lbl 0 "Does not justify IPV" 1 "Justifies IPV"
label values ipv_justified ipv_lbl
label variable ipv_justified "Justification of intimate partner violence (any condition)"

* Tabulate the new variable
tab ipv_justified, missing

 


*******Another confounder****

* Place of residence/area (v025)
rename v025 area
tab area, mis

label define area_label 1 "Urban" 2 "Rural"
label values area area_label
tabulate area

* Division (v024)
rename v024 hh_division
tab hh_division, mis


* Religion (v130)
* Step 1: Generate binary religion variable
* Drop existing variable if it exists
capture drop religion_bin

* Create religion_bin variable with missing initially
gen religion_bin = .

* Assign 1 = Muslim if v130 == 1
replace religion_bin = 1 if v130 == 1

* Assign 0 = Non-Muslim if v130 is in 2,3,4,5 (Hinduism, Buddhist, Christianity, Others)
replace religion_bin = 0 if inlist(v130, 2, 3, 4, 5)

* For any other values (including missing), assign Non-Muslim (0) to have no missing in religion_bin
replace religion_bin = 0 if missing(religion_bin)

* Label the variable
label define rel_lbl 1 "Muslim" 0 "Non-Muslim"
label values religion_bin rel_lbl

* Check frequencies
tab religion_bin

* Household wealth index v190 

* Drop existing categorized wealth variable if it exists
capture drop wealth_cat

* Create a new variable for wealth category
gen wealth_cat = .

* Categorize: Poor (poorest + poorer)
replace wealth_cat = 0 if inlist(v190, 1, 2)   // 1 = poorest, 2 = poorer

* Categorize: Middle class (middle)
replace wealth_cat = 1 if v190 == 3

* Categorize: Rich (richer + richest)
replace wealth_cat = 2 if inlist(v190, 4, 5)

* Label the variable categories
label define wealth_lbl 0 "Poor" 1 "Middle Class" 2 "Rich"
label values wealth_cat wealth_lbl

* Check the frequencies
tab wealth_cat


* Household size (v136)
tab v136, mis

* Drop existing categorized variable if exists
capture drop hh_size_cat

* Generate new categorical variable
gen hh_size_cat = .

* Assign 0 if household size is 1, 2, or 3
replace hh_size_cat = 0 if inlist(v136, 1, 2, 3)

* Assign 1 if household size is 4 or more
replace hh_size_cat = 1 if v136 >= 4

* Label the categories
label define hh_lbl 0 "1-3 members" 1 "4 or more members"
label values hh_size_cat hh_lbl

* Tabulate to check
tab hh_size_cat


* sex of the household head (V151)
tab v151, mis
rename v151 hh_head_sex
tab hh_head_sex


* currently working
rename  v714 currently_working
tab currently_working

* father edu
rename s115_1 father_edu

tab father_edu



****************************************************************************
*---------------------------------------------------------------------------
// Sampling weight
*Since DHS follws stratified sampling we need to apply survey weigth, primary sampling unit (V021), and sampling strata (V022).
*In DHS we need to create Weight variable first, following this formula:
***-------------------------------------------------------------
gen WGT=(v005/1000000)

*Now we will label this variable 

label variable WGT "Survey Weight"
svyset [pw=WGT],psu(v021) strata(v022)
****************************************************************************
 
* Stepwoise variable selection for adjusted models
*******************************************************************************
* Depression and anxiety
*******************************************************************************
* Bivariate association between each variable and depression
* Bivariate association between each variable and depression

tab depression internet_status,chi2
tab depression ownership_level,chi2
tab depression usage_level,chi2




tab depression women_age, chi2 //  significant so add in models
tab depression education_woman, chi2 // significant so add in model
tab depression marital_status, chi2 // significant so add in model
tab depression num_children, chi2 // significant so add in models
tab depression currently_pregnant, chi2 // not significant but add in models cz , face validity and theoretical justification 
tab depression residing_status, chi2 // not signiicant but add for face validity
tab depression menstruated_last6wks, chi2 //  significant
tab  depression currently_abstaining , chi2 // not significant
tab depression number_of_unions ,chi2 // significant p= 0.011
tab depression emp_level , chi2 // significant p = 0.025
tab depression has_health_card , chi2 // insignificantr
tab depression pressure_to_pregnant, chi2 // significant 
tab depression husb_pref_more_same, chi2 // insignificant 
tab depression contracept_decision, chi2 // significant

tab depression ipv_justified,chi2 // insignificant but add for face valifdity


tab depression area, chi2 // not significant but add for face validity
tab depression hh_division, chi2 //  statistically significant 
tab depression religion_bin, chi2 //  significant
tab depression wealth_cat, chi2 // significant
tab depression hh_size_cat, chi2 // insignificant but add for face validity
tab depression hh_head_sex, chi2 //  significant
tab depression currently_working, chi2 // not significant
tab depression father_edu, chi2 // significant



svy:logistic depression father_edu


tab anxiety internet_status,chi2
tab anxiety ownership_level,chi2
tab anxiety usage_level,chi2


* Repeat for anxiety
* Bivariate association between each variable and anxiety
tab anxiety women_age, chi2      // significant so add in models
tab anxiety education_woman, chi2 // significant so add in model
tab anxiety num_children, chi2    // significant so add in models
tab anxiety currently_pregnant, chi2 // not significant but add in models due to face validity and theory
tab anxiety residing_status, chi2  // not significant but add for face validity
tab anxiety menstruated_last6wks, chi2 // significant
tab anxiety currently_abstaining, chi2 // not significant
tab anxiety number_of_unions, chi2 // insignificant
tab anxiety emp_level, chi2         // significant 
tab anxiety has_health_card, chi2   // insignificant
tab anxiety pressure_to_pregnant, chi2 // significant
tab anxiety husb_pref_more_same, chi2  // insignificant
tab anxiety contracept_decision, chi2   // significant

tab anxiety ipv_justified, chi2   // insignificant but add for face validity

tab anxiety area, chi2             // not significant but add for face validity
tab anxiety hh_division, chi2      // statistically significant
tab anxiety religion_bin, chi2     // significant
tab anxiety wealth_cat, chi2        // insignificant but add for face validity
tab anxiety hh_size_cat, chi2       // insignificant but add for face validity
tab anxiety hh_head_sex, chi2       // insignificant
tab anxiety currently_working, chi2 // not significant
tab anxiety father_edu, chi2        // significant








tab depression internet_status,chi2
tab depression ownership_level,chi2
tab depression usage_level,chi2






tab anxiety internet_status,chi2
tab anxiety ownership_level,chi2
tab anxiety usage_level,chi2




*******************************************************************************
*------------------------------------------------------------------------------
*  Unadjusted ODDS Ratio  models
*------------------------------------------------------------------------------
*******************************************************************************
* Crude models with exposure :internet_status 
svy: logistic depression i.internet_status
svy: logistic anxiety i.internet_status





* Crude models with exposure :ICT usage 
svy: logistic depression i. usage_level
svy: logistic anxiety i. usage_level




* Crude models with exposure :ICT ownership
svy: logistic depression i.ownership_level
svy: logistic anxiety i.ownership_level







*******************************************************************************
*------------------------------------------------------------------------------
*  Adjusted ODDS Ratio  models 1
*------------------------------------------------------------------------------

* Exposure 1:internet_status
* AOR  
	
svy: logistic depression i.internet_status ///
    i.women_age i.education_woman i.num_children ///
    i.currently_pregnant i.residing_status i.menstruated_last6wks ///
    i.number_of_unions i.emp_level i.pressure_to_pregnant i.contracept_decision ///
    i.ipv_justified i.area i.hh_division i.religion_bin i.wealth_cat ///
    i.hh_size_cat i.hh_head_sex 
	
	
	
estat gof, group(10) // Hosmer–Lemeshow (deciles)	

/*

estat gof, group(10) // Hosmer–Lemeshow (deciles)     

Logistic model for depression_cat, goodness-of-fit test

                     F(9,631) =         2.92
                     Prob > F =         0.0021
*/

	
*  Check multicollinearity with linear regression
	regress depression i.internet_status ///
    i.women_age i.education_woman i.num_children ///
    i.currently_pregnant i.residing_status i.menstruated_last6wks ///
    i.number_of_unions i.emp_level i.pressure_to_pregnant i.contracept_decision ///
    i.ipv_justified i.area i.hh_division i.religion_bin i.wealth_cat ///
    i.hh_size_cat i.hh_head_sex 
	

vif // (Mean VIF =1.69) remove father education for collinearity 
	
* Godness of fit	
	logistic depression i.internet_status ///
    i.women_age i.education_woman i.num_children ///
    i.currently_pregnant i.residing_status i.menstruated_last6wks ///
    i.number_of_unions i.emp_level i.pressure_to_pregnant i.contracept_decision ///
    i.ipv_justified i.area i.hh_division i.religion_bin i.wealth_cat ///
    i.hh_size_cat i.hh_head_sex 
   estat gof 	
	
/*

Goodness-of-fit test after logistic model
Variable: depression_cat

      Number of observations =   5,486
Number of covariate patterns =   4,493
          Pearson chi2(4460) = 4806.48
                 Prob > chi2 =  0.0002
*/
	
	
	
	
* Exposures 2:usage_level	
	
		
svy: logistic depression i.usage_level	 ///
    i.women_age i.education_woman i.num_children ///
    i.currently_pregnant i.residing_status i.menstruated_last6wks ///
    i.number_of_unions i.emp_level i.pressure_to_pregnant i.contracept_decision ///
    i.ipv_justified i.area i.hh_division i.religion_bin i.wealth_cat ///
    i.hh_size_cat i.hh_head_sex 
	
*  Check multicollinearity with linear regression
	regress depression i.usage_level ///
    i.women_age i.education_woman i.num_children ///
    i.currently_pregnant i.residing_status i.menstruated_last6wks ///
    i.number_of_unions i.emp_level i.pressure_to_pregnant i.contracept_decision ///
    i.ipv_justified i.area i.hh_division i.religion_bin i.wealth_cat ///
    i.hh_size_cat i.hh_head_sex 
	

vif // (Mean VIF =1.93) remove father education for collinearity 
	
* Godness of fit	
	logistic depression i.usage_level ///
    i.women_age i.education_woman i.num_children ///
    i.currently_pregnant i.residing_status i.menstruated_last6wks ///
    i.number_of_unions i.emp_level i.pressure_to_pregnant i.contracept_decision ///
    i.ipv_justified i.area i.hh_division i.religion_bin i.wealth_cat ///
    i.hh_size_cat i.hh_head_sex 
   estat gof 	
	
/*

Goodness-of-fit test after logistic model
Variable: depression_cat

      Number of observations =   18,987
Number of covariate patterns =   14,004
         Pearson chi2(13970) = 14607.42
                 Prob > chi2 =   0.0001

*/	
	
	
* Exposures :ownership_level
	
	
		
svy: logistic depression i.ownership_level	///
    i.women_age i.education_woman i.num_children ///
    i.currently_pregnant i.residing_status i.menstruated_last6wks ///
    i.number_of_unions i.emp_level i.pressure_to_pregnant i.contracept_decision ///
    i.ipv_justified i.area i.hh_division i.religion_bin i.wealth_cat ///
    i.hh_size_cat i.hh_head_sex 
	
*  Check multicollinearity with linear regression
	regress depression i.ownership_level ///
    i.women_age i.education_woman i.num_children ///
    i.currently_pregnant i.residing_status i.menstruated_last6wks ///
    i.number_of_unions i.emp_level i.pressure_to_pregnant i.contracept_decision ///
    i.ipv_justified i.area i.hh_division i.religion_bin i.wealth_cat ///
    i.hh_size_cat i.hh_head_sex 
	

vif // (Mean VIF =2.00) remove father education for collinearity 
	
* Godness of fit	
	logistic depression i.ownership_level ///
    i.women_age i.education_woman i.num_children ///
    i.currently_pregnant i.residing_status i.menstruated_last6wks ///
    i.number_of_unions i.emp_level i.pressure_to_pregnant i.contracept_decision ///
    i.ipv_justified i.area i.hh_division i.religion_bin i.wealth_cat ///
    i.hh_size_cat i.hh_head_sex 
   estat gof 	
	
/*

Goodness-of-fit test after logistic model
Variable: depression_cat

      Number of observations =   18,987
Number of covariate patterns =   14,078
         Pearson chi2(14044) = 14688.53
                 Prob > chi2 =   0.0001

*/	
	
	
	
	
	

*******************************************************************************
*------------------------------------------------------------------------------
*  Adjusted ODDS Ratio  models 2
*------------------------------------------------------------------------------
******************************************************************************* 
* Anxiety
*******************************************************************************




* Exposures 1: Internet status
svy: logistic anxiety ///
     i.internet_status ///
     i.women_age ///
     i.education_woman ///
     i.num_children ///
     i.currently_pregnant ///
     i.residing_status ///
     i.menstruated_last6wks ///
     i.emp_level ///
     i.pressure_to_pregnant ///
     i.contracept_decision ///
     i.ipv_justified ///
     i.area ///
     i.hh_division ///
     i.religion_bin ///
     i.wealth_cat ///
     i.hh_size_cat 
   
    

	
	
*  Check multicollinearity with linear regression
	regress anxiety ///
     i.internet_status ///
     i.women_age ///
     i.education_woman ///
     i.num_children ///
     i.currently_pregnant ///
     i.residing_status ///
     i.menstruated_last6wks ///
     i.emp_level ///
     i.pressure_to_pregnant ///
     i.contracept_decision ///
     i.ipv_justified ///
     i.area ///
     i.hh_division ///
     i.religion_bin ///
     i.wealth_cat ///
     i.hh_size_cat 

    
    

vif // (Mean VIF =1.93) remove father education for collinearity 
	
* Godness of fit	
	logistic anxiety ///
     i.internet_status ///
     i.women_age ///
     i.education_woman ///
     i.num_children ///
     i.currently_pregnant ///
     i.residing_status ///
     i.menstruated_last6wks ///
     i.emp_level ///
     i.pressure_to_pregnant ///
     i.contracept_decision ///
     i.ipv_justified ///
     i.area ///
     i.hh_division ///
     i.religion_bin ///
     i.wealth_cat ///
     i.hh_size_cat 

	 estat gof 	
		
/*

Goodness-of-fit test after logistic model
Variable: anxiety_cat

      Number of observations =   5,486
Number of covariate patterns =   4,493
          Pearson chi2(4460) = 4788.42
                 Prob > chi2 =  0.0003

*/	
	
	
	
	
	
*Exposure 2: usage_level
	
	
	

svy: logistic anxiety ///
     i.usage_level ///
     i.women_age ///
     i.education_woman ///
     i.num_children ///
     i.currently_pregnant ///
     i.residing_status ///
     i.menstruated_last6wks ///
     i.emp_level ///
     i.pressure_to_pregnant ///
     i.contracept_decision ///
     i.ipv_justified ///
     i.area ///
     i.hh_division ///
     i.religion_bin ///
     i.wealth_cat ///
     i.hh_size_cat ///
     i.father_edu 
    
	
	
	
*  Check multicollinearity with linear regression
	regress  anxiety ///
     i.usage_level ///
     i.women_age ///
     i.education_woman ///
     i.num_children ///
     i.currently_pregnant ///
     i.residing_status ///
     i.menstruated_last6wks ///
     i.emp_level ///
     i.pressure_to_pregnant ///
     i.contracept_decision ///
     i.ipv_justified ///
     i.area ///
     i.hh_division ///
     i.religion_bin ///
     i.wealth_cat ///
     i.hh_size_cat ///
     i.father_edu 
    
	  

vif // (Mean VIF =8.95) remove father education for collinearity 
	
* Godness of fit	
	logistic anxiety ///
     i.usage_level ///
     i.women_age ///
     i.education_woman ///
     i.num_children ///
     i.currently_pregnant ///
     i.residing_status ///
     i.menstruated_last6wks ///
     i.emp_level ///
     i.pressure_to_pregnant ///
     i.contracept_decision ///
     i.ipv_justified ///
     i.area ///
     i.hh_division ///
     i.religion_bin ///
     i.wealth_cat ///
     i.hh_size_cat ///
     i.father_edu 

	 estat gof 	
/*

      Number of observations =   18,987
Number of covariate patterns =   15,004
         Pearson chi2(14968) = 14955.08
                 Prob > chi2 =   0.5282

*/	
	
	
	
	
	

	
	
	
	
* Exposures 3: Ownership
svy: logistic anxiety ///
     i. ownership_level ///
     i.women_age ///
     i.education_woman ///
     i.num_children ///
     i.currently_pregnant ///
     i.residing_status ///
     i.menstruated_last6wks ///
     i.emp_level ///
     i.pressure_to_pregnant ///
     i.contracept_decision ///
     i.ipv_justified ///
     i.area ///
     i.hh_division ///
     i.religion_bin ///
     i.wealth_cat ///
     i.hh_size_cat ///
     i.father_edu 
    

	
	
*  Check multicollinearity with linear regression
	regress  anxiety ///
     i.ownership_level ///
     i.women_age ///
     i.education_woman ///
     i.num_children ///
     i.currently_pregnant ///
     i.residing_status ///
     i.menstruated_last6wks ///
     i.emp_level ///
     i.pressure_to_pregnant ///
     i.contracept_decision ///
     i.ipv_justified ///
     i.area ///
     i.hh_division ///
     i.religion_bin ///
     i.wealth_cat ///
     i.hh_size_cat ///
     i.father_edu 
    
	  

vif // (Mean VIF =9.01) remove father education for collinearity 
	
* Godness of fit	
	logistic anxiety ///
     i.ownership_level ///
     i.women_age ///
     i.education_woman ///
     i.num_children ///
     i.currently_pregnant ///
     i.residing_status ///
     i.menstruated_last6wks ///
     i.emp_level ///
     i.pressure_to_pregnant ///
     i.contracept_decision ///
     i.ipv_justified ///
     i.area ///
     i.hh_division ///
     i.religion_bin ///
     i.wealth_cat ///
     i.hh_size_cat ///
     i.father_edu 

	 estat gof 	
/*
   Number of observations =   18,987
Number of covariate patterns =   15,062
         Pearson chi2(15026) = 15007.64
                 Prob > chi2 =   0.5407
    
*/	
	
	
	
	
	
* Save the updated dataset to your desired folder
save "D:\Research\Saudi\new idea\dataset\updated_ict_mental_health.dta", replace	
	
	
	
	


*******************************************************************************

*******************************************************************************
******************************************************************************* 
* Anxiety
*******************************************************************************


***************************************************************************
* Final output of association  model
***************************************************************************

*******************************************************************************
*-------------------------
* Stratified analysis. Interaction 
*-------------------------

*******************************************************************************
tab area

* binary indicator for Rural:
gen byte rural_subpop = (area == 2)


*For Urban

gen byte urban_subpop = (area == 1)




* depression
 *stratified logistic regression for Rural 
 
 
svy, subpop(rural_subpop): logistic depression i.internet_status ///
    i.women_age i.education_woman i.num_children ///
    i.currently_pregnant i.residing_status i.menstruated_last6wks ///
    i.number_of_unions i.emp_level i.pressure_to_pregnant i.contracept_decision ///
    i.ipv_justified i.hh_division i.religion_bin i.wealth_cat ///
    i.hh_size_cat i.hh_head_sex 
 
 
 
 
 
svy, subpop(rural_subpop): logistic depression i.usage_level ///
    i.women_age i.education_woman i.num_children ///
    i.currently_pregnant i.residing_status i.menstruated_last6wks ///
    i.number_of_unions i.emp_level i.pressure_to_pregnant i.contracept_decision ///
    i.ipv_justified i.hh_division i.religion_bin i.wealth_cat ///
    i.hh_size_cat i.hh_head_sex 
 
 
 
 
 
 
svy, subpop(rural_subpop): logistic depression i.ownership_level ///
    i.women_age i.education_woman i.num_children ///
    i.currently_pregnant i.residing_status i.menstruated_last6wks ///
    i.number_of_unions i.emp_level i.pressure_to_pregnant i.contracept_decision ///
    i.ipv_justified i.hh_division i.religion_bin i.wealth_cat ///
    i.hh_size_cat i.hh_head_sex 
 
 
 *****************************************************************************
 *****************************************************************************
 
* For Urban
svy, subpop(urban_subpop): logistic depression i.internet_status ///
    i.women_age i.education_woman i.num_children ///
    i.currently_pregnant i.residing_status i.menstruated_last6wks ///
    i.number_of_unions i.emp_level i.pressure_to_pregnant i.contracept_decision ///
    i.ipv_justified i.hh_division i.religion_bin i.wealth_cat ///
    i.hh_size_cat i.hh_head_sex 



svy, subpop(urban_subpop): logistic depression i.usage_level ///
    i.women_age i.education_woman i.num_children ///
    i.currently_pregnant i.residing_status i.menstruated_last6wks ///
    i.number_of_unions i.emp_level i.pressure_to_pregnant i.contracept_decision ///
    i.ipv_justified i.hh_division i.religion_bin i.wealth_cat ///
    i.hh_size_cat i.hh_head_sex 

	
	
	
	
svy, subpop(urban_subpop): logistic depression i.ownership_level ///
    i.women_age i.education_woman i.num_children ///
    i.currently_pregnant i.residing_status i.menstruated_last6wks ///
    i.number_of_unions i.emp_level i.pressure_to_pregnant i.contracept_decision ///
    i.ipv_justified i.hh_division i.religion_bin i.wealth_cat ///
    i.hh_size_cat i.hh_head_sex 
	
	
	
	



*Similarly for anxiety
* For Rural ( remove division for collinearity)
svy, subpop(rural_subpop): logistic anxiety ///
     i.internet_status ///
     i.women_age ///
     i.education_woman ///
     i.num_children ///
     i.currently_pregnant ///
     i.residing_status ///
     i.menstruated_last6wks ///
     i.emp_level ///
     i.pressure_to_pregnant ///
     i.contracept_decision ///
     i.ipv_justified ///
     i.religion_bin ///
     i.wealth_cat ///
     i.hh_size_cat 
   


svy, subpop(rural_subpop): logistic anxiety ///
     i.usage_level ///
     i.women_age ///
     i.education_woman ///
     i.num_children ///
     i.currently_pregnant ///
     i.residing_status ///
     i.menstruated_last6wks ///
     i.emp_level ///
     i.pressure_to_pregnant ///
     i.contracept_decision ///
     i.ipv_justified ///
     i.religion_bin ///
     i.wealth_cat ///
     i.hh_size_cat 
   




svy, subpop(rural_subpop): logistic anxiety ///
     i.ownership_level ///
     i.women_age ///
     i.education_woman ///
     i.num_children ///
     i.currently_pregnant ///
     i.residing_status ///
     i.menstruated_last6wks ///
     i.emp_level ///
     i.pressure_to_pregnant ///
     i.contracept_decision ///
     i.ipv_justified ///
     i.religion_bin ///
     i.wealth_cat ///
     i.hh_size_cat 
   










* For Urban
svy, subpop(urban_subpop): logistic anxiety ///
     i.internet_status ///
     i.women_age ///
     i.education_woman ///
     i.num_children ///
     i.currently_pregnant ///
     i.residing_status ///
     i.menstruated_last6wks ///
     i.emp_level ///
     i.pressure_to_pregnant ///
     i.contracept_decision ///
     i.ipv_justified ///
     i.religion_bin ///
     i.wealth_cat ///
     i.hh_size_cat 




svy, subpop(urban_subpop): logistic anxiety ///
     i.usage_level ///
     i.women_age ///
     i.education_woman ///
     i.num_children ///
     i.currently_pregnant ///
     i.residing_status ///
     i.menstruated_last6wks ///
     i.emp_level ///
     i.pressure_to_pregnant ///
     i.contracept_decision ///
     i.ipv_justified ///
     i.religion_bin ///
     i.wealth_cat ///
     i.hh_size_cat 	 
	 
	 
	 
	 
	 
	 
svy, subpop(urban_subpop): logistic anxiety ///
     i.ownership_level ///
     i.women_age ///
     i.education_woman ///
     i.num_children ///
     i.currently_pregnant ///
     i.residing_status ///
     i.menstruated_last6wks ///
     i.emp_level ///
     i.pressure_to_pregnant ///
     i.contracept_decision ///
     i.ipv_justified ///
     i.religion_bin ///
     i.wealth_cat ///
     i.hh_size_cat 	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	
********************************************************************************
* END
********************************************************************************

*----------------------------------------------
*----------------------------------------------
* Descriptive statistics: table 1
*----------------------------------------------
*----------------------------------------------
/* method section
We used the BDHS 2022 dataset, consisting of 18,987 ever-married women aged 15–49. Survey design variables were applied to account for clustering (674 PSUs) and stratification (16 strata), with a weighted population size of approximately 19,060.
*/
/*
for method section:
We analyzed data from 18,987 ever-married women aged 15–49 years from the 2022 Bangladesh Demographic and Health Survey (BDHS). To ensure nationally representative estimates, we applied survey weights and accounted for the complex sampling design using Stata's svy suite of commands, adjusting for clustering at the PSU level and stratification.

Descriptive statistics (Table 1) are presented as unweighted counts and percentages to describe the sample characteristics (N = 18,987). All bivariate and multivariable analyses accounted for complex survey design and sample weights using Stata's svy commands. The weighted population size represented approximately 19,060 women


*/

* outcomes
svy:tabulate anxiety 
svy:tabulate depression
* Exposure
tab internet_status
tab ownership_level
tab usage_level

* Univariate tabulations for depression
tab depression internet_status
tab depression ownership_level
tab depression usage_level

tab depression women_age
tab depression education_woman
tab depression marital_status
tab depression num_children
tab depression currently_pregnant
tab depression menstruated_last6wks
tab depression currently_abstaining
tab depression number_of_unions

tab depression emp_level
tab depression has_health_card
tab depression pressure_to_pregnant
tab depression husb_pref_more_same
tab depression contracept_decision
tab depression ipv_justified

tab depression area
tab depression hh_division
tab depression religion_bin
tab depression wealth_cat
tab depression hh_size_cat
tab depression hh_head_sex
tab depression currently_working
tab depression father_edu



* Univariate tabulations for depression


svy:tab internet_status
svy:tab ownership_level
svy:tab usage_level


svy:tab depression internet_status
svy:tab depression ownership_level
svy:tab depression usage_level



svy: tab depression women_age
svy: tab depression education_woman
svy: tab depression marital_status
svy: tab depression num_children
svy: tab depression currently_pregnant
svy: tab depression menstruated_last6wks
svy: tab depression currently_abstaining
svy: tab depression number_of_unions

svy: tab depression emp_level
svy: tab depression has_health_card
svy: tab depression pressure_to_pregnant
svy: tab depression husb_pref_more_same
svy: tab depression contracept_decision
svy: tab depression ipv_justified

svy: tab depression area
svy: tab depression hh_division
svy: tab depression religion_bin
svy: tab depression wealth_cat
svy: tab depression hh_size_cat
svy: tab depression hh_head_sex
svy: tab depression currently_working
svy: tab depression father_edu



*************************************************************
*Chi-square Test of Association with Depression
*************************************************************
* Bivariate Chi2 tests: Depression vs each categorical variable
svy: tab depression internet_status, chi2
svy: tab depression ownership_level, chi2
svy: tab depression usage_level, chi2

svy: tab depression women_age, chi2
svy: tab depression education_woman, chi2
svy: tab depression marital_status, chi2
svy: tab depression num_children, chi2
svy: tab depression currently_pregnant, chi2
svy: tab depression menstruated_last6wks, chi2
svy: tab depression currently_abstaining, chi2
svy: tab depression number_of_unions, chi2

svy: tab depression emp_level, chi2
svy: tab depression has_health_card, chi2
svy: tab depression pressure_to_pregnant, chi2
svy: tab depression husb_pref_more_same, chi2
svy: tab depression contracept_decision, chi2
svy: tab depression ipv_justified, chi2

svy: tab depression area, chi2
svy: tab depression hh_division, chi2
svy: tab depression religion_bin, chi2
svy: tab depression wealth_cat, chi2
svy: tab depression hh_size_cat, chi2
svy: tab depression hh_head_sex, chi2
svy: tab depression currently_working, chi2
svy: tab depression father_edu, chi2



**********************************************************************
*Chi-square Test of Association with Anxiety
**********************************************************************
* Bivariate Chi2 tests: Anxiety vs each categorical variable

tabulate anxiety media_exposure, chi2
tabulate anxiety education_woman, chi2
tabulate anxiety any_marital_status, chi2
tabulate anxiety area, chi2
tabulate anxiety hh_division, chi2
tabulate anxiety religion, chi2
tabulate anxiety hh_size_cat, chi2
tabulate anxiety hh_head_sex, chi2
tabulate anxiety currently_working, chi2
tabulate anxiety father_edu, chi2
tabulate anxiety bp_test_selected, chi2
tabulate anxiety pressure_to_pregnant, chi2
tabulate anxiety decision_visits_family, chi2
tabulate anxiety family_status, chi2
tabulate anxiety any_social_service_help, chi2
tabulate anxiety any_social_worker_help, chi2
tabulate anxiety any_health_care_decision, chi2
tabulate anxiety large_purchase_decision, chi2
tabulate anxiety money_decision, chi2







*************************************************
* visualizations
*************************************************
graph bar (count), over(anxiety_cat, label(angle(45))) ///
    bar(1, color(gs14)) bar(2, color(gs12)) bar(3, color(gs10)) bar(4, color(gs8)) ///
    title("Distribution of Anxiety Levels") ///
    ytitle("Number of Women") ///
    blabel(bar, format(%9.0g))


graph pie, over(anxiety_cat) ///
    title("Proportion of Anxiety Categories") ///
    plabel(_all percent, format(%4.1f))


 
 
 
graph bar (count), over(anxiety_cat, label(angle(45))) ///
    bar(1, color(gs14)) bar(2, color(gs12)) bar(3, color(gs10)) bar(4, color(gs8)) ///
    title("Distribution of Anxiety Levels") ///
    ytitle("Number of Women") ///
    blabel(bar, format(%9.0g))



graph bar (count), over(media_exposure, label(angle(45))) ///
    bar(1, color(navy)) bar(2, color(teal)) bar(3, color(olive)) bar(4, color(maroon)) ///
    title("Distribution of Media Exposure Levels") ///
    ytitle("Number of Women") ///
    blabel(bar, format(%9.0g))

	
	
	
	
	
	graph pie, over(anxiety_cat) ///
    title("Anxiety Level Distribution") ///
    plabel(_all percent, format(%4.1f))

graph pie, over(media_exposure) ///
    title("Media Exposure Distribution") ///
    plabel(_all percent, format(%4.1f))

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
