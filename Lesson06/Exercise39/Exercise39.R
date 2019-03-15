data(rivers)
interquartile_range<-unname(quantile(rivers,.75)-quantile(rivers,.25))
print(interquartile_range)
upper_limit<-unname(quantile(rivers,.75)+1.5*interquartile_range)
lower_limit<-unname(quantile(rivers,.25)-1.5*interquartile_range)

rivers[which(rivers>upper_limit | rivers<lower_limit)]
upper_limit<-unname(quantile(rivers,.75)+3*interquartile_range)
lower_limit<-unname(quantile(rivers,.25)-3*interquartile_range)
