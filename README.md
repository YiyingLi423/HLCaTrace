## Project structure

This project contains two connected components:

1. **Experimental project website**
   
   [![Project Website](https://img.shields.io/badge/Project-Website-blue)](https://yiyingli423.github.io/HLCaTrace/)
   
   A scientific website documenting the complete experimental logic, biological results, imaging workflow, and development process associated with the FEBS Letters study.

   Experimental details, figures, imaging workflows, and scientific background are available at:

   https://yiyingli423.github.io/HLCaTrace/

2. **HLCaTrace R package**

   [![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](LICENSE)
   
   HLCaTrace is an R package for calcium imaging trace analysis. It provides a reproducible workflow for F/F0 normalization, responding cell detection, timecourse summarization, and automated figure
   generation.

   Package installation instructions, usage examples, and function documentation are provided in this README.
## Background

HLCaTrace was developed from calcium signaling analysis workflows used in live-cell fluorescence imaging experiments. The package converts previously Excel-based calcium imaging analysis steps into a reproducible R-based pipeline.

The workflow is designed for single-cell calcium traces, where each column represents one cell and each row represents one imaging frame. The package was developed to improve reproducibility, scalability, and automation in calcium imaging analysis workflows that were previously performed manually in Excel.

The package was developed as part of the live-cell calcium imaging analysis workflow used in the following study:

Li, Y., & Hamada, K. (2026). *Genetically encoded lockdown of SERCA in the endoplasmic reticulum membrane arrests Ca2+ signaling through proximity-covalent crosslinking*. *FEBS Letters*. Advance online publication. DOI: [10.1002/1873-3468.70342](https://doi.org/10.1002/1873-3468.70342)

## Experimental imaging workflow

### Imaging system

Calcium imaging experiments were performed using a Nikon Eclipse Ti-S inverted widefield fluorescence microscope.

Typical acquisition settings:

- 20× objective
- 300 ms exposure time
- ~1.3 sec/frame
- 2 min total recording time

### Calcium indicators

The workflow was developed using:

- NCaMP7 for cytosolic calcium imaging

### Experimental stimulation

Typical stimulation conditions:

- Histamine (100 µM) for HeLa cells
- Carbachol (0.5 mM) for HEK293FT cells

Agonists were added at 30 sec after recording initiation.

These imaging conditions and timing parameters were used to define the default analysis settings implemented in HLCaTrace.

## ROI extraction in Fiji/ImageJ

Fluorescence traces were extracted manually in Fiji/ImageJ using ROI-based measurements.

Representative ROI selection in Fiji/ImageJ:

<div align="center">
<img src="Figures/ROI_selection.png" width="400">
</div>

## Input data format

HLCaTrace assumes the following CSV structure for calcium imaging fluorescence traces:

- Column 1 = frame number
- Remaining columns = individual cell fluorescence traces
- Rows = imaging frames

The workflow was designed for single-cell calcium imaging datasets exported from Fiji/ImageJ ROI measurements.

Representative exported fluorescence CSV:

<div align="center">
<img src="Figures/CSV_structure.png" width="500">
</div>

## Included example dataset

A standard example calcium imaging dataset (`raw_traces.csv`) is included within the package for workflow testing and demonstration.

The dataset is located in:

```text
inst/extdata/raw_traces.csv
```

Users are encouraged to first test the workflow using the included dataset before analyzing custom calcium imaging datasets.

## Features

- Import raw calcium imaging fluorescence traces
- Calculate F0 from user-defined baseline frames
- Perform F/F0 normalization
- Calculate Fmax and peak heights
- Detect responding cells using 5SD, 7SD, and 10SD thresholds
- Summarize population-level timecourse statistics
- Generate individual trace plots
- Generate mean ± SEM plots
- Export analysis results as CSV and PDF files

## Requirements

HLCaTrace requires R and the following package for GitHub installation:

```r
install.packages("devtools")
```

## Installation

Install HLCaTrace from GitHub using:

```r
devtools::install_github("YiyingLi423/HLCaTrace")
```

Then load the package:

```r
library(HLCaTrace)
```

## Basic usage

### 1. Use the included example dataset

A standard example dataset is included in the package. After loading HLCaTrace, users can access it directly in R:

```r

example_file <- system.file(
  "extdata",
  "raw_traces.csv",
  package = "HLCaTrace"
)

```

### 2. Run the full analysis workflow

```r

results <- run_calcium_analysis(
  file = example_file,
  output_prefix = "calcium_analysis"
)

```

### 3. Analyze your own dataset

To analyze your own Fiji/ImageJ-exported fluorescence CSV file, replace `example_file` with your file path:

```r

results <- run_calcium_analysis(
  file = "your_raw_traces.csv",
  output_prefix = "my_analysis",
)

```

The workflow automatically performs F/F0 normalization, peak response analysis, responding cell classification, population timecourse summarization, and figure generation.

Analysis results and figures will be exported to the current R working directory.

## Default analysis assumptions

The default analysis parameters in HLCaTrace were optimized based on the experimental imaging workflow described above, including:

- ~120 sec total recording duration
- ~1.3 sec/frame acquisition speed
- Agonist stimulation around 30 sec after recording initiation

Accordingly, the default analysis frame ranges are:

```r
f0_range = 1:23
baseline_sd_range = 1:23
peak_range = 24:95
```

These default ranges are based on the cleaned normalized trace matrix rather than Excel worksheet row numbers.

All parameters can be manually adjusted for custom experimental conditions and imaging settings.

## Example output

### Mean ± SEM calcium response

<div align="center">
<img src="Figures/Time-course_Trace.png" width="400">
</div>

### Individual calcium traces

<div align="center">
<img src="Figures/Individual_Traces.png" width="500">
</div>

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
| `detect_responding_cells()` | Detect responding cells |
| `summarize_timecourse()` | Calculate mean ± SEM statistics |
| `plot_individual_traces()` | Plot individual traces |
| `plot_mean_sem()` | Plot mean ± SEM trace |
| `run_calcium_analysis()` | Run the full workflow |

## Citation

If you use HLCaTrace in your research, please cite:

Li, Y., & Hamada, K. (2026). *Genetically encoded lockdown of SERCA in the endoplasmic reticulum membrane arrests Ca2+ signaling through proximity-covalent crosslinking*. *FEBS Letters*. Advance online publication. DOI: [10.1002/1873-3468.70342](https://doi.org/10.1002/1873-3468.70342)

## License

This project is licensed under the GPL-3.0 License.

## Additional information

Additional information regarding AI-assisted development and writing is provided in `AI_USAGE_Declaration.md`.
