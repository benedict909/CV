# CV R script 

setwd("~/Github/CV/")

CV_type = c("normal", "all_exams")[1]

if(CV_type == "normal"){
  pdf_filename = paste0("Benedict_Monteiro_CV.pdf")
  gsheets_link = "https://docs.google.com/spreadsheets/d/1WC2VQGbxqxsNcU06x1DMvFBV2AQZg1BCzF26pKs5qCE/edit?usp=sharing"
}

if(CV_type == "all_exams"){
  pdf_filename = paste0("Benedict_Monteiro_CV_all_exams.pdf")
  gsheets_link = "https://docs.google.com/spreadsheets/d/1wLh4dEm8ZeTY_T68b5-7iaN4jLkzOvnEZ8X9INsQbGk/edit?usp=sharing"
  
}

if(file.exists(pdf_filename)) unlink(pdf_filename, force = T)

# devtools::install_github("nstrayer/datadrivencv")
# remotes::install_github('mitchelloharawild/icons@v0.1.0') # install icon until nickstrayer updates datadrivencv to account for icon now being called icons
# run ?datadrivencv::use_datadriven_cv to see more details
# link: https://docs.google.com/spreadsheets/d/1WC2VQGbxqxsNcU06x1DMvFBV2AQZg1BCzF26pKs5qCE/edit?usp=sharing
# example: https://docs.google.com/spreadsheets/d/14MQICF2F8-vf8CKPF1m4lyGKO6_thG-4aSwat1e2TWc/edit#gid=917338460

datadrivencv::use_datadriven_cv(
  full_name = "Benedict Monteiro",
  data_location = gsheets_link,
  # pdf_location = "https://github.com/benedict909/cv/cv.pdf",
  # html_location = "nickstrayer.me/cv/",
  source_location = "https://github.com/benedict909/CV",
  open_files = F
)


# This script builds both the HTML and PDF versions of your CV

# If you wanted to speed up rendering for googlesheets driven CVs you could use
# this script to cache a version of the CV_Printer class with data already
# loaded and load the cached version in the .Rmd instead of re-fetching it twice
# for the HTML and PDF rendering. This exercise is left to the reader.

# Knit the HTML version
rmarkdown::render("cv_mine.rmd",
                  params = list(pdf_mode = FALSE),
                  output_file = "cv.html")

# Knit the PDF version to temporary html location
tmp_html_cv_loc <- fs::file_temp(ext = ".html")
rmarkdown::render("cv_mine.rmd",
                  params = list(pdf_mode = TRUE),
                  output_file = tmp_html_cv_loc)

# Convert to PDF using Pagedown
pagedown::chrome_print(input = tmp_html_cv_loc,
                       output = pdf_filename)



if(CV_type == "normal") file.copy(from = "cv.html", to = "../benedict909.github.io/index.html", overwrite = T)
file.copy(from = pdf_filename, to = paste0(gsub(".pdf","",pdf_filename),"_",Sys.Date(),".pdf"), overwrite = T)

# now push to master using github desktop app on both repos 
