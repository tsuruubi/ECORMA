# Growth rate profiles of different strains of E. coli

[![DOI](https://zenodo.org/badge/9876543210.svg)](https://doi.org/XXXXXXXXX/zenodo.9876543210)

This repository contains the data and code for generating growth rate profiles and performing Flux Balance Analysis (FBA) across various *E. coli* strains (ECOR and MA strains).

---

## Workflow Overview

The analysis is divided into three main steps:
1. **01_Generate_Growth_Profiles**: Processes raw OD data into growth rate metrics using R.
2. **02_Flux_Balance_Analysis**: Constructs genome-scale metabolic models (GEMs) and identifies essential reactions using Python/COBRApy.
3. **03_Main_Analysis**: Integrates phylogenetics, growth profiles, and FBA results for final statistical testing and visualization.

---

## Directory Structure

### 01_Generate_Growth_Profiles
Codes and data for generating growth profiles from raw OD data.
* **Carbon_Info/**: `Carbon_name.csv` (Names of 32 carbon sources).
* **OD_raw_data/**: Raw OD data for ECOR, MA (Ancestors/Progeny), sterile cultures, and carbon source conditions.
* **Output/**: Fitted results (`fit_results_*.csv`) and statistical summaries (`stat_fit_*.csv`) of $\mu_{max}$ and $OD_{max}$.
* **Generate_Growth_Profiles.Rmd**: R script for the entire growth curve fitting pipeline.

### 02_Flux_Balance_Analysis
Tools for metabolic model reconstruction and FBA simulations.
* **carveme/**: SBML models (`ECORXX_model.xml`) generated via CarveMe.
* **cds/**: Original and renamed coding sequence FASTA files.
* **fba/**: 
    * `growth_media/`: In silico media definitions (`M9_singles.tsv`).
    * `output/`: Pan-metabolite/reaction data and essentiality results (`ECORXX__essential_only.csv`).
* **mg1655/**: Reference model `iML1515.xml` and its corresponding FBA outputs.
* **script/**: 
    * `01_Format_cds.Rmd`: R script for FASTA header normalization.
    * `02_Run_Carveme.sh`: Shell script for model reconstruction.
    * `03_Run_FBA.ipynb`: Jupyter Notebook for essential reaction extraction.

### 03_Main_Analysis
Integration and final statistical analysis.
* **EzClermont/**: Phylogenetic data (phylogroups) for ECOR strains.
* **Outputs_Main/**: Final processed dataframes for growth rates, phylogeny, and essential reaction matrices.
* **Main_Analysis.Rmd**: R script for generating figures and performing statistical tests.

---

## Requirements

### Software
* **R**: 4.5.2 or greater
* **Python**: 3.9.20 or greater
* **CarveMe**: https://carveme.readthedocs.io/en/latest/

### Key R Packages
The analysis utilizes a wide range of R libraries categorized as follows:
* **Data Manipulation**: `tidyverse` (`dplyr`, `readr`, `ggplot2`), `magrittr`, `reshape2`, `matrixStats`
* **Visualizations**: `ggpubr`, `patchwork`, `scales`, `VennDiagram`, `RColorBrewer`
* **Heatmaps & Clustering**: `pheatmap`, `gplots`, `circlize`, `dendextend`, `corrplot`
* **Phylogenetics**: `ape`, `ggtree`, `phytools` (Pagel's $\lambda$), `geomorph` (Kmult)
* **Statistics & Multi-variate**: `rstatix`, `factoextra` (PCA), `psych`, `Hmisc`

### Key Python Libraries
* **Metabolic Modeling**: `cobra` (COBRApy)
* **Data Analysis**: `pandas`, `numpy`, `scipy` (Spearman correlation)
* **Visualization**: `matplotlib`, `seaborn`
* **Utilities**: `tqdm`, `pathlib`, `itertools`

## Citation
If you use this code or data, please cite the following Zenodo record:
[https://doi.org/XXXXXXXXX/zenodo.9876543210](https://doi.org/XXXXXXXXX/zenodo.9876543210)