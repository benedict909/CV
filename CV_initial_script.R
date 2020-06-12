# CV R script 

# devtools::install_github("nstrayer/datadrivencv")

setwd("~/Github/CV/")

# run ?datadrivencv::use_datadriven_cv to see more details
datadrivencv::use_datadriven_cv(
  full_name = "Benedict Monteiro",
  data_location = "https://docs.google.com/spreadsheets/d/1WC2VQGbxqxsNcU06x1DMvFBV2AQZg1BCzF26pKs5qCE/edit?usp=sharing",
  # pdf_location = "https://github.com/benedict909/cv/cv.pdf",
  # html_location = "nickstrayer.me/cv/",
  source_location = "https://github.com/benedict909/CV"
)
