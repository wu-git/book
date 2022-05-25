library(ggplot2)

# Create labels
boxLabels = c("year", "age X10", "hct", "race (black vs. caucasion)", "bsa (1.6-1.8 vs. <1.6)", "bsa (1.8-2.0 vs. <1.6)", "bsa (>=2.0 vs. <1.6)", 
              "Gender (female vs. male)", "diabetes", "PVD", )


# you may enter 
# Enter summary data. boxOdds are the odds ratios (calculated elsewhere), boxCILow is the lower bound of the CI, boxCIHigh is the upper bound.

df <- data.frame(
  yaxis = length(boxLabels):1,
  boxOdds = c(1.012,1.252,0.954,1.497,0.826,0.882,1.164,1.07),
  boxCILow = c(0.966,1.181,0.943,1.258,0.619,0.666,0.871,0.941),
  boxCIHigh = c(1.06,1.327,0.965,1.781,1.103,1.167,1.555,1.217)
)


## insert the odds ratio data; 
df=read.csv("S:/CardiacSurg/Restricted/MSTCVS/Ting MSTCVS/race aki/oddsratio plot.csv",header=T,sep=',')

df$yaxis=length(df$boxLabels):1

# Plot
p <- ggplot(df, aes(x = boxOdds, y = yaxis))
p + geom_vline(aes(xintercept = 1), size = .25, linetype = "dashed") +
  geom_errorbarh(aes(xmax = boxCIHigh, xmin = boxCILow), size = .5, height = .2, color = "gray50") +
  geom_point(size = 3.5, color = "orange") +
  theme_bw() +
  theme(panel.grid.minor = element_blank()) +
  scale_y_continuous(breaks = df$yaxis, labels = df$boxLabels) +
  scale_x_continuous(breaks = seq(0,7,0.5) ) +
  coord_trans(x = "log10") +
  ylab("") +
  xlab("Odds ratio (log scale)") +
  annotate(geom = "text", y =1.1, x = 3, label ="", size = 3.5, hjust = 0) + ggtitle("Odds ratios for AKI stage 2-3")