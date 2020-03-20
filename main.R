## Nicholas Gurnard
## Final Project Machine Learning MAE195
## Descriptions of each data frame:
# pa, pg, wa, wg are the data frames with the timestamps converted to seconds
# pa2, pg2, wa2, wg2 are the data frames with 20Hz as absolute truth

# packages ----------------------------------------------------------------


# NOTE: Can check where packages are with .libPaths()
library(tidyverse)
library(plotly)
library(ggthemes)
library(caTools)
library(caret)
library(e1071)
library(randomForest)
library(MASS)
library(farff)
library(zoo)
library(corrplot)
library(GGally)
library(gridExtra)



# Created Functions -------------------------------------------------------

# Finding the peaks. Credit here: https://github.com/stas-g/findPeaks
find_peaks <- function (x, m = 3){ 
  shape <- diff(sign(diff(x, na.pad = FALSE)))
  pks <- sapply(which(shape < 0), FUN = function(i){
    z <- i - m + 1
    z <- ifelse(z > 0, z, 1)
    w <- i + m + 1
    w <- ifelse(w < length(x), w, length(x))
    if(all(x[c(z : i, (i + 2) : w)] <= x[i + 1])) return(i + 1) else return(numeric(0))
  })
  pks <- unlist(pks)
  pks
}

# Moving Average
mult.cols = function(x) rollmean(x, k = 10, fill = NA, align = "right")



# data import -------------------------------------------------------------


## Set the working directory to the place where you are reading the data in from and then import desired data
setwd("Example_Directory")

# Desktop
phoneacc_files <- list.files(path = "wisdm-dataset/wisdm-dataset/raw/phone/accel", pattern = "*.txt", full.names = TRUE) 
phoneacc_df <- ldply(phoneacc_files, read.table, sep = ",", header = FALSE, stringsAsFactors = FALSE)

phonegyro_files <- list.files(path = "wisdm-dataset/wisdm-dataset/raw/phone/gyro", pattern = "*.txt", full.names = TRUE) 
phonegyro_df <- ldply(phonegyro_files, read.table, sep = ",", header = FALSE, stringsAsFactors = FALSE)

watchacc_files <- list.files(path = "wisdm-dataset/wisdm-dataset/raw/watch/accel", pattern = "*.txt", full.names = TRUE) 
watchacc_df <- ldply(watchacc_files, read.table, sep = ",", header = FALSE, stringsAsFactors = FALSE)

watchgyro_files <- list.files(path = "wisdm-dataset/wisdm-dataset/raw/watch/gyro", pattern = "*.txt", full.names = TRUE) 
watchgyro_df <- ldply(watchgyro_files, read.table, sep = ",", header = FALSE, stringsAsFactors = FALSE)

# Laptop
phoneacc_files <- list.files(path = "wisdm-dataset/raw/phone/accel", pattern = "*.txt", full.names = TRUE) 
phoneacc_df <- ldply(phoneacc_files, read.table, sep = ",", header = FALSE, stringsAsFactors = FALSE)

phonegyro_files <- list.files(path = "wisdm-dataset/raw/phone/gyro", pattern = "*.txt", full.names = TRUE) 
phonegyro_df <- ldply(phonegyro_files, read.table, sep = ",", header = FALSE, stringsAsFactors = FALSE)

watchacc_files <- list.files(path = "wisdm-dataset/raw/watch/accel", pattern = "*.txt", full.names = TRUE) 
watchacc_df <- ldply(watchacc_files, read.table, sep = ",", header = FALSE, stringsAsFactors = FALSE)

watchgyro_files <- list.files(path = "wisdm-dataset/raw/watch/gyro", pattern = "*.txt", full.names = TRUE) 
watchgyro_df <- ldply(watchgyro_files, read.table, sep = ",", header = FALSE, stringsAsFactors = FALSE)




# data cleaning -----------------------------------------------------------


## Rename the columns. NOTE: The timestamp is in ms from r epoch time
colnames(phoneacc_df) <- c("subject-id", "activity label", "timestamp", "x", "y", "z")

colnames(phonegyro_df) <- c("subject-id", "activity label", "timestamp", "x", "y", "z")

colnames(watchacc_df) <- c("subject-id", "activity label", "timestamp", "x", "y", "z")

colnames(watchgyro_df) <- c("subject-id", "activity label", "timestamp", "x", "y", "z")


## Need to remove the semicolon in the z column of each data frame
phoneacc_df <- phoneacc_df %>% separate(z, c("z", "trash"), sep = ";")
phoneacc_df <- phoneacc_df[, -7]

phonegyro_df <- phonegyro_df %>% separate(z, c("z", "trash"), sep = ";")
phonegyro_df <- phonegyro_df[, -7]

watchacc_df <- watchacc_df %>% separate(z, c("z", "trash"), sep = ";")
watchacc_df <- watchacc_df[, -7]

watchgyro_df <- watchgyro_df %>% separate(z, c("z", "trash"), sep = ";")
watchgyro_df <- watchgyro_df[, -7]




# create data frames ------------------------------------------------------


## Make the csv into an RDS to save time and memory
saveRDS(phoneacc_df, "phone_accel.rds")
saveRDS(phonegyro_df, "phone_gyro.rds")
saveRDS(watchacc_df, "watch_accel.rds")
saveRDS(watchgyro_df, "watch_gyro.rds")

pa <- readRDS("phone_accel.rds")
pg <- readRDS("phone_gyro.rds")
wa <- readRDS("watch_accel.rds")
wg <- readRDS("watch_gyro.rds")


## Check if there is any NA values in the data
any(is.na(pa)) # False

any(is.na(pg)) # False

any(is.na(wa)) # False

any(is.na(wg)) # False


## Make each activity stary at time 0 and convert it to seconds (we know it is 50ms btw times because the readings are at 20Hz)
# Note: The documentation says UNIX epoch time. That is not true at all!
pa <- as.data.frame(pa %>% group_by(`activity label`, `subject-id`) %>% mutate(timestamp = (timestamp - first(timestamp))/10E8))

pg <- as.data.frame(pg %>% group_by(`activity label`, `subject-id`) %>% mutate(timestamp = (timestamp - first(timestamp))/10E8))
 
wa <- as.data.frame(wa %>% group_by(`activity label`, `subject-id`) %>% mutate(timestamp = (timestamp - first(timestamp))/10E8))

wg <- as.data.frame(wg %>% group_by(`activity label`, `subject-id`) %>% mutate(timestamp = (timestamp - first(timestamp))/10E8))


## Convert columns into desired ata type
pa$`subject-id` <- as.factor(pa$`subject-id`)
pa$`activity label` <- as.factor(pa$`activity label`)
pa$z <- as.numeric(pa$z)

pg$`subject-id` <- as.factor(pg$`subject-id`)
pg$`activity label` <- as.factor(pg$`activity label`)
pg$z <- as.numeric(pg$z)

wa$`subject-id` <- as.factor(wa$`subject-id`)
wa$`activity label` <- as.factor(wa$`activity label`)
wa$z <- as.numeric(wa$z)

wg$`subject-id` <- as.factor(wg$`subject-id`)
wg$`activity label` <- as.factor(wg$`activity label`)
wg$z <- as.numeric(wg$z)


## Create data frame for all phone and all watch with unaltered times.
mega <- rbind(pa, pg, wa, wg)
mega <- readRDS("mega.rds")



## I'm going to take the 20Hz reading as an absolute truth and make the time exactly 20Hz btw readings
pa2 <- as.data.frame(pa %>% group_by(`activity label`, `subject-id`) %>% mutate(timestamp = seq(0, by = 0.05, length.out = n())))
pg2 <- as.data.frame(pg %>% group_by(`activity label`, `subject-id`) %>% mutate(timestamp = seq(0, by = 0.05, length.out = n())))
wa2 <- as.data.frame(wa %>% group_by(`activity label`, `subject-id`) %>% mutate(timestamp = seq(0, by = 0.05, length.out = n())))
wg2 <- as.data.frame(wg %>% group_by(`activity label`, `subject-id`) %>% mutate(timestamp = seq(0, by = 0.05, length.out = n())))

saveRDS(pa2, "pa2.rds")
saveRDS(pg2, "pg2.rds")
saveRDS(wa2, "wa2.rds")
saveRDS(wg2, "wg2.rds")

pa2 <- readRDS("pa2.rds")
wa2 <- readRDS("wa2.rds")
pg2 <- readRDS("pg2.rds")
wg2 <- readRDS("wg2.rds")


## Check to see what Users did not do all activities
fail <- NULL
k = 1
for (person in 1:51){
  t <- pa2 %>% filter(`subject-id` == as.character(1599 + person))
  t2 <- length(unique(as.character(t$`activity label`)))
  t3 <- length(unique(toupper(as.factor(c(letters[1:13], letters[15:19])))))
  if (t2 != t3){
    fail[k] <- as.character(1599 + person)
    k = k + 1
  }
}
# Can see from fail that Users: "1607" "1609" "1616" "1618" "1642" "1643" didn't do all activities


# check orientation of device (inconclusive)---------------------------------------------


## Check to see which orientation the phone is in by analyzing the graphs. I will check the STANDING activity which is E 
# Test
x_orient <- mega %>% filter(`activity label` == "E")
plot_x_orient <- ggplot(x_orient, aes(x = timestamp, y = x)) + geom_point(alpha = .1) + facet_grid(`activity label` ~ data)+ theme_clean() + ggtitle("X Acceleration Reading Over Time")
print(plot_x_orient)
ggsave(plot = plot_x_orient, filename = "x_orient.jpg", device = "jpeg", path = "plots/orientation", height = 6, width = 10, units = "in")

y_orient <- mega %>% filter(`activity label` == "E")
plot_y_orient <- ggplot(y_orient, aes(x = timestamp, y = y)) + geom_point(alpha = .1) + facet_grid(`activity label` ~ data) + theme_clean() + ggtitle("Y Acceleration Reading Over Time")
print(plot_y_orient)
ggsave(plot = plot_y_orient, filename = "y_orient.jpg", device = "jpeg", path = "plots/orientation", height = 6, width = 10, units = "in")

z_orient <- mega %>% filter(`activity label` == "E")
plot_z_orient <- ggplot(z_orient, aes(x = timestamp, y = z)) + geom_point(alpha = .1) + facet_grid(`activity label` ~ data) + theme_clean() + ggtitle("Z Acceleration Reading Over Time")
print(plot_z_orient)
ggsave(plot = plot_z_orient, filename = "z_orient.jpg", device = "jpeg", path = "plots/orientation", height = 6, width = 10, units = "in")

grid.arrange(plot_x_orient, plot_y_orient, plot_z_orient, nrow = 3, ncol = 1)


# Feature Extration -------------------------------------------------------


## The data set provied features that were already extracted for us
pa_arff <- list.files(path = "wisdm-dataset/arff_files/phone/accel", pattern = "*.arff", full.names = TRUE) 
pa_arff_df <- ldply(pa_arff, readARFF)
saveRDS(pa_arff_df, "pa_arff_df.rds")

pg_arff <- list.files(path = "wisdm-dataset/arff_files/phone/gyro", pattern = "*.arff", full.names = TRUE) 
pg_arff_df <- ldply(pg_arff, readARFF)
saveRDS(pg_arff_df, "pg_arff_df.rds")


wa_arff <- list.files(path = "wisdm-dataset/arff_files/watch/accel", pattern = "*.arff", full.names = TRUE) 
wa_arff_df <- ldply(wa_arff, readARFF)
saveRDS(wa_arff_df, "wa_arff_df.rds")


wg_arff <- list.files(path = "wisdm-dataset/arff_files/watch/gyro", pattern = "*.arff", full.names = TRUE) 
wg_arff_df <- ldply(wg_arff, readARFF)
saveRDS(wg_arff_df, "wg_arff_df.rds")


## Extraction of our own features

{# Phone Acceleration ---------------------------------------------------------------


# pa2 considering a 1 minute section that isn't at the very start or very end!
  {# First Minute ---------------------------------------------------------------
pa2_section <- pa2 %>% filter(timestamp < 65 & timestamp >=5)
activity = toupper(c(letters[1:13], letters[15:19]))
features <- NULL
for (s in 1600:1651){
  print(s)
  for (a in activity){
    print(a)
    
    temp <- pa2_section %>% filter(`subject-id` == s & `activity label` == a) 
    if (nrow(temp) == 0){
      next
    }
    
    overlap <- 100
    for (z in 1:12){ # Go over each window
      if (overlap == 1200){ # Break if we are exceeding window row count
        break
      }
      
      window <- temp[(-99 + overlap):(100 + overlap), ]
      
      x_mean <- mean(window$x) # Average
      x_std <- sd(window$x) # Standard deviation
      x_var <- var(window$x) # Variance
      
      y_mean <- mean(window$y) # Average
      y_std <- sd(window$y) # Standard deviation
      y_var <- var(window$y) # Variance
      
      z_mean <- mean(window$z) # Average
      z_std <- sd(window$z) # Standard deviation
      z_var <- var(window$z) # Variance
      
      each <- NULL
      for (row in 1:200){ # For each row in the window
        each[row] <- sqrt((window$x[row])^2 + (window$y[row])^2 + (window$z[row])^2)
      } 
      res_temp <- mean(each) # Average resultant value
      
      
      # Find the peaks and then find the time between them. First look at the moving average for better peaks
      ma.x <- rollmean(window$x, k = 10, fill = NA, align = "right")
      ma.y <- rollmean(window$y, k = 10, fill = NA, align = "right")
      ma.z <- rollmean(window$z, k = 10, fill = NA, align = "right")
      
      max_x <- max(ma.x, na.rm = TRUE) # Maximum values
      max_y <- max(ma.y, na.rm = TRUE)
      max_z <- max(ma.z, na.rm = TRUE)
      
      min_x <- min(ma.x, na.rm = TRUE) # Minimum Values
      min_y <- min(ma.y, na.rm = TRUE)
      min_z <- min(ma.z, na.rm = TRUE)
      
      window_ma <- window %>% cbind(ma.x, ma.y, ma.z)
      window_ma <- window_ma[-c(1:9), ]
      
      # X
      peaks_x <- find_peaks(window_ma$ma.x, m = 5) 
      time_x <- NULL
      for (elem in 1:(length(peaks_x) - 1)){
        time_x[elem] <- window$timestamp[peaks_x[elem + 1]] - window$timestamp[peaks_x[elem]]
      }
      time_btw_peaks_x <- mean(time_x)
      
      # Y
      peaks_y <- find_peaks(window_ma$ma.y, m = 5) 
      time_y <- NULL
      for (elem in 1:(length(peaks_y) - 1)){
        time_y[elem] <- window$timestamp[peaks_y[elem + 1]] - window$timestamp[peaks_y[elem]]
      }
      time_btw_peaks_y <- mean(time_y)
      
      # Z
      peaks_z <- find_peaks(window_ma$ma.z, m = 5) 
      time_z <- NULL
      for (elem in 1:(length(peaks_z) - 1)){
        time_z[elem] <- window$timestamp[peaks_z[elem + 1]] - window$timestamp[peaks_z[elem]]
      }
      time_btw_peaks_z <- mean(time_z)
      
      
      # Make a features data frame to train models
      features_temp <- data.frame(`subject.id` = s, `activity.label` = a,
                                  x_mean = x_mean,
                                  y_mean = y_mean,
                                  z_mean = z_mean,
                                  
                                  x_std = x_std,
                                  y_std = y_std,
                                  z_std = z_std,
                                  
                                  x_var = x_var,
                                  y_var = y_var,
                                  z_var = z_var,
                                  
                                  time_btw_peaks_x = time_btw_peaks_x,
                                  time_btw_peaks_y = time_btw_peaks_y,
                                  time_btw_peaks_z = time_btw_peaks_z,
                                  
                                  avg.resultant.acc = res_temp,
                                  
                                  max_x = max_x,
                                  max_y = max_y,
                                  max_z = max_z,
                                  
                                  min_x = min_x,
                                  min_y = min_y,
                                  min_z = min_z)
      
      features <- features %>% rbind(features_temp)
      overlap <- overlap + 100
    }
  }
}
  
  
features$subject.id <- as.factor(features$subject.id)
  }
  
  saveRDS(features, "features_pa.rds")
  features <- readRDS("features_pa.rds")
  
  # Take out user who didn't participate in all activites
  print(fail)
  '%ni%' <- Negate('%in%')
  features <- features %>% filter(`subject.id` %ni% fail)
  features$subject.id <- as.factor(features$subject.id)
  
  
  {# Second Minute ---------------------------------------------------------------
pa2_section_2 <- pa2 %>% filter(timestamp >=65 & timestamp < 125)
features_2 <- NULL
for (s in 1600:1651){
  print(s)
  for (a in activity){
    print(a)
    
    temp <- pa2_section_2 %>% filter(`subject-id` == s & `activity label` == a) 
    if (nrow(temp) == 0){
      next
    }
    
    overlap <- 100
    for (z in 1:12){ # Go over each window
      if (overlap == 1200){ # Break if we are exceeding window row count
        break
      }
      
      window <- temp[(-99 + overlap):(100 + overlap), ]
      
      x_mean <- mean(window$x) # Average
      x_std <- sd(window$x) # Standard deviation
      x_var <- var(window$x) # Variance
      
      y_mean <- mean(window$y) # Average
      y_std <- sd(window$y) # Standard deviation
      y_var <- var(window$y) # Variance
      
      z_mean <- mean(window$z) # Average
      z_std <- sd(window$z) # Standard deviation
      z_var <- var(window$z) # Variance
      
      each <- NULL
      for (row in 1:200){ # For each row in the window
        each[row] <- sqrt((window$x[row])^2 + (window$y[row])^2 + (window$z[row])^2)
      } 
      res_temp <- mean(each) # Average resultant value
      
      # Find the peaks and then find the time between them. First look at the moving average for better peaks
      ma.x <- rollmean(window$x, k = 10, fill = NA, align = "right")
      ma.y <- rollmean(window$y, k = 10, fill = NA, align = "right")
      ma.z <- rollmean(window$z, k = 10, fill = NA, align = "right")
      
      max_x <- max(ma.x, na.rm = TRUE) # Maximum values
      max_y <- max(ma.y, na.rm = TRUE)
      max_z <- max(ma.z, na.rm = TRUE)
      
      min_x <- min(ma.x, na.rm = TRUE) # Minimum Values
      min_y <- min(ma.y, na.rm = TRUE)
      min_z <- min(ma.z, na.rm = TRUE)
      
      window_ma <- window %>% cbind(ma.x, ma.y, ma.z)
      window_ma <- window_ma[-c(1:9), ]
      
      # X
      peaks_x <- find_peaks(window_ma$ma.x, m = 5) 
      time_x <- NULL
      for (elem in 1:(length(peaks_x) - 1)){
        time_x[elem] <- window$timestamp[peaks_x[elem + 1]] - window$timestamp[peaks_x[elem]]
      }
      time_btw_peaks_x <- mean(time_x)
      
      # Y
      peaks_y <- find_peaks(window_ma$ma.y, m = 5) 
      time_y <- NULL
      for (elem in 1:(length(peaks_y) - 1)){
        time_y[elem] <- window$timestamp[peaks_y[elem + 1]] - window$timestamp[peaks_y[elem]]
      }
      time_btw_peaks_y <- mean(time_y)
      
      # Z
      peaks_z <- find_peaks(window_ma$ma.z, m = 5) 
      time_z <- NULL
      for (elem in 1:(length(peaks_z) - 1)){
        time_z[elem] <- window$timestamp[peaks_z[elem + 1]] - window$timestamp[peaks_z[elem]]
      }
      time_btw_peaks_z <- mean(time_z)
      
      
      # Make a features data frame to train models
      features_temp <- data.frame(`subject.id` = s, `activity.label` = a,
                                  x_mean = x_mean,
                                  y_mean = y_mean,
                                  z_mean = z_mean,
                                  
                                  x_std = x_std,
                                  y_std = y_std,
                                  z_std = z_std,
                                  
                                  x_var = x_var,
                                  y_var = y_var,
                                  z_var = z_var,
                                  
                                  time_btw_peaks_x = time_btw_peaks_x,
                                  time_btw_peaks_y = time_btw_peaks_y,
                                  time_btw_peaks_z = time_btw_peaks_z,
                                  
                                  avg.resultant.acc = res_temp,
                                  
                                  max_x = max_x,
                                  max_y = max_y,
                                  max_z = max_z,
                                  
                                  min_x = min_x,
                                  min_y = min_y,
                                  min_z = min_z)
      
      features_2 <- features_2 %>% rbind(features_temp)
      overlap <- overlap + 100
    }
  }
}

features_2$subject.id <- as.factor(features_2$subject.id)
  }
  
  saveRDS(features_2, "features_pa_2.rds")
  features_2 <- readRDS("features_pa_2.rds")
  
  # Take out user who didn't participate in all activites
  print(fail)
  '%ni%' <- Negate('%in%')
  features_2 <- features_2 %>% filter(`subject.id` %ni% fail)
  features_2$subject.id <- as.factor(features_2$subject.id)
  
  {# Combine all eating activities ---------------------------------------------------------------
    table(features$activity.label)
    features.eat <- features
    features.eat$activity.label <- features.eat$activity.label %>% fct_collapse("Eating" = c("H","I","J","L"))
    
    features.eat_2 <- features_2
    features.eat_2$activity.label <- features.eat_2$activity.label %>% fct_collapse("Eating" = c("H","I","J","L"))
    
  }

  {# Divided by appropriate activities ---------------------------------------------------------------
    divided.pa <- features %>% filter(activity.label == "A" | 
                                        activity.label == "B" |  
                                        activity.label == "C" | 
                                        activity.label == "D" | 
                                        activity.label == "E")
    divided.pa$activity.label <- factor(divided.pa$activity.label)
    
    divided.pa2 <- features_2 %>% filter(activity.label == "A" | 
                                           activity.label == "B" |  
                                           activity.label == "C" | 
                                           activity.label == "D" | 
                                           activity.label == "E")
    divided.pa2$activity.label <- factor(divided.pa2$activity.label)
  }

}

{# Watch Acceleration ---------------------------------------------------------------
  
  
  # wa2 considering a 1 minute section that isn't at the very start or very end!
  {# First Minute ---------------------------------------------------------------
    wa2_section <- wa2 %>% filter(timestamp < 65 & timestamp >=5)
    activity = toupper(c(letters[1:13], letters[15:19]))
    features.wa <- NULL
    for (s in 1600:1651){
      print(s)
      for (a in activity){
        print(a)
        
        temp <- wa2_section %>% filter(`subject-id` == s & `activity label` == a) 
        if (nrow(temp) == 0){
          next
        }
        
        overlap <- 100
        for (z in 1:12){ # Go over each window
          if (overlap == 1200){ # Break if we are exceeding window row count
            break
          }
          
          window <- temp[(-99 + overlap):(100 + overlap), ]
          
          x_mean <- mean(window$x) # Average
          x_std <- sd(window$x) # Standard deviation
          x_var <- var(window$x) # Variance
          
          y_mean <- mean(window$y) # Average
          y_std <- sd(window$y) # Standard deviation
          y_var <- var(window$y) # Variance
          
          z_mean <- mean(window$z) # Average
          z_std <- sd(window$z) # Standard deviation
          z_var <- var(window$z) # Variance
          
          each <- NULL
          for (row in 1:200){ # For each row in the window
            each[row] <- sqrt((window$x[row])^2 + (window$y[row])^2 + (window$z[row])^2)
          } 
          res_temp <- mean(each) # Average resultant value
          
          # Find the peaks and then find the time between them. First look at the moving average for better peaks
          ma.x <- rollmean(window$x, k = 10, fill = NA, align = "right")
          ma.y <- rollmean(window$y, k = 10, fill = NA, align = "right")
          ma.z <- rollmean(window$z, k = 10, fill = NA, align = "right")
          
          max_x <- max(ma.x, na.rm = TRUE) # Maximum values
          max_y <- max(ma.y, na.rm = TRUE)
          max_z <- max(ma.z, na.rm = TRUE)
          
          min_x <- min(ma.x, na.rm = TRUE) # Minimum Values
          min_y <- min(ma.y, na.rm = TRUE)
          min_z <- min(ma.z, na.rm = TRUE)
          
          window_ma <- window %>% cbind(ma.x, ma.y, ma.z)
          window_ma <- window_ma[-c(1:9), ]
          
          # X
          peaks_x <- find_peaks(window_ma$ma.x, m = 5) 
          time_x <- NULL
          for (elem in 1:(length(peaks_x) - 1)){
            time_x[elem] <- window$timestamp[peaks_x[elem + 1]] - window$timestamp[peaks_x[elem]]
          }
          time_btw_peaks_x <- mean(time_x)
          
          # Y
          peaks_y <- find_peaks(window_ma$ma.y, m = 5) 
          time_y <- NULL
          for (elem in 1:(length(peaks_y) - 1)){
            time_y[elem] <- window$timestamp[peaks_y[elem + 1]] - window$timestamp[peaks_y[elem]]
          }
          time_btw_peaks_y <- mean(time_y)
          
          # Z
          peaks_z <- find_peaks(window_ma$ma.z, m = 5) 
          time_z <- NULL
          for (elem in 1:(length(peaks_z) - 1)){
            time_z[elem] <- window$timestamp[peaks_z[elem + 1]] - window$timestamp[peaks_z[elem]]
          }
          time_btw_peaks_z <- mean(time_z)
          
          
          # Make a features data frame to train models
          features_temp <- data.frame(`subject.id` = s, `activity.label` = a,
                                      x_mean = x_mean,
                                      y_mean = y_mean,
                                      z_mean = z_mean,
                                      
                                      x_std = x_std,
                                      y_std = y_std,
                                      z_std = z_std,
                                      
                                      x_var = x_var,
                                      y_var = y_var,
                                      z_var = z_var,
                                      
                                      time_btw_peaks_x = time_btw_peaks_x,
                                      time_btw_peaks_y = time_btw_peaks_y,
                                      time_btw_peaks_z = time_btw_peaks_z,
                                      
                                      avg.resultant.acc = res_temp,
                                      
                                      max_x = max_x,
                                      max_y = max_y,
                                      max_z = max_z,
                                      
                                      min_x = min_x,
                                      min_y = min_y,
                                      min_z = min_z)
          
          features.wa <- features.wa %>% rbind(features_temp)
          overlap <- overlap + 100
        }
      }
    }
    
    
    features.wa$subject.id <- as.factor(features.wa$subject.id)
    features.wa <- features.wa[complete.cases(features.wa), ]
  }
  
  saveRDS(features.wa, "features_wa.rds")
  features.wa <- readRDS("features_wa.rds")
  
  # Take out user who didn't participate in all activites
  print(fail)
  '%ni%' <- Negate('%in%')
  features.wa <- features.wa %>% filter(`subject.id` %ni% fail)
  features.wa$subject.id <- as.factor(features.wa$subject.id)
  
  {# Second Minute ---------------------------------------------------------------
    wa2_section_2 <- wa2 %>% filter(timestamp >=65 & timestamp < 125)
    features.wa_2 <- NULL
    for (s in 1600:1651){
      print(s)
      for (a in activity){
        print(a)
        
        temp <- wa2_section_2 %>% filter(`subject-id` == s & `activity label` == a) 
        if (nrow(temp) == 0){
          next
        }
        
        overlap <- 100
        for (z in 1:12){ # Go over each window
          if (overlap == 1200){ # Break if we are exceeding window row count
            break
          }
          
          window <- temp[(-99 + overlap):(100 + overlap), ]
          
          x_mean <- mean(window$x) # Average
          x_std <- sd(window$x) # Standard deviation
          x_var <- var(window$x) # Variance
          
          y_mean <- mean(window$y) # Average
          y_std <- sd(window$y) # Standard deviation
          y_var <- var(window$y) # Variance
          
          z_mean <- mean(window$z) # Average
          z_std <- sd(window$z) # Standard deviation
          z_var <- var(window$z) # Variance
          
          each <- NULL
          for (row in 1:200){ # For each row in the window
            each[row] <- sqrt((window$x[row])^2 + (window$y[row])^2 + (window$z[row])^2)
          } 
          res_temp <- mean(each) # Average resultant value
          
          # Find the peaks and then find the time between them. First look at the moving average for better peaks
          ma.x <- rollmean(window$x, k = 10, fill = NA, align = "right")
          ma.y <- rollmean(window$y, k = 10, fill = NA, align = "right")
          ma.z <- rollmean(window$z, k = 10, fill = NA, align = "right")
          
          max_x <- max(ma.x, na.rm = TRUE) # Maximum values
          max_y <- max(ma.y, na.rm = TRUE)
          max_z <- max(ma.z, na.rm = TRUE)
          
          min_x <- min(ma.x, na.rm = TRUE) # Minimum Values
          min_y <- min(ma.y, na.rm = TRUE)
          min_z <- min(ma.z, na.rm = TRUE)
          
          window_ma <- window %>% cbind(ma.x, ma.y, ma.z)
          window_ma <- window_ma[-c(1:9), ]
          
          # X
          peaks_x <- find_peaks(window_ma$ma.x, m = 5) 
          time_x <- NULL
          for (elem in 1:(length(peaks_x) - 1)){
            time_x[elem] <- window$timestamp[peaks_x[elem + 1]] - window$timestamp[peaks_x[elem]]
          }
          time_btw_peaks_x <- mean(time_x)
          
          # Y
          peaks_y <- find_peaks(window_ma$ma.y, m = 5) 
          time_y <- NULL
          for (elem in 1:(length(peaks_y) - 1)){
            time_y[elem] <- window$timestamp[peaks_y[elem + 1]] - window$timestamp[peaks_y[elem]]
          }
          time_btw_peaks_y <- mean(time_y)
          
          # Z
          peaks_z <- find_peaks(window_ma$ma.z, m = 5) 
          time_z <- NULL
          for (elem in 1:(length(peaks_z) - 1)){
            time_z[elem] <- window$timestamp[peaks_z[elem + 1]] - window$timestamp[peaks_z[elem]]
          }
          time_btw_peaks_z <- mean(time_z)
          
          
          # Make a features data frame to train models
          features_temp <- data.frame(`subject.id` = s, `activity.label` = a,
                                      x_mean = x_mean,
                                      y_mean = y_mean,
                                      z_mean = z_mean,
                                      
                                      x_std = x_std,
                                      y_std = y_std,
                                      z_std = z_std,
                                      
                                      x_var = x_var,
                                      y_var = y_var,
                                      z_var = z_var,
                                      
                                      time_btw_peaks_x = time_btw_peaks_x,
                                      time_btw_peaks_y = time_btw_peaks_y,
                                      time_btw_peaks_z = time_btw_peaks_z,
                                      
                                      avg.resultant.acc = res_temp,
                                      
                                      max_x = max_x,
                                      max_y = max_y,
                                      max_z = max_z,
                                      
                                      min_x = min_x,
                                      min_y = min_y,
                                      min_z = min_z)
          
          features.wa_2 <- features.wa_2 %>% rbind(features_temp)
          overlap <- overlap + 100
        }
      }
    }
    
    features.wa_2$subject.id <- as.factor(features.wa_2$subject.id)
    features.wa_2 <- features.wa_2[complete.cases(features.wa_2), ]
  }
  
  saveRDS(features.wa_2, "features_wa_2.rds")
  features.wa_2 <- readRDS("features_wa_2.rds")
  
  # Take out user who didn't participate in all activites
  print(fail)
  '%ni%' <- Negate('%in%')
  features.wa_2 <- features.wa_2 %>% filter(`subject.id` %ni% fail)
  features.wa_2$subject.id <- as.factor(features.wa_2$subject.id)
  
  {# Combine all eating activities ---------------------------------------------------------------
    table(features.wa$activity.label)
    features.wa.eat <- features.wa
    features.wa.eat$activity.label <- features.wa.eat$activity.label %>% fct_collapse("Eating" = c("H","I","J","L"))
    
    features.wa.eat_2 <- features.wa_2
    features.wa.eat_2$activity.label <- features.wa.eat_2$activity.label %>% fct_collapse("Eating" = c("H","I","J","L"))
    
  }
  
  {# Divided by appropriate activities ---------------------------------------------------------------
    divided.wa <- features.wa %>% filter(activity.label == "F" | 
                                           activity.label == "G" |  
                                           activity.label == "H" | 
                                           activity.label == "I" | 
                                           activity.label == "J" |
                                           activity.label == "K" |  
                                           activity.label == "L" |
                                           activity.label == "M" |
                                           activity.label == "O" | 
                                           activity.label == "P" |
                                           activity.label == "Q" |
                                           activity.label == "R" |   
                                           activity.label == "S" )
    divided.wa$activity.label <- factor(divided.wa$activity.label)
    
    divided.wa2 <- features.wa_2 %>% filter(activity.label == "F" | 
                                              activity.label == "G" |  
                                              activity.label == "H" | 
                                              activity.label == "I" | 
                                              activity.label == "J" |
                                              activity.label == "K" |  
                                              activity.label == "L" |
                                              activity.label == "M" |
                                              activity.label == "O" | 
                                              activity.label == "P" |
                                              activity.label == "Q" |
                                              activity.label == "R" |   
                                              activity.label == "S" )
    divided.wa2$activity.label <- factor(divided.wa2$activity.label)
    
    divided.wa.eat <- features.wa.eat %>% filter(activity.label == "F" | 
                                                   activity.label == "G" |  
                                                   activity.label == "Eating" |
                                                   activity.label == "K" |
                                                   activity.label == "M" |
                                                   activity.label == "O" | 
                                                   activity.label == "P" |
                                                   activity.label == "Q" |
                                                   activity.label == "R" |   
                                                   activity.label == "S" )
    divided.wa.eat$subject.id <- factor(divided.wa.eat$subject.id)
    divided.wa.eat$activity.label <- factor(divided.wa.eat$activity.label)
    
    divided.wa.eat_2 <- features.wa.eat_2 %>% filter(activity.label == "F" | 
                                                   activity.label == "G" |  
                                                   activity.label == "Eating" |
                                                   activity.label == "K" |
                                                   activity.label == "M" |
                                                   activity.label == "O" | 
                                                   activity.label == "P" |
                                                   activity.label == "Q" |
                                                   activity.label == "R" |   
                                                   activity.label == "S" )
    divided.wa.eat_2$subject.id <- factor(divided.wa.eat_2$subject.id)
    divided.wa.eat_2$activity.label <- factor(divided.wa.eat_2$activity.label)
  }
  
}

{# Phone Gyroscope ---------------------------------------------------------------
  
  
  # pg2 considering a 1 minute section that isn't at the very start or very end!
  {# First Minute ---------------------------------------------------------------
    pg2_section <- pg2 %>% filter(timestamp < 65 & timestamp >=5)
    activity = toupper(c(letters[1:13], letters[15:19]))
    features.pg <- NULL
    for (s in 1600:1651){
      print(s)
      for (a in activity){
        print(a)
        
        temp <- pg2_section %>% filter(`subject-id` == s & `activity label` == a) 
        if (nrow(temp) == 0){
          next
        }
        
        overlap <- 100
        for (z in 1:12){ # Go over each window
          if (overlap == 1200){ # Break if we are exceeding window row count
            break
          }
          
          window <- temp[(-99 + overlap):(100 + overlap), ]
          
          x_mean <- mean(window$x) # Average
          x_std <- sd(window$x) # Standard deviation
          x_var <- var(window$x) # Variance
          
          y_mean <- mean(window$y) # Average
          y_std <- sd(window$y) # Standard deviation
          y_var <- var(window$y) # Variance
          
          z_mean <- mean(window$z) # Average
          z_std <- sd(window$z) # Standard deviation
          z_var <- var(window$z) # Variance
          
          each <- NULL
          for (row in 1:200){ # For each row in the window
            each[row] <- sqrt((window$x[row])^2 + (window$y[row])^2 + (window$z[row])^2)
          } 
          res_temp <- mean(each) # Average resultant value
          
          # Find the peaks and then find the time between them. First look at the moving average for better peaks
          ma.x <- rollmean(window$x, k = 10, fill = NA, align = "right")
          ma.y <- rollmean(window$y, k = 10, fill = NA, align = "right")
          ma.z <- rollmean(window$z, k = 10, fill = NA, align = "right")
          
          max_x <- max(ma.x, na.rm = TRUE) # Maximum values
          max_y <- max(ma.y, na.rm = TRUE)
          max_z <- max(ma.z, na.rm = TRUE)
          
          min_x <- min(ma.x, na.rm = TRUE) # Minimum Values
          min_y <- min(ma.y, na.rm = TRUE)
          min_z <- min(ma.z, na.rm = TRUE)
          
          window_ma <- window %>% cbind(ma.x, ma.y, ma.z)
          window_ma <- window_ma[-c(1:9), ]
          
          # X
          peaks_x <- find_peaks(window_ma$ma.x, m = 5) 
          time_x <- NULL
          for (elem in 1:(length(peaks_x) - 1)){
            time_x[elem] <- window$timestamp[peaks_x[elem + 1]] - window$timestamp[peaks_x[elem]]
          }
          time_btw_peaks_x <- mean(time_x)
          
          # Y
          peaks_y <- find_peaks(window_ma$ma.y, m = 5) 
          time_y <- NULL
          for (elem in 1:(length(peaks_y) - 1)){
            time_y[elem] <- window$timestamp[peaks_y[elem + 1]] - window$timestamp[peaks_y[elem]]
          }
          time_btw_peaks_y <- mean(time_y)
          
          # Z
          peaks_z <- find_peaks(window_ma$ma.z, m = 5) 
          time_z <- NULL
          for (elem in 1:(length(peaks_z) - 1)){
            time_z[elem] <- window$timestamp[peaks_z[elem + 1]] - window$timestamp[peaks_z[elem]]
          }
          time_btw_peaks_z <- mean(time_z)
          
          
          # Make a features data frame to train models
          features_temp <- data.frame(`subject.id` = s, `activity.label` = a,
                                      x_mean = x_mean,
                                      y_mean = y_mean,
                                      z_mean = z_mean,
                                      
                                      x_std = x_std,
                                      y_std = y_std,
                                      z_std = z_std,
                                      
                                      x_var = x_var,
                                      y_var = y_var,
                                      z_var = z_var,
                                      
                                      time_btw_peaks_x = time_btw_peaks_x,
                                      time_btw_peaks_y = time_btw_peaks_y,
                                      time_btw_peaks_z = time_btw_peaks_z,
                                      
                                      avg.resultant.acc = res_temp,
                                      
                                      max_x = max_x,
                                      max_y = max_y,
                                      max_z = max_z,
                                      
                                      min_x = min_x,
                                      min_y = min_y,
                                      min_z = min_z)
          
          features.pg <- features.pg %>% rbind(features_temp)
          overlap <- overlap + 100
        }
      }
    }
    
    
    features.pg$subject.id <- as.factor(features.pg$subject.id)
  }
  
  features.pg <- features.pg[complete.cases(features.pg), ]
  saveRDS(features.pg, "features_pg.rds")
  features.pg <- readRDS("features_pg.rds")
  
  # Take out user who didn't participate in all activites
  print(fail)
  '%ni%' <- Negate('%in%')
  features.pg <- features.pg %>% filter(`subject.id` %ni% fail)
  features.pg$subject.id <- as.factor(features.pg$subject.id)
  
  {# Second Minute ---------------------------------------------------------------
    pg2_section_2 <- pg2 %>% filter(timestamp >=65 & timestamp < 125)
    features.pg_2 <- NULL
    for (s in 1600:1651){
      print(s)
      for (a in activity){
        print(a)
        
        temp <- pg2_section_2 %>% filter(`subject-id` == s & `activity label` == a) 
        if (nrow(temp) == 0){
          next
        }
        
        overlap <- 100
        for (z in 1:12){ # Go over each window
          if (overlap == 1200){ # Break if we are exceeding window row count
            break
          }
          
          window <- temp[(-99 + overlap):(100 + overlap), ]
          
          x_mean <- mean(window$x) # Average
          x_std <- sd(window$x) # Standard deviation
          x_var <- var(window$x) # Variance
          
          y_mean <- mean(window$y) # Average
          y_std <- sd(window$y) # Standard deviation
          y_var <- var(window$y) # Variance
          
          z_mean <- mean(window$z) # Average
          z_std <- sd(window$z) # Standard deviation
          z_var <- var(window$z) # Variance
          
          each <- NULL
          for (row in 1:200){ # For each row in the window
            each[row] <- sqrt((window$x[row])^2 + (window$y[row])^2 + (window$z[row])^2)
          } 
          res_temp <- mean(each) # Average resultant value
          
          # Find the peaks and then find the time between them. First look at the moving average for better peaks
          ma.x <- rollmean(window$x, k = 10, fill = NA, align = "right")
          ma.y <- rollmean(window$y, k = 10, fill = NA, align = "right")
          ma.z <- rollmean(window$z, k = 10, fill = NA, align = "right")
          
          max_x <- max(ma.x, na.rm = TRUE) # Maximum values
          max_y <- max(ma.y, na.rm = TRUE)
          max_z <- max(ma.z, na.rm = TRUE)
          
          min_x <- min(ma.x, na.rm = TRUE) # Minimum Values
          min_y <- min(ma.y, na.rm = TRUE)
          min_z <- min(ma.z, na.rm = TRUE)
          
          window_ma <- window %>% cbind(ma.x, ma.y, ma.z)
          window_ma <- window_ma[-c(1:9), ]
          
          # X
          peaks_x <- find_peaks(window_ma$ma.x, m = 5) 
          time_x <- NULL
          for (elem in 1:(length(peaks_x) - 1)){
            time_x[elem] <- window$timestamp[peaks_x[elem + 1]] - window$timestamp[peaks_x[elem]]
          }
          time_btw_peaks_x <- mean(time_x)
          
          # Y
          peaks_y <- find_peaks(window_ma$ma.y, m = 5) 
          time_y <- NULL
          for (elem in 1:(length(peaks_y) - 1)){
            time_y[elem] <- window$timestamp[peaks_y[elem + 1]] - window$timestamp[peaks_y[elem]]
          }
          time_btw_peaks_y <- mean(time_y)
          
          # Z
          peaks_z <- find_peaks(window_ma$ma.z, m = 5) 
          time_z <- NULL
          for (elem in 1:(length(peaks_z) - 1)){
            time_z[elem] <- window$timestamp[peaks_z[elem + 1]] - window$timestamp[peaks_z[elem]]
          }
          time_btw_peaks_z <- mean(time_z)
          
          
          # Make a features data frame to train models
          features_temp <- data.frame(`subject.id` = s, `activity.label` = a,
                                      x_mean = x_mean,
                                      y_mean = y_mean,
                                      z_mean = z_mean,
                                      
                                      x_std = x_std,
                                      y_std = y_std,
                                      z_std = z_std,
                                      
                                      x_var = x_var,
                                      y_var = y_var,
                                      z_var = z_var,
                                      
                                      time_btw_peaks_x = time_btw_peaks_x,
                                      time_btw_peaks_y = time_btw_peaks_y,
                                      time_btw_peaks_z = time_btw_peaks_z,
                                      
                                      avg.resultant.acc = res_temp,
                                      
                                      max_x = max_x,
                                      max_y = max_y,
                                      max_z = max_z,
                                      
                                      min_x = min_x,
                                      min_y = min_y,
                                      min_z = min_z)
          
          features.pg_2 <- features.pg_2 %>% rbind(features_temp)
          overlap <- overlap + 100
        }
      }
    }
    
    features.pg_2$subject.id <- as.factor(features.pg_2$subject.id)
  }
  
  saveRDS(features.pg_2, "features_pg_2.rds")
  features.pg_2 <- readRDS("features_pg_2.rds")
  
  # Take out user who didn't participate in all activites
  print(fail)
  '%ni%' <- Negate('%in%')
  features.pg_2 <- features.pg_2 %>% filter(`subject.id` %ni% fail)
  features.pg_2$subject.id <- as.factor(features.pg_2$subject.id)
  
  {# Combine all eating activities ---------------------------------------------------------------
    table(features.pg$activity.label)
    features.pg.eat <- features.pg
    features.pg.eat$activity.label <- features.pg.eat$activity.label %>% fct_collapse("Eating" = c("H","I","J","L"))
    
    features.pg.eat_2 <- features.pg_2
    features.pg.eat_2$activity.label <- features.pg.eat_2$activity.label %>% fct_collapse("Eating" = c("H","I","J","L"))
    
  }
  
  {# Divided by appropriate activities ---------------------------------------------------------------
    divided.pg <- features.pg %>% filter(activity.label == "A" | 
                                        activity.label == "B" |  
                                        activity.label == "C" | 
                                        activity.label == "D" | 
                                        activity.label == "E")
    divided.pg$activity.label <- factor(divided.pg$activity.label)
    
    divided.pg2 <- features.pg_2 %>% filter(activity.label == "A" | 
                                           activity.label == "B" |  
                                           activity.label == "C" | 
                                           activity.label == "D" | 
                                           activity.label == "E")
    divided.pg2$activity.label <- factor(divided.pg2$activity.label)
  }
  
}

{# Watch Gyroscope ---------------------------------------------------------------
  
  
  # wg2 considering a 1 minute section that isn't at the very start or very end!
  {# First Minute ---------------------------------------------------------------
    wg2_section <- wg2 %>% filter(timestamp < 65 & timestamp >=5)
    activity = toupper(c(letters[1:13], letters[15:19]))
    features.wg <- NULL
    for (s in 1600:1651){
      print(s)
      for (a in activity){
        print(a)
        
        temp <- wg2_section %>% filter(`subject-id` == s & `activity label` == a) 
        if (nrow(temp) == 0){
          next
        }
        
        overlap <- 100
        for (z in 1:12){ # Go over each window
          if (overlap == 1200){ # Break if we are exceeding window row count
            break
          }
          
          window <- temp[(-99 + overlap):(100 + overlap), ]
          
          x_mean <- mean(window$x) # Average
          x_std <- sd(window$x) # Standard deviation
          x_var <- var(window$x) # Variance
          
          y_mean <- mean(window$y) # Average
          y_std <- sd(window$y) # Standard deviation
          y_var <- var(window$y) # Variance
          
          z_mean <- mean(window$z) # Average
          z_std <- sd(window$z) # Standard deviation
          z_var <- var(window$z) # Variance
          
          each <- NULL
          for (row in 1:200){ # For each row in the window
            each[row] <- sqrt((window$x[row])^2 + (window$y[row])^2 + (window$z[row])^2)
          } 
          res_temp <- mean(each) # Average resultant value
          
          # Find the peaks and then find the time between them. First look at the moving average for better peaks
          ma.x <- rollmean(window$x, k = 10, fill = NA, align = "right")
          ma.y <- rollmean(window$y, k = 10, fill = NA, align = "right")
          ma.z <- rollmean(window$z, k = 10, fill = NA, align = "right")
          
          max_x <- max(ma.x, na.rm = TRUE) # Maximum values
          max_y <- max(ma.y, na.rm = TRUE)
          max_z <- max(ma.z, na.rm = TRUE)
          
          min_x <- min(ma.x, na.rm = TRUE) # Minimum Values
          min_y <- min(ma.y, na.rm = TRUE)
          min_z <- min(ma.z, na.rm = TRUE)
          
          window_ma <- window %>% cbind(ma.x, ma.y, ma.z)
          window_ma <- window_ma[-c(1:9), ]
          
          # X
          peaks_x <- find_peaks(window_ma$ma.x, m = 5) 
          time_x <- NULL
          for (elem in 1:(length(peaks_x) - 1)){
            time_x[elem] <- window$timestamp[peaks_x[elem + 1]] - window$timestamp[peaks_x[elem]]
          }
          time_btw_peaks_x <- mean(time_x)
          
          # Y
          peaks_y <- find_peaks(window_ma$ma.y, m = 5) 
          time_y <- NULL
          for (elem in 1:(length(peaks_y) - 1)){
            time_y[elem] <- window$timestamp[peaks_y[elem + 1]] - window$timestamp[peaks_y[elem]]
          }
          time_btw_peaks_y <- mean(time_y)
          
          # Z
          peaks_z <- find_peaks(window_ma$ma.z, m = 5) 
          time_z <- NULL
          for (elem in 1:(length(peaks_z) - 1)){
            time_z[elem] <- window$timestamp[peaks_z[elem + 1]] - window$timestamp[peaks_z[elem]]
          }
          time_btw_peaks_z <- mean(time_z)
          
          
          # Make a features data frame to train models
          features_temp <- data.frame(`subject.id` = s, `activity.label` = a,
                                      x_mean = x_mean,
                                      y_mean = y_mean,
                                      z_mean = z_mean,
                                      
                                      x_std = x_std,
                                      y_std = y_std,
                                      z_std = z_std,
                                      
                                      x_var = x_var,
                                      y_var = y_var,
                                      z_var = z_var,
                                      
                                      time_btw_peaks_x = time_btw_peaks_x,
                                      time_btw_peaks_y = time_btw_peaks_y,
                                      time_btw_peaks_z = time_btw_peaks_z,
                                      
                                      avg.resultant.acc = res_temp,
                                      
                                      max_x = max_x,
                                      max_y = max_y,
                                      max_z = max_z,
                                      
                                      min_x = min_x,
                                      min_y = min_y,
                                      min_z = min_z)
          
          features.wg <- features.wg %>% rbind(features_temp)
          overlap <- overlap + 100
        }
      }
    }
    
    
    features.wg$subject.id <- as.factor(features.wg$subject.id)
    features.wg <- features.wg[complete.cases(features.wg), ]
  }
  
  saveRDS(features.wg, "features_wg.rds")
  features.wg <- readRDS("features_wg.rds")
  
  # Take out user who didn't participate in all activites
  print(fail)
  '%ni%' <- Negate('%in%')
  features.wg <- features.wg %>% filter(`subject.id` %ni% fail)
  features.wg$subject.id <- as.factor(features.wg$subject.id)
  
  {# Second Minute ---------------------------------------------------------------
    wg2_section_2 <- wg2 %>% filter(timestamp >=65 & timestamp < 125)
    features.wg_2 <- NULL
    for (s in 1600:1651){
      print(s)
      for (a in activity){
        print(a)
        
        temp <- wg2_section_2 %>% filter(`subject-id` == s & `activity label` == a) 
        if (nrow(temp) == 0){
          next
        }
        
        overlap <- 100
        for (z in 1:12){ # Go over each window
          if (overlap == 1200){ # Break if we are exceeding window row count
            break
          }
          
          window <- temp[(-99 + overlap):(100 + overlap), ]
          
          x_mean <- mean(window$x) # Average
          x_std <- sd(window$x) # Standard deviation
          x_var <- var(window$x) # Variance
          
          y_mean <- mean(window$y) # Average
          y_std <- sd(window$y) # Standard deviation
          y_var <- var(window$y) # Variance
          
          z_mean <- mean(window$z) # Average
          z_std <- sd(window$z) # Standard deviation
          z_var <- var(window$z) # Variance
          
          each <- NULL
          for (row in 1:200){ # For each row in the window
            each[row] <- sqrt((window$x[row])^2 + (window$y[row])^2 + (window$z[row])^2)
          } 
          res_temp <- mean(each) # Average resultant value
          
          # Find the peaks and then find the time between them. First look at the moving average for better peaks
          ma.x <- rollmean(window$x, k = 10, fill = NA, align = "right")
          ma.y <- rollmean(window$y, k = 10, fill = NA, align = "right")
          ma.z <- rollmean(window$z, k = 10, fill = NA, align = "right")
          
          max_x <- max(ma.x, na.rm = TRUE) # Maximum values
          max_y <- max(ma.y, na.rm = TRUE)
          max_z <- max(ma.z, na.rm = TRUE)
          
          min_x <- min(ma.x, na.rm = TRUE) # Minimum Values
          min_y <- min(ma.y, na.rm = TRUE)
          min_z <- min(ma.z, na.rm = TRUE)
          
          window_ma <- window %>% cbind(ma.x, ma.y, ma.z)
          window_ma <- window_ma[-c(1:9), ]
          
          # X
          peaks_x <- find_peaks(window_ma$ma.x, m = 5) 
          time_x <- NULL
          for (elem in 1:(length(peaks_x) - 1)){
            time_x[elem] <- window$timestamp[peaks_x[elem + 1]] - window$timestamp[peaks_x[elem]]
          }
          time_btw_peaks_x <- mean(time_x)
          
          # Y
          peaks_y <- find_peaks(window_ma$ma.y, m = 5) 
          time_y <- NULL
          for (elem in 1:(length(peaks_y) - 1)){
            time_y[elem] <- window$timestamp[peaks_y[elem + 1]] - window$timestamp[peaks_y[elem]]
          }
          time_btw_peaks_y <- mean(time_y)
          
          # Z
          peaks_z <- find_peaks(window_ma$ma.z, m = 5) 
          time_z <- NULL
          for (elem in 1:(length(peaks_z) - 1)){
            time_z[elem] <- window$timestamp[peaks_z[elem + 1]] - window$timestamp[peaks_z[elem]]
          }
          time_btw_peaks_z <- mean(time_z)
          
          
          # Make a features data frame to train models
          features_temp <- data.frame(`subject.id` = s, `activity.label` = a,
                                      x_mean = x_mean,
                                      y_mean = y_mean,
                                      z_mean = z_mean,
                                      
                                      x_std = x_std,
                                      y_std = y_std,
                                      z_std = z_std,
                                      
                                      x_var = x_var,
                                      y_var = y_var,
                                      z_var = z_var,
                                      
                                      time_btw_peaks_x = time_btw_peaks_x,
                                      time_btw_peaks_y = time_btw_peaks_y,
                                      time_btw_peaks_z = time_btw_peaks_z,
                                      
                                      avg.resultant.acc = res_temp,
                                      
                                      max_x = max_x,
                                      max_y = max_y,
                                      max_z = max_z,
                                      
                                      min_x = min_x,
                                      min_y = min_y,
                                      min_z = min_z)
          
          features.wg_2 <- features.wg_2 %>% rbind(features_temp)
          overlap <- overlap + 100
        }
      }
    }
    
    features.wg_2$subject.id <- as.factor(features.wg_2$subject.id)
    features.wg_2 <- features.wg_2[complete.cases(features.wg_2), ]
  }
  
  saveRDS(features.wg_2, "features_wg_2.rds")
  features.wg_2 <- readRDS("features_wg_2.rds")
  
  # Take out user who didn't participate in all activites
  print(fail)
  '%ni%' <- Negate('%in%')
  features.wg_2 <- features.wg_2 %>% filter(`subject.id` %ni% fail)
  features.wg_2$subject.id <- as.factor(features.wg_2$subject.id)
  
  {# Combine all eating activities ---------------------------------------------------------------
    table(features.wg$activity.label)
    features.wg.eat <- features.wg
    features.wg.eat$activity.label <- features.wg.eat$activity.label %>% fct_collapse("Eating" = c("H","I","J","L"))
    
    features.wg.eat_2 <- features.wg_2
    features.wg.eat_2$activity.label <- features.wg.eat_2$activity.label %>% fct_collapse("Eating" = c("H","I","J","L"))
    
  }
  
  {# Divided by appropriate activities ---------------------------------------------------------------
    divided.wg <- features.wg %>% filter(activity.label == "F" | 
                                           activity.label == "G" |  
                                           activity.label == "H" | 
                                           activity.label == "I" | 
                                           activity.label == "J" |
                                           activity.label == "K" |  
                                           activity.label == "L" |
                                           activity.label == "M" |
                                           activity.label == "O" | 
                                           activity.label == "P" |
                                           activity.label == "Q" |
                                           activity.label == "R" |   
                                           activity.label == "S" )
    divided.wg$activity.label <- factor(divided.wg$activity.label)
    
    divided.wg2 <- features.wg_2 %>% filter(activity.label == "F" | 
                                              activity.label == "G" |  
                                              activity.label == "H" | 
                                              activity.label == "I" | 
                                              activity.label == "J" |
                                              activity.label == "K" |  
                                              activity.label == "L" |
                                              activity.label == "M" |
                                              activity.label == "O" | 
                                              activity.label == "P" |
                                              activity.label == "Q" |
                                              activity.label == "R" |   
                                              activity.label == "S" )
    divided.wg2$activity.label <- factor(divided.wg2$activity.label)
    
    divided.wg.eat <- features.wg.eat %>% filter(activity.label == "F" | 
                                                   activity.label == "G" |  
                                                   activity.label == "Eating" |
                                                   activity.label == "K" |
                                                   activity.label == "M" |
                                                   activity.label == "O" | 
                                                   activity.label == "P" |
                                                   activity.label == "Q" |
                                                   activity.label == "R" |   
                                                   activity.label == "S" )
    divided.wg.eat$subject.id <- factor(divided.wg.eat$subject.id)
    divided.wg.eat$activity.label <- factor(divided.wg.eat$activity.label)
    
    divided.wg.eat_2 <- features.wg.eat_2 %>% filter(activity.label == "F" | 
                                                       activity.label == "G" |  
                                                       activity.label == "Eating" |
                                                       activity.label == "K" |
                                                       activity.label == "M" |
                                                       activity.label == "O" | 
                                                       activity.label == "P" |
                                                       activity.label == "Q" |
                                                       activity.label == "R" |   
                                                       activity.label == "S" )
    divided.wg.eat_2$subject.id <- factor(divided.wg.eat_2$subject.id)
    divided.wg.eat_2$activity.label <- factor(divided.wg.eat_2$activity.label)
  }
  
}


# Check corrplot. Note: These didn't really help
num.cols <- sapply(features, is.numeric)
cor.data <- cor(features[, num.cols])
print(corrplot(cor.data, method = "color", main = "Correlation Matrix Between Extracted Features", mar=c(0,0,1,0))) # Can see a strong correlation between standar deviation and variance



{# Find and plot the moving average for the report ---------------------------------------------------------------
# recall: mult.cols = function(x) rollmean(x, k = 100, fill = NA, align = "right")

# pa2
pa2.ma <- as.data.frame(pa2 %>% group_by(`activity label`, `subject-id`) %>% mutate_each(funs(mult.cols), x, y, z))
pa2 <- pa2 %>% cbind(x_ma = pa2.ma$x, y_ma = pa2.ma$y, z_ma = pa2.ma$z)


## Temporary data frame for graphing purposes
temp <- pa2 %>% filter(`activity label` == "E" & `subject-id` == 1601, timestamp >= 0 & timestamp <= 125)

ma.plot <- ggplot(temp, aes(x = timestamp)) + 
  geom_line(aes(y = x)) + 
  theme_clean() + 
  geom_line(aes(y = x_ma), color = "red") + 
  ggtitle("Subject 1601, Activity E for pa") + 
  theme(plot.title = element_text(size = 24, hjust = 0.5), axis.title.x = element_text(size = 24), axis.title.y = element_text(size = 24))
ggplotly(ma.plot)

# pg2
pg2.ma <- as.data.frame(pg2 %>% group_by(`activity label`, `subject-id`) %>% mutate_each(funs(mult.cols), x, y, z)) + ggtitle("Subject 1601, Activity E (Standing) for Phone Gyroscope")
pg2 <- pg2 %>% cbind(x_ma = pg2.ma$x, y_ma = pg2.ma$y, z_ma = pg2.ma$z)

## Temporary data frame for graphing purposes
temp <- pg2 %>% filter(`activity label` == "E" & `subject-id` == 1601)

ma.plot <- ggplot(temp, aes(x = timestamp)) + geom_line(aes(y = x)) + theme_clean() + geom_line(aes(y = x_ma), color = "red") + ggtitle("Subject 1601, Activity E (Standing) for Phone Gyroscope")
print(ma.plot)

# wa2
wa2.ma <- as.data.frame(wa2 %>% group_by(`activity label`, `subject-id`) %>% mutate_each(funs(mult.cols), x, y, z))
wa2 <- wa2 %>% cbind(x_ma = wa2.ma$x, y_ma = wa2.ma$y, z_ma = wa2.ma$z)

## Temporary data frame for graphing purposes
temp <- wa2 %>% filter(`activity label` == "E" & `subject-id` == 1601)

ma.plot <- ggplot(temp, aes(x = timestamp)) + geom_line(aes(y = x)) + theme_clean() + geom_line(aes(y = x_ma), color = "red") + ggtitle("Subject 1601, Activity E (Standing) for Watch Acceleration")
print(ma.plot)

# wg2
wg2.ma <- as.data.frame(wg2 %>% group_by(`activity label`, `subject-id`) %>% mutate_each(funs(mult.cols), x, y, z))
wg2 <- wg2 %>% cbind(x_ma = wg2.ma$x, y_ma = wg2.ma$y, z_ma = wg2.ma$z)

## Temporary data frame for graphing purposes
temp <- wg2 %>% filter(`activity label` == "E" & `subject-id` == 1601)

ma.plot <- ggplot(temp, aes(x = timestamp)) + geom_line(aes(y = x)) + theme_clean() + geom_line(aes(y = x_ma), color = "red") + ggtitle("Subject 1601, Activity E (Standing) for Watch Gyroscope")
print(ma.plot)

}

# Build a Model -----------------------------------------------------------

seed <- 123

{## Create train and test sets for the models -----------------------------------------------------------

## PA
unicorn <- nrow(features_2) * 0.5
train.pa <- features %>% rbind(features_2[1:unicorn , ]) # First minute and a half
test.pa <- features_2[(unicorn + 1):nrow(features_2), ]  # Second half os second minute to make a 75/25 split

# For when the phone and watch activities are split
unicorn2 <- nrow(divided.pa2) * 0.5
train.pa.divided <- divided.pa %>% rbind(divided.pa2[1:unicorn2, ]) # First minute and a half
test.pa.divided <- divided.pa2[(unicorn2 + 1):nrow(divided.pa2), ]  # Second half os second minute to make a 75/25 split

# For when eating activities are combined
unicorn3 <- nrow(features.eat_2) * 0.5
train.pa.eat <- features.eat %>% rbind(features.eat_2[1:unicorn3 , ]) # First minute and a half
test.pa.eat <- features.eat_2[(unicorn3 + 1):nrow(features.eat_2), ]  # Second half os second minute to make a 75/25 split


## WA
llama <- nrow(features.wa_2) * 0.5
train.wa <- features.wa %>% rbind(features.wa_2[1:llama, ])
test.wa <- features.wa_2[(llama + 1):nrow(features.wa_2), ]

# For when the phone and watch activities are split
llama2 <- nrow(divided.wa2) * 0.5
train.wa.divided <- divided.wa %>% rbind(divided.wa2[1:llama2, ])
test.wa.divided <- divided.wa2[(llama2 + 1):nrow(divided.wa2), ]

# For when eating activities are combined
llama3 <- nrow(features.wa.eat_2) * 0.5
train.wa.eat <- features.wa.eat %>% rbind(features.wa.eat_2[1:llama3 , ]) # First minute and a half
test.wa.eat <- features.wa.eat_2[(llama3 + 1):nrow(features.wa.eat_2), ]  # Second half os second minute to make a 75/25 split

# For when eating activities are combined and phone and watch activities are split
llama4 <- nrow(divided.wa.eat_2) * 0.5
train.wa.divided.eat <- divided.wa.eat %>% rbind(divided.wa.eat_2[1:llama4 , ]) # First minute and a half
test.wa.divided.eat <- divided.wa.eat_2[(llama4 + 1):nrow(divided.wa.eat_2), ]  # Second half os second minute to make a 75/25 split


## PG
monkey <- nrow(features.pg_2) * 0.5
train.pg <- features.pg %>% rbind(features.pg_2[1:monkey , ]) # First minute and a half
test.pg <- features.pg_2[(monkey + 1):nrow(features.pg_2), ]  # Second half os second minute to make a 75/25 split

# For when the phone and watch activities are split
monkey2 <- nrow(divided.pg2) * 0.5
train.pg.divided <- divided.pg %>% rbind(divided.pg2[1:monkey2, ]) # First minute and a half
test.pg.divided <- divided.pg2[(monkey2 + 1):nrow(divided.pg2), ]  # Second half os second minute to make a 75/25 split

# For when eating activities are combined
monkey3 <- nrow(features.pg.eat_2) * 0.5
train.pg.eat <- features.pg.eat %>% rbind(features.pg.eat_2[1:monkey3 , ]) # First minute and a half
test.pg.eat <- features.pg.eat_2[(monkey3 + 1):nrow(features.pg.eat_2), ]  # Second half os second minute to make a 75/25 split


## WG
racoon <- nrow(features.wg_2) * 0.5
train.wg <- features.wg %>% rbind(features.wg_2[1:racoon, ])
test.wg <- features.wg_2[(racoon + 1):nrow(features.wg_2), ]

# For when the phone and watch activities are split
racoon2 <- nrow(divided.wg2) * 0.5
train.wg.divided <- divided.wg %>% rbind(divided.wg2[1:racoon2, ])
test.wg.divided <- divided.wg2[(racoon2 + 1):nrow(divided.wg2), ]

# For when eating activities are combined
racoon3 <- nrow(features.wg.eat_2) * 0.5
train.wg.eat <- features.wg.eat %>% rbind(features.wg.eat_2[1:racoon3 , ]) # First minute and a half
test.wg.eat <- features.wg.eat_2[(racoon3 + 1):nrow(features.wg.eat_2), ]  # Second half os second minute to make a 75/25 split

# For when eating activities are combined and phone and watch activities are split
racoon4 <- nrow(divided.wg.eat_2) * 0.5
train.wg.divided.eat <- divided.wg.eat %>% rbind(divided.wg.eat_2[1:racoon4 , ]) # First minute and a half
test.wg.divided.eat <- divided.wg.eat_2[(racoon4 + 1):nrow(divided.wg.eat_2), ]  # Second half os second minute to make a 75/25 split


}

{## Create a model for pa -----------------------------------------------------------
  
  {# Random forest model-----------------------------------------------------------
    
    # First forest - all activities
    set.seed(seed)
    rf1.pa <- randomForest(`activity.label` ~ . -x_var - y_var - z_var, data = train.pa, importance = TRUE, proximity = TRUE)
    print(rf1.pa)
    
    set.seed(seed)
    pred1.pa <- predict(rf1.pa, test.pa)
    cm1.pa <- confusionMatrix(pred1.pa, test.pa$activity.label) # 81.03 percent accuracy. CI (0.7985, 0.8217)
    # can see that the eating categories are killing me because their sensitivity is a little too low! I can try a model that lumps them together
    
    plot(rf1.pa) # Cut off at 300 trees
    tune1.pa <- tuneRF(train.pa[, -2], train.pa[, 2], stepfactor = 1, ntreeTry = 300, trace = TRUE, improve = .05) # mtry of 4 is good!
    
    varImpPlot(rf1.pa, main = "Variable Importance Plot") # Keep them all!!!
    

    # Second forest - all activities tuned
    set.seed(seed)
    rf2.pa <- randomForest(`activity.label` ~ . -x_var - y_var - z_var, data = train.pa, importance = TRUE, proximity = TRUE, ntree= 300, mtry = 4)
    print(rf2.pa)
    
    set.seed(seed)
    pred2.pa <- predict(rf2.pa, test.pa)
    cm2.pa <- confusionMatrix(pred2.pa, test.pa$activity.label) # Accuracy of 80.54% which is slightly worse Confidence interval: (0.7935, 0.8169)
    
    varImpPlot(rf2.pa)
    partialPlot(rf2.pa, train.pa, y_mean)
  
    
    ## Third Forest, only predicting the activities where phone is of importance!
    set.seed(seed)
    rf3.pa <- randomForest(`activity.label` ~ . -x_var - y_var - z_var, data = train.pa.divided, importance = TRUE, proximity = TRUE)
    print(rf3.pa)
    
    set.seed(seed)
    pred3.pa <- predict(rf3.pa, test.pa.divided)
    cm3.pa <- confusionMatrix(pred3.pa, test.pa.divided$activity.label) # 95.55% accuracy for these activities!! Confidence interval (0.9425, 0.9663)
    
    varImpPlot(rf3.pa, main = "Variable Importance Plot")
    
    plot(rf3.pa)  # Cut off around 275 trees
    set.seed(seed)
    tune3.pa <- tuneRF(train.pa.divided[, -2], train.pa.divided[, 2], stepfactor = 1, ntreeTry = 275, trace = TRUE, improve = .05)
    # can see mtry = 2 is better
    
    
    # Fourth Forest, tuned only predicting the activities where phone is of importance tuned
    set.seed(seed)
    rf4.pa <- randomForest(`activity.label` ~ . -x_var - y_var - z_var, data = train.pa.divided, importance = TRUE, proximity = TRUE, ntree= 275, mtry = 2)
    print(rf4.pa)
    
    set.seed(seed)
    pred4.pa <- predict(rf4.pa, test.pa.divided)
    cm4.pa <- confusionMatrix(pred4.pa, test.pa.divided$activity.label) # 95.80% accuracy! Confidence interval (0.9452, 0.9684)

    varImpPlot(rf4.pa)    
    
    
    # Fifth Forest - all activities where eating activities are combined
    set.seed(seed)
    rf5.pa <- randomForest(`activity.label` ~ . -x_var - y_var - z_var, data = train.pa.eat, importance = TRUE, proximity = TRUE)
    print(rf5.pa)
    
    set.seed(seed)
    pred5.pa <- predict(rf5.pa, test.pa.eat)
    cm5.pa <- confusionMatrix(pred5.pa, test.pa.eat$activity.label) # 84.06% with CI (0.8295, 0.8513)
    
    varImpPlot(rf5.pa)
    
    plot(rf5.pa) # Cut at 300
    tune5.pa <- tuneRF(train.pa.eat[, -2], train.pa.eat[, 2], stepfactor = 1, ntreeTry = 300, trace = TRUE, improve = .05)
    # mtry = 2 is best
    
    
    # Sixth Forest - all activities where eating activities are combined and tuned
    set.seed(seed)
    rf6.pa <- randomForest(`activity.label` ~ . -x_var - y_var - z_var, data = train.pa.eat, importance = TRUE, proximity = TRUE, mtry = 2, ntree = 300)
    print(rf6.pa)
    
    set.seed(seed)
    pred6.pa <- predict(rf6.pa, test.pa.eat)
    cm6.pa <- confusionMatrix(pred6.pa, test.pa.eat$activity.label) # 84.13% with CI (0.8302, 0.8519)
    
    varImpPlot(rf6.pa)
    
    
    # Seventh Forest - activities considering only the phone activities with eating activities combined
    # Note: same as the 3rd and 4th forest so not done
    
    # Eigth forest - activities considering only the phone activities with eating activities combined and tuned
    # Note: not done because seventh forest not done
  }
  
}

{## Create a model for wa -----------------------------------------------------------

  # First Forest - all activities
  set.seed(seed)
  rf1.wa <- randomForest(`activity.label` ~ . -x_var - y_var - z_var, data = train.wa, importance = TRUE, proximity = TRUE)
  print(rf1.wa)
  
  set.seed(seed)
  pred1.wa <- predict(rf1.wa, test.wa)
  cm1.wa <- confusionMatrix(pred1.wa, test.wa$activity.label) ## 83.16% accuracy! With confidence interval (0.8202, 0.8425)
  # Can see that the activities that are killin me this time are ones where looking at the phone would likely be better
  
  plot(rf1.wa) # can cut off around say 300 trees
  tune1.wa <- tuneRF(train.wa[, -2], train.wa[, 2], stepfactor = 1, ntreeTry = 350, trace = TRUE, improve = .05)
  # can see mtry = 8 is best
  
  varImpPlot(rf1.wa) # All of importance
  
  
  # Second Forest - all activities tuned
  set.seed(seed)
  rf2.wa <- randomForest(`activity.label` ~ . -x_var - y_var - z_var, data = train.wa, importance = TRUE, proximity = TRUE, ntree= 350, mtry = 8)
  print(rf2.wa)
  
  set.seed(seed)
  pred2.wa <- predict(rf2.wa, test.wa)
  cm2.wa <- confusionMatrix(pred2.wa, test.wa$activity.label) #  83.59% accuracy and a confidence interval (0.8246, 0.8466)
  
  varImpPlot(rf2.wa)
  
  
  # Third Forest, only predicting the activities where watch is of importance!
  set.seed(seed)
  rf3.wa <- randomForest(`activity.label` ~ . -x_var - y_var - z_var, data = train.wa.divided, importance = TRUE, proximity = TRUE)
  print(rf3.wa) # Can see that the different eating activities are extremely hard to distinguish. 
  
  set.seed(seed)
  pred3.wa <- predict(rf3.wa, test.wa.divided)
  cm3.wa <- confusionMatrix(pred3.wa, test.wa.divided$activity.label) # 84.87 percent accuray  CI (0.8358, 0.8609)
  
  varImpPlot(rf3.wa)
  
  plot(rf3.wa) # cut off at 325 trees
  tune3.wa <- tuneRF(train.wa.divided[, -2], train.wa.divided[, 2], stepfactor = 1, ntreeTry = 325, trace = TRUE, improve = .05)
  # Can see mtry = 8 is better
  
  
  # Fourth Forest, tuned only predicting the activities where watch is of importance tuned
  set.seed(seed)
  rf4.wa <- randomForest(`activity.label` ~ . -x_var - y_var - z_var, data = train.wa.divided, importance = TRUE, proximity = TRUE, ntree = 325, mtry = 8)
  print(rf4.wa)
  
  set.seed(seed)
  pred4.wa <- predict(rf4.wa, test.wa.divided)
  cm4.wa <- confusionMatrix(pred4.wa, test.wa.divided$activity.label) # 83.99% with confidence interval (0.8267, 0.8525)
  
  
  # Fifth Forest - all activities where eating activities are combined
  set.seed(seed)
  rf5.wa <- randomForest(`activity.label` ~ . -x_var - y_var - z_var, data = train.wa.eat, importance = TRUE, proximity = TRUE)
  print(rf5.wa)
  
  set.seed(seed)
  pred5.wa <- predict(rf5.wa, test.wa.eat)
  cm5.wa <- confusionMatrix(pred5.wa, test.wa.eat$activity.label) # 86.81% with CI (0.8578, 0.8779)
  
  varImpPlot(rf5.wa) # All important
  
  plot(rf5.wa) # cut off at 275 trees
  tune5.wa <- tuneRF(train.wa.eat[, -2], train.wa.eat[, 2], stepfactor = 1, ntreeTry = 275, trace = TRUE, improve = .05)
  # Can see mytry = 8 is best
  
  
  # Sixth Forest - all activities where eating activities are combined tuned
  set.seed(seed)
  rf6.wa <- randomForest(`activity.label` ~ . -x_var - y_var - z_var, data = train.wa.eat, importance = TRUE, proximity = TRUE, mtry = 8, ntree = 275)
  print(rf6.wa)
  
  set.seed(seed)
  pred6.wa <- predict(rf6.wa, test.wa.eat)
  cm6.wa <- confusionMatrix(pred6.wa, test.wa.eat$activity.label) # 86.90% with CI (0.8587, 0.8788)
  
  varImpPlot(rf6.wa)
  
  
  # Seventh Forest - activities considering only the watch activities with eating activities combined
  set.seed(seed)
  rf7.wa <- randomForest(`activity.label` ~ . -x_var - y_var - z_var, data = train.wa.divided.eat, importance = TRUE, proximity = TRUE)
  print(rf7.wa)
  
  set.seed(seed)
  pred7.wa <- predict(rf7.wa, test.wa.divided.eat)
  cm7.wa <- confusionMatrix(pred7.wa, test.wa.divided.eat$activity.label) # 89.56 percent accuracy with confidence interval (0.8844, 0.906)
  
  plot(rf7.wa) # cut around 250 trees
  tune7.wa <- tuneRF(train.wa.divided.eat[, -2], train.wa.divided.eat[, 2], stepfactor = 1, ntreeTry = 250, trace = TRUE, improve = .05)
  # mtry = 8 is good
  
  
  # Eigth forest - activities considering only the phone activities with eating activities combined and tuned
  set.seed(seed)
  rf8.wa <- randomForest(`activity.label` ~ . -x_var - y_var - z_var, data = train.wa.divided.eat, importance = TRUE, proximity = TRUE, ntree = 250, mtry = 8)
  print(rf8.wa)
  
  set.seed(seed)
  pred8.wa <- predict(rf8.wa, test.wa.divided.eat)
  cm8.wa <- confusionMatrix(pred8.wa, test.wa.divided.eat$activity.label) # 89.24% accuracy with CI (0.8812, 0.903)
  
  
}
  
{## Create a model for pg -----------------------------------------------------------
  
  {# Random forest model-----------------------------------------------------------
    
    # First forest
    set.seed(seed)
    rf1.pg <- randomForest(`activity.label` ~ . -x_var - y_var - z_var, data = train.pg, importance = TRUE, proximity = TRUE)
    print(rf1.pg)
    
    set.seed(seed)
    pred1.pg <- predict(rf1.pg, test.pg)
    cm1.pg <- confusionMatrix(pred1.pg, test.pg$activity.label) # 58.44 percent accuracy... which is simply horrible. CI (0.5697, 0.5989)

    plot(rf1.pg) # Cut around 350 trees
    varImpPlot(rf1.pg) # Keep them al!!!
    
    tune1.pg <- tuneRF(train.pg[, -2], train.pg[, 2], stepfactor = 1, ntreeTry = 350, trace = TRUE, improve = .05)
    # mtry = 8 is better
    
    
    # Second forest
    set.seed(seed)
    rf2.pg <- randomForest(`activity.label` ~ . -x_var - y_var - z_var, data = train.pg, importance = TRUE, proximity = TRUE, ntree= 350, mtry = 8)
    print(rf2.pg)
    
    set.seed(seed)
    pred2.pg <- predict(rf2.pg, test.pg)
    cm2.pg <- confusionMatrix(pred2.pg, test.pg$activity.label) # 60.04 with CI (0.5858, 0.6148)
    
    varImpPlot(rf2.pg)
    
    
    ## Third Forest, only predicting the activities where phone is of importance!
    set.seed(seed)
    rf3.pg <- randomForest(`activity.label` ~ . -x_var - y_var - z_var, data = train.pg.divided, importance = TRUE, proximity = TRUE)
    print(rf3.pg)
    
    set.seed(seed)
    pred3.pg <- predict(rf3.pg, test.pg.divided)
    cm3.pg <- confusionMatrix(pred3.pg, test.pg.divided$activity.label) # 89.65% accuracy for these activities!! Confidence interval (0.8782, 0.9129)
    
    varImpPlot(rf3.pg)
    
    plot(rf3.pg)  # Cut off around 350 trees
    tune3.pg <- tuneRF(train.pg.divided[, -2], train.pg.divided[, 2], stepfactor = 1, ntreeTry = 350, trace = TRUE, improve = .05)
    # can see mtry = 8 is better
    
    
    # Fourth Forest, tuned only predicting the activities where phone is of importance
    set.seed(seed)
    rf4.pg <- randomForest(`activity.label` ~ . -x_var - y_var - z_var, data = train.pg.divided, importance = TRUE, proximity = TRUE, ntree= 350, mtry = 8)
    print(rf4.pg)
    
    set.seed(seed)
    pred4.pg <- predict(rf4.pg, test.pg.divided)
    cm4.pg <- confusionMatrix(pred4.pg, test.pg.divided$activity.label) # 87.95% which actually went down interval (0.8601, 0.8972)
    
    varImpPlot(rf4.pg)    
    
    
    # Fifth Forest - all activities where eating activities are combined
    set.seed(seed)
    rf5.pg <- randomForest(`activity.label` ~ . -x_var - y_var - z_var, data = train.pg.eat, importance = TRUE, proximity = TRUE)
    print(rf5.pg)
    
    set.seed(seed)
    pred5.pg <- predict(rf5.pg, test.pg.eat)
    cm5.pg <- confusionMatrix(pred5.pg, test.pg.eat$activity.label) # 65.86% with CI (0.6445, 0.6726)
    
    varImpPlot(rf5.pg) # All important
    
    plot(rf5.pg) # cut off at 300 trees
    tune5.pg <- tuneRF(train.pg.eat[, -2], train.pg.eat[, 2], stepfactor = 1, ntreeTry = 300, trace = TRUE, improve = .05)
    # Can see mytry = 16 is best
    
    
    # Sixth Forest - all activities where eating activities are combined and tuned
    set.seed(seed)
    rf6.pg <- randomForest(`activity.label` ~ . -x_var - y_var - z_var, data = train.pg.eat, importance = TRUE, proximity = TRUE, mtry = 16, ntree = 300)
    print(rf6.pg)
    
    set.seed(seed)
    pred6.pg <- predict(rf6.pg, test.pg.eat)
    cm6.pg <- confusionMatrix(pred6.pg, test.pg.eat$activity.label) # 65.89% with CI (0.6447, 0.6728)
    
    varImpPlot(rf6.pg)
    
    
    # Seventh Forest - activities considering only the phone activities with eating activities combined
    # Note: same as the 3rd and 4th forest so not done
    
    # Eigth forest - activities considering only the phone activities with eating activities combined and tuned
    # Note: not done because seventh forest not done
    
  }
  
}
  
{## Create a model for wg -----------------------------------------------------------
  
  # First Forest - all activities
  set.seed(seed)
  rf1.wg <- randomForest(`activity.label` ~ . -x_var - y_var - z_var, data = train.wg, importance = TRUE, proximity = TRUE)
  print(rf1.wg)
  
  set.seed(seed)
  pred1.wg <- predict(rf1.wg, test.wg)
  cm1.wg <- confusionMatrix(pred1.wg, test.wg$activity.label) # 67.3% accuracy! With confidence interval (0.6589, 0.6868)
  # Can see that the activities that are killin me this time are ones where looking at the phone would likely be better
  
  plot(rf1.wg) # can cut off around say 250 trees
  tune1.wg <- tuneRF(train.wg[, -2], train.wg[, 2], stepfactor = 1, ntreeTry = 250, trace = TRUE, improve = .05)
  # can see mtry = 8 is best
  
  varImpPlot(rf1.wg) # All of importance
  
  
  # Second Forest - all activities tuned
  set.seed(seed)
  rf2.wg <- randomForest(`activity.label` ~ . -x_var - y_var - z_var, data = train.wg, importance = TRUE, proximity = TRUE, ntree= 250, mtry = 8)
  print(rf2.wg)
  
  set.seed(seed)
  pred2.wg <- predict(rf2.wg, test.wg)
  cm2.wg <- confusionMatrix(pred2.wg, test.wg$activity.label) # 68.46 with CI (0.6706, 0.6982)
  
  varImpPlot(rf2.wg)
  
  
  # Third Forest, only predicting the activities where watch is of importance!
  set.seed(seed)
  rf3.wg <- randomForest(`activity.label` ~ . -x_var - y_var - z_var, data = train.wg.divided, importance = TRUE, proximity = TRUE)
  print(rf3.wg) # Can see that the different eating activities are extremely hard to distinguish. 
  
  set.seed(seed)
  pred3.wg <- predict(rf3.wg, test.wg.divided)
  cm3.wg <- confusionMatrix(pred3.wg, test.wg.divided$activity.label) # 69.86% accuracy CI (0.6823, 0.7145)
  
  varImpPlot(rf3.wg)
  
  plot(rf3.wg) # cut off at 325 trees
  tune3.wg <- tuneRF(train.wg.divided[, -2], train.wg.divided[, 2], stepfactor = 1, ntreeTry = 325, trace = TRUE, improve = .05)
  # Can see mtry = 8 is better
  
  
  # Fourth Forest, tuned only predicting the activities where watch is of importance tuned
  set.seed(seed)
  rf4.wg <- randomForest(`activity.label` ~ . -x_var - y_var - z_var, data = train.wg.divided, importance = TRUE, proximity = TRUE, ntree = 325, mtry = 8)
  print(rf4.wg)
  
  set.seed(seed)
  pred4.wg <- predict(rf4.wg, test.wg.divided)
  cm4.wg <- confusionMatrix(pred4.wg, test.wg.divided$activity.label) # Still only 70.89% with confidence interval (0.6928, 0.7246)
  
  
  # Fifth Forest - all activities where eating activities are combined
  set.seed(seed)
  rf5.wg <- randomForest(`activity.label` ~ . -x_var - y_var - z_var, data = train.wg.eat, importance = TRUE, proximity = TRUE)
  print(rf5.wg)
  
  set.seed(seed)
  pred5.wg <- predict(rf5.wg, test.wg.eat)
  cm5.wg <- confusionMatrix(pred5.wg, test.wg.eat$activity.label) # 73.60% with CI (0.7227, 0.7489)
  
  varImpPlot(rf5.wg) # All important
  
  plot(rf5.wg) # cut off at 300 trees
  tune5.wg <- tuneRF(train.wg.eat[, -2], train.wg.eat[, 2], stepfactor = 1, ntreeTry = 300, trace = TRUE, improve = .05)
  # Can see mytry = 8 is best
  
  
  # Sixth Forest - all activities where eating activities are combined tuned
  set.seed(seed)
  rf6.wg <- randomForest(`activity.label` ~ . -x_var - y_var - z_var, data = train.wg.eat, importance = TRUE, proximity = TRUE, mtry = 8, ntree = 300)
  print(rf6.wg)
  
  set.seed(seed)
  pred6.wg <- predict(rf6.wg, test.wg.eat)
  cm6.wg <- confusionMatrix(pred6.wg, test.wg.eat$activity.label) # 74.41% with CI (0.731, 0.7569)
  
  varImpPlot(rf6.wg)
  
  
  # Seventh Forest - activities considering only the watch activities with eating activities combined
  set.seed(seed)
  rf7.wg <- randomForest(`activity.label` ~ .-x_var - y_var - z_var, data = train.wg.divided.eat, importance = TRUE, proximity = TRUE)
  print(rf7.wg)
  
  set.seed(seed)
  pred7.wg <- predict(rf7.wg, test.wg.divided.eat)
  cm7.wg <- confusionMatrix(pred7.wg, test.wg.divided.eat$activity.label) # 78.59 percent accuracy with confidence interval (0.7713, 0.8)
  
  plot(rf7.wg) # cut around 250 trees
  tune7.wg <- tuneRF(train.wg.divided.eat[, -2], train.wg.divided.eat[, 2], stepfactor = 1, ntreeTry = 250, trace = TRUE, improve = .05)
  # can see mtry = 8 is better
  
  
  # Eigth forest - activities considering only the phone activities with eating activities combined and tuned
  set.seed(seed)
  rf8.wg <- randomForest(`activity.label` ~ . -x_var - y_var - z_var, data = train.wg.divided.eat, importance = TRUE, proximity = TRUE, ntree = 250, mtry = 8)
  print(rf8.wg)
  
  set.seed(seed)
  pred8.wg <- predict(rf8.wg, test.wg.divided.eat)
  cm8.wg <- confusionMatrix(pred8.wg, test.wg.divided.eat$activity.label) # 79.44% accuracy with CI (0.7799, 0.8083)
  
  
}







