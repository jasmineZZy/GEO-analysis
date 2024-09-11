rt1<-read.csv("gse91061.csv")
rt2<-read.csv("gse11582.csv")
rt3<-read.csv("gse78220.csv")
rt4<-read.csv("gse93157.csv")
r1<-rt1$Gene
r2<-rt2$X
r3<-rt3$Gene
r4<-rt4$Gene
r4 <- na.omit(r4)  #去掉NA值

library(dplyr)
BiocManager::install("VennDiagram")
library(VennDiagram)
venn.diagram(list(GSE91061=r1,GSE11582=r2,GSE78220=r3,GSE93157=r4),fill=c("red","blue","green","yellow"),cex=1.5,filename="Venn1.png")
l4<-length(r4)
View(r4)