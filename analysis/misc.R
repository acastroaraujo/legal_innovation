
library(ccc)
library(tidyverse)

theme_set(
  theme_light(base_family = "Crimson Text") + 
    theme(strip.background = element_rect(fill = "#4C4C4C"))
)

metadata |> 
  filter(year < max(year)) |> 
  count(type, year) |> 
  ggplot(aes(year, n, label = type, color = type)) +
  geomtextpath::geom_textpath(show.legend = FALSE) +
  labs(y = "count") +
  scale_y_continuous(labels = scales::comma, breaks = seq(0, 1600, by = 200)) 

ggsave("images/count.png", dpi = "print", width = 5, height = 3)

library(tsibble)
library(fable)
library(feasts)

data_stl <- metadata |> 
  select(id, date, type) |> 
  mutate(yearmonth = yearmonth(date)) |> 
  summarise(
    n = n(),
    .by = c(yearmonth)
  ) |> 
  tsibble::as_tsibble(index = yearmonth) |> 
  tsibble::fill_gaps() |> 
  replace_na(replace = list(n = 0)) |> 
  mutate(year = year(yearmonth), month = month(yearmonth, label = TRUE)) 



data_stl |> 
  ## this is where it all happens
  rename(count = n) |> 
  model(STL(count ~ trend(window = 21) + season(window = "periodic"))) |> 
  fabletools::components() |> 
  autoplot() +
  labs(
    title = "Rulings Over Time", subtitle = "Time Series Decomposition (Year-Months)", 
    caption = "n = trend + season_year + remainder",
    x = NULL
  ) 


metadata |> 
  pivot_longer(c(indegree, outdegree), names_to = "dtype", values_to = "degree") |> 
  mutate(dtype = case_when(
    dtype == "indegree" ~ "Average Inward Citations (in-degree)",
    dtype == "outdegree" ~ "Average Outward Citations (out-degree)"
  )) |> 
  ggplot(aes(year, degree)) + 
  stat_summary(
    fun.data = \(x) mean_cl_boot(x, conf.int = 0.68), fatten = 1/2,
    shape = 21, fill = "white", size = 1/10
  ) + 
  facet_grid(type ~ dtype, scales = "free") + 
  scale_x_continuous(labels = seq(1992, 2024, 4), breaks = seq(1992, 2024, 4)) +
  labs(y = NULL, x = NULL) +
  theme(strip.text.y = element_text(angle = 0))

ggsave("images/citations.png", dpi = "print", width = 5*1.5, height = 3*2.2)
