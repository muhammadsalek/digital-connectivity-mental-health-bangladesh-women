
* ===============================================
*   PREPROCESSING FOR MEDIA & MENTAL HEALTH STUDY
*   Population: Ever-Married Women
*   Source: BDHS 2022 (IR File)
*   Analyst: MD Salek Miah
* ===============================================
clear all
set more off
set maxvar 32767

* Load BDHS IR dataset (replace with actual path)
use "D:\Research\Saudi\new idea\dataset\BD_2022_DHS_01042025_611_222432\BDIR81DT\BDIR81FL.DTA", clear



use "D:\Research\Saudi\new idea\dataset\BDHS2022_evermarried_depression_anxiety_analysis.dta"


**************************************************************
* Outcome Variables: Depression and Anxiety
**************************************************************

gen depression_cat = .
replace depression_cat = 1 if mth22 >= 10 & mth22 <= 27
replace depression_cat = 0 if mth22 < 10 & !missing(mth22)
label define yesno 0 "No" 1 "Yes"
label values depression_cat yesno
label variable depression_cat "Depression (PHQ-9 ≥10 = Yes)"

gen anxiety_cat = .
replace anxiety_cat = 1 if mth24 >= 10 & mth24 <= 21
replace anxiety_cat = 0 if mth24 < 10 & !missing(mth24)
label values anxiety_cat yesno
label variable anxiety_cat "Anxiety (GAD-7 ≥10 = Yes)"

tab depression_cat, missing
tab anxiety_cat, missing

**************************************************************
* Ever-Married Indicator
**************************************************************

gen ever_married = 0
replace ever_married = 1 if inlist(v501, 1, 2)
label variable ever_married "Ever Married (1=Yes, 0=No)"
label values ever_married yesno
tab ever_married

**************************************************************
* Internet Use Variables
**************************************************************

gen internet_use = v171a
label variable internet_use "Internet Use Status"
label define internet_use_lbl 0 "Never used" 1 "Used in last 12 months" 2 "Used before last 12 months"
label values internet_use internet_use_lbl
tab internet_use if ever_married == 1

gen internet_freq = .
replace internet_freq = v171b if v171a == 1
label variable internet_freq "Internet Use Frequency (Last Month)"
label define freq_lbl 0 "No use" 1 "Not at all" 2 "Less than once a week" 3 "At least once a week" 4 "Almost every day"
label values internet_freq freq_lbl
tab internet_freq

gen active_internet_user = .
replace active_internet_user = 0 if inlist(internet_freq, 0, 1, 2)
replace active_internet_user = 1 if inlist(internet_freq, 3, 4)
label variable active_internet_user "Active Internet User (Balanced)"
label define active_lbl 0 "Non-user" 1 "User"
label values active_internet_user active_lbl
tab active_internet_user if internet_freq != .

gen internet_user = .
replace internet_user = 1 if internet_use == 1
replace internet_user = 0 if inlist(internet_use, 0, 2)
label variable internet_user "Internet User in Last 12 Months"
label values internet_user intuserlbl
tab internet_user if ever_married == 1

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
* Maternal Health & Obstetric Variables
**************************************************************

tab mth18b   // PHQ-9 total score
tab mth18c   // GAD-7 total score

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

**************************************************************
* Save the Prepared Dataset for Ever-Married Women
**************************************************************

keep if ever_married == 1
save "BDHS2022_evermarried_depression_anxiety_analysis.dta", replace





* Save full ever-married dataset
save "BDHS2022_evermarried_full.dta", replace

* Define missing label for internet_user
label define intuserlbl 0 "Non-user or used before 12 months" 1 "Used in last 12 months"
label values internet_user intuserlbl

* Filter for final analysis sample: internet use in last 12 months
keep if internet_user == 1
save "BDHS2022_evermarried_last12mo_internet.dta", replace

* Save full ever-married dataset
save "BDHS2022_evermarried_full.dta", replace

* Define missing label for internet_user
label define intuserlbl 0 "Non-user or used before 12 months" 1 "Used in last 12 months"
label values internet_user intuserlbl

* Filter for final analysis sample: internet use in last 12 months
keep if internet_user == 1
save "BDHS2022_evermarried_last12mo_internet.dta", replace






keep if ever_married == 1
save "D:\Research\Saudi\new idea\dataset\BDHS2022_evermarried_depression_anxiety_analysis.dta", replace


















tab anxiety
tab depression

tabulate internet_use 
tab women_age // v012
tab education_woman
tab num_children

tab currently_pregnant

tab residing_status
* Check the result
tab currently_abstaining
 * Tabulate to confirm
tab number_of_unions
* Check the recoded variable with a tabulation
tab menstruated_last6wks
* Check the result
tab has_health_card

tab pressure_to_pregnant
tab decision_visits_family

tab family_status
tab social_service_help
tab social_worker_help

tab health_care_decision
tab large_purchase_decision
tab money_decision

* Summary table
tab husb_pref_more_same
* Tabulate the new variable
tab ipv_justified, missing

* Tabulate to verify
tab rel_hh_head, missing
tabulate area
tab religion

tab hh_wealth, mis

tab hh_size_cat, mis
tab hh_head_sex
tab currently_working

tab father_edu
tab newspaper_regular
tab radio_regular


tab  contracept_decision,missing
tab  husb_pref_more_same,missing

















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
* Maternal Health & Obstetric Variables
**************************************************************

tab mth18b   // PHQ-9 total score
tab mth18c   // GAD-7 total score

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
