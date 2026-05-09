install.packages("devtools")

devtools::install_github("YiyingLi423/HLCaTrace")

library(HLCaTrace)

results <- run_calcium_analysis(
  file = "raw_traces.csv",
  output_prefix = "my_analysis"
)
