setwd("/home/erfan/Desktop/University/96-spring/document/maghala")
motahari <- read.csv("a.csv")
rownames(motahari) <- motahari[,1]

motahari <- motahari[,-1]

motahari.s <- t(scale(t(motahari), scale=F))

gr <- c(rep("motahari",16), rep("madahali", 18), rep('nashtali', 2), rep('kakit', 15))
sample <- colnames(motahari)

pc <- prcomp(motahari.s)
pcr <- data.frame(pc$rotation[,1:5], Group=gr)
ggplot(pcr, aes(PC1, PC2, color=Group, label=sample))+geom_point(size=3)+ geom_text(aes(label=sample),hjust=0, vjust=0, size=4) + theme_bw()
