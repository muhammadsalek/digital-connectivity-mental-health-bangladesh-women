<div align="center">

<img src="https://capsule-render.vercel.app/api?type=waving&color=0:00d4ff,50:7c3aed,100:ff6b6b&height=200&section=header&text=Digital%20Connectivity%20%26%20Mental%20Health&fontSize=38&fontColor=ffffff&animation=fadeIn&fontAlignY=38&desc=A%20Rural-Urban%20Perspective%20from%20Bangladesh&descSize=18&descAlignY=58" width="100%"/>

<img src="https://readme-typing-svg.demolab.com/?font=Fira+Code&size=22&duration=3000&pause=800&color=00D4FF&center=true&vCenter=true&multiline=true&repeat=true&width=900&height=80&lines=Internet+Use+%C2%B7+ICT+Ownership+%C2%B7+PHQ-9+%C2%B7+GAD-7;Ever-Married+Women+%C2%B7+BDHS+2022+%C2%B7+n+%3D+18%2C987;Rural%E2%80%93Urban+Disparities+%C2%B7+Spatial+Inequity+%C2%B7+SDG+3" alt="Typing SVG" />

</div>

# Digital Connectivity and Mental Health Symptoms Among Women in Bangladesh: A Rural-Urban Perspective

<div align="center">

[![License](https://img.shields.io/badge/License-MIT-10b981?style=for-the-badge&labelColor=0d1117&logo=opensourceinitiative&logoColor=10b981)](LICENSE)
[![Status](https://img.shields.io/badge/Status-Active%20Research-7c3aed?style=for-the-badge&labelColor=0d1117)](https://github.com)
[![Journal](https://img.shields.io/badge/Output-Q1%20Journal%20Ready-00d4ff?style=for-the-badge&labelColor=0d1117)](https://github.com)
[![Design](https://img.shields.io/badge/Design-Cross--Sectional-ff6b6b?style=for-the-badge&labelColor=0d1117)](https://github.com)
[![Sample](https://img.shields.io/badge/Sample-18%2C987%20Women-f59e0b?style=for-the-badge&labelColor=0d1117)](https://github.com)

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

<div align="center">

```
╔════════════════════════════════════════════════════════════════════════╗
║  📶  Digital Connectivity  ·  🧠  Depression (PHQ-9) & Anxiety (GAD-7) ║
║  👩  18,987 Ever-Married Women  ·  🇧🇩  BDHS 2022  ·  8 Divisions      ║
║  🏙️  Rural–Urban Disparities  ·  🗺️  Spatial Inequity  ·  SDG 3       ║
╚════════════════════════════════════════════════════════════════════════╝
```

</div>

---

## Overview

This study examines the associations between **internet use, ICT usage, and ICT ownership** with **symptoms of depression and anxiety** among ever-married women in Bangladesh, with particular attention to **rural–urban disparities** and **spatial inequities** across the country's eight administrative divisions. The analysis combines **DAG-informed confounder selection**, **bivariate association testing**, **survey-weighted multivariable logistic regression**, and **spatial mapping** to generate policy-relevant evidence for gender-sensitive, geographically targeted digital mental health strategies.

**Analysis Pipeline:**

```
BDHS 2022 Data  (Bangladesh · Ever-Married Women 15–49 yrs · Cross-Sectional)
          │
          │  Internet use · ICT usage · ICT ownership
          │  PHQ-9 (depression) · GAD-7 (anxiety) · n = 18,987
          ▼
   Data Management        cleaning · recoding · variable construction
   (Stata .do file)       "Salek_data Managements to Modeling.do"
          │
          ▼
   DAG Framework           confounder identification · minimal adjustment set
   (Figure 2.png)          theory-driven causal pathway (connectivity → mental health)
          │
          ▼
   Bivariate Analysis      chi-square / t-test associations by exposure & outcome
   (Bivariate.do)          digital connectivity × PHQ-9/GAD-7, by residence & division
          │
          ▼
   Regression Modeling     survey-weighted multivariable logistic regression
   (Stata .do file)        stratified by rural/urban residence
          │
          ▼
   Spatial Mapping         divisional choropleth maps (sf/ggplot2 in R)
   (R script)              internet access · ICT index · mental health burden
          │
          ▼
   Outputs                 descriptive + spatial figures (PNG/TIFF/PDF) · STROBE checklist
```

---

## Abstract

**Objective:** To examine the associations between internet use, information and communication technology (ICT) usage, and ICT ownership with symptoms of depression and anxiety among ever-married women in Bangladesh, with particular attention to rural–urban disparities and spatial inequities.

**Methods:** This study analyzed nationally representative cross-sectional data from **18,987 ever-married women aged 15–49 years** collected from the **Bangladesh Demographic and Health Survey 2022 (BDHS)**. Symptoms of depression and anxiety were assessed using the **Patient Health Questionnaire-9 (PHQ-9)** and the **Generalized Anxiety Disorder-7 (GAD-7)**, respectively. Survey-weighted multivariable logistic regression models were fitted to estimate associations between digital connectivity and mental health symptoms, with descriptive stratified analyses by place of residence (rural/urban).

**Results:** Among all women, **4.8%** showed depression symptoms, while **4.1%** showed anxiety symptoms. Among rural women, ICT use was significantly associated with higher odds of depression symptoms (**aOR: 1.38; 95% CI: 1.12–1.69**). In urban settings, higher ICT ownership was associated with both depression symptoms (**aOR: 1.81; 95% CI: 1.01–3.25**) and anxiety symptoms (**aOR: 2.11; 95% CI: 1.14–3.92**). Rangpur and Rajshahi divisions showed lower digital access and distinct mental health patterns.

**Conclusions:** Digital connectivity and women's mental health symptoms were associated across rural–urban and geographic contexts in Bangladesh. The observed disparities in anxiety and depression symptoms across various dimensions of digital access indicate the importance of considering digital access within broader discussions of women's health. Combining mental health progress with gender-sensitive and geographically targeted digital strategies is important for advancing women's mental well-being and achieving **Sustainable Development Goal (SDG) 3**.

**Keywords:** Digital connectivity · Mental health inequities · Anxiety and depression · Women's health · Rural–urban disparities · Spatial inequality · ICT exposure · Bangladesh

---

## Highlights

- 📈 High mental health burden was highlighted in digitally connected divisions **Dhaka, Chattogram, Sylhet, and Barishal**.
- 📉 Low digital access and lower mental health burden were concentrated in **Rangpur**.
- ⚖️ These findings reveal significant rural–urban and geographic inequities, emphasizing the need for **region-specific, equity-oriented digital mental health interventions** in Bangladesh.

---

## Authors

**Md Salek Miah**¹
Biostatistics, Epidemiology, and Public Health Research Team, Department of Statistics
Shahjalal University of Science & Technology (SUST), Sylhet-3114, Bangladesh
📧 [saleksta@gmail.com](mailto:saleksta@gmail.com)
[![ORCID](https://img.shields.io/badge/ORCID-0009--0005--5973--461X-A6CE39?style=flat-square&logo=orcid&logoColor=white)](https://orcid.org/0009-0005-5973-461X)

**Md Jamal Uddin, PhD**¹ ² *(Corresponding Author)*
Professor, Department of Statistics, Shahjalal University of Science and Technology (SUST), Sylhet, Bangladesh
Faculty of Graduate Education, Daffodil International University, Dhaka, Bangladesh
📧 [jamal-sta@sust.edu](mailto:jamal-sta@sust.edu)
[![ORCID](https://img.shields.io/badge/ORCID-0000--0002--8360--3274-A6CE39?style=flat-square&logo=orcid&logoColor=white)](https://orcid.org/0000-0002-8360-3274)

¹ Biostatistics, Epidemiology, and Public Health Research Team, Department of Statistics, SUST, Sylhet-3114, Bangladesh
² Faculty of Graduate Education, Daffodil International University, Dhaka, Bangladesh

---

## Study Design & Data Source

### Design Overview

This is a **cross-sectional analytical study** using the **Bangladesh Demographic and Health Survey (BDHS) 2022**, examining digital connectivity and mental health symptoms among ever-married women, disaggregated by **rural/urban residence** and **divisional (administrative) geography**. The study follows **STROBE reporting guidelines for cross-sectional studies** (see `STROBE_checklist_cross-sectional.docx`) and uses a **DAG-informed analytic strategy** to minimize confounding bias in estimating the connectivity–mental health relationship.

### Study Population & Eligibility

```
Target Population
      │
      ├─ Ever-married women aged 15–49 years
      ├─ Residing in one of Bangladesh's 8 administrative divisions
      └─ Inclusion criterion: complete data on internet use / ICT use / ICT ownership
           and PHQ-9 / GAD-7 screening items

                         ↓  After data cleaning & reconciliation

              ┌─────────────────────────────────────────────┐
              │   Final Analytic Sample: n = 18,987          │
              ├──────────────────┬────────────────────────────┤
              │  Depression (PHQ-9 positive)  │   4.8%        │
              │  Anxiety (GAD-7 positive)     │   4.1%        │
              └──────────────────┴────────────────────────────┘
```

### Geographic Scope

Spatial analyses use official **Bangladesh administrative boundary shapefiles** (`bd.shp`) to map division-level indicators of internet access, combined ICT status, and mental health burden. High digital connectivity and mental health burden clustered in **Dhaka, Chattogram, Sylhet, and Barishal**, while **Rangpur** showed the lowest digital access alongside a distinct mental health pattern.

---

## Repository Structure

```
digital-connectivity-mental-health-bangladesh-women/
│
├── README.md
├── LICENSE
│
├── data/
│   ├── ict_combined_block_by_division.xlsx        ← ICT access indicators by division
│   ├── ict_mental_combined_block_by_division.xlsx ← Combined ICT + mental health data by division
│   ├── internet_status_by_division.xlsx           ← Internet use status by division
│   └── bd.shp                                     ← Bangladesh administrative boundary shapefile
│
├── scripts/
│   ├── Salek_data Managements to Modeling.do        ← Data cleaning, recoding & regression modeling (Stata)
│   ├── Bivariate.do                                 ← Bivariate association analysis (Stata)
│   └── Salek_SUST_Spatial_mapping_ & Descriptives.R ← Spatial mapping & descriptive graphics (R)
│
├── figures/
│   ├── Figure 2.png                                 ← DAG (directed acyclic graph) framework
│   ├── Figure 3.tiff                                ← Descriptive/spatial figure
│   ├── Figure 4.tiff                                ← Descriptive/spatial figure
│   ├── Figure 5.tiff                                ← Descriptive/spatial figure
│   ├── Figure 6.tiff                                ← Descriptive/spatial figure
│   ├── Figure 05.pdf                                ← Descriptive/spatial figure (PDF)
│   └── Figure 06.pdf                                ← Descriptive/spatial figure (PDF)
│
├── diagrams/
│   └── Flow charts.drawio                           ← Study flow diagram (editable, draw.io format)
│
└── reporting/
    └── STROBE_checklist_cross-sectional.docx         ← STROBE checklist for cross-sectional studies
```

---

## Quick Start

**Requirements:** Stata `>= 15` and R `>= 4.0`

**Step 1 — Data Management & Modeling (Stata)**

```stata
do "scripts/Salek_data Managements to Modeling.do"
```

**Step 2 — Bivariate Analysis (Stata)**

```stata
do "scripts/Bivariate.do"
```

**Step 3 — Spatial Mapping & Descriptive Graphics (R)**

```r
# Install dependencies
install.packages(c("sf", "ggplot2", "readxl", "dplyr", "tidyr", "viridis"))

# Run spatial mapping and descriptive script
source("scripts/Salek_SUST_Spatial_mapping_ & Descriptives.R")
```

**Step 4 — Review Reporting Documents**

- Open `reporting/STROBE_checklist_cross-sectional.docx` for the completed STROBE checklist
- Open `diagrams/Flow charts.drawio` in [draw.io](https://app.diagrams.net) to view/edit the study flow diagram

---

## Key Highlights

| Feature | Details |
|:--------|:--------|
| **Study Design** | Cross-sectional · nationally representative · rural–urban stratified |
| **Data Source** | Bangladesh Demographic and Health Survey (BDHS) 2022 |
| **Reporting Standard** | STROBE checklist (cross-sectional) |
| **Exposure Variables** | Internet use · ICT usage · ICT ownership |
| **Outcome Variables** | Depression symptoms (PHQ-9) · Anxiety symptoms (GAD-7) |
| **Population** | Ever-married women aged 15–49 years, Bangladesh |
| **Sample Size** | **18,987** women |
| **Geographic Scope** | 8 administrative divisions |
| **Analytic Strategy** | DAG-informed confounder selection → bivariate testing → survey-weighted adjusted regression |
| **Statistical Software** | Stata (data management & modeling) · R (spatial mapping & descriptives) |
| **Spatial Data** | Bangladesh administrative boundary shapefile (`bd.shp`) |

---

## Key Results

### Overall Prevalence

| Outcome | Prevalence |
|:--------|:----------:|
| Depression symptoms (PHQ-9 positive) | **4.8%** |
| Anxiety symptoms (GAD-7 positive) | **4.1%** |

### Adjusted Associations (Survey-Weighted Logistic Regression)

| Residence | Exposure | Outcome | aOR | 95% CI |
|:----------|:---------|:--------|:---:|:------:|
| Rural | ICT use | Depression symptoms | **1.38** | 1.12–1.69 |
| Urban | ICT ownership | Depression symptoms | **1.81** | 1.01–3.25 |
| Urban | ICT ownership | Anxiety symptoms | **2.11** | 1.14–3.92 |

### Spatial Patterns

| Pattern | Divisions |
|:--------|:----------|
| High digital connectivity + high mental health burden | Dhaka, Chattogram, Sylhet, Barishal |
| Low digital access + distinct mental health pattern | Rangpur, Rajshahi |

---

## Analytic Framework (DAG)

A directed acyclic graph (`Figure 2.png`) was used to formalize the hypothesized causal pathway between digital connectivity and mental health outcomes, guiding the selection of a minimal sufficient adjustment set prior to survey-weighted regression modeling and reducing the risk of over-adjustment or collider bias.

---

## Research Impact

| Domain | Contribution |
|:-------|:-------------|
| **Mental Health** | National evidence on digital connectivity and mental health burden among Bangladeshi women |
| **Rural–Urban Equity** | Differential associations of ICT use/ownership with depression and anxiety by residence |
| **Spatial Epidemiology** | Divisional choropleth mapping identifying Rangpur/Rajshahi as low-access, high-need regions |
| **Methodological Rigor** | DAG-informed confounder selection · STROBE-compliant reporting · survey-weighted modeling |
| **Digital Health Policy** | Evidence base for region-specific, gender-sensitive digital mental health interventions |
| **Public Health** | Evidence supporting SDG 3 (Good Health and Well-being) |

---

## Citation

```bibtex
@article{miah_uddin_digital_connectivity_mental_health_2026,
  title   = {Digital Connectivity and Mental Health Symptoms Among Women in Bangladesh:
             A Rural-Urban Perspective},
  author  = {Miah, Md Salek and Uddin, Md Jamal},
  journal = {[Journal Name]},
  year    = {2026},
  note    = {Q1 Journal Submission},
  url     = {https://github.com/muhammadsalek/digital-connectivity-mental-health-bangladesh-women}
}
```

---

## License

MIT License — Copyright (c) 2026 Md Salek Miah & Md Jamal Uddin
Open for academic research. Citation required for publication use.

---

<div align="center">

<img src="https://capsule-render.vercel.app/api?type=waving&color=0:ff6b6b,50:7c3aed,100:00d4ff&height=120&section=footer" width="100%"/>

**Biostatistics, Epidemiology, and Public Health Research Team**
Department of Statistics · Shahjalal University of Science and Technology · Sylhet-3114, Bangladesh

[![Made with Stata](https://img.shields.io/badge/Made%20with-Stata-1F5CA8?style=flat-square)](https://www.stata.com)
[![Made with R](https://img.shields.io/badge/Made%20with-R-276DC3?style=flat-square&logo=r&logoColor=white)](https://www.r-project.org)
[![Spatial Analysis](https://img.shields.io/badge/Spatial-sf%20%2B%20ggplot2-2E8B57?style=flat-square)](https://r-spatial.github.io/sf/)
[![STROBE](https://img.shields.io/badge/Reporting-STROBE-9333ea?style=flat-square)](https://www.strobe-statement.org)
[![SUST](https://img.shields.io/badge/University-SUST%20Bangladesh-f59e0b?style=flat-square)](https://www.sust.edu)

*⭐ Star this repo if it helped your research!*

</div>
