## Please note: This script will not work in its entirety unless the workspace from the main script is loaded.

library(tidyverse)
library(formattable)


# Activities Table
act <- c("Walking", "Jogging", "Walking on Stairs", "Sitting", "Standing",
                 "Typing", "Brushing Teeth", "Eating Soup", "Eating Chips", "Eating Pasta",
                 "Drinking from Cup", "Eating Sandwich", "Kicking Ball", "Playing Catch", "Dribbling (Basketball)",
                 "Writing", "Clapping", "Folding Clothes")
code <- c("A", "B", "C", "D", "E", "F", "G", "H", "I", "J" ,"K", "L", "M", "O", "P", "Q", "R", "S")

df <- data.frame(Activities = act, Code = code)
formattable(df, align = c("l", "r"))


# Model Table
# Accuracy
acc.pa <- c(cm1.pa$overall[1], cm4.pa$overall[1], cm6.pa$overall[1], Accuracy = NA)
acc.pg <- c(cm2.pg$overall[1], cm3.pg$overall[1], cm6.pg$overall[1], Accuracy = NA)
acc.wa <- c(cm2.wa$overall[1], cm3.wa$overall[1], cm6.wa$overall[1], cm7.wa$overall[1])
acc.wg <- c(cm2.wg$overall[1], cm4.wg$overall[1], cm6.wg$overall[1], cm8.wg$overall[1])

# Kappa
kappa.pa <- c(cm1.pa$overall[2], cm4.pa$overall[2], cm6.pa$overall[2], Kappa = NA)
kappa.pg <- c(cm2.pg$overall[2], cm3.pg$overall[2], cm6.pg$overall[2], Kappa = NA)
kappa.wa <- c(cm2.wa$overall[2], cm3.wa$overall[2], cm6.wa$overall[2], cm7.wa$overall[2])
kappa.wg <- c(cm2.wg$overall[2], cm4.wg$overall[2], cm6.wg$overall[2], cm8.wg$overall[2])

# 95% Confidence Interval
ci.pa <- c(paste0("(", format(round(cm1.pa$overall[3] * 100, 2), nsmall = 2), ", ", format(round(cm1.pa$overall[4] * 100, 2), nsmall = 2), ")"),
           paste0("(", format(round(cm4.pa$overall[3] * 100, 2), nsmall = 2), ", ", format(round(cm4.pa$overall[4] * 100, 2), nsmall = 2), ")"), 
           paste0("(", format(round(cm6.pa$overall[3] * 100, 2), nsmall = 2), ", ", format(round(cm6.pa$overall[4] * 100, 2), nsmall = 2), ")"), 
           NA)
ci.pg <- c(paste0("(", format(round(cm2.pg$overall[3] * 100, 2), nsmall = 2), ", ", format(round(cm2.pg$overall[4] * 100, 2), nsmall = 2), ")"), 
           paste0("(", format(round(cm3.pg$overall[3] * 100, 2), nsmall = 2), ", ", format(round(cm3.pg$overall[4] * 100, 2), nsmall = 2), ")"), 
           paste0("(", format(round(cm6.pg$overall[3] * 100, 2), nsmall = 2), ", ", format(round(cm6.pg$overall[4] * 100, 2), nsmall = 2), ")"), 
           NA)
ci.wa <- c(paste0("(", format(round(cm2.wa$overall[3] * 100, 2), nsmall = 2), ", ", format(round(cm2.wa$overall[4] * 100, 2), nsmall = 2), ")"), 
           paste0("(", format(round(cm3.wa$overall[3] * 100, 2), nsmall = 2), ", ", format(round(cm3.wa$overall[4] * 100, 2), nsmall = 2), ")"), 
           paste0("(", format(round(cm6.wa$overall[3] * 100, 2), nsmall = 2), ", ", format(round(cm6.wa$overall[4] * 100, 2), nsmall = 2), ")"), 
           paste0("(", format(round(cm7.wa$overall[3] * 100, 2), nsmall = 2), ", ", format(round(cm7.wa$overall[4] * 100, 2), nsmall = 2), ")"))
ci.wg <- c(paste0("(", format(round(cm2.wg$overall[3] * 100, 2), nsmall = 2), ", ", format(round(cm2.wg$overall[4] * 100, 2), nsmall = 2), ")"), 
           paste0("(", format(round(cm4.wg$overall[3] * 100, 2), nsmall = 2), ", ", format(round(cm4.wg$overall[4] * 100, 2), nsmall = 2), ")"), 
           paste0("(", format(round(cm6.wg$overall[3] * 100, 2), nsmall = 2), ", ", format(round(cm6.wg$overall[4] * 100, 2), nsmall = 2), ")"), 
           paste0("(", format(round(cm8.wg$overall[3] * 100, 2), nsmall = 2), ", ", format(round(cm8.wg$overall[4] * 100, 2), nsmall = 2), ")")) 

df2 <- data.frame(Accuracy = c(acc.pa, acc.pg, acc.wa, acc.wg),
                  Kappa = c(kappa.pa, kappa.pg, kappa.wa, kappa.wg),
                  ci = c(ci.pa, ci.pg, ci.wa, ci.wg))
colnames(df2) <- c("Accuracy", "Kappa", "95% Confidence Interval")
rownames(df2) <- c("RF1 - pa", "RF2 - pa", "RF3 - pa", "RF4 - pa",
                   "RF1 - pg", "RF2 - pg", "RF3 - pg", "RF4 - pg",
                   "RF1 - wa", "RF2 - wa", "RF3 - wa", "RF4 - wa",
                   "RF1 - wg", "RF2 - wg", "RF3 - wg", "RF4 - wg")
df2$Accuracy <- round(df2$Accuracy * 100, 2)
df2$Kappa <- round(df2$Kappa, 2)


formattable(df2,  align = c("c","c","c","c"), list(formatter("span", style = ~ style(color = "grey",font.weight = "bold"))))

# Table 3
df3 <- as.data.frame(cm1.pa$byClass[, 5:7])
formattable(df3,  align = c("c","c","c"), list(formatter("span", style = ~ style(color = "grey",font.weight = "bold"))))

