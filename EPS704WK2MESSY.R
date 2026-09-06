library(tidyverse)
library(readr)
library(dplyr)
library(stringr)
messy <- read_csv("messy.csv")
dim(messy)
clean <- messy |>
  mutate(program = str_trim(program)) |>
  mutate(gender = str_to_lower(gender)) |>
  mutate(gender = case_when(gender %in% c("f", "female") ~ "Female", gender %in% c("m", "male")   ~ "Male", TRUE ~ gender)) |>
  mutate(gpa = na_if(gpa, "999")) |>
  distinct(student_id, .keep_all = TRUE)
colSums(is.na(clean))

enroll <- read_csv("enrollment.csv")
enroll$enrolled_on <- as.Date(enroll$enrolled_on)
class(enroll$enrolled_on)