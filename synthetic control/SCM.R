library(SCtools)
library(Synth)

# loading data
setwd("C:/Users/willy/Desktop/論文/generated data/12 periods volume")
AZ_volume_12_periods <- read.csv("AZ_volume_12_periods.csv", header = T)
BNT_volume_12_periods <- read.csv("BNT_volume_12_periods.csv", header = T)
Moderna_volume_12_periods <- read.csv("Moderna_volume_12_periods.csv", header = T)
MVC_volume_12_periods <- read.csv("MVC_volume_12_periods.csv", header = T)


setwd("C:/Users/willy/Desktop/論文/generated data")
vaccine_injection_17_periods <- read.csv("vaccine_injection_17_periods.csv", header = T)


# foo (synthetic data frame)
# unit_num : AZ = 1, BNT = 2, Moderna = 3, MVC = 4

# AZ
AZ_volume_12_periods$name <- rep("AZ", 12)
AZ_volume_12_periods$unit_num <- rep(1, 12)
AZ_volume_12_periods$injection <- vaccine_injection_17_periods$AZ[1:12]

# BNT
BNT_volume_12_periods$name <- rep("BNT", 12)
BNT_volume_12_periods$unit_num <- rep(2, 12)
BNT_volume_12_periods$injection <- vaccine_injection_17_periods$BNT[1:12]

# Moderna
Moderna_volume_12_periods$name <- rep("Moderna", 12)
Moderna_volume_12_periods$unit_num <- rep(3, 12)
Moderna_volume_12_periods$injection <- vaccine_injection_17_periods$Moderna[1:12]

# MVC
MVC_volume_12_periods$name <- rep("MVC", 12)
MVC_volume_12_periods$unit_num <- rep(4, 12)
MVC_volume_12_periods$injection <- vaccine_injection_17_periods$MVC[1:12]

# BNT 9/22 才開始施打，故 9/22 以前的補登資料改成 0
# 1 ~ 4 期直接設為 0，第五期扣掉 4 (9/15 ~ 9/21)
BNT_volume_12_periods[1, 7] <- 0
BNT_volume_12_periods[2, 7] <- 0
BNT_volume_12_periods[3, 7] <- 0
BNT_volume_12_periods[4, 7] <- 0
BNT_volume_12_periods[5, 7] <- 125992

# rbind
df_synth <- rbind(AZ_volume_12_periods, BNT_volume_12_periods,
                  Moderna_volume_12_periods, MVC_volume_12_periods)

df_synth <- df_synth[, c("name", "period", "injection",
                         "negative", "positive", "neutral", "unit_num")]

write.csv(df_synth,"C:/Users/willy/Desktop/論文/synthetic control/df_synth.csv")

# synthetic control method(實驗組Moderna)
dataprep.out<-
  dataprep(
    foo = df_synth,   # data
    predictors = c("negative", "positive", "neutral"),   # 非落後期之變數
    predictors.op = "mean",   # 對變數執行的函數
    dependent = "injection",   # dependent variable
    unit.variable = "unit_num",   # 疫苗編號
    time.variable = "period",   # 施打區間
    special.predictors = list(   # 落後期變數, periods: 1、2、3、4、5
      list("injection", 1, "mean"),
      list("injection", 2, "mean"),
      list("injection", 3, "mean"),
      list("injection", 4, "mean"),
      list("injection", 5, "mean")
    ),
    treatment.identifier = 3,   # Moderna unit_num
    controls.identifier = c(2,4),    # 對照組 unit_num
    time.predictors.prior = c(1:5),   # 對 predictors 執行函數 mean 的期間
    time.optimize.ssr = c(1:5),   # 極小化 MSPE 的期間
    unit.names.variable = "name",   # 疫苗名稱
    time.plot = c(1:6)   # 要畫圖之期間
  )


synth.out <- synth(dataprep.out)


Moderna_plot <- path.plot(dataprep.res = dataprep.out, synth.res = synth.out, tr.intake = 5,
          Ylab = "injection", Xlab = "period",
          Main = "Moderna Injection vs. synthetic Moderna Injection",
          Legend.position = "topleft", Legend = c("Moderna", "Synthetic Moderna"))


Moderna_gap_plot <- gaps.plot(dataprep.res = dataprep.out, synth.res = synth.out, tr.intake = 5,
          Ylab = "gap in Vaccine Injection", Xlab = "period",
          Main = "gap in Injection between Moderna and synthetic Moderna")


synth.tables <- synth.tab(dataprep.res = dataprep.out, synth.res = synth.out)
tab.pred <- synth.tables$tab.pred
tab.w <- synth.tables$tab.w
tab.v <- synth.tables$tab.v

# synthetic control method(實驗組MVC)
dataprep.out<-
  dataprep(
    foo = df_synth,   # data
    predictors = c("negative", "positive", "neutral"),   # 非落後期之變數
    predictors.op = "mean",   # 對變數執行的函數
    dependent = "injection",   # dependent variable
    unit.variable = "unit_num",   # 疫苗編號
    time.variable = "period",   # 施打區間
    special.predictors = list(   # 落後期變數, periods: 1、2、3、4、5
      list("injection", 1, "mean"),
      list("injection", 2, "mean"),
      list("injection", 3, "mean"),
      list("injection", 4, "mean"),
      list("injection", 5, "mean")
    ),
    treatment.identifier = 4,   # Moderna unit_num
    controls.identifier = c(2,3),    # 對照組 unit_num
    time.predictors.prior = c(1:5),   # 對 predictors 執行函數 mean 的期間
    time.optimize.ssr = c(1:5),   # 極小化 MSPE 的期間
    unit.names.variable = "name",   # 疫苗名稱
    time.plot = c(1:6)   # 要畫圖之期間
  )


synth.out <- synth(dataprep.out)




MVC_gap_plot <- gaps.plot(dataprep.res = dataprep.out, synth.res = synth.out, tr.intake = 5,
          Ylab = "gap in Vaccine Injection", Xlab = "period",
          Main = "gap in Injection between MVC and synthetic MVC")


synth.tables <- synth.tab(dataprep.res = dataprep.out, synth.res = synth.out)
tab.pred <- synth.tables$tab.pred
tab.w <- synth.tables$tab.w
tab.v <- synth.tables$tab.v


# synthetic control method(實驗組BNT)
dataprep.out<-
  dataprep(
    foo = df_synth,   # data
    predictors = c("negative", "positive", "neutral"),   # 非落後期之變數
    predictors.op = "mean",   # 對變數執行的函數
    dependent = "injection",   # dependent variable
    unit.variable = "unit_num",   # 疫苗編號
    time.variable = "period",   # 施打區間
    special.predictors = list(   # 落後期變數, periods: 1、2、3、4、5
      list("injection", 1, "mean"),
      list("injection", 2, "mean"),
      list("injection", 3, "mean"),
      list("injection", 4, "mean"),
      list("injection", 5, "mean")
    ),
    treatment.identifier = 2,   # Moderna unit_num
    controls.identifier = c(3,4),    # 對照組 unit_num
    time.predictors.prior = c(1:5),   # 對 predictors 執行函數 mean 的期間
    time.optimize.ssr = c(1:5),   # 極小化 MSPE 的期間
    unit.names.variable = "name",   # 疫苗名稱
    time.plot = c(1:6)   # 要畫圖之期間
  )


synth.out <- synth(dataprep.out)



BNT_gap_plot <- gaps.plot(dataprep.res = dataprep.out, synth.res = synth.out, tr.intake = 5,
          Ylab = "gap in Vaccine Injection", Xlab = "period",
          Main = "gap in Injection between BNT and synthetic BNT")


synth.tables <- synth.tab(dataprep.res = dataprep.out, synth.res = synth.out)
tab.pred <- synth.tables$tab.pred
tab.w <- synth.tables$tab.w
tab.v <- synth.tables$tab.v






placebos <- generate.placebos(dataprep.out, synth.out,strategy = "sequential")

# MSPE 20 times higher than Taiwan
plot_placebos(placebos, xlab = "period")


ratio <- mspe.test(placebos)
ratio$p.val
MSPE.ratio <- ratio$test


mspe.plot(placebos)
