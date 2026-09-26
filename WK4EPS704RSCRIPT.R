library(readr); library(dplyr)
enroll <- read_csv("enrollment.csv")
enroll <- enroll |>
  mutate(gpa = na_if(gpa, 999))
mean(enroll$gpa, na.rm = TRUE)
sd(enroll$gpa, na.rm = TRUE)
summary(enroll$gpa)

table(enroll$program)
enroll |> group_by(program) |>
  summarise(mean_gpa = mean(gpa, na.rm = TRUE), students = n())

table(enroll$program, enroll$degree_level)

cor(enroll[c("gpa", "credits", "gre_q", "gre_v")], use = "complete.obs")
