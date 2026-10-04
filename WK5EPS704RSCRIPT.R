library(readr); library(dplyr)
enroll <- read_csv("enrollment.csv")
enroll <- enroll |>
  mutate(gpa = na_if(gpa, 999))

library(readr)
enroll <- read_csv("enrollment.csv")
cor(enroll$gpa, enroll$credits, use = "complete.obs")
cor.test(enroll$gpa, enroll$credits)

t.test(gpa ~ graduated, data = enroll)
summary(aov(gpa ~ program, data = enroll))

tab <- table(enroll$degree_level, enroll$graduated)
chisq.test(tab)

model <- lm(gpa ~ credits, data = enroll)
summary(model)

pp <- read_csv("pre_post_scores.csv")
t.test(pp$post, pp$pre, paired = TRUE)