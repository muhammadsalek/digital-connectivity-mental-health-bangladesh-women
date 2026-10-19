<div align="center">

<img src="https://capsule-render.vercel.app/api?type=waving&color=0:00d4ff,50:7c3aed,100:ff6b6b&height=200&section=header&text=Digital%20Connectivity%20%26%20Mental%20Health&fontSize=38&fontColor=ffffff&animation=fadeIn&fontAlignY=38&desc=A%20Rural-Urban%20Perspective%20from%20Bangladesh&descSize=18&descAlignY=58" width="100%"/>

<img src="https://readme-typing-svg.demolab.com/?font=Fira+Code&size=22&duration=3000&pause=800&color=00D4FF&center=true&vCenter=true&multiline=true&repeat=true&width=900&height=80&lines=Internet+Use+%C2%B7+ICT+Ownership+%C2%B7+PHQ-9+%C2%B7+GAD-7;Ever-Married+Women+%C2%B7+BDHS+2022+%C2%B7+n+%3D+18%2C987;Rural%E2%80%93Urban+Disparities+%C2%B7+Spatial+Inequity+%C2%B7+SDG+3" alt="Typing SVG" />

</div>

# Digital Connectivity and Mental Health Symptoms Among Women in Bangladesh: A Rural-Urban Perspective

<div align="center">

<table>
<tr>
<td align="center">
<img src="https://avatars.githubusercontent.com/u/180872571?v=4" width="100" height="100" style="border-radius:50%;" alt="Md Salek Miah"/><br/>
<b>Md Salek Miah</b><br/>
<sub>Department of Statistics, SUST</sub>
</td>
<td align="center">
<img src="https://scholar.googleusercontent.com/citations?view_op=medium_photo&user=tMZWkOUAAAAJ&citpid=7" width="100" height="100" style="border-radius:50%;" alt="Md Jamal Uddin"/><br/>
<b>Md Jamal Uddin, PhD</b><br/>
<sub>Corresponding Author · SUST / DIU</sub>
</td>
</tr>
</table>

</div>

<div align="center">

[![DOI](https://img.shields.io/badge/DOI-10.5281%2Fzenodo.23469923-1682D4?style=for-the-badge&labelColor=0d1117&logo=zenodo&logoColor=1682D4)](https://zenodo.org/records/23469923)
[![License](https://img.shields.io/badge/License-MIT-10b981?style=for-the-badge&labelColor=0d1117&logo=opensourceinitiative&logoColor=10b981)](LICENSE)
[![Release](https://img.shields.io/badge/Release-v1.0.0-7c3aed?style=for-the-badge&labelColor=0d1117)](https://github.com/muhammadsalek/digital-connectivity-mental-health-bangladesh-women/releases/tag/v1.0.0)
[![Design](https://img.shields.io/badge/Design-Cross--Sectional-ff6b6b?style=for-the-badge&labelColor=0d1117)](#study-design-and-data-source)
[![Sample](https://img.shields.io/badge/Sample-18%2C987%20Women-f59e0b?style=for-the-badge&labelColor=0d1117)](#study-design-and-data-source)

</div>

<div align="center">

![Stata](https://img.shields.io/badge/Stata-1F5CA8?style=flat-square&logoColor=white)
![R](https://img.shields.io/badge/R-276DC3?style=flat-square&logo=r&logoColor=white)
![sf](https://img.shields.io/badge/sf-Spatial_Mapping-2E8B57?style=flat-square&logoColor=white)
![ggplot2](https://img.shields.io/badge/ggplot2-Visualization-1f77b4?style=flat-square&logoColor=white)
![PHQ9](https://img.shields.io/badge/PHQ--9-Depression%20Screening-e63946?style=flat-square&logoColor=white)
![GAD7](https://img.shields.io/badge/GAD--7-Anxiety%20Screening-9333ea?style=flat-square&logoColor=white)
![STROBE](https://img.shields.io/badge/Reporting-STROBE%20Checklist-9333ea?style=flat-square&logoColor=white)
![DAG](https://img.shields.io/badge/Framework-DAG%20Causal%20Model-00d4ff?style=flat-square&logoColor=white)
![BDHS](https://img.shields.io/badge/Data-BDHS%202022-e63946?style=flat-square&logoColor=white)
![SDG3](https://img.shields.io/badge/SDG-3%20Good%20Health-4CAF50?style=flat-square&logoColor=white)

</div>

---

## Table of Contents

1. [At a Glance](#at-a-glance)
2. [Research Question and Rationale](#research-question-and-rationale)
3. [Abstract](#abstract)
4. [Key Findings](#key-findings)
5. [Authors and Affiliations](#authors-and-affiliations)
6. [Study Design and Data Source](#study-design-and-data-source)
7. [Statistical Methods](#statistical-methods)
8. [Analytic Framework (DAG)](#analytic-framework-dag)
9. [Repository Structure](#repository-structure)
10. [Reproducibility Guide](#reproducibility-guide)
11. [Limitations](#limitations)
12. [Policy and Public Health Implications](#policy-and-public-health-implications)
13. [Data Availability and Ethics](#data-availability-and-ethics)
14. [Open Science and Archiving](#open-science-and-archiving)
15. [How to Cite](#how-to-cite)
16. [License](#license)
17. [Contact](#contact)

---

## At a Glance

| Item | Details |
|:-----|:--------|
| **Title** | Digital Connectivity and Mental Health Symptoms Among Women in Bangladesh: A Rural-Urban Perspective |
| **Design** | Cross-sectional, nationally representative, rural-urban stratified |
| **Data source** | Bangladesh Demographic and Health Survey (BDHS) 2022 |
| **Population** | Ever-married women aged 15-49 years (n = 18,987) |
| **Exposures** | Internet use, ICT usage, ICT ownership |
| **Outcomes** | Depression symptoms (PHQ-9), anxiety symptoms (GAD-7) |
| **Primary method** | Survey-weighted multivariable logistic regression, DAG-informed adjustment |
| **Spatial component** | Divisional choropleth mapping across 8 administrative divisions |
| **Reporting standard** | STROBE (cross-sectional) |
| **Software** | Stata (data management and modeling), R (spatial mapping and graphics) |
| **Archive** | Zenodo, DOI [10.5281/zenodo.23469923](https://zenodo.org/records/23469923) |
| **Global health goal** | Sustainable Development Goal 3: Good Health and Well-being |

---

## Research Question and Rationale

Mobile phones and the internet are expanding rapidly across Bangladesh, yet access is unevenly distributed by gender, residence, and region. Whether this expansion supports or strains women's mental health remains poorly understood in low- and middle-income settings, and national-level evidence disaggregated by rural-urban residence and geography is scarce.

**Primary research question:** Are internet use, ICT usage, and ICT ownership associated with symptoms of depression and anxiety among ever-married women in Bangladesh, and do these associations differ between rural and urban settings and across divisions?

**Specific objectives**

1. Estimate the national prevalence of depression (PHQ-9) and anxiety (GAD-7) symptoms among ever-married women.
2. Quantify associations between three dimensions of digital connectivity and each mental health outcome using survey-weighted adjusted models.
3. Assess effect heterogeneity by place of residence (rural versus urban).
4. Map divisional patterns of digital access and mental health burden to identify geographic inequities.

---

## Abstract

**Objective:** To examine the associations between internet use, information and communication technology (ICT) usage, and ICT ownership with symptoms of depression and anxiety among ever-married women in Bangladesh, with particular attention to rural-urban disparities and spatial inequities.

**Methods:** This study analyzed nationally representative cross-sectional data from **18,987 ever-married women aged 15-49 years** collected from the **Bangladesh Demographic and Health Survey 2022 (BDHS)**. Symptoms of depression and anxiety were assessed using the **Patient Health Questionnaire-9 (PHQ-9)** and the **Generalized Anxiety Disorder-7 (GAD-7)**, respectively. Survey-weighted multivariable logistic regression models were fitted to estimate associations between digital connectivity and mental health symptoms, with descriptive stratified analyses by place of residence (rural/urban).

**Results:** Among all women, **4.8%** showed depression symptoms, while **4.1%** showed anxiety symptoms. Among rural women, ICT use was significantly associated with higher odds of depression symptoms (**aOR: 1.38; 95% CI: 1.12-1.69**). In urban settings, higher ICT ownership was associated with both depression symptoms (**aOR: 1.81; 95% CI: 1.01-3.25**) and anxiety symptoms (**aOR: 2.11; 95% CI: 1.14-3.92**). Rangpur and Rajshahi divisions showed lower digital access and distinct mental health patterns.

**Conclusions:** Digital connectivity and women's mental health symptoms were associated across rural-urban and geographic contexts in Bangladesh. The observed disparities in anxiety and depression symptoms across various dimensions of digital access indicate the importance of considering digital access within broader discussions of women's health. Combining mental health progress with gender-sensitive and geographically targeted digital strategies is important for advancing women's mental well-being and achieving **Sustainable Development Goal (SDG) 3**.

**Keywords:** Digital connectivity, Mental health inequities, Anxiety and depression, Women's health, Rural-urban disparities, Spatial inequality, ICT exposure, Bangladesh

---

## Key Findings

### Overall Prevalence

| Outcome | Prevalence |
|:--------|:----------:|
| Depression symptoms (PHQ-9 positive) | **4.8%** |
| Anxiety symptoms (GAD-7 positive) | **4.1%** |

### Adjusted Associations (Survey-Weighted Logistic Regression)

| Residence | Exposure | Outcome | aOR | 95% CI |
|:----------|:---------|:--------|:---:|:------:|
| Rural | ICT use | Depression symptoms | **1.38** | 1.12-1.69 |
| Urban | ICT ownership | Depression symptoms | **1.81** | 1.01-3.25 |
| Urban | ICT ownership | Anxiety symptoms | **2.11** | 1.14-3.92 |

aOR = adjusted odds ratio; CI = confidence interval.

### Spatial Patterns

| Pattern | Divisions |
|:--------|:----------|
| High digital connectivity and high mental health burden | Dhaka, Chattogram, Sylhet, Barishal |
| Low digital access and distinct mental health pattern | Rangpur, Rajshahi |

### Highlights

- Mental health burden was concentrated in digitally connected divisions: Dhaka, Chattogram, Sylhet, and Barishal.
- Low digital access with lower mental health burden was concentrated in Rangpur.
- Associations differed by residence, supporting region-specific and equity-oriented digital mental health strategies rather than a single national approach.

---

## Authors and Affiliations

**Md Salek Miah**¹
Biostatistics, Epidemiology, and Public Health Research Team, Department of Statistics
Shahjalal University of Science and Technology (SUST), Sylhet-3114, Bangladesh
Email: [saleksta@gmail.com](mailto:saleksta@gmail.com)
[![ORCID](https://img.shields.io/badge/ORCID-0009--0005--5973--461X-A6CE39?style=flat-square&logo=orcid&logoColor=white)](https://orcid.org/0009-0005-5973-461X)

**Md Jamal Uddin, PhD**¹ ² *(Corresponding Author)*
Professor, Department of Statistics, Shahjalal University of Science and Technology (SUST), Sylhet, Bangladesh
Faculty of Graduate Education, Daffodil International University, Dhaka, Bangladesh
Email: [jamal-sta@sust.edu](mailto:jamal-sta@sust.edu)
[![ORCID](https://img.shields.io/badge/ORCID-0000--0002--8360--3274-A6CE39?style=flat-square&logo=orcid&logoColor=white)](https://orcid.org/0000-0002-8360-3274)

¹ Biostatistics, Epidemiology, and Public Health Research Team, Department of Statistics, SUST, Sylhet-3114, Bangladesh
² Faculty of Graduate Education, Daffodil International University, Dhaka, Bangladesh

---

## Study Design and Data Source

### Design Overview

This is a cross-sectional analytical study using the **Bangladesh Demographic and Health Survey (BDHS) 2022**, a nationally representative household survey. Digital connectivity and mental health symptoms among ever-married women are analyzed overall and disaggregated by **rural/urban residence** and **division**. The study follows the **STROBE reporting guidelines for cross-sectional studies** and uses a **DAG-informed analytic strategy** to limit confounding bias.

### Study Population and Eligibility

```
Target population
      |
      |- Ever-married women aged 15-49 years
      |- Residing in one of Bangladesh's 8 administrative divisions
      '- Complete data on internet use / ICT use / ICT ownership
           and PHQ-9 / GAD-7 screening items

                   After data cleaning and reconciliation

        +---------------------------------------------+
        |   Final analytic sample: n = 18,987         |
        +----------------------------------+----------+
        |  Depression (PHQ-9 positive)     |   4.8%   |
        |  Anxiety (GAD-7 positive)        |   4.1%   |
        +----------------------------------+----------+
```

### Measures

| Domain | Measure |
|:-------|:--------|
| Exposure | Internet use, ICT usage, ICT ownership |
| Outcome (depression) | PHQ-9 screening, dichotomized at the standard symptom threshold |
| Outcome (anxiety) | GAD-7 screening, dichotomized at the standard symptom threshold |
| Stratifier | Place of residence (rural/urban) |
| Geography | Eight administrative divisions |
| Covariates | Selected through the DAG-based minimal sufficient adjustment set |

PHQ-9 and GAD-7 are screening instruments. Positive scores indicate probable symptoms and are not clinical diagnoses.

### Geographic Scope

Spatial analyses use official Bangladesh administrative boundary shapefiles to map division-level indicators of internet access, combined ICT status, and mental health burden.

---

## Statistical Methods

1. **Data management:** cleaning, recoding, and construction of exposure, outcome, and covariate variables in Stata.
2. **Confounder selection:** a directed acyclic graph (DAG) identified the minimal sufficient adjustment set, reducing the risk of over-adjustment and collider bias.
3. **Bivariate analysis:** chi-square and t-test comparisons of digital connectivity indicators with PHQ-9 and GAD-7 outcomes, by residence and division.
4. **Multivariable modeling:** survey-weighted logistic regression accounting for the complex BDHS sampling design (clustering, stratification, and sampling weights), reported as adjusted odds ratios with 95% confidence intervals.
5. **Stratified analysis:** models fitted separately for rural and urban women to examine effect heterogeneity.
6. **Spatial mapping:** divisional choropleth maps built with `sf` and `ggplot2` in R.

---

## Analytic Framework (DAG)

A directed acyclic graph was used to formalize the hypothesized causal pathway between digital connectivity and mental health outcomes. It guided the selection of covariates before modeling, so adjustment was theory-driven rather than data-driven. The DAG figure is provided in the `Figures/` folder.

---

## Repository Structure

```
digital-connectivity-mental-health-bangladesh-women/
|
|-- README.md
|-- LICENSE
|
|-- Codes/                  Stata .do files and R scripts
|-- Figures/                Manuscript figures (DAG, descriptive, spatial)
|-- Tables/                 Manuscript tables
|
|-- Submitted_Versions/     Manuscript as submitted
|-- Revision_Paper/         Revised manuscript versions
|-- Published_Versions/     Published version(s)
|
|-- Citations_Papers/       Cited reference papers
|-- Mothers_Papers/         Related parent papers from the same project
|
|-- Ai_Plagrarism_Reports/  AI-content and similarity check reports
`-- Waiver_Letter/          Waiver letter documentation
```

| Folder | Purpose |
|:-------|:--------|
| `Codes/` | Complete analysis code: data management, bivariate analysis, regression modeling, spatial mapping, and figure syntaxes |
| `Figures/` | Final manuscript figures |
| `Tables/` | Final manuscript tables |
| `Submitted_Versions/` | Manuscript as originally submitted |
| `Revision_Paper/` | Revised manuscript versions |
| `Published_Versions/` | Published article version(s) |
| `Citations_Papers/` | Reference papers supporting the study |
| `Mothers_Papers/` | Related parent papers |
| `Ai_Plagrarism_Reports/` | AI-detection and plagiarism similarity reports |
| `Waiver_Letter/` | Waiver letter for the submission |

---

## Reproducibility Guide

**Requirements:** Stata 15 or later; R 4.0 or later.

**Step 1. Obtain the data.** Register with the [DHS Program](https://dhsprogram.com) and request the BDHS 2022 datasets. Raw microdata are not redistributed in this repository, in line with the DHS data use agreement.

**Step 2. Data management and modeling (Stata).** Run the data management and modeling `.do` file in `Codes/`.

**Step 3. Bivariate analysis (Stata).** Run the bivariate `.do` file in `Codes/`.

**Step 4. Spatial mapping and descriptive graphics (R).**

```r
install.packages(c("sf", "ggplot2", "readxl", "dplyr", "tidyr", "viridis"))
```

Then run the spatial mapping and descriptive R script(s) in `Codes/`.

**Step 5. Review outputs.** Final figures are in `Figures/` and final tables are in `Tables/`.

> GitHub previews `.png`, `.jpg`, `.gif`, and `.svg` inline but not `.tiff` or `.pdf`. High-resolution TIFF figures are intended for journal submission; download them to view locally.

---

## Limitations

- **Cross-sectional design:** temporal ordering between digital connectivity and mental health symptoms cannot be established, and reverse causation is possible (for example, symptomatic women may change their ICT use).
- **Screening instruments:** PHQ-9 and GAD-7 identify probable symptoms, not clinical disorders, and rely on self-report.
- **Residual confounding:** although covariates were chosen using a DAG, unmeasured factors such as social support, online content type, and screen time may remain.
- **Estimate precision:** some urban estimates have wide confidence intervals with lower bounds close to 1.0, so they should be interpreted cautiously.
- **Exposure measurement:** BDHS captures access and ownership but not the intensity, purpose, or quality of digital engagement.
- **Population scope:** findings apply to ever-married women aged 15-49 years and may not generalize to unmarried women, men, or other age groups.

---

## Policy and Public Health Implications

- Digital access should be considered within broader discussions of women's mental health rather than treated as uniformly beneficial or harmful.
- Differences between rural and urban associations support context-specific, gender-sensitive digital mental health strategies.
- Divisional patterns, notably in Rangpur and Rajshahi, point to areas where low digital access and distinct mental health needs coincide, which may help target resources.
- Findings contribute evidence toward SDG 3 (Good Health and Well-being).

---

## Data Availability and Ethics

- **Data:** BDHS 2022 data are publicly available from the DHS Program (https://dhsprogram.com) upon registration and approval.
- **Ethics:** this is a secondary analysis of de-identified, publicly available survey data. The original BDHS received ethical approval and informed consent from participants during data collection.
- **Code:** all analysis code is openly available in this repository and in the Zenodo archive.

---

## Open Science and Archiving

This repository is permanently archived on Zenodo to guarantee long-term access and a citable, versioned snapshot of the analysis.

| Resource | Link |
|:---------|:-----|
| Zenodo record (v1.0.0) | [10.5281/zenodo.23469923](https://zenodo.org/records/23469923) |
| GitHub release | [v1.0.0](https://github.com/muhammadsalek/digital-connectivity-mental-health-bangladesh-women/releases/tag/v1.0.0) |
| Repository | [muhammadsalek/digital-connectivity-mental-health-bangladesh-women](https://github.com/muhammadsalek/digital-connectivity-mental-health-bangladesh-women) |

---

## How to Cite

**Dataset and code archive**

> Miah, M. S., & Uddin, M. J. (2026). *Digital Connectivity and Mental Health Symptoms Among Women in Bangladesh: A Rural-Urban Perspective* (v1.0.0) [Data and code]. Zenodo. https://doi.org/10.5281/zenodo.23469923

**BibTeX**

```bibtex
@misc{miah_uddin_2026_digital_connectivity,
  author    = {Miah, Md Salek and Uddin, Md Jamal},
  title     = {Digital Connectivity and Mental Health Symptoms Among Women
               in Bangladesh: A Rural-Urban Perspective},
  year      = {2026},
  version   = {v1.0.0},
  publisher = {Zenodo},
  doi       = {10.5281/zenodo.23469923},
  url       = {https://doi.org/10.5281/zenodo.23469923}
}
```

---

## License

Released under the MIT License. Copyright (c) 2026 Md Salek Miah and Md Jamal Uddin. Open for academic research; citation is required for publication use.

---

## Contact

For questions, collaboration, or data and code queries:

- **Md Salek Miah:** [saleksta@gmail.com](mailto:saleksta@gmail.com)
- **Md Jamal Uddin, PhD (Corresponding Author):** [jamal-sta@sust.edu](mailto:jamal-sta@sust.edu)

<div align="center">

<img src="https://capsule-render.vercel.app/api?type=waving&color=0:ff6b6b,50:7c3aed,100:00d4ff&height=120&section=footer" width="100%"/>

**Biostatistics, Epidemiology, and Public Health Research Team**
Department of Statistics · Shahjalal University of Science and Technology · Sylhet-3114, Bangladesh

[![Made with Stata](https://img.shields.io/badge/Made%20with-Stata-1F5CA8?style=flat-square)](https://www.stata.com)
[![Made with R](https://img.shields.io/badge/Made%20with-R-276DC3?style=flat-square&logo=r&logoColor=white)](https://www.r-project.org)
[![Spatial Analysis](https://img.shields.io/badge/Spatial-sf%20%2B%20ggplot2-2E8B57?style=flat-square)](https://r-spatial.github.io/sf/)
[![STROBE](https://img.shields.io/badge/Reporting-STROBE-9333ea?style=flat-square)](https://www.strobe-statement.org)
[![SUST](https://img.shields.io/badge/University-SUST%20Bangladesh-f59e0b?style=flat-square)](https://www.sust.edu)

</div>
