
#=============================================

#Data loading and view

#=============================================

df <- read.csv("ZuvuKiekis.csv")

str(df)
summary(df)



#=============================================

#Data cleaning

#=============================================



df[1:4] <- NULL


df[] <- lapply(df, function(x) ifelse(x == "" | x == "---", NA, x))


data_columns <- c('zvejybos_pastangos_pradzia',
                 'zvejybos_pastangos_pabaiga',
                 'laivo_isvykimo_data_laikas',
                 'laivo_grizimo_data_laikas')

df[data_columns] <- lapply(df[data_columns], 
       function(x) as.POSIXct(x, format = '%Y-%m-%dT%H:%M:%S', tz = 'UTC')
)


logical_columns <- c('ar_isvykimo_uostas_eu',
                     'ar_grizimo_uostas_eu')
df[logical_columns] <- lapply(df[logical_columns], function(x) as.logical(x))



df$year <- as.integer(format(df$zvejybos_pastangos_pradzia, format = '%Y'))
df$month <- as.integer(format(df$zvejybos_pastangos_pradzia, format = '%m'))

#=============================================

#Data analysis

#=============================================


df$effort_time <- as.numeric(difftime(
  df$zvejybos_pastangos_pabaiga, 
  df$zvejybos_pastangos_pradzia,
  units = 'hours')
)


df$CPUE <- ifelse(!is.na(df$effort_time) & df$effort_time > 0,
  df$sugauta_kiekis/df$effort_time, NA)


df_one_year <- subset(df, year == 2020)


aggregate(CPUE~zuvies_pav, data = df_one_year, FUN = mean, na.rm = TRUE)


species_cpue <- aggregate(CPUE~zuvies_pav_en, 
                          data = df_one_year, 
                          FUN = mean, na.rm = TRUE)
species_cpue <- species_cpue[order(species_cpue$CPUE, decreasing = TRUE),]



aggregate(CPUE~ar_isvykimo_uostas_eu,  
        data = df_one_year,
        FUN = mean, 
        na.rm = TRUE)


hour <- as.integer(format(df_one_year$zvejybos_pastangos_pradzia, format = "%H"))



df_one_year$time_of_day <- cut(hour, 
                               breaks = c(0,4,12,18,24), 
                               labels = c('night','morning','afternoon','evening'), 
                               right = F)


aggregate(CPUE~time_of_day, data = df_one_year, FUN = mean, na.rm = TRUE)




#=============================================

#Data visualization

#=============================================

if (!dir.exists("figures")) dir.create("figures")

png(
  file = file.path("figures", "CPUE_distribution.png"),
  width = 1200, height = 900, res = 150
)

boxplot(log(df$CPUE[df$CPUE > 0]), main = 'Log CPUE distribution')

dev.off()



log_data <- log(df_one_year$sugauta_kiekis[df_one_year$sugauta_kiekis>0])


png(
  file = file.path("figures", "Distribution_of_fish_catch.png"),
  width = 1200, height = 900, res = 150
)

hist(log_data, 
     main = 'Log distribution of fish catch',
     xlab = 'log(fish catch)',
     ylab = 'Frequency',
     col ='lightblue',
     border = 'black',
     cex.main = 1.5,
     cex.lab = 1.2)

dev.off()



png(
  file = file.path("figures", "Number_of_trips_by_timeofday.png"),
  width = 1200, height = 900, res = 150
)

g <- factor(df_one_year$time_of_day)
plot(
  g,
  main = 'Number of trips by time of day',
  sub = 'Time of day',
  ylab = 'Number of trips',
  col  = c('gold', 'lightblue','lightgreen','brown'),
  ylim = c(0,1700),
  cex.main = 2,
  cex.names = 1.5,
  cex.lab = 1.5,
  cex.sub = 1.5
)

dev.off()


png(
  file = file.path("figures", "CPUE_distribution_by_timeofday.png"),
  width = 1200, height = 900, res = 150
)

boxplot(log(CPUE) ~ time_of_day,
        data = subset(df_one_year, CPUE > 0),
        main = 'Log CPUE by Time of day',
        xlab = 'Time of day',
        ylab = 'log(CPUE)',
        col = c('gold','lightblue','lightgreen','brown'))

dev.off()










