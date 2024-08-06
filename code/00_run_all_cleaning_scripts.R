# TITLE: "Run All Data Cleaning Scripts"
# AUTHOR(S): [enter]
# DATE: `r Sys.Date()`

# DESCRIPTION: Run all cleaning scripts

# Clear environment
rm(list = ls())

# Load packages - first pacman, installing if necessary, then others
if (!require("pacman")) install.packages("pacman"); library(pacman)
pacman::p_load(here, readxl, tidyverse, janitor, rstatix)


# Run all cleaning scripts in order (send Rmd output to temp folder, to be deleted)
### All grades
source(knitr::purl(input = here("code/clean_district_school_codes.Rmd"),
                   output = here("code/temp/temp.Rmd"),
                   quiet = TRUE), encoding = 'UTF-8')

source(knitr::purl(input = here("code/clean_enrollment_district.Rmd"),
                   output = here("code/temp/temp.Rmd"),
                   quiet = TRUE), encoding = 'UTF-8')

source(knitr::purl(input = here("code/clean_enrollment_statewide.Rmd"),
                   output = here("code/temp/temp.Rmd"),
                   quiet = TRUE), encoding = 'UTF-8')

source(knitr::purl(input = here("code/clean_enrollment_school.Rmd"),
                   output = here("code/temp/temp.Rmd"),
                   quiet = TRUE), encoding = 'UTF-8')

source(knitr::purl(input = here("code/clean_enrollment_school_ELL.Rmd"),
                   output = here("code/temp/temp.Rmd"),
                   quiet = TRUE), encoding = 'UTF-8')

source(knitr::purl(input = here("code/clean_enrollment_school_FRPL.Rmd"),
                   output = here("code/temp/temp.Rmd"),
                   quiet = TRUE), encoding = 'UTF-8')

source(knitr::purl(input = here("code/clean_enrollment_school_race.Rmd"),
                   output = here("code/temp/temp.Rmd"),
                   quiet = TRUE), encoding = 'UTF-8')

source(knitr::purl(input = here("code/clean_enrollment_school_SWD.Rmd"),
                   output = here("code/temp/temp.Rmd"),
                   quiet = TRUE), encoding = 'UTF-8')

source(knitr::purl(here("code/clean_smarterbalanced_achievement_all_students.Rmd"),
                   output = here("code/temp/temp.Rmd"),
                   quiet = TRUE), encoding = 'UTF-8')

source(knitr::purl(here("code/clean_smarterbalanced_achievement_ELL_students_all_grades.Rmd"),
                   output = here("code/temp/temp.Rmd"),
                   quiet = TRUE), encoding = 'UTF-8')

source(knitr::purl(here("code/clean_smarterbalanced_achievement_FRPL_students_all_grades.Rmd"),
                   output = here("code/temp/temp.Rmd"),
                   quiet = TRUE), encoding = 'UTF-8')

source(knitr::purl(here("code/clean_smarterbalanced_achievement_race_ethnicity_all_grades.Rmd"),
                   output = here("code/temp/temp.Rmd"),
                   quiet = TRUE), encoding = 'UTF-8')

source(knitr::purl(here("code/clean_smarterbalanced_achievement_SWD_students_all_grades.Rmd"),
                   output = here("code/temp/temp.Rmd"),
                   quiet = TRUE), encoding = 'UTF-8')


### Grade-Level scripts
source(knitr::purl(here("code/clean_smarterbalanced_achievement_all_students_by_grade.Rmd"),
                   output = here("code/temp/temp.Rmd"),
                   quiet = TRUE), encoding = 'UTF-8')

source(knitr::purl(here("code/clean_smarterbalanced_achievement_ELL_students_by_grade.Rmd"),
                   output = here("code/temp/temp.Rmd"),
                   quiet = TRUE), encoding = 'UTF-8')

source(knitr::purl(here("code/clean_smarterbalanced_achievement_FRPL_students_by_grade.Rmd"),
                   output = here("code/temp/temp.Rmd"),
                   quiet = TRUE), encoding = 'UTF-8')

source(knitr::purl(here("code/clean_smarterbalanced_achievement_race_ethnicity_students_by_grade.Rmd"),
                   output = here("code/temp/temp.Rmd"),
                   quiet = TRUE), encoding = 'UTF-8')

source(knitr::purl(here("code/clean_smarterbalanced_achievement_SWD_students_by_grade.Rmd"),
                   output = here("code/temp/temp.Rmd"),
                   quiet = TRUE), encoding = 'UTF-8')


# Delete contents of temp folder 
here("code/temp") %>%    #specify the path to the folder
  list.files(., full.names = TRUE) %>%  #get a list of files in the folder
  file.remove()                         #remove the files (contents of the folder)
