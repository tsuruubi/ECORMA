# Growth rate profiles of different strains of E. coli

[![DOI](https://zenodo.org/badge/1206532381.svg)](https://doi.org/10.5281/zenodo.19707592)

This repository contains the data and code for generating growth rate profiles and performing Flux Balance Analysis (FBA) across various *E. coli* strains (ECOR and MA strains).

---

## Workflow Overview

The analysis is divided into three main steps:
1. **01_Generate_Growth_Profiles**: Processes raw OD data into growth rate metrics using R.
2. **02_Flux_Balance_Analysis**: Constructs genome-scale metabolic models (GEMs) and examines FBA using Python/COBRApy.
3. **03_Main_Analysis**: Integrates phylogenetics, growth profiles, and FBA results for final statistical testing and visualization.

---

## Directory Structure

### 01_Generate_Growth_Profiles
Codes and data for generating growth profiles from raw OD data.
* **Carbon_Info/**: `Carbon_name.csv` (Names of 32 carbon sources).
* **OD_raw_data/**: Raw OD data for ECOR, MA (Ancestors/Progeny), sterile cultures, and carbon source conditions.
* **Output/**: Fitted results (`fit_results_*.csv`) and statistical summaries (`stat_fit_*.csv`) of $\mu_{max}$ and $OD_{max}$. The allrep suffix represents that statistics were calculated using all replicates. The obtained output files were copied and pasted into the 03_Main_Analysis/From_RawOD_to_GrowthProf/Output directory.
* **Generate_Growth_Profiles.Rmd**: R script for the entire growth curve fitting pipeline.

### 02_Flux_Balance_Analysis
Tools for metabolic model reconstruction and FBA simulations.
* **carveme/**: SBML models (`ECORXX_model.xml`) generated via CarveMe. The full models are available at Zenodo (https://doi.org/10.5281/zenodo.19491366).
* **cds/**: Original and renamed coding sequence FASTA files. The full datasets are available in Patel et al. (https://doi.org/10.1128/mra.01133-18).
* **fba/**: 
    * `growth_media/`: In silico media definitions (`M9_singles_lowox.tsv`).
    * `output_rev10/`: Essential reactions for optimal biomass production in FBA and flux distributions in parsimonious FBA (pFBA). The full output files were copied and pasted into the 03_Main_Analysis/FBA/output_rev10 directory.
* **mg1655/**: Reference model `iML1515.xml` and its corresponding FBA outputs. The full output files were copied and pasted into the 03_Main_Analysis/FBA/output_rev10 directory.
* **script/**: 
    * `01_Format_cds.Rmd`: R script for FASTA header normalization.
    * `02_Run_Carveme.sh`: Shell script for model reconstruction.
    * `03_Run_FBA.ipynb`: Jupyter Notebook for FBA.

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
* **Growth Curve Fitting**: `growthcurver`
* **Visualizations**: `ggpubr`, `patchwork`, `scales`, `VennDiagram`, `RColorBrewer`
* **Heatmaps & Clustering**: `pheatmap`, `gplots`, `circlize`, `dendextend`, `corrplot`
* **Phylogenetics**: `ape`, `ggtree`, `phytools` (Pagel's $\lambda$), `caper` (PGLS), `geomorph` (Kmult)
* **Statistics & Multi-variate**: `rstatix`, `lme4` (linear mixed-effects models), `vegan` (Mantel test), `factoextra` (PCA), `psych`, `Hmisc`

### Key Python Libraries
* **Metabolic Modeling**: `cobra` (COBRApy)
* **Data Analysis**: `pandas`, `numpy`, `scipy` (Spearman correlation)
* **Visualization**: `matplotlib`, `seaborn`
* **Utilities**: `tqdm`, `pathlib`, `itertools`


## Citation
If you use this code or data, please cite the following Zenodo record:
[https://doi.org/10.5281/zenodo.19707592](https://doi.org/10.5281/zenodo.19707592)