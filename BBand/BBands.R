library(tidyverse)
library(openxlsx)
library(readxl)
library(tseries)
library(forecast)
library(ggplot2)
library(quantmod)
library(TTR)

setwd("C:/Users/willy/Desktop/論文/generated data/num of nolume")


################### 總聲量 EMA #######################

# 自訂期間 17 期, 0 為了配合 EMA 前六天, 1 代表第一期, 以此類推
period <- c(rep(0, 6), rep(1, 7), rep(2, 4), rep(3, 8), rep(4, 4),
            rep(5, 9), rep(6, 9), rep(7, 3), rep(8, 9),
            rep(9, 7), rep(10, 7), rep(11, 6), rep(12, 6))


num_of_volume_Moderna <- read.csv("Moderna_num_of_volume.csv", header = T)
num_of_volume_Moderna <- num_of_volume_Moderna[229:313, ]
num_of_volume_Moderna$period <- period
num_of_volume_Moderna$X <- NULL


# 轉成 xts
num_of_volume_Moderna <- as.xts(read.zoo(num_of_volume_Moderna))



################## negative ##################
################## Moderna ##################

chartSeries(num_of_volume_Moderna[, 2], theme = "white" , name = "negative")
addBBands(n = 7, sd = 1.96, maType = "EMA")   # 95 %
addEMA(n = 7, col = "blue")


# BBands's up and down
bb <- BBands(num_of_volume_Moderna[, 2], sd = 1.96, n = 7, maType = "EMA")
bb$negative <- num_of_volume_Moderna$negative
bb$over_bb_up <- 0
bb$over_bb_dn <- 0

for (i in 7:length(bb$negative)) {
  if (bb$negative[[i]] > bb$up[[i]]) {
    bb$over_bb_up[[i]] <- 1
  } else if (bb$negative[[i]] < bb$dn[[i]]) {
    bb$over_bb_dn[[i]] <- 1
  }
}

bb$period <- num_of_volume_Moderna[, 4]

addTA(bb$over_bb_up, col = "brown", type = "h")
addTA(bb$over_bb_dn, col = "orange", type = "h")


# write out bb
temp <- as.data.frame(bb)
setwd("C:/Users/willy/Desktop/論文/output figures/BBand")
write.csv(temp, "Moderna_BBands_numerical.csv")
rm(temp)

