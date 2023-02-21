setwd("C:/Users/willy/Desktop/論文/generated data/12 periods volume")


AZ_volume_12_periods <- read.csv("AZ_volume_12_periods.csv", header = T)
BNT_volume_12_periods <- read.csv("BNT_volume_12_periods.csv", header = T)
Moderna_volume_12_periods <- read.csv("Moderna_volume_12_periods.csv", header = T)
MVC_volume_12_periods <- read.csv("MVC_volume_12_periods.csv", header = T)


# MVC
plot(MVC_volume_12_periods$neutral, type = "l", col = "red", xlab = "period", ylab = "volume")
  lines(MVC_volume_12_periods$negative, type = "l", col = "blue")
  lines(MVC_volume_12_periods$positive, type = "l", col = "black")
  legend("topright", legend=c("positive", "negative", "neutral"),
       col=c("black", "blue", "red"), lty=c(1, 1, 1, 1), cex=0.5)
  title(main = "2021 MVC volume of 12 periods")
  

# Moderna
plot(Moderna_volume_12_periods$neutral, type = "l", col = "red", xlab = "period", ylab = "volume",
     ylim = c(0, 80000))
  lines(Moderna_volume_12_periods$negative, type = "l", col = "blue")
  lines(Moderna_volume_12_periods$positive, type = "l", col = "black")
  legend("topright", legend=c("positive", "negative", "neutral"),
         col=c("black", "blue", "red"), lty=c(1, 1, 1, 1),pt.cex = 1)
  title(main = "2021 Moderna volume of 12 periods")
  

# AZ
plot(AZ_volume_12_periods$neutral, type = "l", col = "red", xlab = "period", ylab = "volume",
     ylim = c(0, 55000))
  lines(AZ_volume_12_periods$negative, type = "l", col = "blue")
  lines(AZ_volume_12_periods$positive, type = "l", col = "black")
  legend("topright", legend=c("positive", "negative", "neutral"),
         col=c("black", "blue", "red"), lty=c(1, 1, 1, 1), cex=0.5)
  title(main = "2021 AZ volume of 12 periods")
  
  
# BNT
plot(BNT_volume_12_periods$neutral, type = "l", col = "red", xlab = "period", ylab = "volume",
     ylim = c(0, 50000))
  lines(BNT_volume_12_periods$negative, type = "l", col = "blue")
  lines(BNT_volume_12_periods$positive, type = "l", col = "black")
  legend("topright", legend=c("positive", "negative", "neutral"),
         col=c("black", "blue", "red"), lty=c(1, 1, 1, 1), cex=0.5)
  title(main = "2021 BNT volume of 12 periods")
  
  
