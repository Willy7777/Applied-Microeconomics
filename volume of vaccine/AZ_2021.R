library(tidyverse)
library(openxlsx)
library(readxl)

setwd("C:/Users/willy/Desktop/論文/opview data")

# 1/1 ~ 8/10
AZ_data_1 <- read_excel("AZ_vaccine_20210101_to_20210810.xlsx")

# 8/11 ~ 11/9
AZ_data_2 <- read_excel("AZ_vaccine_20210811_to_20211109.xlsx")

# merge AZ data
AZ_data <- rbind(AZ_data_1, AZ_data_2)

# remove useless df
rm(AZ_data_1)
rm(AZ_data_2)


# 依日期，分成好幾個 df，放到 list df_split_by_date 中
df_split_by_date <- split(AZ_data, AZ_data$發佈時間)


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


# AZ data 缺 1/16
setwd("C:/Users/willy/Desktop/論文/generated data/num of nolume")
write.csv(num_of_volume, "AZ_num_of_volume.csv")

