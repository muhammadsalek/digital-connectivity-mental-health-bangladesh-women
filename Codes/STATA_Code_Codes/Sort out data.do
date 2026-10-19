
* Step 1: Identify ever married women (currently or formerly married)
gen ever_married = 0
replace ever_married = 1 if inlist(v501, 1, 2)  // 1 = currently, 2 = formerly
label variable ever_married "Ever Married (1=Yes, 0=No)"
label define yesno 0 "No" 1 "Yes"
label values ever_married yesno

* Check total number of ever-married women
tab ever_married

* Step 2: Internet use status (v171a)
gen internet_use = v171a
label variable internet_use "Internet Use Status"
label define internet_use_lbl 0 "Never used" 1 "Used in last 12 months" 2 "Used before last 12 months"
label values internet_use internet_use_lbl

* Check internet use distribution among ever-married women
tab internet_use if ever_married == 1

* Step 3: Internet frequency in last month (v171b), restrict to valid cases only
gen internet_freq = .
replace internet_freq = v171b if v171a == 1   // Only for those who used internet in last 12 months
label variable internet_freq "Frequency of Internet Use Last Month (Valid Users Only)"
label define freq_lbl 0 "No use" 1 "Not at all" 2 "Less than once a week" 3 "At least once a week" 4 "Almost every day"
label values internet_freq freq_lbl

* Check cleaned internet frequency distribution
tab internet_freq

* Step 4: Balanced classification of active internet users
gen active_internet_user = .
replace active_internet_user = 0 if inlist(internet_freq, 0, 1, 2)   // No use, not at all, < once a week
replace active_internet_user = 1 if inlist(internet_freq, 3, 4)      // At least once a week, almost every day
label variable active_internet_user "Active Internet User (Balanced)"
label define active_lbl 0 "Non-user" 1 "User"
label values active_internet_user active_lbl

* Check distribution among valid recent users
tab active_internet_user if internet_freq != .

* Step 5: Binary internet user variable (used in last 12 months)
gen internet_user = .
replace internet_user = 1 if internet_use == 1
replace internet_user = 0 if inlist(internet_use, 0, 2)
label variable internet_user "Internet User in Last 12 Months (1=Yes, 0=No)"
label define intuserlbl 0 "Non-user" 1 "User"
label values internet_user intuserlbl

* Check among ever-married women only
tab internet_user if ever_married == 1

/*
For modeling overall internet use (binary):
Use 18,987

For modeling internet frequency:
Use 5,699 who used internet in the last 12 months (v171a == 1)

*/


save "D:\Research\Saudi\new idea\dataset\BDHS_cleaned_final.dta", replace
