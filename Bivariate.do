*************************************************************
* Chi-square Test of Association with Depression
*************************************************************
* Bivariate Chi2 tests: Depression vs each categorical variable
svy: tab depression internet_status, pearson
svy: tab depression ownership_level, pearson
svy: tab depression usage_level, pearson

svy: tab depression women_age, pearson
svy: tab depression education_woman, pearson
svy: tab depression marital_status, pearson
svy: tab depression num_children, pearson
svy: tab depression currently_pregnant, pearson
svy: tab depression menstruated_last6wks, pearson
svy: tab depression currently_abstaining, pearson
svy: tab depression number_of_unions, pearson

svy: tab depression emp_level, pearson
svy: tab depression has_health_card, pearson
svy: tab depression pressure_to_pregnant, pearson
svy: tab depression husb_pref_more_same, pearson
svy: tab depression contracept_decision, pearson
svy: tab depression ipv_justified, pearson

svy: tab depression area, pearson
svy: tab depression hh_division, pearson
svy: tab depression religion_bin, pearson
svy: tab depression wealth_cat, pearson
svy: tab depression hh_size_cat, pearson
svy: tab depression hh_head_sex, pearson
svy: tab depression currently_working, pearson
svy: tab depression father_edu 





* Bivariate Chi2 tests: Depression vs each categorical variable
tab depression internet_status, chi2
tab depression ownership_level, chi2
tab depression usage_level, chi2

tab depression women_age, chi2
tab depression education_woman, chi2
tab depression num_children, chi2
tab depression currently_pregnant, chi2
tab depression menstruated_last6wks, chi2
tab depression currently_abstaining, chi2
tab depression number_of_unions, chi2

tab depression emp_level, chi2
tab depression has_health_card, chi2
tab depression pressure_to_pregnant, chi2
tab depression husb_pref_more_same, chi2
tab depression contracept_decision, chi2
tab depression ipv_justified, chi2

tab depression area, chi2
tab depression hh_division, chi2
tab depression religion_bin, chi2
tab depression wealth_cat, chi2
tab depression hh_size_cat, chi2
tab depression hh_head_sex, chi2
tab depression currently_working, chi2
tab depression father_edu, chi2





* Bivariate Chi2 tests: Anxiety vs each categorical variable
tab anxiety internet_status, chi2
tab anxiety ownership_level, chi2
tab anxiety usage_level, chi2

tab anxiety women_age, chi2
tab anxiety education_woman, chi2
tab anxiety num_children, chi2
tab anxiety currently_pregnant, chi2
tab anxiety menstruated_last6wks, chi2
tab anxiety currently_abstaining, chi2
tab anxiety number_of_unions, chi2

tab anxiety emp_level, chi2
tab anxiety has_health_card, chi2
tab anxiety pressure_to_pregnant, chi2
tab anxiety husb_pref_more_same, chi2
tab anxiety contracept_decision, chi2
tab anxiety ipv_justified, chi2

tab anxiety area, chi2
tab anxiety hh_division, chi2
tab anxiety religion_bin, chi2
tab anxiety wealth_cat, chi2
tab anxiety hh_size_cat, chi2
tab anxiety hh_head_sex, chi2
tab anxiety currently_working, chi2
tab anxiety father_edu, chi2
















* Bivariate Chi2 tests: Depression vs each categorical variable (including missing)
tab depression internet_status, chi2 missing
tab depression ownership_level, chi2 missing
tab depression usage_level, chi2 missing

tab depression women_age, chi2 missing
tab depression education_woman, chi2 missing
tab depression num_children, chi2 missing
tab depression currently_pregnant, chi2 missing
tab depression menstruated_last6wks, chi2 missing
tab depression currently_abstaining, chi2 missing
tab depression number_of_unions, chi2 missing

tab depression emp_level, chi2 missing
tab depression has_health_card, chi2 missing
tab depression pressure_to_pregnant, chi2 missing
tab depression husb_pref_more_same, chi2 missing
tab depression contracept_decision, chi2 missing
tab depression ipv_justified, chi2 missing

tab depression area, chi2 missing
tab depression hh_division, chi2 missing
tab depression religion_bin, chi2 missing
tab depression wealth_cat, chi2 missing
tab depression hh_size_cat, chi2 missing
tab depression hh_head_sex, chi2 missing
tab depression currently_working, chi2 missing
tab depression father_edu, chi2 missing




* Bivariate Chi2 tests: Anxiety vs each categorical variable (including missing)
tab anxiety internet_status, chi2 missing
tab anxiety ownership_level, chi2 missing
tab anxiety usage_level, chi2 missing

tab anxiety women_age, chi2 missing
tab anxiety education_woman, chi2 missing
tab anxiety num_children, chi2 missing
tab anxiety currently_pregnant, chi2 missing
tab anxiety menstruated_last6wks, chi2 missing
tab anxiety currently_abstaining, chi2 missing
tab anxiety number_of_unions, chi2 missing

tab anxiety emp_level, chi2 missing
tab anxiety has_health_card, chi2 missing
tab anxiety pressure_to_pregnant, chi2 missing
tab anxiety husb_pref_more_same, chi2 missing
tab anxiety contracept_decision, chi2 missing
tab anxiety ipv_justified, chi2 missing

tab anxiety area, chi2 missing
tab anxiety hh_division, chi2 missing
tab anxiety religion_bin, chi2 missing
tab anxiety wealth_cat, chi2 missing
tab anxiety hh_size_cat, chi2 missing
tab anxiety hh_head_sex, chi2 missing
tab anxiety currently_working, chi2 missing
tab anxiety father_edu, chi2 missing




































svy: logistic depression i.internet_status
svy: logistic depression i.ownership_level
svy: logistic depression i.usage_level

svy: logistic depression i.women_age
svy: logistic depression i.education_woman

svy: logistic depression i.num_children
svy: logistic depression i.currently_pregnant
svy: logistic depression i.menstruated_last6wks
svy: logistic depression i.currently_abstaining
svy: logistic depression i.number_of_unions

svy: logistic depression i.emp_level
svy: logistic depression i.has_health_card
svy: logistic depression i.pressure_to_pregnant
svy: logistic depression i.husb_pref_more_same
svy: logistic depression i.contracept_decision
svy: logistic depression i.ipv_justified

svy: logistic depression i.area
svy: logistic depression i.hh_division
svy: logistic depression i.religion_bin
svy: logistic depression i.wealth_cat
svy: logistic depression i.hh_size_cat
svy: logistic depression i.hh_head_sex
svy: logistic depression i.currently_working
svy: logistic depression i.father_edu













svy: logistic anxiety i.internet_status
svy: logistic anxiety i.ownership_level
svy: logistic anxiety i.usage_level

svy: logistic anxiety i.women_age
svy: logistic anxiety i.education_woman

svy: logistic anxiety i.num_children
svy: logistic anxiety i.currently_pregnant
svy: logistic anxiety i.menstruated_last6wks
svy: logistic anxiety i.currently_abstaining
svy: logistic anxiety i.number_of_unions

svy: logistic anxiety i.emp_level
svy: logistic anxiety i.has_health_card
svy: logistic anxiety i.pressure_to_pregnant
svy: logistic anxiety i.husb_pref_more_same
svy: logistic anxiety i.contracept_decision
svy: logistic anxiety i.ipv_justified

svy: logistic anxiety i.area
svy: logistic anxiety i.hh_division
svy: logistic anxiety i.religion_bin
svy: logistic anxiety i.wealth_cat
svy: logistic anxiety i.hh_size_cat
svy: logistic anxiety i.hh_head_sex
svy: logistic anxiety i.currently_working
svy: logistic anxiety i.father_edu







* descriptive table 1
* Bivariate Chi2 tests: Depression vs each categorical variable
svy: tab depression internet_status
svy: tab depression ownership_level
svy: tab depression usage_level

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







* List of variables to test bivariate association with depression
local bivars internet_status ownership_level usage_level ///
    women_age education_woman marital_status num_children ///
    currently_pregnant menstruated_last6wks currently_abstaining number_of_unions ///
    emp_level has_health_card pressure_to_pregnant husb_pref_more_same ///
    contracept_decision ipv_justified ///
    area hh_division religion_bin wealth_cat hh_size_cat ///
    hh_head_sex currently_working father_edu

* Loop through each and run chi-square tabulations
foreach var of local bivars {
    di "==================================================="
    di "Bivariate Chi2 Test: depression vs `var'"
    svy: tab depression `var'
}











