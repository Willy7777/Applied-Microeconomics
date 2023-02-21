library(tidyverse)
library(openxlsx)
library(readxl)

setwd("C:/Users/willy/Desktop/論文/opview data")

# 1/1 ~ 11/9
Moderna_data <- read_excel("Moderna_vaccine_20210101_to_20211109.xlsx")


# 處理發佈日期，拿掉小時、分、秒
Moderna_data$發佈時間 <- substr(Moderna_data$發佈時間, 1, 10)


# 依日期，分成好幾個 df，放到 list df_split_by_date 中
df_split_by_date <- split(Moderna_data, Moderna_data$發佈時間)


# 每日各情緒加總數
num_of_positive <- c()
num_of_negative <- c()
num_of_neutral <- c()
for (i in 1:length(df_split_by_date)) {
  sub_df <- df_split_by_date[[i]]
  num_of_positive <- c(num_of_positive, nrow(sub_df[sub_df$情緒標記 == "正面", ]))
  num_of_negative <- c(num_of_negative, nrow(sub_df[sub_df$情緒標記 == "負面", ]))
  num_of_neutral <- c(num_of_neutral, nrow(sub_df[sub_df$情緒標記 == "中立", ]))
}


# 每日總聲量之 data frame
num_of_volume <- data.frame("date" = names(df_split_by_date),
                            "positive" = num_of_positive,
                            "negative" = num_of_negative,
                            "neutral" = num_of_neutral)


# Moderna 缺 2/13
setwd("C:/Users/willy/Desktop/論文/generated data/num of nolume")
write.csv(num_of_volume, "Moderna_num_of_volume.csv")
