library(readr)
library(dplyr)
library(tidyr)
enroll <- read_csv("enrollment.csv")
advisors <- read_csv("advisors.csv")
scores <- read_csv("scores_wide.csv")

enroll <- enroll |>
  mutate(gpa_group = case_when(
    gpa >= 3.5 ~ "High",
    gpa >= 3.0 ~ "Middle",
    TRUE       ~ "Low"))
  
enroll <- enroll |>
  mutate(gpa = na_if(gpa, 999)) 

enroll |>
  group_by(program) |>
  summarise(mean_gpa = mean(gpa, na.rm = TRUE),
            students = n())

long <- scores |>
  pivot_longer(cols = c(midterm, final, project),
               names_to = "score_type",
               values_to = "score")

wide <- long |>
  pivot_wider(names_from = score_type,
              values_from = score)

enroll |>
  group_by(program) |>
  summarise(across(c(gpa, credits), mean, na.rm = TRUE))

joined <- enroll |>
  left_join(advisors, by = "advisor_id")
head(joined)

