data(islands)
boxplot(islands)
log_islands<-log(islands)
boxplot(log_islands)
interquartile_range<-quantile(islands,.75)-quantile(islands,.25)
upper_limit<-quantile(islands,.75)+1.5*interquartile_range
outliers<-islands[which(islands>upper_limit)]
interquartile_range_log<-quantile(log_islands,.75)-quantile(log_islands,.25)
upper_limit_log<-quantile(log_islands,.75)+1.5*interquartile_range_log
outliers_log<-islands[which(log_islands>upper_limit_log)]
print(outliers)
print(outliers_log)
island_mean<-mean(islands)
island_sd<-sd(islands)
outliers<-islands[which(islands>(island_mean+2*island_sd))]
outliers

island_mean_log<-mean(log_islands)
island_sd_log<-sd(log_islands)

outliers_log<-log_islands[which(log_islands>(island_mean_log+2*island_sd_log))]

print(outliers_log)
