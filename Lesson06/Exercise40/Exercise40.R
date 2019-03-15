data(rivers)
standard_deviation<-sd(rivers)
z_scores<-(rivers-mean(rivers))/ standard_deviation
outliers<-rivers[which(z_scores>2 | z_scores<(-2))]
outliers
