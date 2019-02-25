# Create a sample of 50 numbers which are incremented by 1.
s <- seq(0,50,by = 1)

# Create the binomial distribution.
probs <- dbinom(s,50,0.5)

# Give the chart file a name.
plot(s,probs)
