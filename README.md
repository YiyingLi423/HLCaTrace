# HLCaTrace

HLCaTrace is an R package for calcium imaging trace analysis. It provides a reproducible workflow for F/F0 normalization, responding cell detection, timecourse summarization, and automated figure generation.

## Background

HLCaTrace was developed from calcium signaling analysis workflows used in live-cell fluorescence imaging experiments. The package converts previously Excel-based calcium imaging analysis steps into a reproducible R-based pipeline.

The workflow is designed for single-cell calcium traces, where each column represents one cell and each row represents one imaging frame. The package was developed to improve reproducibility, scalability, and automation in calcium imaging analysis workflows that were previously performed manually in Excel.

## Features

- Import raw calcium imaging fluorescence traces
- Calculate F0 from a user-defined baseline frame range
- Perform F/F0 normalization
- Calculate Fmax and peak height
- Detect responding cells using 5SD, 7SD, and 10SD thresholds
- Summarize population-level timecourse statistics
- Generate individual trace plots
- Generate mean ± SEM plots
- Export analysis results as CSV and PDF files

## Installation

You can install HLCaTrace from GitHub using:

```r
install.packages("devtools")
devtools::install_github("YiyingLi423/HLCaTrace")
```

Then load the package:

```r
library(HLCaTrace)
```

## Input format

The input CSV file should contain raw fluorescence traces.

Expected format:

```text
Column 1: frame number
Column 2 onward: individual cell fluorescence traces
```

Example:

```text
Frame, Cell_1, Cell_2, Cell_3, ...
1,     144.6,  179.6,  177.2
2,     144.2,  180.1,  177.5
3,     144.4,  180.4,  177.4
```

## Basic usage

```r
results <- run_calcium_analysis(
  file = "raw_traces.csv",
  output_prefix = "calcium_analysis",
  f0_range = 1:23,
  peak_range = 57:128,
  baseline_sd_range = 34:56,
  total_time_sec = 120
)
```
## Example Output

### Mean ± SEM calcium response

![Time-course Trace](Figures/Time-course_Trace.png)

### Individual calcium traces

![Individual Traces](Figures/Individual_Traces.png)

## Output files

The workflow automatically generates:

```text
calcium_analysis_normalized_traces.csv
calcium_analysis_cell_summary.csv
calcium_analysis_count_summary.csv
calcium_analysis_timecourse_summary.csv
calcium_analysis_individual_traces.pdf
calcium_analysis_mean_sem.pdf
calcium_analysis_linear_regression_summary.csv
```

## Main functions

| Function | Description |
|---|---|
| `import_calcium_data()` | Import raw calcium imaging data |
| `normalize_traces()` | Perform F/F0 normalization |
| `detect_responding_cells()` | Detect responding cells using SD thresholds |
| `summarize_timecourse()` | Calculate mean, SD, SEM across timepoints |
| `plot_individual_traces()` | Plot individual normalized traces |
| `plot_mean_sem()` | Plot mean ± SEM trace |
| `run_calcium_analysis()` | Run the full analysis pipeline |


## Citation

If you use HLCaTrace in your research, please cite:

Li, Y., & Hamada, K. (2026).  
Genetically encoded lockdown of SERCA in the endoplasmic reticulum membrane arrests Ca2+ signaling through proximity-covalent crosslinking.  
FEBS Letters.  
https://doi.org/10.1002/1873-3468.70342
        
        
        
        

## License

This project is licensed under the MIT License.
