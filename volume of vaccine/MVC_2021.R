library(tidyverse)
library(openxlsx)
library(readxl)

setwd("C:/Users/willy/Desktop/論文/opview data")

# 1/1 ~ 7/31
MVC_data_1 <- read_excel("MVC_vaccine_20210101_to_20210731.xlsx")

# 8/1 ~ 11/9
MVC_data_2 <- read_excel("MVC_vaccine_20210801_to_20211109.xlsx")

# merge MVC data
MVC_data <- rbind(MVC_data_1, MVC_data_2)

# remove useless df
rm(MVC_data_1)
rm(MVC_data_2)


# 處理發佈日期，拿掉小時、分、秒
MVC_data$發佈時間 <- substr(MVC_data$發佈時間, 1, 10)


# 依日期，分成好幾個 df，放到 list df_split_by_date 中
df_split_by_date <- split(MVC_data, MVC_data$發佈時間)


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


setwd("C:/Users/willy/Desktop/論文/generated data/num of nolume")
write.csv(num_of_volume, "MVC_num_of_volume.csv")
