setwd("C:/Users/willy/Desktop/論文/generated data/num of nolume")


# 切到 3/22, 配合疫苗已經打好的 code
num_of_volume_Moderna <- read.csv("Moderna_num_of_volume.csv", header = T)
num_of_volume_Moderna <- num_of_volume_Moderna[81:313, ]   
num_of_volume_Moderna$X <- NULL

Moderna_period_volume <- c()

# 第 1 期：8/23 - 8/29
df_Moderna_volume_period <- num_of_volume_Moderna[155:161, ]
Moderna_period_volume <- c(Moderna_period_volume, sum(df_Moderna_volume_period$negative))

# 第 2 期：8/30 - 9/2
df_Moderna_volume_period <- num_of_volume_Moderna[162:165, ]
Moderna_period_volume <- c(Moderna_period_volume, sum(df_Moderna_volume_period$negative))

# 第 3 期：9/3 - 9/10
df_Moderna_volume_period <- num_of_volume_Moderna[166:173, ]
Moderna_period_volume <- c(Moderna_period_volume, sum(df_Moderna_volume_period$negative))

# 第 4 期：9/11 – 9/14
df_Moderna_volume_period <- num_of_volume_Moderna[174:177, ]
Moderna_period_volume <- c(Moderna_period_volume, sum(df_Moderna_volume_period$negative))

# 第 5 期：9/15 - 9/23
df_Moderna_volume_period <- num_of_volume_Moderna[178:186, ]
Moderna_period_volume <- c(Moderna_period_volume, sum(df_Moderna_volume_period$negative))

# 第 6 期：9/24 - 10/2
df_Moderna_volume_period <- num_of_volume_Moderna[187:195, ]
Moderna_period_volume <- c(Moderna_period_volume, sum(df_Moderna_volume_period$negative))

# 第 7 期：10/3 - 10/5
df_Moderna_volume_period <- num_of_volume_Moderna[196:198, ]
Moderna_period_volume <- c(Moderna_period_volume, sum(df_Moderna_volume_period$negative))

# 第 8 期：10/6 - 10/14
df_Moderna_volume_period <- num_of_volume_Moderna[199:207, ]
Moderna_period_volume <- c(Moderna_period_volume, sum(df_Moderna_volume_period$negative))

# 第 9 期：10/15 - 10/21
df_Moderna_volume_period <- num_of_volume_Moderna[208:214, ]
Moderna_period_volume <- c(Moderna_period_volume, sum(df_Moderna_volume_period$negative))

# 第 10 期：10/22 - 10/28
df_Moderna_volume_period <- num_of_volume_Moderna[215:221, ]
Moderna_period_volume <- c(Moderna_period_volume, sum(df_Moderna_volume_period$negative))

# 第 11 期：10/29 - 11/3
df_Moderna_volume_period <- num_of_volume_Moderna[222:227, ]
Moderna_period_volume <- c(Moderna_period_volume, sum(df_Moderna_volume_period$negative))

# 第 12 期：11/4 - 11/12
df_Moderna_volume_period <- num_of_volume_Moderna[228:233, ]
Moderna_period_volume <- c(Moderna_period_volume, sum(df_Moderna_volume_period$negative))


# ACF
my_acf <- acf(Moderna_period_volume)
my_pacf <- pacf(Moderna_period_volume)

