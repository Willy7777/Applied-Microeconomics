library(tidyverse)
library(openxlsx)
library(readxl)

setwd("C:/Users/willy/Desktop/論文/CDC data")


# 各疫苗每日施打量
daily_injection_df <- read.xlsx("各疫苗每日接種人數.xlsx", detectDates = TRUE)


# 把自訂的 17 期施打量，放入一個 vector
AZ_period_injection <- c()
Moderna_period_injection <- c()
BNT_period_injection <- c()
MVC_period_injection <- c()

# 第 1 期：8/23 - 8/29
df_injection_period <- daily_injection_df[155:161, ]

AZ_period_injection <- c(AZ_period_injection, sum(df_injection_period$AZ))
Moderna_period_injection <- c(Moderna_period_injection, sum(df_injection_period$Moderna))
BNT_period_injection <- c(BNT_period_injection, sum(df_injection_period$BioNTech))
MVC_period_injection <- c(MVC_period_injection, sum(df_injection_period$Medigen))

# 第 2 期：8/30 - 9/2
df_injection_period <- daily_injection_df[162:165, ]

AZ_period_injection <- c(AZ_period_injection, sum(df_injection_period$AZ))
Moderna_period_injection <- c(Moderna_period_injection, sum(df_injection_period$Moderna))
BNT_period_injection <- c(BNT_period_injection, sum(df_injection_period$BioNTech))
MVC_period_injection <- c(MVC_period_injection, sum(df_injection_period$Medigen))

# 第 3 期：9/3 - 9/10
df_injection_period <- daily_injection_df[166:173, ]

AZ_period_injection <- c(AZ_period_injection, sum(df_injection_period$AZ))
Moderna_period_injection <- c(Moderna_period_injection, sum(df_injection_period$Moderna))
BNT_period_injection <- c(BNT_period_injection, sum(df_injection_period$BioNTech))
MVC_period_injection <- c(MVC_period_injection, sum(df_injection_period$Medigen))

# 第 4 期：9/11 – 9/14
df_injection_period <- daily_injection_df[174:177, ]

AZ_period_injection <- c(AZ_period_injection, sum(df_injection_period$AZ))
Moderna_period_injection <- c(Moderna_period_injection, sum(df_injection_period$Moderna))
BNT_period_injection <- c(BNT_period_injection, sum(df_injection_period$BioNTech))
MVC_period_injection <- c(MVC_period_injection, sum(df_injection_period$Medigen))

# 第 5 期：9/15 - 9/23
df_injection_period <- daily_injection_df[178:186, ]

AZ_period_injection <- c(AZ_period_injection, sum(df_injection_period$AZ))
Moderna_period_injection <- c(Moderna_period_injection, sum(df_injection_period$Moderna))
BNT_period_injection <- c(BNT_period_injection, sum(df_injection_period$BioNTech))
MVC_period_injection <- c(MVC_period_injection, sum(df_injection_period$Medigen))

# 第 6 期：9/24 - 10/2
df_injection_period <- daily_injection_df[187:195, ]

AZ_period_injection <- c(AZ_period_injection, sum(df_injection_period$AZ))
Moderna_period_injection <- c(Moderna_period_injection, sum(df_injection_period$Moderna))
BNT_period_injection <- c(BNT_period_injection, sum(df_injection_period$BioNTech))
MVC_period_injection <- c(MVC_period_injection, sum(df_injection_period$Medigen))

# 第 7 期：10/3 - 10/5
df_injection_period <- daily_injection_df[196:198, ]

AZ_period_injection <- c(AZ_period_injection, sum(df_injection_period$AZ))
Moderna_period_injection <- c(Moderna_period_injection, sum(df_injection_period$Moderna))
BNT_period_injection <- c(BNT_period_injection, sum(df_injection_period$BioNTech))
MVC_period_injection <- c(MVC_period_injection, sum(df_injection_period$Medigen))

# 第 8 期：10/6 - 10/14
df_injection_period <- daily_injection_df[199:207, ]

AZ_period_injection <- c(AZ_period_injection, sum(df_injection_period$AZ))
Moderna_period_injection <- c(Moderna_period_injection, sum(df_injection_period$Moderna))
BNT_period_injection <- c(BNT_period_injection, sum(df_injection_period$BioNTech))
MVC_period_injection <- c(MVC_period_injection, sum(df_injection_period$Medigen))

# 第 9 期：10/15 - 10/21
df_injection_period <- daily_injection_df[208:214, ]

AZ_period_injection <- c(AZ_period_injection, sum(df_injection_period$AZ))
Moderna_period_injection <- c(Moderna_period_injection, sum(df_injection_period$Moderna))
BNT_period_injection <- c(BNT_period_injection, sum(df_injection_period$BioNTech))
MVC_period_injection <- c(MVC_period_injection, sum(df_injection_period$Medigen))

# 第 10 期：10/22 - 10/28
df_injection_period <- daily_injection_df[215:221, ]

AZ_period_injection <- c(AZ_period_injection, sum(df_injection_period$AZ))
Moderna_period_injection <- c(Moderna_period_injection, sum(df_injection_period$Moderna))
BNT_period_injection <- c(BNT_period_injection, sum(df_injection_period$BioNTech))
MVC_period_injection <- c(MVC_period_injection, sum(df_injection_period$Medigen))

# 第 11 期：10/29 - 11/3
df_injection_period <- daily_injection_df[222:227, ]

AZ_period_injection <- c(AZ_period_injection, sum(df_injection_period$AZ))
Moderna_period_injection <- c(Moderna_period_injection, sum(df_injection_period$Moderna))
BNT_period_injection <- c(BNT_period_injection, sum(df_injection_period$BioNTech))
MVC_period_injection <- c(MVC_period_injection, sum(df_injection_period$Medigen))

# 第 12 期：11/4 - 11/12
df_injection_period <- daily_injection_df[228:236, ]

AZ_period_injection <- c(AZ_period_injection, sum(df_injection_period$AZ))
Moderna_period_injection <- c(Moderna_period_injection, sum(df_injection_period$Moderna))
BNT_period_injection <- c(BNT_period_injection, sum(df_injection_period$BioNTech))
MVC_period_injection <- c(MVC_period_injection, sum(df_injection_period$Medigen))

# 第 13 期：11/13 - 11/24
df_injection_period <- daily_injection_df[237:248, ]

AZ_period_injection <- c(AZ_period_injection, sum(df_injection_period$AZ))
Moderna_period_injection <- c(Moderna_period_injection, sum(df_injection_period$Moderna))
BNT_period_injection <- c(BNT_period_injection, sum(df_injection_period$BioNTech))
MVC_period_injection <- c(MVC_period_injection, sum(df_injection_period$Medigen))

# 第 14 期：11/25 -12/1
df_injection_period <- daily_injection_df[249:255, ]

AZ_period_injection <- c(AZ_period_injection, sum(df_injection_period$AZ))
Moderna_period_injection <- c(Moderna_period_injection, sum(df_injection_period$Moderna))
BNT_period_injection <- c(BNT_period_injection, sum(df_injection_period$BioNTech))
MVC_period_injection <- c(MVC_period_injection, sum(df_injection_period$Medigen))

# 第 15 期：12/2 - 12/8
df_injection_period <- daily_injection_df[256:262, ]

AZ_period_injection <- c(AZ_period_injection, sum(df_injection_period$AZ))
Moderna_period_injection <- c(Moderna_period_injection, sum(df_injection_period$Moderna))
BNT_period_injection <- c(BNT_period_injection, sum(df_injection_period$BioNTech))
MVC_period_injection <- c(MVC_period_injection, sum(df_injection_period$Medigen))

# 第 16 期：12/9 - 12/15
df_injection_period <- daily_injection_df[263:269, ]

AZ_period_injection <- c(AZ_period_injection, sum(df_injection_period$AZ))
Moderna_period_injection <- c(Moderna_period_injection, sum(df_injection_period$Moderna))
BNT_period_injection <- c(BNT_period_injection, sum(df_injection_period$BioNTech))
MVC_period_injection <- c(MVC_period_injection, sum(df_injection_period$Medigen))

# 第 17 期：12/16 - 12/22
df_injection_period <- daily_injection_df[270:276, ]

AZ_period_injection <- c(AZ_period_injection, sum(df_injection_period$AZ))
Moderna_period_injection <- c(Moderna_period_injection, sum(df_injection_period$Moderna))
BNT_period_injection <- c(BNT_period_injection, sum(df_injection_period$BioNTech))
MVC_period_injection <- c(MVC_period_injection, sum(df_injection_period$Medigen))


plot(BNT_period_injection, type = "l", col = "red", xlab = "period", ylab = "injection")
  lines(Moderna_period_injection, type = "l", col = "blue")
  lines(AZ_period_injection, type = "l", col = "black")
  lines(MVC_period_injection, type = "l", col = "green")
  legend("topright", legend=c("AZ", "Moderna", "BNT", "Medigen"),
       col=c("black", "blue", "red", "green"), lty=c(1, 1, 1, 1), cex=0.4)
  title(main = "2021")
  
  
# 輸出四種種疫苗 17 期的施打量
vaccine_17_period <- data.frame("period" = seq(1, 17),
                                "AZ" = AZ_period_injection,
                                "MVC" = MVC_period_injection,
                                "Moderna" = Moderna_period_injection,
                                "BNT" = BNT_period_injection)


setwd("C:/Users/willy/Desktop/論文/generated data")
write.csv(vaccine_17_period, "vaccine_injection_17_periods.csv", row.names = F)








