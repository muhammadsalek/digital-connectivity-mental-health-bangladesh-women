# Digital Connectivity and Mental Health Among Women in Bangladesh

## Internet Use, ICT Access, and Depressive/Anxiety Symptoms Among Bangladeshi Women: A Spatial Epidemiological Analysis

<div align="center">

[![License](https://img.shields.io/badge/License-MIT-10b981?style=for-the-badge&labelColor=0d1117&logo=opensourceinitiative&logoColor=10b981)](LICENSE)
[![Status](https://img.shields.io/badge/Status-Active%20Research-7c3aed?style=for-the-badge&labelColor=0d1117)](https://github.com)
[![Journal](https://img.shields.io/badge/Output-Q1%20Journal%20Ready-00d4ff?style=for-the-badge&labelColor=0d1117)](https://github.com)
[![Design](https://img.shields.io/badge/Design-Cross--Sectional-ff6b6b?style=for-the-badge&labelColor=0d1117)](https://github.com)
[![Scope](https://img.shields.io/badge/Scope-8%20Divisions%20%7C%20Bangladesh-f59e0b?style=for-the-badge&labelColor=0d1117)](https://github.com)

</div>

<div align="center">

![Stata](https://img.shields.io/badge/Stata-1F5CA8?style=flat-square&logoColor=white)
![R](https://img.shields.io/badge/R-276DC3?style=flat-square&logo=r&logoColor=white)
![sf](https://img.shields.io/badge/sf-Spatial_Mapping-2E8B57?style=flat-square&logoColor=white)
![ggplot2](https://img.shields.io/badge/ggplot2-Visualization-1f77b4?style=flat-square&logoColor=white)
![STROBE](https://img.shields.io/badge/Reporting-STROBE%20Checklist-9333ea?style=flat-square&logoColor=white)
![DAG](https://img.shields.io/badge/Framework-DAG%20Causal%20Model-00d4ff?style=flat-square&logoColor=white)
![BDHS](https://img.shields.io/badge/Data-Bangladesh%20Survey-e63946?style=flat-square&logoColor=white)

</div>

---

<div align="center">

```
╔══════════════════════════════════════════════════════════════════════╗
║  📶  Digital Connectivity  ·  🧠  Mental Health  ·  🇧🇩  Bangladesh  ║
║  🗺️  8 Administrative Divisions  ·  Spatial + Bivariate + DAG Model  ║
║  📊  Stata (Data Mgmt & Modeling)  ·  R (Spatial Mapping & Figures)  ║
╚══════════════════════════════════════════════════════════════════════╝
```

</div>

---

## Overview

This study investigates the association between **digital connectivity (internet use and ICT access)** and **mental health outcomes (depressive and anxiety symptoms)** among women in Bangladesh, using nationally representative survey data disaggregated across the country's **eight administrative divisions**. The analysis combines **bivariate association testing**, **directed acyclic graph (DAG)-informed confounder selection**, and **spatial mapping** of internet access and mental health burden to identify geographic disparities and inform digital health policy.

**Analysis Pipeline:**

```
Survey Data  (Bangladesh · Women 15–49 yrs · Cross-Sectional)
          │
          │  ICT/internet use indicators + mental health screening items
          │  disaggregated by administrative division (n = 8)
          ▼
   Data Management       cleaning · recoding · variable construction
   (Stata .do file)      "Salek_data Managements to Modeling.do"
          │
          ▼
   DAG Framework          confounder identification · minimal adjustment set
   (Figure 2.png)         theory-driven causal pathway (connectivity → mental health)
          │
          ▼
   Bivariate Analysis     chi-square / t-test associations by exposure & outcome
   (Bivariate.do)         internet use × depression/anxiety, by division
          │
          ▼
   Regression Modeling    adjusted models per DAG-selected covariates
   (Stata .do file)       survey-weighted logistic/ordinal regression
          │
          ▼
   Spatial Mapping        divisional choropleth maps (sf/ggplot2 in R)
   (R script)             internet access · ICT combined index · mental health burden
          │
          ▼
   Outputs                descriptive + spatial figures (PNG/TIFF/PDF) · STROBE checklist
```

---

## Abstract

**Background:** Digital connectivity is expanding rapidly across Bangladesh, yet its relationship with women's mental health remains understudied at the sub-national level. Understanding how internet use and ICT access relate to depressive and anxiety symptoms — and how this relationship varies geographically — can inform targeted digital health and mental health interventions.

**Objectives:** This study aimed to (i) examine the association between digital connectivity indicators (internet use, ICT access) and depressive/anxiety symptoms among Bangladeshi women; (ii) identify a theoretically grounded set of confounders using a directed acyclic graph (DAG); and (iii) map divisional-level spatial patterns of internet access and mental health burden across Bangladesh.

**Methods:** Nationally representative survey data on women aged 15–49 years were analyzed. A DAG was constructed to guide covariate selection prior to adjusted modeling. Bivariate associations between digital connectivity indicators and mental health outcomes were tested, followed by adjusted regression modeling. Divisional-level choropleth maps were generated in R (`sf`, `ggplot2`) using Bangladesh administrative boundary shapefiles to visualize spatial heterogeneity in internet access, combined ICT indices, and mental health burden.

**Results:** *[Insert final prevalence, association statistics, and adjusted effect estimates once modeling is finalized — e.g., prevalence of internet use by division, prevalence of depressive/anxiety symptoms, and adjusted odds ratios from the regression models.]*

**Conclusions:** *[Insert key policy-relevant conclusions once results are finalized — e.g., divisional disparities in digital access and their association with mental health burden, implications for digital health literacy programs.]*

**Keywords:** Digital connectivity · Internet use · ICT access · Mental health · Depression · Anxiety · Bangladesh · Spatial epidemiology · DAG · Women's health

---

## Authors

**Md Salek Miah**
Research Assistant, Department of Statistics
Shahjalal University of Science and Technology (SUST), Sylhet-3114, Bangladesh
📧 [saleksta@gmail.com](mailto:saleksta@gmail.com)
[![ORCID](https://img.shields.io/badge/ORCID-0009--0005--5973--461X-A6CE39?style=flat-square&logo=orcid&logoColor=white)](https://orcid.org/0009-0005-5973-461X)

**Affiliation**

Biostatistics, Epidemiology, and Public Health Research Team
Department of Statistics, Shahjalal University of Science & Technology (SUST), Sylhet-3114, Bangladesh

---

## Study Design & Data Source

### Design Overview

This is a **cross-sectional analytical study** examining digital connectivity and mental health among women in Bangladesh, disaggregated at the **divisional (administrative) level**. The study follows **STROBE reporting guidelines for cross-sectional studies** (see `STROBE_checklist_cross-sectional.docx`), and uses a **DAG-informed analytic strategy** to minimize confounding bias in the estimation of the connectivity–mental health relationship.

### Study Population & Eligibility

```
Target Population
      │
      ├─ Women of reproductive/adult age (15–49 years)
      ├─ Residing in one of Bangladesh's 8 administrative divisions
      └─ Inclusion criterion: complete data on internet use / ICT access
           and mental health screening items

                         ↓  After data cleaning & reconciliation

              ┌─────────────────────────────────────────┐
              │   Divisional Coverage: 8 Divisions       │
              ├──────────────────┬──────────────────────┤
              │  Barishal          Chattogram             │
              │  Dhaka             Khulna                 │
              │  Mymensingh        Rajshahi                │
              │  Rangpur           Sylhet                  │
              └──────────────────┴──────────────────────┘
```

### Geographic Scope

Spatial analyses use official **Bangladesh administrative boundary shapefiles** (`bd.shp`) to map division-level indicators of internet access, combined ICT status, and mental health burden.

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
│   ├── Salek_data Managements to Modeling.do       ← Data cleaning, recoding & regression modeling (Stata)
│   ├── Bivariate.do                                ← Bivariate association analysis (Stata)
│   └── Salek_SUST_Spatial_mapping_ & Descriptives.R ← Spatial mapping & descriptive graphics (R)
│
├── figures/
│   ├── Figure 2.png                                ← DAG (directed acyclic graph) framework
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
    └── STROBE_checklist_cross-sectional.docx        ← STROBE checklist for cross-sectional studies
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
| **Study Design** | Cross-sectional · divisional-level disaggregation · secondary survey data |
| **Reporting Standard** | STROBE checklist (cross-sectional) |
| **Exposure Variables** | Internet use · combined ICT access index |
| **Outcome Variables** | Depressive symptoms · anxiety symptoms |
| **Population** | Women aged 15–49 years, Bangladesh |
| **Geographic Scope** | 8 administrative divisions |
| **Analytic Strategy** | DAG-informed confounder selection → bivariate testing → adjusted regression |
| **Statistical Software** | Stata (data management & modeling) · R (spatial mapping & descriptives) |
| **Spatial Data** | Bangladesh administrative boundary shapefile (`bd.shp`) |
| **Output Format** | Publication-ready descriptive and spatial figures (PNG/TIFF/PDF) |

---

## Analytic Framework (DAG)

A directed acyclic graph (`Figure 2.png`) was used to formalize the hypothesized causal pathway between digital connectivity and mental health outcomes, guiding the selection of a minimal sufficient adjustment set prior to regression modeling and reducing the risk of over-adjustment or collider bias.

---

## Divisional Data Coverage

| Data File | Content |
|:----------|:--------|
| `internet_status_by_division.xlsx` | Internet use prevalence, disaggregated by division |
| `ict_combined_block_by_division.xlsx` | Combined ICT access index, disaggregated by division |
| `ict_mental_combined_block_by_division.xlsx` | Joint ICT access + mental health indicators, by division |
| `bd.shp` | Administrative boundary shapefile for spatial (choropleth) mapping |

---

## Research Impact

| Domain | Contribution |
|:-------|:-------------|
| **Mental Health** | Divisional-level evidence on digital connectivity and mental health burden |
| **Digital Health Policy** | Evidence base for targeted digital literacy and mental health interventions |
| **Spatial Epidemiology** | Choropleth mapping of internet access and mental health across Bangladesh |
| **Methodological Rigor** | DAG-informed confounder selection · STROBE-compliant reporting |
| **Public Health** | Evidence for SDG 3 (Good Health and Well-being) and SDG 9 (digital infrastructure) |

---

## Citation

```bibtex
@article{miah_digital_connectivity_mental_health_2026,
  title   = {Digital Connectivity and Mental Health Among Women in Bangladesh:
             A Spatial Epidemiological Analysis},
  author  = {Miah, Md Salek},
  journal = {[Journal Name]},
  year    = {2026},
  note    = {Manuscript in preparation},
  url     = {https://github.com/muhammadsalek/digital-connectivity-mental-health-bangladesh-women}
}
```

---

## License

MIT License — Copyright (c) 2026 Md Salek Miah
Open for academic research. Citation required for publication use.

---

<div align="center">

**Biostatistics, Epidemiology, and Public Health Research Team**
Department of Statistics · Shahjalal University of Science and Technology · Sylhet-3114, Bangladesh

[![Made with Stata](https://img.shields.io/badge/Made%20with-Stata-1F5CA8?style=flat-square)](https://www.stata.com)
[![Made with R](https://img.shields.io/badge/Made%20with-R-276DC3?style=flat-square&logo=r&logoColor=white)](https://www.r-project.org)
[![Spatial Analysis](https://img.shields.io/badge/Spatial-sf%20%2B%20ggplot2-2E8B57?style=flat-square)](https://r-spatial.github.io/sf/)
[![STROBE](https://img.shields.io/badge/Reporting-STROBE-9333ea?style=flat-square)](https://www.strobe-statement.org)
[![SUST](https://img.shields.io/badge/University-SUST%20Bangladesh-f59e0b?style=flat-square)](https://www.sust.edu)

*⭐ Star this repo if it helped your research!*

</div>
