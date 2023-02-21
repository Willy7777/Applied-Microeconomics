setwd("C:/Users/willy/Desktop/論文/generated data/num of nolume")


# 切到 3/22, 配合疫苗已經寫好的 code
num_of_volume_MVC <- read.csv("MVC_num_of_volume.csv", header = T)
num_of_volume_MVC <- num_of_volume_MVC[81:313, ]   
num_of_volume_MVC$X <- NULL

num_of_volume_AZ <- read.csv("AZ_num_of_volume.csv", header = T)
num_of_volume_AZ <- num_of_volume_AZ[80:312, ]   
num_of_volume_AZ$X <- NULL

num_of_volume_BNT <- read.csv("BNT_num_of_volume.csv", header = T)
num_of_volume_BNT <- num_of_volume_BNT[80:312, ]   
num_of_volume_BNT$X <- NULL

num_of_volume_Moderna <- read.csv("Moderna_num_of_volume.csv", header = T)
num_of_volume_Moderna <- num_of_volume_Moderna[81:313, ]   
num_of_volume_Moderna$X <- NULL


# 把 4 個疫苗的 df 放到一個 list 裡面
num_of_volume_vaccine <- list()
num_of_volume_vaccine[[1]] <- num_of_volume_MVC
num_of_volume_vaccine[[2]] <- num_of_volume_AZ
num_of_volume_vaccine[[3]] <- num_of_volume_BNT
num_of_volume_vaccine[[4]] <- num_of_volume_Moderna


# 創造一個 list, 放四種疫苗的正、負、中立聲量
negative_period_volume <- list(c(0), c(0), c(0), c(0))
positive_period_volume <- list(c(0), c(0), c(0), c(0))
neutral_period_volume <- list(c(0), c(0), c(0), c(0))


for (i in 1:4) {
  
  # 第 1 期：8/23 - 8/29
  df <- num_of_volume_vaccine[[i]][155:161, ]
  negative_period_volume[[i]] <- c(negative_period_volume[[i]], sum(df$negative))
  positive_period_volume[[i]] <- c(positive_period_volume[[i]], sum(df$positive))
  neutral_period_volume[[i]] <- c(neutral_period_volume[[i]], sum(df$neutral))
  
  
  # 第 2 期：8/30 - 9/2
  df <- num_of_volume_vaccine[[i]][162:165, ]
  negative_period_volume[[i]] <- c(negative_period_volume[[i]], sum(df$negative))
  positive_period_volume[[i]] <- c(positive_period_volume[[i]], sum(df$positive))
  neutral_period_volume[[i]] <- c(neutral_period_volume[[i]], sum(df$neutral))
  
  # 第 3 期：9/3 - 9/10
  df <- num_of_volume_vaccine[[i]][166:173, ]
  negative_period_volume[[i]] <- c(negative_period_volume[[i]], sum(df$negative))
  positive_period_volume[[i]] <- c(positive_period_volume[[i]], sum(df$positive))
  neutral_period_volume[[i]] <- c(neutral_period_volume[[i]], sum(df$neutral))
  
  # 第 4 期：9/11 – 9/14
  df <- num_of_volume_vaccine[[i]][174:177, ]
  negative_period_volume[[i]] <- c(negative_period_volume[[i]], sum(df$negative))
  positive_period_volume[[i]] <- c(positive_period_volume[[i]], sum(df$positive))
  neutral_period_volume[[i]] <- c(neutral_period_volume[[i]], sum(df$neutral))
  
  # 第 5 期：9/15 - 9/23
  df <- num_of_volume_vaccine[[i]][178:186, ]
  negative_period_volume[[i]] <- c(negative_period_volume[[i]], sum(df$negative))
  positive_period_volume[[i]] <- c(positive_period_volume[[i]], sum(df$positive))
  neutral_period_volume[[i]] <- c(neutral_period_volume[[i]], sum(df$neutral))
  
  # 第 6 期：9/24 - 10/2
  df <- num_of_volume_vaccine[[i]][187:195, ]
  negative_period_volume[[i]] <- c(negative_period_volume[[i]], sum(df$negative))
  positive_period_volume[[i]] <- c(positive_period_volume[[i]], sum(df$positive))
  neutral_period_volume[[i]] <- c(neutral_period_volume[[i]], sum(df$neutral))
  
  # 第 7 期：10/3 - 10/5
  df <- num_of_volume_vaccine[[i]][196:198, ]
  negative_period_volume[[i]] <- c(negative_period_volume[[i]], sum(df$negative))
  positive_period_volume[[i]] <- c(positive_period_volume[[i]], sum(df$positive))
  neutral_period_volume[[i]] <- c(neutral_period_volume[[i]], sum(df$neutral))
  
  # 第 8 期：10/6 - 10/14
  df <- num_of_volume_vaccine[[i]][199:207, ]
  negative_period_volume[[i]] <- c(negative_period_volume[[i]], sum(df$negative))
  positive_period_volume[[i]] <- c(positive_period_volume[[i]], sum(df$positive))
  neutral_period_volume[[i]] <- c(neutral_period_volume[[i]], sum(df$neutral))
  
  # 第 9 期：10/15 - 10/21
  df <- num_of_volume_vaccine[[i]][208:214, ]
  negative_period_volume[[i]] <- c(negative_period_volume[[i]], sum(df$negative))
  positive_period_volume[[i]] <- c(positive_period_volume[[i]], sum(df$positive))
  neutral_period_volume[[i]] <- c(neutral_period_volume[[i]], sum(df$neutral))
  
  # 第 10 期：10/22 - 10/28
  df <- num_of_volume_vaccine[[i]][215:221, ]
  negative_period_volume[[i]] <- c(negative_period_volume[[i]], sum(df$negative))
  positive_period_volume[[i]] <- c(positive_period_volume[[i]], sum(df$positive))
  neutral_period_volume[[i]] <- c(neutral_period_volume[[i]], sum(df$neutral))
  
  # 第 11 期：10/29 - 11/3
  df <- num_of_volume_vaccine[[i]][222:227, ]
  negative_period_volume[[i]] <- c(negative_period_volume[[i]], sum(df$negative))
  positive_period_volume[[i]] <- c(positive_period_volume[[i]], sum(df$positive))
  neutral_period_volume[[i]] <- c(neutral_period_volume[[i]], sum(df$neutral))
  
  # 第 12 期：11/4 - 11/9
  df <- num_of_volume_vaccine[[i]][228:233, ]
  negative_period_volume[[i]] <- c(negative_period_volume[[i]], sum(df$negative))
  positive_period_volume[[i]] <- c(positive_period_volume[[i]], sum(df$positive))
  neutral_period_volume[[i]] <- c(neutral_period_volume[[i]], sum(df$neutral))
}



# index 順序：MVC,AZ, BNT, Moderna
# negative[2:13], 因 index 1 為補值的 0

setwd("C:/Users/willy/Desktop/論文/generated data/12 periods volume")

# MVC
MVC_negative_period_volume <- negative_period_volume[[1]][2:13]
MVC_positive_period_volume <- positive_period_volume[[1]][2:13]
MVC_neutral_period_volume <- neutral_period_volume[[1]][2:13]


df <- data.frame("period" = seq(1, 12),
                 "positive" = MVC_positive_period_volume,
                 "negative" = MVC_negative_period_volume,
                 "neutral" = MVC_neutral_period_volume)

write.csv(df, "MVC_volume_12_periods.csv", row.names = F)


# AZ
AZ_negative_period_volume <- negative_period_volume[[2]][2:13]
AZ_positive_period_volume <- positive_period_volume[[2]][2:13]
AZ_neutral_period_volume <- neutral_period_volume[[2]][2:13]


df <- data.frame("period" = seq(1, 12),
                 "positive" = AZ_positive_period_volume,
                 "negative" = AZ_negative_period_volume,
                 "neutral" = AZ_neutral_period_volume)

write.csv(df, "AZ_volume_12_periods.csv", row.names = F)


# BNT
BNT_negative_period_volume <- negative_period_volume[[3]][2:13]
BNT_positive_period_volume <- positive_period_volume[[3]][2:13]
BNT_neutral_period_volume <- neutral_period_volume[[3]][2:13]


df <- data.frame("period" = seq(1, 12),
                 "positive" = BNT_positive_period_volume,
                 "negative" = BNT_negative_period_volume,
                 "neutral" = BNT_neutral_period_volume)

write.csv(df, "BNT_volume_12_periods.csv", row.names = F)


# Moderna
Moderna_negative_period_volume <- negative_period_volume[[4]][2:13]
Moderna_positive_period_volume <- positive_period_volume[[4]][2:13]
Moderna_neutral_period_volume <- neutral_period_volume[[4]][2:13]


df <- data.frame("period" = seq(1, 12),
                 "positive" = Moderna_positive_period_volume,
                 "negative" = Moderna_negative_period_volume,
                 "neutral" = Moderna_neutral_period_volume)

write.csv(df, "Moderna_volume_12_periods.csv", row.names = F)
