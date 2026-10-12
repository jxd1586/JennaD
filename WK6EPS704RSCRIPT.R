library(readr); library(dplyr)
enroll <- read_csv("enrollment.csv")
enroll <- enroll |>
  mutate(gpa = na_if(gpa, 999))

library(readr); library(ggplot2)

ggplot(enroll, aes(x = gpa)) +
  geom_histogram(binwidth = 0.1) +
  labs(title = "Distribution of GPA", x = "GPA", y = "Number of students")

ggplot(enroll, aes(x = credits, y = gpa)) +
  geom_point() +
  geom_smooth(method = "lm") +
  labs(title = "GPA by credits", x = "Credits", y = "GPA")

ggplot(enroll, aes(x = degree_level, y = gpa)) + geom_boxplot() +
  labs(title = "GPA by degree level")
ggplot(enroll, aes(x = program)) + geom_bar() +
  labs(title = "Students per program") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

ggplot(enroll, aes(x = credits, y = gpa, color = degree_level)) +
  geom_point() +
  facet_wrap(~ program)
ggsave("gpa_plot.png")