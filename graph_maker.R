## This is the code used to make all of the graphs
# Note: The workspace from main must be loaded in order for this script to run porperly

# create time graphs for every user, every activity (ONLY RUN THIS ONCE)  ------------------------------------------------------

{# Phone Acceleration ---------------------------------------------------------------
  
  {# walking (A) ----------------------------------------------------------------
    # X
    for (i in 1:51){
      temp <- pa %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "A")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = x)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("pa_time_x_walking", i, ".jpg"), device = "jpeg", path = "plots/phone_acc/time/walking/x", height = 7, width = 15, units = "in")
    }
    # Y
    for (i in 1:51){
      temp <- pa %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "A")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = y)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("pa_time_y_walking", i, ".jpg"), device = "jpeg", path = "plots/phone_acc/time/walking/y", height = 7, width = 15, units = "in")
    }
    # Z
    for (i in 1:51){
      temp <- pa %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "A")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = z)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("pa_time_z_walking", i, ".jpg"), device = "jpeg", path = "plots/phone_acc/time/walking/z", height = 7, width = 15, units = "in")
    }
  }
  
  {# jogging (B) ----------------------------------------------------------------
    
    #X
    for (i in 1:51){
      temp <- pa %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "B")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = x)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("pa_time_x_jogging", i, ".jpg"), device = "jpeg", path = "plots/phone_acc/time/jogging/x", height = 7, width = 15, units = "in")
    }
    # Y
    for (i in 1:51){
      temp <- pa %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "B")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = y)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("pa_time_y_jogging", i, ".jpg"), device = "jpeg", path = "plots/phone_acc/time/jogging/y", height = 7, width = 15, units = "in")
    }
    # Z
    for (i in 1:51){
      temp <- pa %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "B")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = z)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("pa_time_z_jogging", i, ".jpg"), device = "jpeg", path = "plots/phone_acc/time/jogging/z", height = 7, width = 15, units = "in")
    }
    
  }
  
  {# stairs (C) ----------------------------------------------------------------
    
    # X
    for (i in 1:51){
      temp <- pa %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "C")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = x)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("pa_time_x_stairs", i, ".jpg"), device = "jpeg", path = "plots/phone_acc/time/stairs/x", height = 7, width = 15, units = "in")
    }
    # Y
    for (i in 1:51){
      temp <- pa %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "C")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = y)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("pa_time_y_stairs", i, ".jpg"), device = "jpeg", path = "plots/phone_acc/time/stairs/y", height = 7, width = 15, units = "in")
    }
    # Z
    for (i in 1:51){
      temp <- pa %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "C")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = z)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("pa_time_z_stairs", i, ".jpg"), device = "jpeg", path = "plots/phone_acc/time/stairs/z", height = 7, width = 15, units = "in")
    }
    
  }
  
  {# sitting (D) ----------------------------------------------------------------
    
    # X
    for (i in 1:51){
      temp <- pa %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "D")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = x)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("pa_time_x_sitting", i, ".jpg"), device = "jpeg", path = "plots/phone_acc/time/sitting/x", height = 7, width = 15, units = "in")
    }
    # Y
    for (i in 1:51){
      temp <- pa %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "D")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = y)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("pa_time_y_sitting", i, ".jpg"), device = "jpeg", path = "plots/phone_acc/time/sitting/y", height = 7, width = 15, units = "in")
    }
    # Z
    for (i in 1:51){
      temp <- pa %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "D")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = z)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("pa_time_z_sitting", i, ".jpg"), device = "jpeg", path = "plots/phone_acc/time/sitting/z", height = 7, width = 15, units = "in")
    }
    
  }
  
  {# standing (E) ----------------------------------------------------------------
    
    # X
    for (i in 1:51){
      temp <- pa %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "E")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = x)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("pa_time_x_standing", i, ".jpg"), device = "jpeg", path = "plots/phone_acc/time/standing/x", height = 7, width = 15, units = "in")
    }
    # Y
    for (i in 1:51){
      temp <- pa %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "E")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = y)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("pa_time_y_standing", i, ".jpg"), device = "jpeg", path = "plots/phone_acc/time/standing/y", height = 7, width = 15, units = "in")
    }
    # Z
    for (i in 1:51){
      temp <- pa %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "E")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = z)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("pa_time_z_standing", i, ".jpg"), device = "jpeg", path = "plots/phone_acc/time/standing/z", height = 7, width = 15, units = "in")
    }
    
  }
  
  {# typing (F) ----------------------------------------------------------------
    
    # X
    for (i in 1:51){
      temp <- pa %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "F")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = x)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("pa_time_x_typing", i, ".jpg"), device = "jpeg", path = "plots/phone_acc/time/typing/x", height = 7, width = 15, units = "in")
    }
    # Y
    for (i in 1:51){
      temp <- pa %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "F")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = y)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("pa_time_y_typing", i, ".jpg"), device = "jpeg", path = "plots/phone_acc/time/typing/y", height = 7, width = 15, units = "in")
    }
    # Z
    for (i in 1:51){
      temp <- pa %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "F")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = z)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("pa_time_z_typing", i, ".jpg"), device = "jpeg", path = "plots/phone_acc/time/typing/z", height = 7, width = 15, units = "in")
    }
    
  }
  
  {# teeth (G) ----------------------------------------------------------------
    
    # X
    for (i in 1:51){
      temp <- pa %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "G")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = x)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("pa_time_x_teeth", i, ".jpg"), device = "jpeg", path = "plots/phone_acc/time/teeth/x", height = 7, width = 15, units = "in")
    }
    # Y
    for (i in 1:51){
      temp <- pa %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "G")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = y)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("pa_time_y_teeth", i, ".jpg"), device = "jpeg", path = "plots/phone_acc/time/teeth/y", height = 7, width = 15, units = "in")
    }
    # Z
    for (i in 1:51){
      temp <- pa %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "G")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = z)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("pa_time_z_teeth", i, ".jpg"), device = "jpeg", path = "plots/phone_acc/time/teeth/z", height = 7, width = 15, units = "in")
    }
    
  }
  
  {# soup (H) ----------------------------------------------------------------
    
    # X
    for (i in 1:51){
      temp <- pa %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "H")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = x)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("pa_time_x_soup", i, ".jpg"), device = "jpeg", path = "plots/phone_acc/time/soup/x", height = 7, width = 15, units = "in")
    }
    # Y
    for (i in 1:51){
      temp <- pa %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "H")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = y)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("pa_time_y_soup", i, ".jpg"), device = "jpeg", path = "plots/phone_acc/time/soup/y", height = 7, width = 15, units = "in")
    }
    # Z
    for (i in 1:51){
      temp <- pa %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "H")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = z)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("pa_time_z_soup", i, ".jpg"), device = "jpeg", path = "plots/phone_acc/time/soup/z", height = 7, width = 15, units = "in")
    }
    
  }
  
  {# chips (I) ----------------------------------------------------------------
    
    # X
    for (i in 1:51){
      temp <- pa %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "I")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = x)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("pa_time_x_chips", i, ".jpg"), device = "jpeg", path = "plots/phone_acc/time/chips/x", height = 7, width = 15, units = "in")
    }
    # Y
    for (i in 1:51){
      temp <- pa %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "I")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = y)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("pa_time_y_chips", i, ".jpg"), device = "jpeg", path = "plots/phone_acc/time/chips/y", height = 7, width = 15, units = "in")
    }
    # Z
    for (i in 1:51){
      temp <- pa %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "I")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = z)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("pa_time_z_chips", i, ".jpg"), device = "jpeg", path = "plots/phone_acc/time/chips/z", height = 7, width = 15, units = "in")
    }
    
  }
  
  {# pasta (J) ----------------------------------------------------------------
    
    # X
    for (i in 1:51){
      temp <- pa %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "J")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = x)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("pa_time_x_pasta", i, ".jpg"), device = "jpeg", path = "plots/phone_acc/time/pasta/x", height = 7, width = 15, units = "in")
    }
    # Y
    for (i in 1:51){
      temp <- pa %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "J")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = y)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("pa_time_y_pasta", i, ".jpg"), device = "jpeg", path = "plots/phone_acc/time/pasta/y", height = 7, width = 15, units = "in")
    }
    # Z
    for (i in 1:51){
      temp <- pa %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "J")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = z)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("pa_time_z_pasta", i, ".jpg"), device = "jpeg", path = "plots/phone_acc/time/pasta/z", height = 7, width = 15, units = "in")
    }
    
  }
  
  {# drinking (K) ----------------------------------------------------------------
    
    # X
    for (i in 1:51){
      temp <- pa %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "K")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = x)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("pa_time_x_drinking", i, ".jpg"), device = "jpeg", path = "plots/phone_acc/time/drinking/x", height = 7, width = 15, units = "in")
    }
    # Y
    for (i in 1:51){
      temp <- pa %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "K")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = y)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("pa_time_y_drinking", i, ".jpg"), device = "jpeg", path = "plots/phone_acc/time/drinking/y", height = 7, width = 15, units = "in")
    }
    # Z
    for (i in 1:51){
      temp <- pa %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "K")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = z)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("pa_time_z_drinking", i, ".jpg"), device = "jpeg", path = "plots/phone_acc/time/drinking/z", height = 7, width = 15, units = "in")
    }
    
  }
  
  {# sandwich (L) ----------------------------------------------------------------
    
    # X
    for (i in 1:51){
      temp <- pa %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "L")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = x)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("pa_time_x_sandwich", i, ".jpg"), device = "jpeg", path = "plots/phone_acc/time/sandwich/x", height = 7, width = 15, units = "in")
    }
    # Y
    for (i in 1:51){
      temp <- pa %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "L")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = y)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("pa_time_y_sandwich", i, ".jpg"), device = "jpeg", path = "plots/phone_acc/time/sandwich/y", height = 7, width = 15, units = "in")
    }
    # Z
    for (i in 1:51){
      temp <- pa %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "L")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = z)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("pa_time_z_sandwich", i, ".jpg"), device = "jpeg", path = "plots/phone_acc/time/sandwich/z", height = 7, width = 15, units = "in")
    }
    
  }
  
  {# kicking (M) ----------------------------------------------------------------
    
    # X
    for (i in 1:51){
      temp <- pa %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "M")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = x)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("pa_time_x_kicking", i, ".jpg"), device = "jpeg", path = "plots/phone_acc/time/kicking/x", height = 7, width = 15, units = "in")
    }
    # Y
    for (i in 1:51){
      temp <- pa %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "M")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = y)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("pa_time_y_kicking", i, ".jpg"), device = "jpeg", path = "plots/phone_acc/time/kicking/y", height = 7, width = 15, units = "in")
    }
    # Z
    for (i in 1:51){
      temp <- pa %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "M")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = z)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("pa_time_z_kicking", i, ".jpg"), device = "jpeg", path = "plots/phone_acc/time/kicking/z", height = 7, width = 15, units = "in")
    }
    
  }
  
  {# catch (O) ----------------------------------------------------------------
    
    # X
    for (i in 1:51){
      temp <- pa %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "O")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = x)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("pa_time_x_catch", i, ".jpg"), device = "jpeg", path = "plots/phone_acc/time/catch/x", height = 7, width = 15, units = "in")
    }
    # Y
    for (i in 1:51){
      temp <- pa %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "O")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = y)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("pa_time_y_catch", i, ".jpg"), device = "jpeg", path = "plots/phone_acc/time/catch/y", height = 7, width = 15, units = "in")
    }
    # Z
    for (i in 1:51){
      temp <- pa %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "O")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = z)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("pa_time_z_catch", i, ".jpg"), device = "jpeg", path = "plots/phone_acc/time/catch/z", height = 7, width = 15, units = "in")
    }
    
  }
  
  {# dribbling (P) ----------------------------------------------------------------
    
    # X
    for (i in 1:51){
      temp <- pa %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "P")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = x)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("pa_time_x_dribbling", i, ".jpg"), device = "jpeg", path = "plots/phone_acc/time/dribbling/x", height = 7, width = 15, units = "in")
    }
    # Y
    for (i in 1:51){
      temp <- pa %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "P")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = y)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("pa_time_y_dribbling", i, ".jpg"), device = "jpeg", path = "plots/phone_acc/time/dribbling/y", height = 7, width = 15, units = "in")
    }
    # Z
    for (i in 1:51){
      temp <- pa %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "P")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = z)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("pa_time_z_dribbling", i, ".jpg"), device = "jpeg", path = "plots/phone_acc/time/dribbling/z", height = 7, width = 15, units = "in")
    }
    
  }
  
  {# writing (Q) ----------------------------------------------------------------
    
    # X
    for (i in 1:51){
      temp <- pa %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "Q")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = x)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("pa_time_x_writing", i, ".jpg"), device = "jpeg", path = "plots/phone_acc/time/writing/x", height = 7, width = 15, units = "in")
    }
    # Y
    for (i in 1:51){
      temp <- pa %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "Q")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = y)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("pa_time_y_writing", i, ".jpg"), device = "jpeg", path = "plots/phone_acc/time/writing/y", height = 7, width = 15, units = "in")
    }
    # Z
    for (i in 1:51){
      temp <- pa %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "Q")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = z)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("pa_time_z_writing", i, ".jpg"), device = "jpeg", path = "plots/phone_acc/time/writing/z", height = 7, width = 15, units = "in")
    }
    
  }
  
  {# clapping (R) ----------------------------------------------------------------
    
    # X
    for (i in 1:51){
      temp <- pa %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "R")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = x)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("pa_time_x_clapping", i, ".jpg"), device = "jpeg", path = "plots/phone_acc/time/clapping/x", height = 7, width = 15, units = "in")
    }
    # Y
    for (i in 1:51){
      temp <- pa %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "R")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = y)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("pa_time_y_clapping", i, ".jpg"), device = "jpeg", path = "plots/phone_acc/time/clapping/y", height = 7, width = 15, units = "in")
    }
    # Z
    for (i in 1:51){
      temp <- pa %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "R")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = z)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("pa_time_z_clapping", i, ".jpg"), device = "jpeg", path = "plots/phone_acc/time/clapping/z", height = 7, width = 15, units = "in")
    }
    
  }
  
  {# folding (S) ----------------------------------------------------------------
    
    # X
    for (i in 1:51){
      temp <- pa %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "S")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = x)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("pa_time_x_folding", i, ".jpg"), device = "jpeg", path = "plots/phone_acc/time/folding/x", height = 7, width = 15, units = "in")
    }
    # Y
    for (i in 1:51){
      temp <- pa %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "S")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = y)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("pa_time_y_folding", i, ".jpg"), device = "jpeg", path = "plots/phone_acc/time/folding/y", height = 7, width = 15, units = "in")
    }
    # Z
    for (i in 1:51){
      temp <- pa %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "S")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = z)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("pa_time_z_folding", i, ".jpg"), device = "jpeg", path = "plots/phone_acc/time/folding/z", height = 7, width = 15, units = "in")
    }
    
  }
  
}

{# Phone Gyro ---------------------------------------------------------------
  
  {# walking (A) ----------------------------------------------------------------
    # X
    for (i in 1:51){
      temp <- pg %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "A")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = x)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("pg_time_x_walking", i, ".jpg"), device = "jpeg", path = "plots/phone_gyro/time/walking/x", height = 7, width = 15, units = "in")
    }
    # Y
    for (i in 1:51){
      temp <- pg %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "A")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = y)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("pg_time_y_walking", i, ".jpg"), device = "jpeg", path = "plots/phone_gyro/time/walking/y", height = 7, width = 15, units = "in")
    }
    # Z
    for (i in 1:51){
      temp <- pg %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "A")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = z)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("pg_time_z_walking", i, ".jpg"), device = "jpeg", path = "plots/phone_gyro/time/walking/z", height = 7, width = 15, units = "in")
    }
  }
  
  {# jogging (B) ----------------------------------------------------------------
    
    #X
    for (i in 1:51){
      temp <- pg %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "B")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = x)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("pg_time_x_jogging", i, ".jpg"), device = "jpeg", path = "plots/phone_gyro/time/jogging/x", height = 7, width = 15, units = "in")
    }
    # Y
    for (i in 1:51){
      temp <- pg %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "B")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = y)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("pg_time_y_jogging", i, ".jpg"), device = "jpeg", path = "plots/phone_gyro/time/jogging/y", height = 7, width = 15, units = "in")
    }
    # Z
    for (i in 1:51){
      temp <- pg %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "B")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = z)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("pg_time_z_jogging", i, ".jpg"), device = "jpeg", path = "plots/phone_gyro/time/jogging/z", height = 7, width = 15, units = "in")
    }
    
  }
  
  {# stairs (C) ----------------------------------------------------------------
    
    # X
    for (i in 1:51){
      temp <- pg %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "C")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = x)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("pg_time_x_stairs", i, ".jpg"), device = "jpeg", path = "plots/phone_gyro/time/stairs/x", height = 7, width = 15, units = "in")
    }
    # Y
    for (i in 1:51){
      temp <- pg %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "C")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = y)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("pg_time_y_stairs", i, ".jpg"), device = "jpeg", path = "plots/phone_gyro/time/stairs/y", height = 7, width = 15, units = "in")
    }
    # Z
    for (i in 1:51){
      temp <- pg %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "C")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = z)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("pg_time_z_stairs", i, ".jpg"), device = "jpeg", path = "plots/phone_gyro/time/stairs/z", height = 7, width = 15, units = "in")
    }
    
  }
  
  {# sitting (D) ----------------------------------------------------------------
    
    # X
    for (i in 1:51){
      temp <- pg %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "D")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = x)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("pg_time_x_sitting", i, ".jpg"), device = "jpeg", path = "plots/phone_gyro/time/sitting/x", height = 7, width = 15, units = "in")
    }
    # Y
    for (i in 1:51){
      temp <- pg %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "D")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = y)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("pg_time_y_sitting", i, ".jpg"), device = "jpeg", path = "plots/phone_gyro/time/sitting/y", height = 7, width = 15, units = "in")
    }
    # Z
    for (i in 1:51){
      temp <- pg %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "D")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = z)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("pg_time_z_sitting", i, ".jpg"), device = "jpeg", path = "plots/phone_gyro/time/sitting/z", height = 7, width = 15, units = "in")
    }
    
  }
  
  {# standing (E) ----------------------------------------------------------------
    
    # X
    for (i in 1:51){
      temp <- pg %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "E")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = x)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("pg_time_x_standing", i, ".jpg"), device = "jpeg", path = "plots/phone_gyro/time/standing/x", height = 7, width = 15, units = "in")
    }
    # Y
    for (i in 1:51){
      temp <- pg %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "E")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = y)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("pg_time_y_standing", i, ".jpg"), device = "jpeg", path = "plots/phone_gyro/time/standing/y", height = 7, width = 15, units = "in")
    }
    # Z
    for (i in 1:51){
      temp <- pg %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "E")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = z)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("pg_time_z_standing", i, ".jpg"), device = "jpeg", path = "plots/phone_gyro/time/standing/z", height = 7, width = 15, units = "in")
    }
    
  }
  
  {# typing (F) ----------------------------------------------------------------
    
    # X
    for (i in 1:51){
      temp <- pg %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "F")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = x)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("pg_time_x_typing", i, ".jpg"), device = "jpeg", path = "plots/phone_gyro/time/typing/x", height = 7, width = 15, units = "in")
    }
    # Y
    for (i in 1:51){
      temp <- pg %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "F")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = y)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("pg_time_y_typing", i, ".jpg"), device = "jpeg", path = "plots/phone_gyro/time/typing/y", height = 7, width = 15, units = "in")
    }
    # Z
    for (i in 1:51){
      temp <- pg %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "F")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = z)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("pg_time_z_typing", i, ".jpg"), device = "jpeg", path = "plots/phone_gyro/time/typing/z", height = 7, width = 15, units = "in")
    }
    
  }
  
  {# teeth (G) ----------------------------------------------------------------
    
    # X
    for (i in 1:51){
      temp <- pg %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "G")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = x)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("pg_time_x_teeth", i, ".jpg"), device = "jpeg", path = "plots/phone_gyro/time/teeth/x", height = 7, width = 15, units = "in")
    }
    # Y
    for (i in 1:51){
      temp <- pg %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "G")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = y)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("pg_time_y_teeth", i, ".jpg"), device = "jpeg", path = "plots/phone_gyro/time/teeth/y", height = 7, width = 15, units = "in")
    }
    # Z
    for (i in 1:51){
      temp <- pg %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "G")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = z)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("pg_time_z_teeth", i, ".jpg"), device = "jpeg", path = "plots/phone_gyro/time/teeth/z", height = 7, width = 15, units = "in")
    }
    
  }
  
  {# soup (H) ----------------------------------------------------------------
    
    # X
    for (i in 1:51){
      temp <- pg %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "H")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = x)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("pg_time_x_soup", i, ".jpg"), device = "jpeg", path = "plots/phone_gyro/time/soup/x", height = 7, width = 15, units = "in")
    }
    # Y
    for (i in 1:51){
      temp <- pg %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "H")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = y)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("pg_time_y_soup", i, ".jpg"), device = "jpeg", path = "plots/phone_gyro/time/soup/y", height = 7, width = 15, units = "in")
    }
    # Z
    for (i in 1:51){
      temp <- pg %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "H")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = z)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("pg_time_z_soup", i, ".jpg"), device = "jpeg", path = "plots/phone_gyro/time/soup/z", height = 7, width = 15, units = "in")
    }
    
  }
  
  {# chips (I) ----------------------------------------------------------------
    
    # X
    for (i in 1:51){
      temp <- pg %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "I")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = x)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("pg_time_x_chips", i, ".jpg"), device = "jpeg", path = "plots/phone_gyro/time/chips/x", height = 7, width = 15, units = "in")
    }
    # Y
    for (i in 1:51){
      temp <- pg %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "I")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = y)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("pg_time_y_chips", i, ".jpg"), device = "jpeg", path = "plots/phone_gyro/time/chips/y", height = 7, width = 15, units = "in")
    }
    # Z
    for (i in 1:51){
      temp <- pg %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "I")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = z)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("pg_time_z_chips", i, ".jpg"), device = "jpeg", path = "plots/phone_gyro/time/chips/z", height = 7, width = 15, units = "in")
    }
    
  }
  
  {# pasta (J) ----------------------------------------------------------------
    
    # X
    for (i in 1:51){
      temp <- pg %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "J")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = x)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("pg_time_x_pasta", i, ".jpg"), device = "jpeg", path = "plots/phone_gyro/time/pasta/x", height = 7, width = 15, units = "in")
    }
    # Y
    for (i in 1:51){
      temp <- pg %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "J")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = y)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("pg_time_y_pasta", i, ".jpg"), device = "jpeg", path = "plots/phone_gyro/time/pasta/y", height = 7, width = 15, units = "in")
    }
    # Z
    for (i in 1:51){
      temp <- pg %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "J")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = z)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("pg_time_z_pasta", i, ".jpg"), device = "jpeg", path = "plots/phone_gyro/time/pasta/z", height = 7, width = 15, units = "in")
    }
    
  }
  
  {# drinking (K) ----------------------------------------------------------------
    
    # X
    for (i in 1:51){
      temp <- pg %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "K")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = x)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("pg_time_x_drinking", i, ".jpg"), device = "jpeg", path = "plots/phone_gyro/time/drinking/x", height = 7, width = 15, units = "in")
    }
    # Y
    for (i in 1:51){
      temp <- pg %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "K")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = y)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("pg_time_y_drinking", i, ".jpg"), device = "jpeg", path = "plots/phone_gyro/time/drinking/y", height = 7, width = 15, units = "in")
    }
    # Z
    for (i in 1:51){
      temp <- pg %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "K")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = z)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("pg_time_z_drinking", i, ".jpg"), device = "jpeg", path = "plots/phone_gyro/time/drinking/z", height = 7, width = 15, units = "in")
    }
    
  }
  
  {# sandwich (L) ----------------------------------------------------------------
    
    # X
    for (i in 1:51){
      temp <- pg %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "L")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = x)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("pg_time_x_sandwich", i, ".jpg"), device = "jpeg", path = "plots/phone_gyro/time/sandwich/x", height = 7, width = 15, units = "in")
    }
    # Y
    for (i in 1:51){
      temp <- pg %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "L")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = y)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("pg_time_y_sandwich", i, ".jpg"), device = "jpeg", path = "plots/phone_gyro/time/sandwich/y", height = 7, width = 15, units = "in")
    }
    # Z
    for (i in 1:51){
      temp <- pg %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "L")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = z)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("pg_time_z_sandwich", i, ".jpg"), device = "jpeg", path = "plots/phone_gyro/time/sandwich/z", height = 7, width = 15, units = "in")
    }
    
  }
  
  {# kicking (M) ----------------------------------------------------------------
    
    # X
    for (i in 1:51){
      temp <- pg %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "M")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = x)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("pg_time_x_kicking", i, ".jpg"), device = "jpeg", path = "plots/phone_gyro/time/kicking/x", height = 7, width = 15, units = "in")
    }
    # Y
    for (i in 1:51){
      temp <- pg %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "M")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = y)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("pg_time_y_kicking", i, ".jpg"), device = "jpeg", path = "plots/phone_gyro/time/kicking/y", height = 7, width = 15, units = "in")
    }
    # Z
    for (i in 1:51){
      temp <- pg %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "M")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = z)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("pg_time_z_kicking", i, ".jpg"), device = "jpeg", path = "plots/phone_gyro/time/kicking/z", height = 7, width = 15, units = "in")
    }
    
  }
  
  {# catch (O) ----------------------------------------------------------------
    
    # X
    for (i in 1:51){
      temp <- pg %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "O")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = x)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("pg_time_x_catch", i, ".jpg"), device = "jpeg", path = "plots/phone_gyro/time/catch/x", height = 7, width = 15, units = "in")
    }
    # Y
    for (i in 1:51){
      temp <- pg %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "O")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = y)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("pg_time_y_catch", i, ".jpg"), device = "jpeg", path = "plots/phone_gyro/time/catch/y", height = 7, width = 15, units = "in")
    }
    # Z
    for (i in 1:51){
      temp <- pg %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "O")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = z)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("pg_time_z_catch", i, ".jpg"), device = "jpeg", path = "plots/phone_gyro/time/catch/z", height = 7, width = 15, units = "in")
    }
    
  }
  
  {# dribbling (P) ----------------------------------------------------------------
    
    # X
    for (i in 1:51){
      temp <- pg %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "P")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = x)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("pg_time_x_dribbling", i, ".jpg"), device = "jpeg", path = "plots/phone_gyro/time/dribbling/x", height = 7, width = 15, units = "in")
    }
    # Y
    for (i in 1:51){
      temp <- pg %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "P")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = y)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("pg_time_y_dribbling", i, ".jpg"), device = "jpeg", path = "plots/phone_gyro/time/dribbling/y", height = 7, width = 15, units = "in")
    }
    # Z
    for (i in 1:51){
      temp <- pg %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "P")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = z)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("pg_time_z_dribbling", i, ".jpg"), device = "jpeg", path = "plots/phone_gyro/time/dribbling/z", height = 7, width = 15, units = "in")
    }
    
  }
  
  {# writing (Q) ----------------------------------------------------------------
    
    # X
    for (i in 1:51){
      temp <- pg %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "Q")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = x)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("pg_time_x_writing", i, ".jpg"), device = "jpeg", path = "plots/phone_gyro/time/writing/x", height = 7, width = 15, units = "in")
    }
    # Y
    for (i in 1:51){
      temp <- pg %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "Q")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = y)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("pg_time_y_writing", i, ".jpg"), device = "jpeg", path = "plots/phone_gyro/time/writing/y", height = 7, width = 15, units = "in")
    }
    # Z
    for (i in 1:51){
      temp <- pg %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "Q")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = z)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("pg_time_z_writing", i, ".jpg"), device = "jpeg", path = "plots/phone_gyro/time/writing/z", height = 7, width = 15, units = "in")
    }
    
  }
  
  {# clapping (R) ----------------------------------------------------------------
    
    # X
    for (i in 1:51){
      temp <- pg %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "R")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = x)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("pg_time_x_clapping", i, ".jpg"), device = "jpeg", path = "plots/phone_gyro/time/clapping/x", height = 7, width = 15, units = "in")
    }
    # Y
    for (i in 1:51){
      temp <- pg %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "R")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = y)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("pg_time_y_clapping", i, ".jpg"), device = "jpeg", path = "plots/phone_gyro/time/clapping/y", height = 7, width = 15, units = "in")
    }
    # Z
    for (i in 1:51){
      temp <- pg %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "R")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = z)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("pg_time_z_clapping", i, ".jpg"), device = "jpeg", path = "plots/phone_gyro/time/clapping/z", height = 7, width = 15, units = "in")
    }
    
  }
  
  {# folding (S) ----------------------------------------------------------------
    
    # X
    for (i in 1:51){
      temp <- pg %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "S")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = x)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("pg_time_x_folding", i, ".jpg"), device = "jpeg", path = "plots/phone_gyro/time/folding/x", height = 7, width = 15, units = "in")
    }
    # Y
    for (i in 1:51){
      temp <- pg %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "S")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = y)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("pg_time_y_folding", i, ".jpg"), device = "jpeg", path = "plots/phone_gyro/time/folding/y", height = 7, width = 15, units = "in")
    }
    # Z
    for (i in 1:51){
      temp <- pg %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "S")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = z)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("pg_time_z_folding", i, ".jpg"), device = "jpeg", path = "plots/phone_gyro/time/folding/z", height = 7, width = 15, units = "in")
    }
    
  }
  
}

{# Watch Acceleration ---------------------------------------------------------------
  
  {# walking (A) ----------------------------------------------------------------
    # X
    for (i in 1:51){
      temp <- wa %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "A")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = x)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("wa_time_x_walking", i, ".jpg"), device = "jpeg", path = "plots/watch_acc/time/walking/x", height = 7, width = 15, units = "in")
    }
    # Y
    for (i in 1:51){
      temp <- wa %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "A")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = y)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("wa_time_y_walking", i, ".jpg"), device = "jpeg", path = "plots/watch_acc/time/walking/y", height = 7, width = 15, units = "in")
    }
    # Z
    for (i in 1:51){
      temp <- wa %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "A")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = z)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("wa_time_z_walking", i, ".jpg"), device = "jpeg", path = "plots/watch_acc/time/walking/z", height = 7, width = 15, units = "in")
    }
  }
  
  {# jogging (B) ----------------------------------------------------------------
    
    #X
    for (i in 1:51){
      temp <- wa %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "B")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = x)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("wa_time_x_jogging", i, ".jpg"), device = "jpeg", path = "plots/watch_acc/time/jogging/x", height = 7, width = 15, units = "in")
    }
    # Y
    for (i in 1:51){
      temp <- wa %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "B")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = y)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("wa_time_y_jogging", i, ".jpg"), device = "jpeg", path = "plots/watch_acc/time/jogging/y", height = 7, width = 15, units = "in")
    }
    # Z
    for (i in 1:51){
      temp <- wa %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "B")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = z)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("wa_time_z_jogging", i, ".jpg"), device = "jpeg", path = "plots/watch_acc/time/jogging/z", height = 7, width = 15, units = "in")
    }
    
  }
  
  {# stairs (C) ----------------------------------------------------------------
    
    # X
    for (i in 1:51){
      temp <- wa %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "C")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = x)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("wa_time_x_stairs", i, ".jpg"), device = "jpeg", path = "plots/watch_acc/time/stairs/x", height = 7, width = 15, units = "in")
    }
    # Y
    for (i in 1:51){
      temp <- wa %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "C")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = y)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("wa_time_y_stairs", i, ".jpg"), device = "jpeg", path = "plots/watch_acc/time/stairs/y", height = 7, width = 15, units = "in")
    }
    # Z
    for (i in 1:51){
      temp <- wa %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "C")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = z)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("wa_time_z_stairs", i, ".jpg"), device = "jpeg", path = "plots/watch_acc/time/stairs/z", height = 7, width = 15, units = "in")
    }
    
  }
  
  {# sitting (D) ----------------------------------------------------------------
    
    # X
    for (i in 1:51){
      temp <- wa %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "D")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = x)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("wa_time_x_sitting", i, ".jpg"), device = "jpeg", path = "plots/watch_acc/time/sitting/x", height = 7, width = 15, units = "in")
    }
    # Y
    for (i in 1:51){
      temp <- wa %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "D")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = y)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("wa_time_y_sitting", i, ".jpg"), device = "jpeg", path = "plots/watch_acc/time/sitting/y", height = 7, width = 15, units = "in")
    }
    # Z
    for (i in 1:51){
      temp <- wa %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "D")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = z)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("wa_time_z_sitting", i, ".jpg"), device = "jpeg", path = "plots/watch_acc/time/sitting/z", height = 7, width = 15, units = "in")
    }
    
  }
  
  {# standing (E) ----------------------------------------------------------------
    
    # X
    for (i in 1:51){
      temp <- wa %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "E")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = x)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("wa_time_x_standing", i, ".jpg"), device = "jpeg", path = "plots/watch_acc/time/standing/x", height = 7, width = 15, units = "in")
    }
    # Y
    for (i in 1:51){
      temp <- wa %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "E")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = y)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("wa_time_y_standing", i, ".jpg"), device = "jpeg", path = "plots/watch_acc/time/standing/y", height = 7, width = 15, units = "in")
    }
    # Z
    for (i in 1:51){
      temp <- wa %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "E")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = z)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("wa_time_z_standing", i, ".jpg"), device = "jpeg", path = "plots/watch_acc/time/standing/z", height = 7, width = 15, units = "in")
    }
    
  }
  
  {# typing (F) ----------------------------------------------------------------
    
    # X
    for (i in 1:51){
      temp <- wa %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "F")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = x)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("wa_time_x_typing", i, ".jpg"), device = "jpeg", path = "plots/watch_acc/time/typing/x", height = 7, width = 15, units = "in")
    }
    # Y
    for (i in 1:51){
      temp <- wa %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "F")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = y)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("wa_time_y_typing", i, ".jpg"), device = "jpeg", path = "plots/watch_acc/time/typing/y", height = 7, width = 15, units = "in")
    }
    # Z
    for (i in 1:51){
      temp <- wa %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "F")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = z)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("wa_time_z_typing", i, ".jpg"), device = "jpeg", path = "plots/watch_acc/time/typing/z", height = 7, width = 15, units = "in")
    }
    
  }
  
  {# teeth (G) ----------------------------------------------------------------
    
    # X
    for (i in 1:51){
      temp <- wa %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "G")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = x)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("wa_time_x_teeth", i, ".jpg"), device = "jpeg", path = "plots/watch_acc/time/teeth/x", height = 7, width = 15, units = "in")
    }
    # Y
    for (i in 1:51){
      temp <- wa %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "G")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = y)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("wa_time_y_teeth", i, ".jpg"), device = "jpeg", path = "plots/watch_acc/time/teeth/y", height = 7, width = 15, units = "in")
    }
    # Z
    for (i in 1:51){
      temp <- wa %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "G")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = z)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("wa_time_z_teeth", i, ".jpg"), device = "jpeg", path = "plots/watch_acc/time/teeth/z", height = 7, width = 15, units = "in")
    }
    
  }
  
  {# soup (H) ----------------------------------------------------------------
    
    # X
    for (i in 1:51){
      temp <- wa %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "H")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = x)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("wa_time_x_soup", i, ".jpg"), device = "jpeg", path = "plots/watch_acc/time/soup/x", height = 7, width = 15, units = "in")
    }
    # Y
    for (i in 1:51){
      temp <- wa %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "H")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = y)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("wa_time_y_soup", i, ".jpg"), device = "jpeg", path = "plots/watch_acc/time/soup/y", height = 7, width = 15, units = "in")
    }
    # Z
    for (i in 1:51){
      temp <- wa %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "H")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = z)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("wa_time_z_soup", i, ".jpg"), device = "jpeg", path = "plots/watch_acc/time/soup/z", height = 7, width = 15, units = "in")
    }
    
  }
  
  {# chips (I) ----------------------------------------------------------------
    
    # X
    for (i in 1:51){
      temp <- wa %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "I")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = x)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("wa_time_x_chips", i, ".jpg"), device = "jpeg", path = "plots/watch_acc/time/chips/x", height = 7, width = 15, units = "in")
    }
    # Y
    for (i in 1:51){
      temp <- wa %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "I")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = y)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("wa_time_y_chips", i, ".jpg"), device = "jpeg", path = "plots/watch_acc/time/chips/y", height = 7, width = 15, units = "in")
    }
    # Z
    for (i in 1:51){
      temp <- wa %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "I")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = z)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("wa_time_z_chips", i, ".jpg"), device = "jpeg", path = "plots/watch_acc/time/chips/z", height = 7, width = 15, units = "in")
    }
    
  }
  
  {# pasta (J) ----------------------------------------------------------------
    
    # X
    for (i in 1:51){
      temp <- wa %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "J")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = x)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("wa_time_x_pasta", i, ".jpg"), device = "jpeg", path = "plots/watch_acc/time/pasta/x", height = 7, width = 15, units = "in")
    }
    # Y
    for (i in 1:51){
      temp <- wa %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "J")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = y)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("wa_time_y_pasta", i, ".jpg"), device = "jpeg", path = "plots/watch_acc/time/pasta/y", height = 7, width = 15, units = "in")
    }
    # Z
    for (i in 1:51){
      temp <- wa %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "J")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = z)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("wa_time_z_pasta", i, ".jpg"), device = "jpeg", path = "plots/watch_acc/time/pasta/z", height = 7, width = 15, units = "in")
    }
    
  }
  
  {# drinking (K) ----------------------------------------------------------------
    
    # X
    for (i in 1:51){
      temp <- wa %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "K")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = x)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("wa_time_x_drinking", i, ".jpg"), device = "jpeg", path = "plots/watch_acc/time/drinking/x", height = 7, width = 15, units = "in")
    }
    # Y
    for (i in 1:51){
      temp <- wa %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "K")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = y)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("wa_time_y_drinking", i, ".jpg"), device = "jpeg", path = "plots/watch_acc/time/drinking/y", height = 7, width = 15, units = "in")
    }
    # Z
    for (i in 1:51){
      temp <- wa %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "K")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = z)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("wa_time_z_drinking", i, ".jpg"), device = "jpeg", path = "plots/watch_acc/time/drinking/z", height = 7, width = 15, units = "in")
    }
    
  }
  
  {# sandwich (L) ----------------------------------------------------------------
    
    # X
    for (i in 1:51){
      temp <- wa %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "L")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = x)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("wa_time_x_sandwich", i, ".jpg"), device = "jpeg", path = "plots/watch_acc/time/sandwich/x", height = 7, width = 15, units = "in")
    }
    # Y
    for (i in 1:51){
      temp <- wa %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "L")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = y)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("wa_time_y_sandwich", i, ".jpg"), device = "jpeg", path = "plots/watch_acc/time/sandwich/y", height = 7, width = 15, units = "in")
    }
    # Z
    for (i in 1:51){
      temp <- wa %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "L")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = z)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("wa_time_z_sandwich", i, ".jpg"), device = "jpeg", path = "plots/watch_acc/time/sandwich/z", height = 7, width = 15, units = "in")
    }
    
  }
  
  {# kicking (M) ----------------------------------------------------------------
    
    # X
    for (i in 1:51){
      temp <- wa %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "M")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = x)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("wa_time_x_kicking", i, ".jpg"), device = "jpeg", path = "plots/watch_acc/time/kicking/x", height = 7, width = 15, units = "in")
    }
    # Y
    for (i in 1:51){
      temp <- wa %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "M")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = y)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("wa_time_y_kicking", i, ".jpg"), device = "jpeg", path = "plots/watch_acc/time/kicking/y", height = 7, width = 15, units = "in")
    }
    # Z
    for (i in 1:51){
      temp <- wa %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "M")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = z)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("wa_time_z_kicking", i, ".jpg"), device = "jpeg", path = "plots/watch_acc/time/kicking/z", height = 7, width = 15, units = "in")
    }
    
  }
  
  {# catch (O) ----------------------------------------------------------------
    
    # X
    for (i in 1:51){
      temp <- wa %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "O")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = x)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("wa_time_x_catch", i, ".jpg"), device = "jpeg", path = "plots/watch_acc/time/catch/x", height = 7, width = 15, units = "in")
    }
    # Y
    for (i in 1:51){
      temp <- wa %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "O")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = y)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("wa_time_y_catch", i, ".jpg"), device = "jpeg", path = "plots/watch_acc/time/catch/y", height = 7, width = 15, units = "in")
    }
    # Z
    for (i in 1:51){
      temp <- wa %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "O")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = z)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("wa_time_z_catch", i, ".jpg"), device = "jpeg", path = "plots/watch_acc/time/catch/z", height = 7, width = 15, units = "in")
    }
    
  }
  
  {# dribbling (P) ----------------------------------------------------------------
    
    # X
    for (i in 1:51){
      temp <- wa %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "P")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = x)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("wa_time_x_dribbling", i, ".jpg"), device = "jpeg", path = "plots/watch_acc/time/dribbling/x", height = 7, width = 15, units = "in")
    }
    # Y
    for (i in 1:51){
      temp <- wa %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "P")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = y)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("wa_time_y_dribbling", i, ".jpg"), device = "jpeg", path = "plots/watch_acc/time/dribbling/y", height = 7, width = 15, units = "in")
    }
    # Z
    for (i in 1:51){
      temp <- wa %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "P")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = z)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("wa_time_z_dribbling", i, ".jpg"), device = "jpeg", path = "plots/watch_acc/time/dribbling/z", height = 7, width = 15, units = "in")
    }
    
  }
  
  {# writing (Q) ----------------------------------------------------------------
    
    # X
    for (i in 1:51){
      temp <- wa %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "Q")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = x)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("wa_time_x_writing", i, ".jpg"), device = "jpeg", path = "plots/watch_acc/time/writing/x", height = 7, width = 15, units = "in")
    }
    # Y
    for (i in 1:51){
      temp <- wa %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "Q")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = y)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("wa_time_y_writing", i, ".jpg"), device = "jpeg", path = "plots/watch_acc/time/writing/y", height = 7, width = 15, units = "in")
    }
    # Z
    for (i in 1:51){
      temp <- wa %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "Q")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = z)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("wa_time_z_writing", i, ".jpg"), device = "jpeg", path = "plots/watch_acc/time/writing/z", height = 7, width = 15, units = "in")
    }
    
  }
  
  {# clapping (R) ----------------------------------------------------------------
    
    # X
    for (i in 1:51){
      temp <- wa %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "R")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = x)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("wa_time_x_clapping", i, ".jpg"), device = "jpeg", path = "plots/watch_acc/time/clapping/x", height = 7, width = 15, units = "in")
    }
    # Y
    for (i in 1:51){
      temp <- wa %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "R")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = y)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("wa_time_y_clapping", i, ".jpg"), device = "jpeg", path = "plots/watch_acc/time/clapping/y", height = 7, width = 15, units = "in")
    }
    # Z
    for (i in 1:51){
      temp <- wa %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "R")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = z)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("wa_time_z_clapping", i, ".jpg"), device = "jpeg", path = "plots/watch_acc/time/clapping/z", height = 7, width = 15, units = "in")
    }
    
  }
  
  {# folding (S) ----------------------------------------------------------------
    
    # X
    for (i in 1:51){
      temp <- wa %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "S")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = x)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("wa_time_x_folding", i, ".jpg"), device = "jpeg", path = "plots/watch_acc/time/folding/x", height = 7, width = 15, units = "in")
    }
    # Y
    for (i in 1:51){
      temp <- wa %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "S")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = y)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("wa_time_y_folding", i, ".jpg"), device = "jpeg", path = "plots/watch_acc/time/folding/y", height = 7, width = 15, units = "in")
    }
    # Z
    for (i in 1:51){
      temp <- wa %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "S")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = z)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("wa_time_z_folding", i, ".jpg"), device = "jpeg", path = "plots/watch_acc/time/folding/z", height = 7, width = 15, units = "in")
    }
    
  }
  
}

{# Watch Gyro ---------------------------------------------------------------
  
  {# walking (A) ----------------------------------------------------------------
    # X
    for (i in 1:51){
      temp <- wg %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "A")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = x)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("wa_time_x_walking", i, ".jpg"), device = "jpeg", path = "plots/watch_gyro/time/walking/x", height = 7, width = 15, units = "in")
    }
    # Y
    for (i in 1:51){
      temp <- wg %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "A")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = y)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("wa_time_y_walking", i, ".jpg"), device = "jpeg", path = "plots/watch_gyro/time/walking/y", height = 7, width = 15, units = "in")
    }
    # Z
    for (i in 1:51){
      temp <- wg %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "A")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = z)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("wa_time_z_walking", i, ".jpg"), device = "jpeg", path = "plots/watch_gyro/time/walking/z", height = 7, width = 15, units = "in")
    }
  }
  
  {# jogging (B) ----------------------------------------------------------------
    
    #X
    for (i in 1:51){
      temp <- wg %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "B")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = x)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("wa_time_x_jogging", i, ".jpg"), device = "jpeg", path = "plots/watch_gyro/time/jogging/x", height = 7, width = 15, units = "in")
    }
    # Y
    for (i in 1:51){
      temp <- wg %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "B")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = y)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("wa_time_y_jogging", i, ".jpg"), device = "jpeg", path = "plots/watch_gyro/time/jogging/y", height = 7, width = 15, units = "in")
    }
    # Z
    for (i in 1:51){
      temp <- wg %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "B")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = z)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("wa_time_z_jogging", i, ".jpg"), device = "jpeg", path = "plots/watch_gyro/time/jogging/z", height = 7, width = 15, units = "in")
    }
    
  }
  
  {# stairs (C) ----------------------------------------------------------------
    
    # X
    for (i in 1:51){
      temp <- wg %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "C")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = x)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("wa_time_x_stairs", i, ".jpg"), device = "jpeg", path = "plots/watch_gyro/time/stairs/x", height = 7, width = 15, units = "in")
    }
    # Y
    for (i in 1:51){
      temp <- wg %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "C")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = y)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("wa_time_y_stairs", i, ".jpg"), device = "jpeg", path = "plots/watch_gyro/time/stairs/y", height = 7, width = 15, units = "in")
    }
    # Z
    for (i in 1:51){
      temp <- wg %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "C")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = z)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("wa_time_z_stairs", i, ".jpg"), device = "jpeg", path = "plots/watch_gyro/time/stairs/z", height = 7, width = 15, units = "in")
    }
    
  }
  
  {# sitting (D) ----------------------------------------------------------------
    
    # X
    for (i in 1:51){
      temp <- wg %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "D")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = x)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("wa_time_x_sitting", i, ".jpg"), device = "jpeg", path = "plots/watch_gyro/time/sitting/x", height = 7, width = 15, units = "in")
    }
    # Y
    for (i in 1:51){
      temp <- wg %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "D")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = y)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("wa_time_y_sitting", i, ".jpg"), device = "jpeg", path = "plots/watch_gyro/time/sitting/y", height = 7, width = 15, units = "in")
    }
    # Z
    for (i in 1:51){
      temp <- wg %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "D")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = z)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("wa_time_z_sitting", i, ".jpg"), device = "jpeg", path = "plots/watch_gyro/time/sitting/z", height = 7, width = 15, units = "in")
    }
    
  }
  
  {# standing (E) ----------------------------------------------------------------
    
    # X
    for (i in 1:51){
      temp <- wg %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "E")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = x)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("wa_time_x_standing", i, ".jpg"), device = "jpeg", path = "plots/watch_gyro/time/standing/x", height = 7, width = 15, units = "in")
    }
    # Y
    for (i in 1:51){
      temp <- wg %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "E")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = y)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("wa_time_y_standing", i, ".jpg"), device = "jpeg", path = "plots/watch_gyro/time/standing/y", height = 7, width = 15, units = "in")
    }
    # Z
    for (i in 1:51){
      temp <- wg %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "E")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = z)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("wa_time_z_standing", i, ".jpg"), device = "jpeg", path = "plots/watch_gyro/time/standing/z", height = 7, width = 15, units = "in")
    }
    
  }
  
  {# typing (F) ----------------------------------------------------------------
    
    # X
    for (i in 1:51){
      temp <- wg %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "F")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = x)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("wa_time_x_typing", i, ".jpg"), device = "jpeg", path = "plots/watch_gyro/time/typing/x", height = 7, width = 15, units = "in")
    }
    # Y
    for (i in 1:51){
      temp <- wg %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "F")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = y)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("wa_time_y_typing", i, ".jpg"), device = "jpeg", path = "plots/watch_gyro/time/typing/y", height = 7, width = 15, units = "in")
    }
    # Z
    for (i in 1:51){
      temp <- wg %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "F")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = z)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("wa_time_z_typing", i, ".jpg"), device = "jpeg", path = "plots/watch_gyro/time/typing/z", height = 7, width = 15, units = "in")
    }
    
  }
  
  {# teeth (G) ----------------------------------------------------------------
    
    # X
    for (i in 1:51){
      temp <- wg %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "G")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = x)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("wa_time_x_teeth", i, ".jpg"), device = "jpeg", path = "plots/watch_gyro/time/teeth/x", height = 7, width = 15, units = "in")
    }
    # Y
    for (i in 1:51){
      temp <- wg %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "G")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = y)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("wa_time_y_teeth", i, ".jpg"), device = "jpeg", path = "plots/watch_gyro/time/teeth/y", height = 7, width = 15, units = "in")
    }
    # Z
    for (i in 1:51){
      temp <- wg %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "G")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = z)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("wa_time_z_teeth", i, ".jpg"), device = "jpeg", path = "plots/watch_gyro/time/teeth/z", height = 7, width = 15, units = "in")
    }
    
  }
  
  {# soup (H) ----------------------------------------------------------------
    
    # X
    for (i in 1:51){
      temp <- wg %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "H")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = x)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("wa_time_x_soup", i, ".jpg"), device = "jpeg", path = "plots/watch_gyro/time/soup/x", height = 7, width = 15, units = "in")
    }
    # Y
    for (i in 1:51){
      temp <- wg %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "H")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = y)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("wa_time_y_soup", i, ".jpg"), device = "jpeg", path = "plots/watch_gyro/time/soup/y", height = 7, width = 15, units = "in")
    }
    # Z
    for (i in 1:51){
      temp <- wg %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "H")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = z)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("wa_time_z_soup", i, ".jpg"), device = "jpeg", path = "plots/watch_gyro/time/soup/z", height = 7, width = 15, units = "in")
    }
    
  }
  
  {# chips (I) ----------------------------------------------------------------
    
    # X
    for (i in 1:51){
      temp <- wg %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "I")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = x)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("wa_time_x_chips", i, ".jpg"), device = "jpeg", path = "plots/watch_gyro/time/chips/x", height = 7, width = 15, units = "in")
    }
    # Y
    for (i in 1:51){
      temp <- wg %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "I")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = y)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("wa_time_y_chips", i, ".jpg"), device = "jpeg", path = "plots/watch_gyro/time/chips/y", height = 7, width = 15, units = "in")
    }
    # Z
    for (i in 1:51){
      temp <- wg %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "I")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = z)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("wa_time_z_chips", i, ".jpg"), device = "jpeg", path = "plots/watch_gyro/time/chips/z", height = 7, width = 15, units = "in")
    }
    
  }
  
  {# pasta (J) ----------------------------------------------------------------
    
    # X
    for (i in 1:51){
      temp <- wg %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "J")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = x)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("wa_time_x_pasta", i, ".jpg"), device = "jpeg", path = "plots/watch_gyro/time/pasta/x", height = 7, width = 15, units = "in")
    }
    # Y
    for (i in 1:51){
      temp <- wg %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "J")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = y)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("wa_time_y_pasta", i, ".jpg"), device = "jpeg", path = "plots/watch_gyro/time/pasta/y", height = 7, width = 15, units = "in")
    }
    # Z
    for (i in 1:51){
      temp <- wg %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "J")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = z)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("wa_time_z_pasta", i, ".jpg"), device = "jpeg", path = "plots/watch_gyro/time/pasta/z", height = 7, width = 15, units = "in")
    }
    
  }
  
  {# drinking (K) ----------------------------------------------------------------
    
    # X
    for (i in 1:51){
      temp <- wg %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "K")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = x)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("wa_time_x_drinking", i, ".jpg"), device = "jpeg", path = "plots/watch_gyro/time/drinking/x", height = 7, width = 15, units = "in")
    }
    # Y
    for (i in 1:51){
      temp <- wg %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "K")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = y)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("wa_time_y_drinking", i, ".jpg"), device = "jpeg", path = "plots/watch_gyro/time/drinking/y", height = 7, width = 15, units = "in")
    }
    # Z
    for (i in 1:51){
      temp <- wg %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "K")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = z)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("wa_time_z_drinking", i, ".jpg"), device = "jpeg", path = "plots/watch_gyro/time/drinking/z", height = 7, width = 15, units = "in")
    }
    
  }
  
  {# sandwich (L) ----------------------------------------------------------------
    
    # X
    for (i in 1:51){
      temp <- wg %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "L")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = x)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("wa_time_x_sandwich", i, ".jpg"), device = "jpeg", path = "plots/watch_gyro/time/sandwich/x", height = 7, width = 15, units = "in")
    }
    # Y
    for (i in 1:51){
      temp <- wg %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "L")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = y)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("wa_time_y_sandwich", i, ".jpg"), device = "jpeg", path = "plots/watch_gyro/time/sandwich/y", height = 7, width = 15, units = "in")
    }
    # Z
    for (i in 1:51){
      temp <- wg %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "L")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = z)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("wa_time_z_sandwich", i, ".jpg"), device = "jpeg", path = "plots/watch_gyro/time/sandwich/z", height = 7, width = 15, units = "in")
    }
    
  }
  
  {# kicking (M) ----------------------------------------------------------------
    
    # X
    for (i in 1:51){
      temp <- wg %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "M")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = x)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("wa_time_x_kicking", i, ".jpg"), device = "jpeg", path = "plots/watch_gyro/time/kicking/x", height = 7, width = 15, units = "in")
    }
    # Y
    for (i in 1:51){
      temp <- wg %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "M")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = y)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("wa_time_y_kicking", i, ".jpg"), device = "jpeg", path = "plots/watch_gyro/time/kicking/y", height = 7, width = 15, units = "in")
    }
    # Z
    for (i in 1:51){
      temp <- wg %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "M")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = z)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("wa_time_z_kicking", i, ".jpg"), device = "jpeg", path = "plots/watch_gyro/time/kicking/z", height = 7, width = 15, units = "in")
    }
    
  }
  
  {# catch (O) ----------------------------------------------------------------
    
    # X
    for (i in 1:51){
      temp <- wg %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "O")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = x)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("wa_time_x_catch", i, ".jpg"), device = "jpeg", path = "plots/watch_gyro/time/catch/x", height = 7, width = 15, units = "in")
    }
    # Y
    for (i in 1:51){
      temp <- wg %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "O")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = y)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("wa_time_y_catch", i, ".jpg"), device = "jpeg", path = "plots/watch_gyro/time/catch/y", height = 7, width = 15, units = "in")
    }
    # Z
    for (i in 1:51){
      temp <- wg %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "O")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = z)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("wa_time_z_catch", i, ".jpg"), device = "jpeg", path = "plots/watch_gyro/time/catch/z", height = 7, width = 15, units = "in")
    }
    
  }
  
  {# dribbling (P) ----------------------------------------------------------------
    
    # X
    for (i in 1:51){
      temp <- wg %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "P")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = x)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("wa_time_x_dribbling", i, ".jpg"), device = "jpeg", path = "plots/watch_gyro/time/dribbling/x", height = 7, width = 15, units = "in")
    }
    # Y
    for (i in 1:51){
      temp <- wg %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "P")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = y)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("wa_time_y_dribbling", i, ".jpg"), device = "jpeg", path = "plots/watch_gyro/time/dribbling/y", height = 7, width = 15, units = "in")
    }
    # Z
    for (i in 1:51){
      temp <- wg %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "P")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = z)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("wa_time_z_dribbling", i, ".jpg"), device = "jpeg", path = "plots/watch_gyro/time/dribbling/z", height = 7, width = 15, units = "in")
    }
    
  }
  
  {# writing (Q) ----------------------------------------------------------------
    
    # X
    for (i in 1:51){
      temp <- wg %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "Q")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = x)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("wa_time_x_writing", i, ".jpg"), device = "jpeg", path = "plots/watch_gyro/time/writing/x", height = 7, width = 15, units = "in")
    }
    # Y
    for (i in 1:51){
      temp <- wg %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "Q")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = y)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("wa_time_y_writing", i, ".jpg"), device = "jpeg", path = "plots/watch_gyro/time/writing/y", height = 7, width = 15, units = "in")
    }
    # Z
    for (i in 1:51){
      temp <- wg %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "Q")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = z)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("wa_time_z_writing", i, ".jpg"), device = "jpeg", path = "plots/watch_gyro/time/writing/z", height = 7, width = 15, units = "in")
    }
    
  }
  
  {# clapping (R) ----------------------------------------------------------------
    
    # X
    for (i in 1:51){
      temp <- wg %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "R")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = x)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("wa_time_x_clapping", i, ".jpg"), device = "jpeg", path = "plots/watch_gyro/time/clapping/x", height = 7, width = 15, units = "in")
    }
    # Y
    for (i in 1:51){
      temp <- wg %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "R")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = y)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("wa_time_y_clapping", i, ".jpg"), device = "jpeg", path = "plots/watch_gyro/time/clapping/y", height = 7, width = 15, units = "in")
    }
    # Z
    for (i in 1:51){
      temp <- wg %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "R")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = z)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("wa_time_z_clapping", i, ".jpg"), device = "jpeg", path = "plots/watch_gyro/time/clapping/z", height = 7, width = 15, units = "in")
    }
    
  }
  
  {# folding (S) ----------------------------------------------------------------
    
    # X
    for (i in 1:51){
      temp <- wg %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "S")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = x)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("wa_time_x_folding", i, ".jpg"), device = "jpeg", path = "plots/watch_gyro/time/folding/x", height = 7, width = 15, units = "in")
    }
    # Y
    for (i in 1:51){
      temp <- wg %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "S")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = y)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("wa_time_y_folding", i, ".jpg"), device = "jpeg", path = "plots/watch_gyro/time/folding/y", height = 7, width = 15, units = "in")
    }
    # Z
    for (i in 1:51){
      temp <- wg %>% filter(`subject-id` == as.character(1599 + i) & `activity label` == "S")
      temp_plot <- ggplot(temp, aes(x = timestamp, y = z)) + geom_line() + theme_clean()
      ggsave(temp_plot, filename = paste0("wa_time_z_folding", i, ".jpg"), device = "jpeg", path = "plots/watch_gyro/time/folding/z", height = 7, width = 15, units = "in")
    }
    
  }
  
}
